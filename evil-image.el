;;; evil-image.el --- Add Evil bindings to Image

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
(require 'image-mode)

(evil-set-initial-state 'image-mode 'motion)

(evil-define-key 'motion image-mode-map
  (kbd "<return>") 'image-toggle-animation
  (kbd "<space>") 'image-scroll-up
  (kbd "S-<space>") 'image-scroll-down
  "F" 'image-goto-frame
  "," 'image-previous-frame ; mplayer/mpv style
  "." 'image-next-frame ; mplayer/mpv style
  "H" 'image-transform-fit-to-height
  "W" 'image-transform-fit-to-width
  "K" 'image-previous-file
  "J" 'image-next-file
  "q" 'quit-window
  "gg" 'image-bob
  "G" 'image-eob
  "h" 'image-backward-hscroll
  "l" 'image-forward-hscroll
  "0" 'image-bol
  "^" 'image-bol
  "$" 'image-eol
  "j" 'image-next-line
  "k" 'image-previous-line
  (kbd "C-d") 'image-scroll-down
  "}" 'image-increase-speed ; mplayer/mpv style
  "{" 'image-decrease-speed ; mplayer/mpv style
  "a0" 'image-reset-speed
  "ar" 'image-reverse-speed
  (kbd "C-c C-c") 'image-toggle-display
  (kbd "DEL") 'image-scroll-down)

;; TODO: What if the user changes `evil-want-C-u-scroll' after this is run?
(when evil-want-C-u-scroll
  (evil-define-key 'motion image-mode-map
    (kbd "C-u") 'image-scroll-up))

(provide 'evil-image)
;;; evil-image.el ends here
