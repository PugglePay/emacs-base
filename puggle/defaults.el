;;; puggle/defaults.el

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

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-splash-screen t)
;; Fix encoding
(setq default-process-coding-system '(utf-8 . utf-8))
;; Larger fonts
(set-face-attribute 'default nil :height 150)
;; Bug fix
(setq stack-trace-on-error t)
(setq imenu-auto-rescan t)
(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)

;; Fix scrolling
(setq auto-window-vscroll nil)
;; Diable ring bell
(setq ring-bell-function 'ignore)
;; Remove trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq backup-directory-alist         `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(defalias 'yes-or-no-p 'y-or-n-p)
