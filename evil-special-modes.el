;;; evil-special-modes.el --- Register all Evil bindings

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

;; TODO: Replace all scroll commands with evil commands?
;; TODO: Replace all 'quit-window with 'evil-quit?

;;;###autoload
(defun evil-special-modes-init ()
  "Register the Evil bindings for all supported modes.

Alternatively, you may register select bindings only with, for
instance:

  (with-eval-after-load 'calendar (require 'evil-calendar))
"
  (interactive)
  (with-eval-after-load 'calendar (require 'evil-calendar))
  (with-eval-after-load 'cus-edit (require 'evil-custom))
  (with-eval-after-load 'debug (require 'evil-debugger))
  (with-eval-after-load 'diff-mode (require 'evil-diff-mode))
  (with-eval-after-load 'eshell (require 'evil-eshell))
  (with-eval-after-load 'help (require 'evil-help))
  (with-eval-after-load 'image-mode (require 'evil-image))
  (with-eval-after-load 'info (require 'evil-info))
  (with-eval-after-load 'man (require 'evil-man))
  (with-eval-after-load 'outline (require 'evil-outline))
  (with-eval-after-load 'package (require 'evil-package))
  (with-eval-after-load 'proced (require 'evil-proced))
  (with-eval-after-load 'profiler (require 'evil-profiler))
  (with-eval-after-load 'term (require 'evil-term)))

(provide 'evil-special-modes)
;;; evil-special-modes.el ends here
