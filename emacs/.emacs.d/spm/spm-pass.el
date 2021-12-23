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
  (map-let (id username email) entry
    (format "%s/%s" id (if (seq-empty-p username) email username))))

(defun spm/pass/format-csv-entry (entry)
  "Formats a list parsed from the ENTRY's CSV into a legible choice."
  (map-let (id username email) entry
    (format "%s | %s | %s" id username email)))

(defun spm/pass/convert-csv-entry ()
  "Copy an entry from the backup passwords file in the store."
  (interactive)
  (save-excursion
    (with-temp-buffer
      (insert-file-contents spm/pass/csv-passwords-file)
      (goto-char (point-min))
      (let* ((options (spm/pass/copy-csv-column))
             (mapped (seq-map (lambda (entry)
                                (cons (spm/pass/format-csv-entry entry) entry))
                              options))
             (choice (cdr (assoc (completing-read "Entry to port: " mapped) mapped))))
        (password-store-insert
         (spm/pass/make-password-path choice)
         (alist-get 'password choice))))))

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
        (push (list (cons 'id id)
                    (cons 'username username)
                    (cons 'email email)
                    (cons 'password pass))
              options)))
    options))

(provide 'spm-pass)
;;; spm-pass ends here
