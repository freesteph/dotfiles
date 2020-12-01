;;; spm-vpn -- VPN helpers

;;; Commentary:
;;; Hacks around Cisco's Anyconnect VPN: the main entrypoint is
;;; `spm/vpn/connect' which will connect the user based on the
;;; fields in a pass entry designated by `spm/vpn/pass-entry'.

;;; Code:
(defcustom spm/vpn/pass-entry
  "work/gds/vpn"
  "Indicate the entry to query in the password store.

The path is sent to the `pass' password manager and should expose
the following fields:

PASSWORD
user: USERNAME
host: HOST"
  :type 'string
  :group 'spm/vpn)

(defcustom spm/vpn/exec-path
  "/opt/cisco/anyconnect/bin/vpn"
  "Points to the AnyConnect executable to connect with."
  :type 'string
  :group 'spm/vpn)

(defun spm/vpn/issue-command (cmd &optional callback)
  "Send CMD to the VPN instance and execute CALLBACK if provided."
  (let ((cmd (format "%s %s" spm/vpn/exec-path cmd)))
    (with-temp-buffer
      (shell-command cmd (current-buffer))
      (when callback
        (funcall callback)))))

(defun spm/vpn/status-is-connected-p ()
  "Check if current buffer contain marker of an active VPN connection."
  (save-excursion
    (goto-char (point-min))
    (search-forward ">> state: Connected" nil t 3)))

(defun spm/vpn/is-connected-p ()
  "Return non-nil if there is already an active VPN connection."
  (interactive)
  (let ((connected (spm/vpn/issue-command "status" #'spm/vpn/status-is-connected-p)))
    (if (called-interactively-p 'any)
        (message (concat "You are " (and (not connected) "not ") "connected to the GDS VPN."))
      connected)))

(defun spm/vpn/disconnect ()
  "Disconnect the current VPN connection."
  (interactive)
  (spm/vpn/issue-command "disconnect")
  t)

(defun spm/vpn/connect ()
  "Connects to GDS VPN.  Disconnect beforehand if necessary."
  (interactive)
  (when (not (password-store-get spm/vpn/pass-entry))
    (error "Your VPN pass entry (`%s') doesn't exist" spm/vpn/pass-entry))
  (or (and (spm/vpn/is-connected-p)
           (not (and (yes-or-no-p "You are already connected. Do you want to attempt a new connection? ")
                     (spm/vpn/disconnect))))
      (let* ((code (read-from-minibuffer "Enter your 2FA code: "))
             (host (password-store-get-field spm/vpn/pass-entry "host"))
             (user-name (password-store-get-field spm/vpn/pass-entry "user"))
             (password (password-store-get spm/vpn/pass-entry))
             (creds (string-join
                     (list
                      (format "connect %s" host)
                      user-name
                      password
                      code)
                     "\n"))
             (creds-file (make-temp-file "vpn-creds-" nil nil creds)))
        (shell-command (format "%s -s < %s" spm/vpn/exec-path creds-file))
        (delete-file creds-file)
        (message "You are now connected to the GDS VPN."))))

(provide 'spm-vpn)
;;; spm-vpn.el ends here
