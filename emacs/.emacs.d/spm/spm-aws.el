;;; spm-aws -- AWS-related functions

;;; Commentary:

;;; `spm/aws/update-aws-token' is to be called interactively and will
;;; do the following:
;;; 1. ask for a valid TOTP;
;;; 2. format a command-line SNS command;
;;; 3. parse the resulting JSON from AWS;
;;; 4. format it into a valid set of credentials in ~/.aws/credentials

(defvar spm/aws/pass-aws-path
  "work/aws/cli"
  "The path used to retrieve AWS profile information from `pass'.")

(defvar spm/aws/pass-root-profile-field-name
  "profile"
  "The pass field name to retrieve the name of the authenticating AWS profile.")

(defvar spm/aws/pass-serial-field-name
  "mfa"
  "The pass field name to retrieve the device serial number (ARN) to use for MFA.")

(defvar spm/aws/pass-mfa-field-name
  "mfa_profile"
  "The pass field name to retrieve the name of the resulting, MFA-ed, AWS profile.")

;;; Code:
(defun spm/aws/format-sns-cmd ()
  "Format an AWS SNS command used to retrieve a MFA session token.

It assumes you have `pass' set up with an entry stored at
`spm/aws/pass-aws-path' containing:

1. the name of the calling profile you wish to use in the
`spm/aws/pass-root-profile-field-name' field;

2. the serial-number to identify the device you're going to use
in the `spm/aws/pass-serial-field-name' field;

3. the name of the profile that must be updated with the valid
token, designated with `spm/aws/pass-mfa-field-name'.

These fields should coexist in a pass entry designated by (1), akin to:

<password>
mfa: XXX (2)
profile: YYY (3)
mfa_profile: ZZZ (4)."
  (let* ((token (read-from-minibuffer "Please enter an AWS token: "))
         (cmd "aws sts get-session-token")
         (profile (password-store-get-field
                   spm/aws/pass-aws-path
                   spm/aws/pass-root-profile-field-name))
         (serial-number (password-store-get-field
                         spm/aws/pass-aws-path
                         spm/aws/pass-serial-field-name)))
    (format "AWS_PROFILE=%s %s --serial-number %s --token %s"
            profile
            cmd
            serial-number
            token)))

(defun spm/aws/format-credentials (data)
  "Format the parsed AWS response DATA into a profile declaration."
  (let ((creds-map '((aws_secret_access_key . SecretAccessKey)
                     (aws_access_key_id . AccessKeyId)
                     (aws_session_token . SessionToken)))
        (credentials (alist-get 'Credentials data)))
    (mapconcat (lambda (kv)
                 (format "%s=%s" (car kv) (alist-get (cdr kv) credentials)))
               creds-map "\n")))

(defun spm/aws/overwrite-profile-with (profile-name data)
  "Overwrite the profile designated by PROFILE-NAME with DATA."
  (with-current-buffer
      (find-file-noselect "~/.aws/credentials")
    (goto-char (point-min))
    (and (search-forward profile-name nil t)
         (progn
           (mark-paragraph)
           (kill-region (mark) (point))
           (insert (format "\n[%s]\n%s\n" profile-name data))
           (save-buffer)))))

(defun spm/aws/update-aws-token ()
  "Grab an MFA token and update the revelant credentials in AWS creds file."
  (interactive)
  (let* ((cmd (spm/aws/format-sns-cmd))
         (data (shell-command-to-string cmd))
         (payload (json-read-from-string data))
         (profile-name (password-store-get-field
                        spm/aws/pass-aws-path
                        spm/aws/pass-mfa-field-name)))
    (spm/aws/overwrite-profile-with
     profile-name
     (spm/aws/format-credentials payload))))

(provide 'spm-aws)
;;; spm-aws.el ends here
