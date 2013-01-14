; load path
(add-to-list 'load-path "~/.emacs.d")

; useless chrome
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

; default font
(set-face-attribute 'default nil :family "Inconsolata" :height 110)

; color theme
(require 'color-theme)
(load-theme 'wombat t)

; moz-reload
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
(autoload 'moz-reload-on-save-mode' "moz-reload-on-save-mode" "Mozilla save on reload" t)


(add-hook 'haml-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))
