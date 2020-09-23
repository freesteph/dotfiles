;; mu4e
(require 'mu4e)

(setf mu4e-get-mail-command "getmail"
      mu4e-update-interval 300
      mu4e-confirm-quit nil
      mu4e-debug t)

;; make 'o' capture the e-mail
(define-key
  mu4e-headers-mode-map
  (kbd "o")
  'mu4e-org-store-and-capture)

(require 'ox-md)

(global-set-key (kbd "C-=") 'mu4e)

(use-package mu4e-alert
  :init (mu4e-alert-enable-mode-line-display))
