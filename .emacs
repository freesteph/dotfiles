; load path
(add-to-list 'load-path "~/.emacs.d")

; useless chrome
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

; default font
(set-face-attribute 'default nil :family "Inconsolata" :height 140)

; color theme
(require 'color-theme)
(require 'solarized)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'solarized-dark t)

; less css mode
(require 'less-css-mode)

; haml mode
(require 'haml-mode)

; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; moz-reload
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
(autoload 'moz-reload-on-save-mode' "moz-reload-on-save-mode" "Mozilla save on reload" t)

; don't clutter up the tree with autosave files, push them to /tmp or something
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-hook 'haml-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))

; mac keys
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

; IRC track mode
(add-hook 'rcirc-mode-hook
	  (lambda ()
	    (rcirc-track-minor-mode 1)))

; sort buffer list by mode
(setq Buffer-menu-sort-column 4)

; django mode
(require 'python-django)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("91b5a381aa9b691429597c97ac56a300db02ca6c7285f24f6fe4ec1aa44a98c3" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "dc46381844ec8fcf9607a319aa6b442244d8c7a734a2625dac6a1f63e34bc4a6" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "7f14fad67d7ac8d0555bd5a1fd1a429ce2dd37162c4e2dc7ae501f54bad1273a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(nxhtml-autoload-web nil t))

(setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace

;; coffee-mode
(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(require 'coffee-mode)
(setq coffee-tab-width 2)

;; 4-spaces indent
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; SCSS mode
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

;; ruby tweaks
(setq ruby-insert-encoding-magic-comment nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; package manager
(require 'package)
(add-to-list 'package-archives
'("melpa" . "http://melpa.milkbox.net/packages/") t)

;; latex
(getenv "PATH")
 (setenv "PATH"
(concat
 "/usr/texbin" ":"

(getenv "PATH")))
