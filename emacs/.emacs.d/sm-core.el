;;; package --- Summary
;;; a set of JS-editing related functions

;;; Commentary:
;;; awkwardly honest functions I use for my work

;;; Code:

;; encode a special shortcut to open this blessed config file
(defun sm/edit-init-el ()
  "Open init.el."
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(global-set-key (kbd "C-;") 'sm/edit-init-el)

;; this is a feature I saw in js2-refactor but I don't use js2-mode
(defun sm/js/toggle-async ()
  "Turn the function at point into an async function."
  (interactive)
  (save-excursion
    (let ((fn-reg "\\(async \\)?\\(\\(([[:word:], ]+)\\|[[:word:]]+\\|()\\)\\) =>"))
      (and (search-backward-regexp fn-reg)
           (progn (beginning-of-line)
                  (and (re-search-forward fn-reg)
                       (replace-match (concat (if (match-string 1) "" "async ")
                                              (match-string 2)
                                              " =>"))))))))

(defun sm/js/toggle-string-template ()
  "Turn the current string into a template string."
  (interactive)
  (save-excursion
    (and (search-backward "\"")
         (progn (replace-match "`")
                (search-forward "\"")
                (replace-match "`")))))

(add-hook 'js-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c `") 'sm/js/toggle-string-template)
            (local-set-key (kbd "C-c C-a") 'sm/js/toggle-async)))

(defun spm/ruby/toggle-rspec-focus ()
  "Toggle focused-mode for the Rspec test at point."
  (interactive)
  (save-excursion
    (let ((fn-reg "\\(it \".*\"\\)\\(, ?focus: ?true.*\\)?\\( do\\)"))
      (and (search-backward-regexp fn-reg)
           (progn (beginning-of-line)
                  (and (re-search-forward fn-reg)
                       (replace-match (concat (match-string 1)
                                              (if (match-string 2) "" ", focus: true ")
                                              (match-string 3)))))))))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-f") 'spm/ruby/toggle-rspec-focus)))

(provide 'sm-core)
;;; sm-core.el ends here
