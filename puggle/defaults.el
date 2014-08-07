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
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

(column-number-mode 1)
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

(setq twittering-use-master-password t)

(custom-set-variables
 '(evil-want-fine-undo t))

(setq
 mac-option-modifier nil
 mac-command-modifier 'meta
 x-select-enable-clipboard t)

;; =================================================
;; w3m settings
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)
(setq browse-url-browser-function 'w3m-browse-url)
(setq w3m-use-cookies t)
(setq g-html-handler 'w3m)
(setq mm-text-html-renderer 'w3m)
(setq browse-url-browser-function
            'w3m-browse-url)
     (setq browse-url-browser-function
            'w3m-browse-url)
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(defalias 'yes-or-no-p 'y-or-n-p)
