
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
(provide 'spm-ruby)
;;; spm-ruby.el ends here
