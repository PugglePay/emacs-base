;;; init.el

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

;;; Init file to use this package as emacs.d folder

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'emacs-base)

(defun sync-packages ()
  "Synchronize packages 2"
  (interactive)

  (el-get 'sync '(el-get package))
  (setq el-get-sources puggle/packages)
  (setq my-packages (mapcar 'el-get-source-name el-get-sources))
  (el-get 'sync my-packages)
  (package-initialize))

(setq package-archives puggle/package-archives)
(package-initialize)
(if (require 'el-get nil t)
    (sync-packages)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp)
     (setq el-get-verbose t)
     (sync-packages))))

(puggle-globalized-mode 1)
