;;; evil-proced.el --- Add Evil bindings to proced

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

;;; Commentary:

;;; Code:

(require 'evil)
(require 'proced)

(evil-set-initial-state 'proced-mode 'motion)

(evil-define-key 'motion proced-mode-map
  (kbd "<return>") 'proced-refine

  ;; TODO: Implement a proced-toggle-mark?
  "m" 'proced-mark ; Mentioned in documentation, should be followed.
  "M" 'proced-mark-all
  "U" 'proced-unmark-all
  "*" 'proced-toggle-marks
  "c" 'proced-mark-children
  "C" 'proced-mark-children ; Emacs has "C"
  "p" 'proced-mark-parents
  "P" 'proced-mark-parents ; Emacs has "P"
  (kbd "<delete>") 'proced-unmark-backward
  ;; TODO: Implement beginning-of-buffer / end-of-buffer.
  (kbd "SPC") 'evil-scroll-down
  (kbd "S-SPC") 'evil-scroll-up

  "zt" 'proced-toggle-tree

  "u" 'proced-undo

  "O" 'proced-omit-processes ; TODO: Work this binding out.

  "gr" 'revert-buffer

  "x" 'proced-send-signal ; Emacs has "k" and "x", "k" is mentioned in documentation
  "s" 'proced-filter-interactive ; Refers to "[s]elect", Emacs has "f" mentioned in documentation.
  "S" 'proced-format-interactive

  "oo" 'proced-sort-start ; Refers to "[o]order", Emacs has "s" mentioned in documentation.
  "oO" 'proced-sort-interactive
  "oc" 'proced-sort-pcpu
  "om" 'proced-sort-pmem
  "op" 'proced-sort-pid
  "ot" 'proced-sort-time
  "ou" 'proced-sort-user

  "q" 'quit-window ; TODO: Macro support?

  "r" 'proced-renice)

(provide 'evil-proced)
;;; evil-proced.el ends here
