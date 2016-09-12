
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

;; post melpa init
(add-hook 'after-init-hook (lambda () (load "~/emacs.d/init.el")))
