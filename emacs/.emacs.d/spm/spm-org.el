;;; spm-org -- org-related things

;;; Commentary:
;;; Customisation for org.

;;; Code:
(setf org-todo-keywords
      '((sequence "TODO" "DONE")
        (sequence "TODO" "DISCUSSED(@!)" "WIP(w!)" "PR(@)" "MERGED" "DEPLOYED" "DONE"))
      goto-interface 'outline-path-completion
      org-outline-path-complete-in-steps nil)


(org-add-link-type "key" 'identity
                   (lambda (path desc backend)
                     (cl-case backend
                       (html (format "<span class=\"key\">%s</span>"
                                     (or desc path)))
                       (t path))))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("WIP" . "yellow")
        ("MERGED" . "blue")))

(provide 'spm-org)
;;; spm-org.el ends here
