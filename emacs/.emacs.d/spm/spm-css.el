(defun spm/css-mode-hook ()
  "Tack some keybindings over `css-mode'."
  (add-to-list
   'load-path (concat
               (getenv "DEV_ROOT")
               "/steph/gh/css-sort/"))
  (define-key css-mode-map
    (kbd "C-c C-s") 'css-sort))

(add-hook 'css-mode-hook 'spm/css-mode-hook)

(provide 'spm-css)
;;; spm-css.el ends here
