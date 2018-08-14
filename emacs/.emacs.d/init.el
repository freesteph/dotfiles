;; basic info
(use-package diminish
  :ensure t)

(setq
 user-mail-address "stephane.maniaci@asos.com"
 user-full-name  "Stéphane Maniaci")

;; superfluous chrome
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; js
(setq js-indent-level 2)

;; mac keys
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

; default font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :weight 'light
                    :width 'normal
		    :height 130)

(use-package swiper
  :ensure t
  :config (ivy-mode 1)
  :bind (("C-s" . swiper)
         ("M-x" . counsel-M-x)
	 ("M-/" . counsel-company)
         ("C-x C-f" . counsel-find-file)))

(use-package company
  :ensure t
  :config (setq company-dabbrev-downcase nil)
  :init (global-company-mode)
  :diminish company-mode)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy)
  :bind ("C-c C-p" . 'projectile-command-map))


(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode))

(use-package expand-region
  :ensure t
  :bind ("M-=" . er/expand-region))

;; mac path something flycheck
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-enabled-checkers 'eslint))

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; ace-window
 (use-package ace-window
  :bind ("M-o" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; magit
(use-package magit
 :bind ("C-x g" . magit-status))

;; see ya
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; display time
(display-time-mode 't)

(use-package counsel
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

;; terminal outputs
;; truncate buffers continuously
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

;; devdocs
(use-package devdocs
  :bind ("C-M-'" . devdocs-search))

;; dictionary
(use-package dictionary
  :bind ("C-c C-d" . dictionary-search))

;; js-import
(use-package js-import
  :bind ("C-M-=" . js-import))

;; prettier
(use-package prettier-js
  :init
  (add-hook 'js-mode-hook 'prettier-js-mode))

;; css
(setq css-indent-offset 2)

; node modules path = happy flycheck
(use-package add-node-modules-path
  :ensure t
  :init
  (add-hook 'js-mode-hook 'add-node-modules-path t))

;; human after all
(setq dired-listing-switches "-h")

(use-package yasnippet
  :ensure t
  :config (yas-global-mode))

(use-package deft
  :config
  (setq
   deft-directory "/Users/stephane.maniaci/build/ASOS"
   deft-auto-save-interval 0.0))

(use-package minions
  :ensure t
  :config (minions-mode))

(use-package dumb-jump
  :ensure t
  :config (setq dumb-jump-selector 'ivy))

(use-package beacon
  :init (beacon-mode))

(use-package solarized-theme
  :config
  (load-theme 'solarized-light t)
  (let ((line (face-attribute 'mode-line :underline)))
    (set-face-attribute 'mode-line          nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :underline  line)
    (set-face-attribute 'mode-line          nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :background "#f9f2d9")))

(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (setq moody-slant-function #'moody-slant-apple-rgb)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  (setq which-key-popup-type 'side-window
	which-key-side-window-location 'left))

;; (load "~/.emacs.d/private.el")

(global-set-key (kbd "C-x RET") 'toggle-frame-fullscreen)

;; use ls coloured, long listing, all files, vertical, omitting group
(setq dired-listing-switches "-Gla1o")

(use-package rainbow-mode)

(use-package json-mode)
