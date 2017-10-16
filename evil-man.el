;;; evil-man.el --- Add Evil bindings to Man

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
(require 'man)

(evil-define-key 'motion Man-mode-map
  (kbd "<space>") 'scroll-up-command
  (kbd "<tab>") 'forward-button
  (kbd "<backtab>") 'backward-button
  (kbd "M-s f") 'Man-goto-section
  "q" 'Man-quit
  "gm" 'man
  (kbd "C-j") 'Man-next-section
  (kbd "C-k") 'Man-previous-section
  (kbd "]") 'Man-next-section
  (kbd "[") 'Man-previous-section
  "gr" 'Man-follow-manual-reference
  "gs" 'Man-goto-see-also-section
  "u" 'Man-update-manpage
  "J" 'Man-next-manpage
  "K" 'Man-previous-manpage)

(provide 'evil-man)
;;; evil-man.el ends here
