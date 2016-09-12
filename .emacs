
;; useless chrome

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; no backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; mac keys
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

;; sort buffer list by mode
(setq Buffer-menu-sort-column 4)

;; spaces indent
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; javascript indent
(setq js2-basic-offset 2)
(setq js-indent-level 2)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; see ya
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; display time
(display-time-mode 't)

;; color theme
;; (require 'color-theme)

;; post melpa init
(add-hook 'after-init-hook (lambda () (load "~/.emacs.init.el")))
