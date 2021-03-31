;; basic info

(setf
 user-mail-address "stephane.maniaci@digital.cabinet-office.gov.uk"
 user-full-name  "Stéphane Maniaci"
 system-time-locale "C")

;; uncrowd modeline
(use-package diminish
  :ensure t)

;; common lisp
(use-package slime
  :config
  (setq inferior-lisp-program "/usr/bin/clisp"))

;; superfluous chrome
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setf inhibit-splash-screen t
      menu-bar-mode nil
      tool-bar-mode nil
      scroll-bar-mode nil)

;; tabs
(set-default 'indent-tabs-mode nil)

;; diff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; js
(setq js-indent-level 2)

;; web mode
(use-package web-mode
  :init (setq web-mode-markup-indent-offset 2)
  :config
  (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))


;; mac keys
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

; default font
(set-face-attribute 'default nil
                    :family "IBM Plex Mono"
                    :weight 'normal
                    :width 'normal
                    :slant 'italic
                    :height 90)

(use-package swiper
  :ensure t
  :config (ivy-mode 1)
  :bind (("C-s" . counsel-grep-or-swiper)
         ("M-x" . counsel-M-x)
         ("M-/" . counsel-company)
         ("M-y" . counsel-yank-pop)
         ("C-x C-f" . counsel-find-file)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)))

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
  :bind ("C-c p" . 'projectile-command-map))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

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
  (setq flycheck--automatically-enabled-checkers '(eslint scss-stylelint standard)
        flycheck--automatically-disabled-checkers '(scss-lint)))

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

;; remove whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; display time
(display-time-mode 't)

;; terminal outputs
;; truncate buffers continuously
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

;; devdocs
(use-package devdocs
  :bind ("C-M-'" . devdocs-search))

;; dictionary
(use-package define-word
  :bind ("C-c C-d" . define-word-at-point)
  :custom (define-word-default-service 'webster "use the Wonderful webster dictionary"))

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
  (add-hook 'js-mode-hook 'add-node-modules-path t)
  (add-hook 'scss-mode-hook 'add-node-modules-path t))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode))

(use-package markdown-mode
  :config
  (setq markdown-css-paths '("~/.emacs.d/markdown/style.css")))

(use-package deft
  :config
  (setq
   deft-directory (expand-file-name "~/build/notes")
   deft-default-extension "org"
   deft-auto-save-interval 0.0))

(use-package minions
  :ensure t
  :config (minions-mode))

(use-package dumb-jump
  :ensure t
  :config
  (add-to-list 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-selector 'ivy))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  (setq which-key-popup-type 'side-window
        which-key-side-window-location 'left))

(global-set-key (kbd "C-x RET") 'toggle-frame-fullscreen)

;; dired
;; use ls coloured, long listing, all files, vertical, omitting group
(setf dired-listing-switches "-Ghla1o"
      dired-auto-revert-buffer t
      dired-dwim-target t)

;; GPG
(setf epg-pinentry-mode 'loopback)

;; paint colour hexs
(use-package rainbow-mode
  :config (rainbow-mode))

;; flash the modeline rather than the other absurd options
(use-package mode-line-bell
  :config (mode-line-bell-mode))

(use-package json-mode
  :config (unbind-key "C-c C-p" json-mode-map))

;; electric-pair
(electric-pair-mode 1)
(defun sm/electric-pair-prohibit (char)
  "Disable electric-pair mode when in the minibuffer.  CHAR is required but unused."
  (minibufferp))

(setq electric-pair-inhibit-predicate #'sm/electric-pair-prohibit)

;; elfeed
(use-package elfeed
  :bind ("C-x w" . elfeed)
  :config
  (setq elfeed-feeds
        '("http://nullprogram.com/feed/"
          "https://blog.cleancoder.com/atom.xml"
          "https://www.reddit.com/r/emacs.rss"
          "https://ploum.net/feed/"
          "https://w3c.studio24.net/feeds/updates.xml")))

;; e-mail things
(let ((private-config "~/.emacs.d/private.el"))
  (and (file-exists-p private-config)
       (load "~/.emacs.d/private.el")))

;; changes quite often so separate untracked file
(defun freesteph/load-theme-from-env ()
  "Load a colour theme from environment variable EMACS_THEME."
  (let ((theme (getenv "EMACS_THEME")))
    (and (not (null theme))
         (seq-contains (custom-available-themes) (intern theme))
         (load-theme (intern theme) t))))

(freesteph/load-theme-from-env)

(setq org-publish-project-alist
      '(("personal"
         :base-directory "~/build/steph/selfweb/notes/"
         :publishing-function org-html-publish-to-html
         :html-head "<link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\"/>\n
<!-- Global site tag (gtag.js) - Google Analytics -->\n
<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-4257569-2\"></script>\n
<script>\n
  window.dataLayer = window.dataLayer || [];\n
  function gtag(){dataLayer.push(arguments);}\n
  gtag('js', new Date());\n
\n
  gtag('config', 'UA-4257569-2');\n
</script>\n
"
         :with-author nil
         :with-toc nil
         :html-html5-fancy t
         :with-title nil
         :html-validation-link nil
         :section-numbers nil
         :auto-sitemap t
         :sitemap-title "Latest blog entries"
         :sitemap-format-entry spm/org-publish-sitemap-default-entry
         :sitemap-function spm/org-publish-sitemap-default
         :sitemap-sort-files anti-chronologically
         :exclude ".*.draft.*"
         :makeindex t
         :recursive t
         :publishing-directory "/sshx:freesteph@ssh-freesteph.alwaysdata.net:/home/freesteph/www/self/")))

(setf org-export-with-smart-quotes t)
(defun spm/org-publish-sitemap-default (title list)
  "Default site map, as a string.
TITLE is the the title of the site map.  LIST is an internal
representation for the files to include, as returned by
`org-list-to-lisp'.  PROJECT is the current project."
  (concat
   "#+TITLE: " title "\n\n"
   "#+BEGIN_sitemap \n"
   (org-list-to-org list)
   "\n#+END_sitemap"))

(defun spm/org-publish-sitemap-default-entry (entry style project)
  "Default format for site map ENTRY, as a string.
ENTRY is a file name.  STYLE is the style of the sitemap.
PROJECT is the current project."
  (cond ((not (directory-name-p entry))
         (let ((is-blog-entry (cl-search "blog/" entry)))
           (if (not is-blog-entry)
               (org-publish-sitemap-default-entry entry style project)
             (format "[[file:%s][%s %s]]"
                   entry
                   (format-time-string "%Y-%m-%d - " (org-publish-find-date entry project))
                   (org-publish-find-title entry project)))))
         ((eq style 'tree)
          ;; Return only last subdir.
          (file-name-nondirectory (directory-file-name entry)))
         (t entry)))

;; docker
(use-package dockerfile-mode
  :no-require t)

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

;; vterm kills
(use-package vterm
  :ensure t
  :config (setf
           vterm-kill-buffer-on-exit t))

;; unfill
(use-package unfill)

;; yaml
(use-package yaml-mode
  :ensure t)

;; haml
(use-package haml-mode
  :ensure t)

;; ;; restclient
;; (use-package restclient)

;; org + markdown
;; (require 'ox-md)

;; start on my org agenda
(defun spm/load-agenda ()
  (org-agenda-list)
  (delete-other-windows))

(add-hook 'after-init-hook 'spm/load-agenda)

;; password managemnet
(use-package pass
  :ensure t
  :config
  (setf pass-username-fallback-on-filename t))

(use-package sqlup-mode
  :config (add-hook 'sql-mode-hook 'sqlup-mode))

(use-package moody
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package nginx-mode
  :ensure t)

(use-package package-lint)

(use-package elescope
  :ensure t
  :config
  (setf elescope-root-folder "~/build/"
        elescope-clone-depth nil
        elescope-use-full-path t
        elescope-github-token nil))

(use-package pomidor
  :ensure t
  :config
  (setf pomidor-sound-tick nil
        pomidor-sound-tack nil))

(use-package graphviz-dot-mode
  :config
  (setf graphviz-dot-preview-extension "svg"))

(use-package emms
  :config
  (progn
    (require 'emms-setup)
    (emms-standard)
    (emms-default-players))
  (setf emms-source-file-default-directory "~/Music")
  :bind ("<pause>" . emms-pause))

(use-package feature-mode
  :config
  (setf feature-docker-compose-container "web"))

(use-package soundklaus
  :ensure t
  :commands
  (soundklaus-activities
   soundklaus-connect
   soundklaus-my-favorites
   soundklaus-my-playlists
   soundklaus-my-tracks
   soundklaus-playlists
   soundklaus-tracks))

(use-package browse-at-remote
  :ensure t)

(use-package projectile-rails
  :config
  (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map))

(use-package ruby-electric
  :ensure t
  :config
  (add-hook 'ruby-mode-hook
            #'ruby-electric-mode))

(use-package ivy-xref
  :ensure t
  :config
  (setf xref-show-definitions-function #'ivy-xref-show-defs))

(provide 'init)
;;; init.el ends here
