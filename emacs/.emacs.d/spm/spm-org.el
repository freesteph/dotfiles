;;; spm-org -- org-related things

;;; Commentary:
;;; Customisation for org.

;;; Code:
(setf org-todo-keywords
      '((sequence "TODO" "DONE")
        (sequence
         "TODO"
         "DISCUSSED(d!@)"
         "WIP(w!)"
         "PR(p!@)"
         "MERGED(m!)"
         "DEPLOYED(D!)"
         "|"
         "DONE"
         "DELEGATED(X!)"
         "HALTED(h!)"))
      org-goto-interface 'outline-path-completion
      org-outline-path-complete-in-steps nil
      org-use-fast-todo-selection t
      org-agenda-log-mode-items '(closed clock state))


;; Example configuration
(setq counsel-org-goto-display-style 'path)
(setq counsel-org-goto-separator " ➜ ")
(setq counsel-org-goto-face-style 'org)
(define-key org-mode-map (kbd "C-c C-j") 'counsel-org-goto)
(define-key org-mode-map (kbd "C-u C-c C-j") 'counsel-org-goto-all)

(org-add-link-type "key" 'identity
                   (lambda (path desc backend)
                     (cl-case backend
                       (html (format "<span class=\"key\">%s</span>"
                                     (or desc path)))
                       (t path))))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("HALTED" . org-warning)
        ("MERGED" . "blue")))

(provide 'spm-org)
;;; spm-org.el ends here
