;;; spm-org -- org-related
;;; Commentary:
;;; Customisation for org.

;;; Code:
(add-hook 'org-mode-hook (lambda () (electric-indent-local-mode -1)))
(add-hook 'org-mode-hook 'auto-fill-mode)

;; (use-package ob-async
;;   :straight t)

(use-package ob-mermaid
  :straight t)

(setf
 org-directory (concat (getenv "HOME") "/Documents/cyborg/")
 org-log-done 'time
 org-refile-targets '((org-agenda-files :maxlevel . 3))
 org-default-notes-file (concat org-directory "/notes.org")
 org-agenda-files (list org-directory)
 org-src-tab-acts-natively t)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setf org-todo-keywords
      '(sequence "TODO" "OBE" "ONGOING" "DONE")
      org-goto-interface 'outline-path-completion
      org-outline-path-complete-in-steps nil
      org-use-fast-todo-selection t
      org-agenda-log-mode-items '(closed clock state))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("OBE" . org-warning)
        ("ONGOING" . "blue")))

(setf org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (shell . t)
   (dot . t)
   (mermaid . t)))

(provide 'spm-org)
;;; spm-org.el ends here
