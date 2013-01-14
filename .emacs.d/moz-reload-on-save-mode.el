(require 'moz)

;;; Usage
;; Run M-x moz-reload-on-save-mode to switch moz-reload on/off in the
;; current buffer.
;; When active, saving the buffer triggers Firefox
;; to reload its current page.

(define-minor-mode moz-reload-on-save-mode
  "Moz Reload On Save Minor Mode"
  nil " Reload" nil
  (if moz-reload-on-save-mode
      ;; Edit hook buffer-locally.
      (add-hook 'after-save-hook 'moz-firefox-reload nil t)
    (remove-hook 'after-save-hook 'moz-firefox-reload t)))

(defun moz-firefox-reload ()
  (comint-send-string (inferior-moz-process) "BrowserReload();"))