
;; useless chrome
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; default font
(set-face-attribute 'default nil :family "Inconsolata" :height 140)

;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

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
