
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
