;;; puggle/init-lisp.el

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

;; this changes what emacs treats as a word
(modify-syntax-entry ?_ "w")
(modify-syntax-entry ?- "w")
(modify-syntax-entry ?/ "w")
(modify-syntax-entry ?: "w")

;;=======================================
;; hooks
(add-hook (puggle/mode-hook) 'paredit-mode)
;;=======================================

;; keybingings
(define-key (current-local-map) (kbd "C-c C-v") 'puggle/clone-parent-sexp)
(define-key (current-local-map) (kbd "C-l") 'puggle/delete-sexp)

;;========================================
;; clojure auto-complete

(require 'ac-nrepl)

(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-to-list 'ac-modes 'cider-repl-mode)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; ========================================
;; clones the sexp the cursor is at and adds it indented to the next line
(defun puggle/clone-parent-sexp ()
  (interactive)
  (let ((c (current-column)))
    (unless mark-active
      (backward-up-list)
      (mark-sexp))
    (call-interactively 'kill-ring-save)
    (call-interactively 'pop-to-mark-command)
    (paredit-newline)
    (yank)
    (call-interactively 'pop-to-mark-command)
    (move-to-column c)))

(define-clojure-indent
  (for-all 1))
