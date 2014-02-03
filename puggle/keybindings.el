;;; puggle/keybindings.el

;; Copyright (C) 2014 PugglePay

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

(define-key puggle/keymap (kbd "C-x C-p") 'ack-and-a-half)
(define-key puggle/keymap (kbd "C-x g")   'magit-status)

(define-key puggle/keymap (kbd "C-c C-<right>") 'windmove-right)
(define-key puggle/keymap (kbd "C-c C-<up>")    'windmove-up)
(define-key puggle/keymap (kbd "C-c C-<left>")  'windmove-left)
(define-key puggle/keymap (kbd "C-c C-<down>")  'windmove-down)

;; =================================================================================
;; Pair programming special keybingings

;; Extra keybindings for when working in tty
(define-key puggle/keymap (kbd "M-[ c")      (kbd "C-<right>"))
(define-key puggle/keymap (kbd "M-[ d")      (kbd "C-<left>"))
(define-key puggle/keymap (kbd "M-[ a")      (kbd "C-<up>"))
(define-key puggle/keymap (kbd "M-[ b")      (kbd "C-<down>"))
(define-key puggle/keymap (kbd "C-c M-[ c")  (kbd "C-c C-<right>"))
(define-key puggle/keymap (kbd "C-c M-[ d")  (kbd "C-c C-<left>"))
(define-key puggle/keymap (kbd "C-c M-[ a")  (kbd "C-c C-<up>"))
(define-key puggle/keymap (kbd "C-c M-[ b")  (kbd "C-c C-<down>"))
(define-key puggle/keymap (kbd "ESC <down>") (kbd "M-<down>"))
(define-key puggle/keymap (kbd "ESC <up>")   (kbd "M-<up>"))

;; Add those escape sequences to iterm2.
(define-key input-decode-map "\e[1;4A" [M-up])
(define-key input-decode-map "\e[1;4B" [M-down])
(define-key input-decode-map "\e[1;4C" [M-right])
(define-key input-decode-map "\e[1;4D" [M-left])

(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])

(define-key input-decode-map "\e[1;8A" [C-M-up])
(define-key input-decode-map "\e[1;8B" [C-M-down])
(define-key input-decode-map "\e[1;8C" [C-M-right])
(define-key input-decode-map "\e[1;8D" [C-M-left])

;; =================================================================================
