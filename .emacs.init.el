;; basic info
(setq
 user-mail-address "stephane.maniaci@gmail.com"
 user-full-name  "Stéphane Maniaci")

;; superfluous chrome
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

; default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :weight 'light
                    :width 'normal
                    :height 160)

;; mac keys
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

;; spaces indent (not sure if still relevant)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; ido
(setq
 ido-everywhere t
 ido-vertical-mode t)
(ido-mode t)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq
 js2-basic-offset '2
 js2-mode-show-parse-errors nil
 js2-mode-show-strict-warnings nil)

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

;; flycheck
(require 'flycheck)
(add-hook 'js2-mode-hook 'flycheck-mode)

;; ace-window
(require 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; ag
(setq ag-group-matches nil)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; magit-pulls
;; (require 'magit-gh-pulls)
;; (add-hook 'magit-mode-hook 'turn-pacpon-magit-gh-pulls)

;; mu4e
(require 'mu4e)
(setq
 mu4e-maildir "~/Documents/Mail"
 mu4e-update-interval 300
 mu4e-get-mail-command "getmail")

;; smtp conf
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-user "stephane@musicglue.com"
      smtpmail-smtp-server "smtp.1and1.com")

;; rcirc
(require 'tls)
(require 'rcirc)
(setq rcirc-default-nick "freesteph")

;; deft
(setq
 deft-default-extension "org"
 deft-auto-save-interval 0.0)

;; see ya
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; display time
(display-time-mode 't)

(add-hook 'after-init-hook (lambda () (load "~/.emacs.private.el")))
