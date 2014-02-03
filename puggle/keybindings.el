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
