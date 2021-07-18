;;; spm-misc.el --- Various unclassified functions   -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Stéphane Maniaci

;; Author: Stéphane Maniaci <stephane.maniaci@digital.cabinet-office.gov.uk>
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

;; This is a bunch of functions that don't really belong anywhere, yet.

;;; Code:

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

(provide 'spm-misc)
;;; spm-misc.el ends here
