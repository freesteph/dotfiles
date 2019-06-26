
;; useless chrome

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; no backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; sort buffer list by mode
(setq Buffer-menu-sort-column 4)
(setq use-package-always-ensure t)

(add-hook 'after-init-hook (lambda ()
                             (let ((extensions '(init sm-core sm-work)))
                               (dolist (ext extensions)
                                 (let ((file (format "%s%s%s" user-emacs-directory ext ".el")))
                                   (and (file-exists-p file) (load file)))))))

;; move custom declarations out of here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :noerror)
(put 'narrow-to-region 'disabled nil)
