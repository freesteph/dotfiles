;; colors
(load-theme 'zenburn)

;; exec path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; buffer numbers
(window-numbering-mode 't)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; flycheck
(require 'flycheck)
(add-hook 'js2-mode-hook 'flycheck-mode)

(defface display-time-mail-face '((t (:background "red")))
