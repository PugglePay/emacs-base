;;; puggle/mode-initializer.el

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

(defvar puggle/modes-initialized '())

;; ==================================
;; mode categories replaces groupes modes to use the same init file
(defvar puggle/mode-categories
  '((ruby . (enh-ruby-mode))
    (lisp . (clojure-mode
             emacs-lisp-mode
             inferior-emacs-lisp-mode
             minibuffer-inactive-mode
             lisp-interaction-mode))
    (mail . (gnus-article-mode
             gnus-summary-mode
             gnus-group-mode
             message-mode))
    (shell . (shell-mode))
    (git  . (magit-log-mode
             magit-branch-manager-mode
             git-commit-mode
             magit-process-mode
             magit-status-mode))))

;; =========================================
;; (puggle/resolve-mode-category 'test) => 'test
;; (puggle/resolve-mode-category 'clojure-mode) => 'lisp
(defun puggle/resolve-mode-category (mode)
  (reduce
   (lambda (res mode-pair)
     (if (member mode (cdr mode-pair))
         (car mode-pair)
       res))
   puggle/mode-categories
   :initial-value mode))

(defun puggle/mode-hook ()
  (intern (concat (symbol-name major-mode) "-hook")))

(defun puggle/init-mode ()
  (unless (assoc major-mode puggle/modes-initialized)
    (load (concat "puggle/init-" (symbol-name (puggle/resolve-mode-category major-mode)) ".el") t)
    (setq puggle/modes-initialized (cons `(,major-mode . t) puggle/modes-initialized))))

(defun puggle/init-mode-initializer ()
  (add-hook 'after-change-major-mode-hook 'puggle/init-mode))
