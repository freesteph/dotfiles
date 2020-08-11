;;; spm-org -- org-related things

;;; Commentary:
;;; Customisation for org.

;;; Code:
(setf org-todo-keywords
      '((sequence "TODO" "DONE")
        (sequence "TODO" "DISCUSSED(@!)" "WIP(w!)" "PR(@)" "MERGED" "DEPLOYED" "DONE"))
      goto-interface 'outline-path-completion
      org-outline-path-complete-in-steps nil)

(provide 'spm-org)
;;; spm-org.el ends here
