;;; spm-yaml.el --- utility functions for YAML       -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Stéphane Maniaci

;; Author: Stéphane Maniaci <stephane.maniaci@digital.cabinet-office.gov.uk>
;; Keywords: languages

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

;; a set of functions used to edit YAML.
(require 's)

;;; Code:
(defun spm/yaml/key-regexp-at-column (column)
  "Build a regular expression to search for a key at COLUMN."
  (format "^[[:blank:]]\\{,%s\\}\\([[:word:]-]+\\)" column))

(defun spm/yaml/collect-keys-at-point ()
  "Collect all keys aligned at point."
  (save-excursion
    (back-to-indentation)
    (let* ((offset (current-column))
           (key-regexp (spm/yaml/key-regexp-at-column offset))
           (matches ()))
      (goto-char (point-min))
      (while (re-search-forward key-regexp nil t)
        (setf matches (cons (match-string 1) matches)))
      (reverse (mapcar #'substring-no-properties matches)))))

(defun spm/yaml/get-full-path-at-point ()
  "Display the full path of the key at point."
  (save-excursion
    (back-to-indentation)
    (let ((offset (current-column)))
      (if (eql 0 offset)
          ()
        (if (re-search-backward (spm/yaml/key-regexp-at-column (- offset 1)))
            (cons (substring-no-properties (match-string 1))
                  (spm/yaml/get-full-path-at-point))
          ())))))

(defun spm/yaml/print-full-path-at-point ()
  "Display the full path of the key at point."
  (interactive)
  (let ((path (spm/yaml/get-full-path-at-point)))
    (message "Current path: %s" (s-join "/" (reverse path)))))

(provide 'spm-yaml)
;;; spm-yaml.el ends here
