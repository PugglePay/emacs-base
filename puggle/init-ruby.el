;;; puggle/init-ruby.el

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
(modify-syntax-entry ?? "w")
(modify-syntax-entry ?! "w")

(add-hook (puggle/mode-hook) 'rspec-mode)
(add-hook (puggle/mode-hook) 'puggle/toggle-line-wrap)
(add-hook (puggle/mode-hook) 'auto-complete-mode)
(add-hook (puggle/mode-hook) 'smartparens-mode)

(require 'find-file-in-project)

(defun puggle/toggle-line-wrap ()
  (setq truncate-lines 1))

(defvar puggle/zeus-buffers ())
(defun puggle/exec-zeus ()
  (interactive)
  (let* ((project (ffip-project-root)))
    (cd "~/src/puggle/mantis")
    (pop-to-buffer (ansi-term "/bin/bash" "zeus boar-proj"))
    (insert "hello world")))
