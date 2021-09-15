;; temp files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; thanks but no thanks
(setf create-lockfiles nil)

;; init file
(load-file (concat user-emacs-directory "init.el"))

;; custom files
(load-file (concat user-emacs-directory "spm/spm-core.el"))

;; bookmarks
(require 'bookmark)

(setf bookmark-default-file (concat
                             user-emacs-directory
                             "bookmarks.gpg"))

;; move custom declarations out of here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :noerror)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
