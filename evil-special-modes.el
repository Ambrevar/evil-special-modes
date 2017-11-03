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
;; Register the bindings, either all at once:
;;
;;      (when (require 'evil-special-modes nil t)
;;        (evil-special-modes-init))
;;
;; or mode-by-mode, for instance
;;
;;      (with-eval-after-load 'calendar   (require 'evil-calendar) (evil-calendar-set-keys))
;;
;; The list of supported modes is simply the list of files.
;;
;; If you want to run on Evil in the minibuffer, you'll have to enable it
;; manually.  This is so because many users find it confusing.
;;
;;      (require 'evil-minibuffer)
;;      (evil-minibuffer-init)

;;; Code:

;; TODO: Replace all scroll commands with evil commands?

;;;###autoload
(defun evil-special-modes-init ()
  "Register the Evil bindings for all supported modes except the minibuffer.

Alternatively, you may register select bindings only with, for
instance:

  (with-eval-after-load 'calendar (require 'evil-calendar))
"
  (interactive)
  (with-eval-after-load 'calendar   (require 'evil-calendar) (evil-calendar-set-keys))
  (with-eval-after-load 'cus-edit   (require 'evil-custom) (evil-custom-set-keys))
  (with-eval-after-load 'debug      (require 'evil-debugger) (evil-debugger-set-keys))
  (with-eval-after-load 'diff-mode  (require 'evil-diff-mode) (evil-diff-mode-set-keys))
  (with-eval-after-load 'eshell     (require 'evil-eshell) (evil-eshell-set-keys))
  (with-eval-after-load 'help       (require 'evil-help) (evil-help-set-keys))
  (with-eval-after-load 'image-mode (require 'evil-image) (evil-image-set-keys))
  (with-eval-after-load 'info       (require 'evil-info) (evil-info-set-keys))
  (with-eval-after-load 'man        (require 'evil-man) (evil-man-set-keys))
  (with-eval-after-load 'outline    (require 'evil-outline) (evil-outline-set-keys))
  (with-eval-after-load 'package    (require 'evil-package) (evil-package-set-keys))
  (with-eval-after-load 'proced     (require 'evil-proced) (evil-proced-set-keys))
  (with-eval-after-load 'profiler   (require 'evil-profiler) (evil-profiler-set-keys))
  (with-eval-after-load 'term       (require 'evil-term) (evil-term-set-keys))
  (with-eval-after-load 'woman      (require 'evil-woman) (evil-woman-set-keys)))

(provide 'evil-special-modes)
;;; evil-special-modes.el ends here
