;; basic info
(setq
 user-mail-address "stephane.maniaci@asos.com"
 user-full-name  "Stéphane Maniaci")

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

;; GPG stuff
(setf epa-pinentry-mode 'loopback)

;; tabs
(setq indent-tabs-mode nil)

;; js
(setq js-indent-level 2)

;; web mode
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode)))

;; mac keys
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

; default font
(set-face-attribute 'default nil
                    :family "Overpass Mono"
                    :weight 'normal
                    :width 'normal
		    :height 110)

(use-package swiper
  :ensure t
  :config (ivy-mode 1)
  :bind (("C-s" . counsel-grep-or-swiper)
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
  :config
  (counsel-projectile-mode)
  (setq
   counsel-rg-base-command (concat counsel-rg-base-command " -M 120")))

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
  (add-hook 'js-mode-hook 'add-node-modules-path t))

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
  :init (dumb-jump-mode)
  :config
  (setq dumb-jump-selector 'ivy
	dumb-jump-prefer-searcher 'rg))

(use-package beacon
  :config
  (setq beacon-dont-blink-major-modes '(shell-mode))
  :init (beacon-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  (setq which-key-popup-type 'side-window
	which-key-side-window-location 'left))

(global-set-key (kbd "C-x RET") 'toggle-frame-fullscreen)

;; dired
;; use ls coloured, long listing, all files, vertical, omitting group
(setq dired-listing-switches "-Ghla1o")
(setq dired-auto-revert-buffer t)
(setq dired-dwim-target t)

;; paint colour hexs #224488
(use-package rainbow-mode)

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

;; mode
(use-package elfeed
  :bind ("C-x w" . elfeed)
  :config
  (setq elfeed-feeds
	'("http://nullprogram.com/feed/"
          "https://blog.cleancoder.com/atom.xml"
          "https://www.ft.com/?format=rss&edition=uk")))

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

(setq org-publish-project-alist
      '(("personal"
	 :base-directory "~/build/me/selfweb/notes/"
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
	 :exclude ".*.draft.*"
	 :makeindex t
	 :recursive t
	 :publishing-directory "/ssh:freesteph@ssh-freesteph.alwaysdata.net:/home/freesteph/www/self/")))

(defun jw/html-escape-attribute (value)
  "Entity-escape VALUE and wrap it in quotes."
  ;; http://www.w3.org/TR/2009/WD-html5-20090212/serializing-html-fragments.html
  ;;
  ;; "Escaping a string... consists of replacing any occurrences of
  ;; the "&" character by the string "&amp;", any occurrences of the
  ;; U+00A0 NO-BREAK SPACE character by the string "&nbsp;", and, if
  ;; the algorithm was invoked in the attribute mode, any occurrences
  ;; of the """ character by the string "&quot;"..."
  (let* ((value (replace-regexp-in-string "&" "&amp;" value))
         (value (replace-regexp-in-string "\u00a0" "&nbsp;" value))
         (value (replace-regexp-in-string "\"" "&quot;" value)))
    value))


(eval-after-load "org"
  '(org-add-link-type
    "span" #'ignore ; not an 'openable' link
    #'(lambda (class desc format)
        (pcase format
          (`html (format "<span class=\"%s\">%s</span>"
                         (jw/html-escape-attribute class)
                         (or desc "")))
          (_ (or desc ""))))))
;; (freesteph/load-theme-from-env)
