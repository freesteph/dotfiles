(defun spm/css/sort-properties ()
  "Sort all the properties in a CSS block alphabetically."
  (interactive)
  (save-excursion
    (backward-up-list)
    (unless (not (eql (char-after (point)) ?{))
      (let ((beg (point)))
        (forward-list)
        (forward-line -1)
        (end-of-line)
        (let ((end (point)))
          (goto-char beg)
          (forward-line)
          (beginning-of-line)
          (sort-lines nil (point) end))))))

(defun spm/css-mode-hook ()
  "Tack some keybindings over `css-mode'."
  (define-key css-mode-map
    (kbd "C-c C-s") 'spm/css/sort-properties))

(add-hook 'css-mode-hook 'spm/css-mode-hook)

(provide 'spm-css)
;;; spm-css.el ends here
