;;; emacs-base.el

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

;; ============================================
;; main key map
(defvar puggle/keymap (make-sparse-keymap))

;; ============================================
;; Puggle Mode for turning on/off all puggle settings

(define-minor-mode puggle-mode nil
  :keymap puggle/keymap
  :after-hook (puggle/init))

(define-global-minor-mode puggle-globalized-mode puggle-mode
  (lambda () (puggle-mode 1)))

(defun puggle/init ()
  (evil-mode 1)
  (puggle/init-mode-initializer))

;; ============================================
;; Dependencies

(load "puggle/packages")
(load "puggle/keybindings")
(load "puggle/defaults")
(load "puggle/mode-initializer")
(load "puggle/file-modes")

(provide 'emacs-base)
