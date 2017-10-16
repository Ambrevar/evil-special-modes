;;; evil-debugger.el --- Add Evil bindings to Debugger

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
(require 'debug)

(evil-set-initial-state 'debugger-mode 'motion)

(evil-define-key 'motion debugger-mode-map
  (kbd "<tab>") 'forward-button
  (kbd "<return>") 'debug-help-follow
  (kbd "<space>") 'next-line
  "R" 'debugger-record-expression
  "gb" 'debugger-frame
  "c" 'debugger-continue
  "d" 'debugger-step-through
  "x" 'debugger-eval-expression
  "J" 'debugger-jump
  "zl" 'debugger-list-functions
  "q" 'top-level
  "r" 'debugger-return-value
  "u" 'debugger-frame-clear
  "p" 'debugger-toggle-locals)

(provide 'evil-debugger)
;;; evil-debugger.el ends here
