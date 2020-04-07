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

(and
 (file-exists-p "spm-work.el.gpg")
 (load-file "spm-work.el.gpg"))

(require 'spm-js)
(require 'spm-ruby)
(require 'spm-css)

(provide 'spm-core)
;;; spm-core.el ends here
