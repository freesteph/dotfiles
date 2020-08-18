;;; spm-pass -- password store functions

;;; Commentary:
;;; small functions to help me move to pass

;;; Code:
(require 'pass)

(defvar
  spm/pass/csv-passwords-file
  "~/Downloads/passwords.steph.csv.gpg")

(defun spm/pass/make-password-path (entry)
  "Formats a file path for ENTRY."
  (let ((id (nth 0 entry))
        (username (nth 1 entry))
        (email (nth 2 entry)))
    (format "%s/%s/%s.gpg"
            (password-store-dir)
            id
            (if (seq-empty-p username) email username))))

(defun spm/pass/convert-csv-entry ()
  "Copy an entry from the backup passwords file in the store."
  (interactive)
  (save-excursion
    (with-current-buffer (find-file spm/pass/csv-passwords-file)
      (goto-char (point-min))
      (let* ((options (spm/pass/copy-csv-column))
             (entry (completing-read "Which entry do you want to port?"
                                     (seq-map
                                      (lambda (e) (format "%s | %s | %s" (car e) (cadr e) (caddr e)))
                                      options)))
             (rematch (seq-find (lambda (e)
                                  (string-equal (format "%s | %s | %s" (car e) (cadr e) (caddr e))
                                                entry))
                                options))
             (path (spm/pass/make-password-path rematch)))
        (make-directory (file-name-directory path) t)
        (save-excursion
          (with-current-buffer (find-file path)
            (insert (car (last rematch)))
            (save-buffer)))))))

(defun spm/pass/capture-csv-field-no-quotes ()
  "Capture the current CSV field without the surrounding quotes."
  (mark-sexp)
  (substring
   (buffer-substring-no-properties (region-beginning) (region-end)) 1 -1))

(defun spm/pass/copy-nth-csv-line-field (nth)
  "Copy NTH field in the current CSV line."
  (beginning-of-line)
  (forward-sexp (+ 1 nth))
  (backward-sexp)
  (spm/pass/capture-csv-field-no-quotes))

(defun spm/pass/copy-csv-column (&optional acc)
  "Copy column N into ACC until there is none left."
  (let ((options '()))
    (while (and
            (not (eq 1 (forward-line)))
            (not (eolp)))
      (mark-sexp)
      (let ((id (spm/pass/copy-nth-csv-line-field 0))
             (username (spm/pass/copy-nth-csv-line-field 2))
             (email (spm/pass/copy-nth-csv-line-field 3))
             (pass (spm/pass/copy-nth-csv-line-field 5)))
        (push (list id username email pass) options)))
    options))

(provide 'spm-pass)
;;; spm-pass ends here
