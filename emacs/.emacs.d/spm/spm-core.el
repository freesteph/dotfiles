;;; spm/work --- set of editing-related functions

;;; Commentary:
;;; awkwardly honest functions

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

;; load all other files
(dolist (file (directory-files (concat user-emacs-directory "spm/") t "^spm-.*\.el$"))
  (unless (string-equal (file-name-base file) "spm-core")
    (load-file file)))

;; (let ((work-file (concat user-emacs-directory "spm/spm-work.el.gpg")))
;;   (and (file-exists-p work-file)
;;        (load-file work-file)))

(provide 'spm-core)
;;; spm-core.el ends here
