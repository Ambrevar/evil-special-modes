;;; evil-term.el --- Add Evil bindings to term-mode

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
(require 'term)

(evil-set-initial-state 'term-mode 'insert)

;;; TODO: Rebinding ESC has the drawback that programs like vi cannot use it anymore.
;;; Workaround: switch to Emacs mode and double-press ESC.
;;; Otherwise leave ESC to "C-c C-j".
;;; Or bind char-mode ESC to "C-c C-x"?

(defun evil-term-char-mode-insert ()
  (interactive)
  (term-char-mode)
  (evil-insert-state))

(evil-define-key 'normal term-mode-map
  (kbd "C-c C-k") 'evil-term-char-mode-insert
  (kbd "RET") 'term-send-input)

(evil-define-key 'insert term-mode-map (kbd "C-c C-k") 'term-char-mode)

(evil-define-key 'normal term-mode-map
  "[" 'term-previous-prompt
  "]" 'term-next-prompt
  (kbd "C-k") 'term-previous-prompt
  (kbd "C-j") 'term-next-prompt
  "0" 'term-bol
  "$" 'term-show-maximum-output)

(defun evil-term-char-mode-entry-function ()
  (when (get-buffer-process (current-buffer))
    (let (last-prompt)
      (save-excursion
        (goto-char (point-max))
        (when (= (line-beginning-position) (line-end-position))
          (ignore-errors (backward-char)))
        (setq last-prompt (max (term-bol nil) (line-beginning-position))))
      (when (>= (point) last-prompt)
        (term-char-mode)))))

(defun evil-term-setup ()
  (add-hook 'evil-insert-state-entry-hook 'evil-term-char-mode-entry-function)
  (add-hook 'evil-insert-state-exit-hook 'term-line-mode))
(add-hook 'term-mode-hook 'evil-term-setup)

(provide 'evil-term)
;;; evil-term.el ends here
