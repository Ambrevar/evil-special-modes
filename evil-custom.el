;;; evil-custom.el --- Add Evil bindings to Customize

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
(require 'cus-edit)

(evil-set-initial-state 'Custom-mode 'motion)

(evil-define-key 'motion custom-mode-map
  (kbd "SPC") 'scroll-up-command
  (kbd "S-SPC") 'scroll-down-command
  (kbd "DEL") 'scroll-down-command
  (kbd "RET") 'Custom-newline
  (kbd "TAB") 'widget-forward
  (kbd "S-TAB") 'widget-backward
  (kbd "<backtab>") 'widget-backward
  "\M-sf" 'Man-goto-section
  "<" 'Custom-goto-parent
  "\C-j" 'widget-forward
  "\C-k" 'widget-backward
  "q" 'Custom-buffer-done)

(provide 'evil-custom)
;;; evil-custom.el ends here
