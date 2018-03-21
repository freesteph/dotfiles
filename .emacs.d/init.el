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

; default font
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :weight 'light
                    :width 'normal
                    :height 150)

(use-package nord-theme
  :ensure t
  :config (load-theme 'nord))

(use-package swiper
  :ensure t
  :config (ivy-mode 1)
  :bind (("C-s" . swiper)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)))

(use-package company
  :ensure t
  :diminish company-mode)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

;; mac keys
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

;; spaces indent (not sure if still relevant)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; mac path something flycheck
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; flycheck
(use-package flycheck
  :ensure t)

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; ace-window
(use-package ace-window
  :bind ("M-o" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; ag
(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq ag-reuse-window t)
  (setq ag-group-matches nil))

;; magit
(use-package magit
 :bind ("C-x g" . magit-status))

;; magit-pulls
;; (require 'magit-gh-pulls)
;; (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

;; see ya
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; display time
(display-time-mode 't)

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/private.el")))

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

(setq css-indent-offset 2)

; node modules path = happy flycheck
(use-package add-node-modules-path
  :init
  (add-hook 'js-mode-hook 'add-node-modules-path t))

(use-package magithub
  :after magit
  :config (magithub-feature-autoinject t))
(use-package yasnippet
  :ensure t
  :config (yas-global-mode))
(use-package minions
  :ensure t
  :config (minions-mode))
