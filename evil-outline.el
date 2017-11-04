;;; evil-outline.el --- Add Evil bindings to outline-mode

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
(require 'outline)

;;;###autoload
(defun evil-outline-set-keys ()
  (evil-define-key 'normal outline-mode-map
    ;; folding
    ;; Evil default keys:
    ;; zO: Show recursively for current branch only.
    ;; za: Toggle first level like outline-toggle-children.
    ;; zc: Hide complete subtree.
    ;; zm: Show only root notes.
    ;; zo: Show current node like "za".
    ;; zr: Show everything.
    (kbd "S-<tab>") 'outline-show-all ; Also "z r" by default
    (kbd "<tab>") 'outline-toggle-children ; Also "z a" by default
    ;; "ze" 'outline-hide-entry
    ;; "zE" 'outline-show-entry
    ;; "zl" 'outline-hide-leaves
    ;; "zb" 'outline-show-branches
    ;; "zo" 'outline-hide-other
    "zB" 'outline-hide-body ; Hide all bodies, Emacs has "C-c C-t".
    "zb" 'outline-hide-entry ; Hide current body, Emacs has "C-c C-c".
    "ze" 'outline-show-entry ; Show current body only, not subtree, reverse of outline-hide-entry, Emacs has "C-c C-e".
    "zl" 'outline-hide-leaves ; Like `outline-hide-body' but for current subtree only, Emacs has "C-c C-l".
    "zK" 'outline-show-branches ; Show all children recursively but no body.  Emacs has "C-c C-k".
    "zk" 'outline-show-children ; Direct children only unlike `outline-show-branches', and no content unlike `outline-show-entry' and `outline-toggle-children'.  Emacs has "C-c TAB".

    "zp" 'outline-hide-other ; Hide all nodes and bodies except current body.  Emacs has "C-c C-o".
    ;; outline-hide-sublevels ; q ; Is it any different from `outline-hide-body'?
    ;; outline-hide-subtree ; Emacs has "C-c C-d", Evil has default "zc".
    ;; outline-show-subtree ; Emacs has "C-c C-s", Evil has default "zO".

    ;; TODO: To mark subtree ("C-c @"), we would need to define a tree object.

    ;; motion
    "[" 'outline-previous-visible-heading
    "]" 'outline-next-visible-heading
    (kbd "C-k") 'outline-backward-same-level
    (kbd "C-j") 'outline-forward-same-level
    "^" 'outline-up-heading

    (kbd "M-h") 'outline-move-demote ; Org-mode has "M-<left>", Evil-org has "M-h"
    (kbd "M-j") 'outline-move-subtree-down ; Org-mode has "M-<down>", Evil-org has "M-j"
    (kbd "M-k") 'outline-move-subtree-up ; Org-mode has "M-<up>", Evil-org has "M-k"
    (kbd "M-l") 'outline-move-promote ; Org-mode has "M-<right>", Evil-org has "M-l"

    (kbd "M-<return>") 'outline-insert-heading)) ; Org-mode has "M-<return>"

(provide 'evil-outline)
;;; evil-outline.el ends here
