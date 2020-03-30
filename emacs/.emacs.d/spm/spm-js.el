;; this is a feature I saw in js2-refactor but I don't use js2-mode
(defun spm/js/toggle-async ()
  "Turn the function at point into an async function."
  (interactive)
  (save-excursion
    (let ((fn-reg "\\(async \\)?\\(\\(([[:word:], ]+)\\|[[:word:]]+\\|()\\)\\) =>"))
      (and (search-backward-regexp fn-reg)
           (progn (beginning-of-line)
                  (and (re-search-forward fn-reg)
                       (replace-match (concat (if (match-string 1) "" "async ")
                                              (match-string 2)
                                              " =>"))))))))

(defun spm/js/toggle-string-template ()
  "Turn the current string into a template string."
  (interactive)
  (save-excursion
    (and (search-backward "\"")
         (progn (replace-match "`")
                (search-forward "\"")
                (replace-match "`")))))

(add-hook 'js-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c `") 'spm/js/toggle-string-template)
            (local-set-key (kbd "C-c C-a") 'spm/js/toggle-async)))

(provide 'spm-js)
;;; spm-js.el ends here
