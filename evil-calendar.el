;;; evil-calendar.el --- Add Evil bindings to calendar

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
(require 'calendar)

(evil-define-key 'motion calendar-mode-map
  "v" 'calendar-set-mark
  "h" 'calendar-backward-day
  "0" 'calendar-beginning-of-week
  "$" 'calendar-end-of-week
  "l" 'calendar-forward-day
  "j" 'calendar-forward-week
  "k" 'calendar-backward-week
  "\C-f" 'calendar-scroll-left-three-months
  (kbd "<space>") 'scroll-other-window
  "." 'calendar-goto-today
  "<" 'calendar-scroll-right
  ">" 'calendar-scroll-left
  "?" 'calendar-goto-info-node
  "D" 'diary-view-other-diary-entries
  "M" 'calendar-lunar-phases
  "S" 'calendar-sunrise-sunset
  "a" 'calendar-list-holidays
  "c" 'org-calendar-goto-agenda
  "d" 'diary-view-entries
  "\M-h" 'calendar-cursor-holidays
  "m" 'diary-mark-entries
  "o" 'calendar-other-month
  "q" 'calendar-exit
  "s" 'diary-show-all-entries
  "u" 'calendar-unmark
  "x" 'calendar-mark-holidays
  "\C-c\C-l" 'calendar-redraw
  "[" 'calendar-backward-year
  "]" 'calendar-forward-year
  "\M-<" 'calendar-beginning-of-year
  "\M-=" 'calendar-count-days-region
  "\M->" 'calendar-end-of-year
  "(" 'calendar-beginning-of-month
  ")" 'calendar-end-of-month
  "\C-b" 'calendar-scroll-right-three-months
  "{" 'calendar-backward-month
  "}" 'calendar-forward-month)

(provide 'evil-calendar)
;;; evil-calendar.el ends here
