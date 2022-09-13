;;; spm-osx.el --- OSX-related configuration         -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stéphane Maniaci

;; Author: Stéphane Maniaci <stephane.maniaci@beta.gouv.fr>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This is a bunch of functions I use for OSX environments

;;; Code:

;;; it'd be nice to skip this is (((memq system-type '(darwin)))

(defcustom
  spm--firefox-work-profile
  "Steph@Work"
  "Firefox profile to use when launching URLs."
  :type 'string
  :group nil)

(defcustom
  spm--firefox-bin
  "/Applications/Firefox.app/Contents/MacOS/firefox-bin"
  "Path to the Firefox binary."
  :type 'string)

(defun spm--browse-with-firefox-work-profile (url &optional args)
  "Open the URL with a specific Firefox profile and any optional ARGS."
  (let* ((cmd (concat
               spm--firefox-bin
               " -P "
               spm--firefox-work-profile))
         (url (browse-url-encode-url url))
         (full-cmd (concat cmd " " url)))
    (start-process-shell-command full-cmd nil full-cmd)))


(defun spm--wrap-function ()
  "Wrapper function to avoid processing if we're not on OSX."
  (setf browse-url-browser-function #'spm--browse-with-firefox-work-profile))

(and (memq system-type '(darwin))
     (spm--wrap-function))

(provide 'spm-osx)
;;; spm-osx.el ends here
