;;; spm-org -- org-related things

;;; Commentary:
;;; Customisation for org.

;;; Code:
(add-hook 'org-mode-hook (lambda () (electric-indent-local-mode -1)))
(add-hook 'org-mode-hook 'auto-fill-mode)

(use-package ob-restclient
  :straight t)

(use-package org
  :straight t
  :ensure t
  :config (setf
           org-directory (concat (getenv "HOME") "/Documents/cyborg/")
           org-log-done 'time
           org-clock-idle-time 15
           org-refile-targets '((org-agenda-files :maxlevel . 5))
           org-default-notes-file (concat org-directory "/notes.org")
           org-agenda-files (list org-directory)
           org-src-tab-acts-natively t)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c b" . org-switchb)))

(require 'org)
(require 'org-protocol)

(setf org-todo-keywords
      '((sequence "TODO" "DONE")
        (sequence
         "TODO"
         "DISCUSSED(d!@)"
         "WIP(w!)"
         "PR(p@)"
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


(setq org-agenda-include-diary t)

;; counsel-org-goto
(setf counsel-org-goto-display-style 'path
      counsel-org-goto-separator " ➜ "
      counsel-org-goto-face-style 'org)

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

(setf org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (shell . t)
   (restclient . t)))

(provide 'spm-org)
;;; spm-org.el ends here

(defun spm/org/table-cell-select ()
  "Mark the current org-table cell."
  (interactive)
  (org-table-beginning-of-field)
  (set-mark (point))
  (org-table-end-of-field))
