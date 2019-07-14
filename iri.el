;;; iri.el --- An interactive Ruby RI front-end for Emacs

;; Copyright (C) 2019 Fan Yang

;; Author: Fan Yang <Fan_Yang@sjtu.edu.cn>
;; Maintainer: Fan Yang <Fan_Yang@sjtu.edu.cn>
;; Created: 14 Jul 2019
;; Version: 1.0.0
;; Keywords: processes
;; URL: https://github.com/Raphus-cucullatus/iri

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; `iri' is an interactive Ruby API reference front-end for Emacs.  It
;; provides an interactive way to query Ruby API docs. Under the hood,
;; it is essentially comint-mode running ri.
;;
;; It is derived from comint-mode, so that all those familiar key
;; strokes are inherited. (If you don't know comint-mode, you may know
;; shell-mode which is also derived from comint-mode).
;;
;; It directly calls ri (Ruby's built-in command-line tool for API
;; reference) instead of dealing with the docs itself, so that
;; compatibility is maximized in theory.
;;
;; Please see README.md from the same repository for more information.

;;; Code:

(require 'comint)

(defvar iri-mode-map
  (let ((map (nconc (make-sparse-keymap) comint-mode-map)))
    map))

(defvar iri-ri-file-name "ri"
  "Ruby RI file name.")

(defvar iri-ri-args '("-i")
  "Command line args when starting Ruby RI.")

(define-derived-mode iri-mode comint-mode "Iri"
  "Major mode for interacting with an inferior Ruby RI.\\<iri-mode-map>")

(defun iri ()
  "Run an inferior Ruby RI, with I/O through buffer `*iri*'.

If the `*iri*' buffer exists but the RI process is not running, make a new RI.
If the buffer exists and the process is running, just switch to the buffer.

\(Type \\[describe-mode] in the `*iri*' buffer for a list of commands.)"
  (interactive)
  (let ((buffer (if (or (not (derived-mode-p 'iri-mode))
			(comint-check-proc (current-buffer)))
		    (get-buffer-create "*iri*")
		  ;; If the current buffer is a dead iri buffer, use it.
		  (current-buffer))))
    (pop-to-buffer buffer)
    (unless (comint-check-proc buffer)
      (apply 'make-comint-in-buffer "iri" buffer iri-ri-file-name
	     nil iri-ri-args)
      (iri-mode))
    buffer))

(provide 'iri)

;;; iri.el ends here
