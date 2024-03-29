;; bootstrap code
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; basic info

(setf
 user-mail-address "stephane.maniaci@unboxedconsulting.com"
 user-full-name  "Stéphane Maniaci"
 system-time-locale "C")

;; uncrowd modeline
(use-package diminish
  :straight t)

;; superfluous chrome
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setf inhibit-splash-screen t
      menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil
      display-time-default-load-average nil)

;; tabs
(set-default 'indent-tabs-mode nil)

;; diff
(setf ediff-window-setup-function 'ediff-setup-windows-plain)

;; web mode
(use-package web-mode
  :straight t
  :init (setq web-mode-markup-indent-offset 2)
  :config
  (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))


;; Mac keys
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

;; Allow Option to function normally on OSX
(if (boundp 'ns-option-modifier)
    (setq ns-option-modifier nil))

; default font
(set-face-attribute 'default nil
                    :family "IBM Plex Mono"
                    :weight 'normal
                    :width 'normal
                    :slant 'italic
                    :height 130)

(use-package projectile
  :straight t
  :config
  (setq projectile-completion-system 'default)
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

;; mac path something flycheck
(use-package exec-path-from-shell
  :straight t
  :config
  (exec-path-from-shell-initialize))

;; flycheck
(use-package flycheck
  :straight t
  :init (global-flycheck-mode)
  :config
  (setf flycheck--automatically-enabled-checkers '(eslint scss-stylelint standard)
        flycheck--automatically-disabled-checkers '(scss-lint)))

;; (setq-default flycheck-disabled-checkers
;;   (append flycheck-disabled-checkers
;;     '(javascript-jshint scss-lint)))

;; ace-window
 (use-package ace-window
   :straight t
   :bind ("M-o" . ace-window)
   :config
   (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; magit
(use-package magit
  :straight t
  :bind ("C-x g" . magit-status))

;; display time
(display-time-mode 't)

;; terminal outputs
;; truncate buffers continuously
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

;; dictionary
(use-package define-word
  :straight t
  :bind ("C-c C-d" . define-word-at-point)
  :custom (define-word-default-service 'webster "use the Wonderful webster dictionary"))

;; js-import
(use-package js-import
  :straight t
  :bind ("C-M-=" . js-import))

;; css
(setq css-indent-offset 2)

; node modules path = happy flycheck
(use-package add-node-modules-path
  :straight t
  :init
  (add-hook 'js-mode-hook 'add-node-modules-path t)
  (add-hook 'scss-mode-hook 'add-node-modules-path t))

(use-package yasnippet
  :straight t
  :config (yas-global-mode))

(use-package markdown-mode
  :straight t
  :config)

(use-package minions
  :straight t
  :config (minions-mode))

(use-package dumb-jump
  :straight t
  :config
  (add-to-list 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-selector 'ivy))

(use-package which-key
  :straight t
  :config
  (which-key-mode 1)
  (setq which-key-popup-type 'side-window
        which-key-side-window-location 'left
        which-key-max-description-length 100))

(global-set-key (kbd "C-x RET") 'toggle-frame-fullscreen)

;; remove whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; dired
;; use ls coloured, long listing, all files, vertical, omitting group
(setf dired-listing-switches "-Ghla1o"
      dired-auto-revert-buffer t
      dired-dwim-target t)

;; GPG
(setf epg-pinentry-mode 'loopback)


;; flash the modeline rather than the other absurd options
(use-package mode-line-bell
  :straight t
  :config (mode-line-bell-mode))

(use-package json-mode
  :straight t
  :config (unbind-key "C-c C-p" json-mode-map))

;; electric-pair
(electric-pair-mode 1)

(defun sm/electric-pair-prohibit (char)
  "Disable electric-pair mode when in the minibuffer.  CHAR is required but unused."
  (minibufferp))

(setq electric-pair-inhibit-predicate #'sm/electric-pair-prohibit)

;; docker
(use-package dockerfile-mode
  :straight t
  :no-require t)

(use-package docker
  :straight t
  :bind ("C-c d" . docker))

;; unfill
(use-package unfill
  :straight t)

;; yaml
(use-package yaml-mode
  :straight t)

;; haml
(use-package haml-mode
  :straight t)

;; restclient
(use-package restclient
  :straight t)

;; password managemnet
(use-package pass
  :straight t
  :config
  (setf pass-username-fallback-on-filename t))

(use-package sqlup-mode
  :straight t
  :config (add-hook 'sql-mode-hook 'sqlup-mode))

(use-package moody
  :straight t
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package package-lint
  :straight t)

(use-package elescope
  :straight t
  :config
  (setf elescope-root-folder "~/build/"
        elescope-clone-depth nil
        elescope-use-full-path t))

(use-package graphviz-dot-mode
  :straight t
  :config
  (setf graphviz-dot-preview-extension "svg"))

(use-package feature-mode
  :straight t
  :config
  (setf feature-docker-compose-container "web"))

(use-package browse-at-remote
  :straight t)

(use-package projectile-rails
  :straight t
  :config
  (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map))

(use-package gif-screencast
  :straight t
  :config
  (setf gif-screencast-capture-prefer-internal t))

(use-package csv-mode
  :straight t)

(straight-use-package
 '(bbc6 :type git :host github :repo "freesteph/bbc6.el"))

(load-theme 'modus-operandi)

;; start on my org agenda
(defun spm/load-agenda ()
  "Load my agenda on startup"
  (org-agenda-list)
  (delete-other-windows))

(add-hook 'after-init-hook 'spm/load-agenda)

(straight-use-package 'yari)

(use-package terraform-mode
  :straight t)

(setq straight-vc-git-default-protocol 'ssh)

(provide 'init)
;;; init.el ends here
