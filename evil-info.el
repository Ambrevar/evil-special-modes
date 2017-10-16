;;; evil-info.el --- Add Evil bindings to Info

;; Copyright (C) 2017 Pierre Neidhardt

;; Author: Pierre Neidhardt <ambrevar@gmail.com>
;; Package-Requires: ((evil "1.2.3"))
;; Package-Version: 20170724.1223
;; Homepage: https://github.com/Ambrevar/evil-special-modes
;; Version: 0

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 3, or (at your
;; option) any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary: The default bindings in motion state override the standard
;;; movement keys.  This package restores them.

;;; Code:

(require 'evil)
(require 'info)

(evil-define-key 'motion Info-mode-map
  (kbd "C-j") 'Info-next
  (kbd "C-k") 'Info-prev
  (kbd "M-s f") 'Info-goto-node ; TODO: Replace with something more Evil.
  (kbd "M-w") 'Info-copy-current-node-name
  "gt" 'Info-top-node
  "gT" 'Info-toc
  "gf" 'Info-follow-reference
  "w" 'evil-forward-word-begin
  "e" 'evil-forward-word-end
  "ge" 'evil-backward-word-end
  "gE" 'evil-backward-WORD-end
  "b" 'evil-backward-word-begin
  "gg" 'evil-goto-first-line
  "t" 'evil-find-char-to
  "T" 'evil-find-char-to-backward
  "f" 'evil-find-char
  "n" 'evil-search-next
  "?" 'evil-search-backward
  "p" nil)

(provide 'evil-info)
;;; evil-info.el ends here
