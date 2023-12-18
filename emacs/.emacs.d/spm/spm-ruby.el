(setf ruby-insert-encoding-magic-comment nil)

(defun spm/ruby/toggle-rspec-focus ()
  "Toggle focused-mode for the Rspec test at point."
  (interactive)
  (save-excursion
    (let ((fn-reg "\\(it \".*\"\\)\\(, ?focus: ?true.*\\)?\\( do\\)"))
      (and (search-backward-regexp fn-reg)
           (progn (beginning-of-line)
                  (and (re-search-forward fn-reg)
                       (replace-match (concat (match-string 1)
                                              (if (match-string 2) "" ", focus: true ")
                                              (match-string 3)))))))))

(defun spm/ruby/insert-frozen-string-literal ()
  "Insert the frozen string literal on the first buffer line."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert "# frozen_string_literal: true")
    (open-line 2)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-f") 'spm/ruby/toggle-rspec-focus)))

(setf ruby-insert-encoding-magic-comment nil)

# Rubocop stuff
(defun spm/rubocop/error-to-anchor (name)
  "Get the last component of a slash-separated NAME and downcase it."
  (downcase (mapconcat 'identity (split-string name "/"))))

(defun spm/rubocop/get-next-error-id ()
  "Find the next error on the line and return its id."
  (save-excursion
    (move-beginning-of-line nil)
    (let* ((pos (flycheck-next-error-pos 1))
           (err (get-char-property pos 'flycheck-error)))
      (flycheck-error-id err))))

(defun spm/rubocop/lookup-next-rubocop-error ()
  "Look up and browse the documentation for the next error."
  (interactive)
  (let* ((base-url "https://docs.rubocop.org/rubocop-rails/cops_rails.html")
         (err-id (spm/rubocop/get-next-error-id))
         (anchor (spm/rubocop/error-to-anchor err-id)))
    (browse-url (format "%s#%s" base-url anchor))))

(define-key ruby-mode-map (kbd "C-c h") 'spm/rubocop/lookup-next-rubocop-error)

(provide 'spm-ruby)
;;; spm-ruby.el ends here
