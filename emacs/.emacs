
;; useless chrome

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; have Emacs handle the decryption prompt
(pinentry-start)

;; init file
(load (concat user-emacs-directory "init.el"))

;; custom files
(push "/home/steph/.emacs.d/spm" load-path)
(require 'spm-core)

;; bookmarks
(require 'bookmark)

(setf bookmark-default-file (concat
                             user-emacs-directory
                             "bookmarks.gpg"))

;; move custom declarations out of here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :noerror)
