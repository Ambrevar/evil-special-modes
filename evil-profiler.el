;;; evil-profiler.el --- Add Evil bindings to profiler

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
(require 'profiler)

;;;###autoload
(defun evil-profiler-set-keys ()
  (evil-set-initial-state 'profiler-report-mode 'motion)

  (evil-define-key 'motion profiler-report-mode-map
    ;; motion
    (kbd "SPC") 'scroll-up-command
    (kbd "S-SPC") 'scroll-down-command
    (kbd "<delete>") 'scroll-down-command
    "j" 'profiler-report-next-entry
    "k" 'profiler-report-previous-entry

    (kbd "<tab>") 'profiler-report-toggle-entry
    (kbd "<return>") 'profiler-report-toggle-entry
    "i" 'profiler-report-toggle-entry

    ;; sort
    "o" 'profiler-report-ascending-sort
    "O" 'profiler-report-descending-sort

    "c" 'profiler-report-render-calltree
    "C" 'profiler-report-render-reversed-calltree
    "i" 'profiler-report-describe-entry
    "=" 'profiler-report-compare-profile

    ;; goto
    "gd" 'profiler-report-find-entry

    ;; update
    "gr" 'revert-buffer

    ;; quit
    "q" 'quit-window
    "ZQ" 'evil-quit
    "ZZ" 'quit-windw))

(provide 'evil-profiler)
;;; evil-profiler.el ends here
