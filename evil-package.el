;;; evil-package.el --- Add Evil bindings to Package

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
(require 'package)

(evil-set-initial-state 'package-menu-mode 'motion)

(evil-define-key 'motion package-menu-mode-map
  "i" 'package-menu-mark-install
  "U" 'package-menu-mark-upgrades
  "d" 'package-menu-mark-delete

  ;; marking
  "u" 'package-menu-mark-unmark
  "x" 'package-menu-execute

  ;; "q" 'quit-window ; macros can make sense here.
  "ZQ" 'quit-window
  "ZZ" 'quit-window)

(provide 'evil-package)
;;; evil-package.el ends here
