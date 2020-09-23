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

;; wiktionary lookup
(require 'thingatpt)

(defvar spm/wiktionaries
  '((fr . "https://fr.wiktionary.org/wiki/")
    (en . "https://wiktionary.org/wiki/"))
  "Map of languages and their corresponding Wiktionary URL.")

(defun spm/lookup-in-wiktionary (&optional arg)
  "Prompt for a word and look it up in Wiktionary.

Switch the search to English (default is French) if called with
the prefix argument ARG."
  (interactive "P")
  (let ((lang (or (and arg (completing-read "Language: " spm/wiktionaries)) 'fr))
        (word (read-from-minibuffer "Word: " (word-at-point t))))
    (eww (concat (alist-get lang spm/wiktionaries) word))))

(and
 (file-exists-p "spm-work.el.gpg")
 (load-file "spm-work.el.gpg"))

;; load all other files
(dolist (file (directory-files "." nil "^spm-.*\.el"))
  (unless (string-equal file "spm-core.el")
    (load file)))

(provide 'spm-core)
;;; spm-core.el ends here
