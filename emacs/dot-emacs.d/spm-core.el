;;; spm/work --- set of editing-related functions

;;; Commentary:
;;; awkwardly honest functions I use for my work

;;; Code:

(defvar spm/sandbox-folder
  (file-name-as-directory (concat (getenv "DEV_ROOT") "/steph/sandbox"))
  "Directory hosting sandbox projects.")

(defun spm/edit-init-el ()
  "Open init.el."
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

;; encode a special shortcut to open this blessed config file
(global-set-key (kbd "C-;") 'spm/edit-init-el)


;; org notepad
(defun spm/open-pad ()
  "Open my Org notepad."
  (interactive)
  (bookmark-jump "pad.org"))

(global-set-key (kbd "C-#") 'spm/open-pad)


(defun spm/make-shed (project-name)
  "Start a new project called PROJECT-NAME in my sandbox folder."
  (interactive "MProject name: ")
  (dired-other-window spm/sandbox-folder)
  (magit-init (expand-file-name project-name spm/sandbox-folder)))

(defun spm/set-frame-font-size (font-size)
  "Set the FONT-SIZE of the current frame with the same font face."
  (interactive "NFont size: ")
  (let ((current-font (frame-parameter nil 'font)))
	(and (string-match "\\*-[[:digit:]]+-\\*" current-font)
	     (set-frame-font
	      (replace-match (format "*-%d-*" font-size) nil nil current-font)))))

;; this is a feature I saw in js2-refactor but I don't use js2-mode
(defun spm/js/toggle-async ()
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

(defun spm/js/toggle-string-template ()
  "Turn the current string into a template string."
  (interactive)
  (save-excursion
    (and (search-backward "\"")
         (progn (replace-match "`")
                (search-forward "\"")
                (replace-match "`")))))

(add-hook 'js-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c `") 'spm/js/toggle-string-template)
            (local-set-key (kbd "C-c C-a") 'spm/js/toggle-async)))

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

(defun spm/ruby/insert-frozen-string-literal ()
  "Insert the frozen string literal on the first buffer line."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert "# frozen_string_literal: true")
    (open-line 2)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-f") 'spm/ruby/toggle-rspec-focus)))

(provide 'sm-core)
;;; sm-core.el ends here
