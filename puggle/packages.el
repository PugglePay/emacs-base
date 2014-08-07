;;; puggle/packages.el

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

 ;; archives to download packages from
(defvar puggle/package-archives
  '(("gnu"       . "http://elpa.gnu.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
    ("melpa"     . "http://melpa.milkbox.net/packages/")))

(defvar puggle/packages
  '(undo-tree
    evil
    evil-surround

    (:name enh-ruby-mode
     :type github
     :pkgname "zenspider/enhanced-ruby-mode"
     :features enh-ruby-mode)

    ruby-compilation
    scss-mode
    yaml-mode
    auto-complete
    markdown-mode
    rspec-mode
    jekyll-el
    rvm
    fiplr
    ac-nrepl
    emacs-w3m
    find-file-in-project
    ido-ubiquitous

    (:name ack-and-a-half
           :type github
           :pkgname "jhelwig/ack-and-a-half"
           :features ack-and-a-half)

    multiple-cursors

    (:name expand-region
           :type github
           :pkgname "magnars/expand-region.el"
           :features expand-region
           :before (defconst ruby-block-end-re "end"))

    magit
    (:name web-mode :type elpa)

    (:name dash
           :description "A modern list library for Emacs"
           :type github
           :pkgname "magnars/dash.el"
           :features dash)

    (:name s
           :description "The long lost Emacs string manipulation library"
           :type github
           :pkgname "magnars/s.el"
           :features s)

    (:name smartparens
           :description "Modern minor mode for Emacs that deals with parens pairs and tries to be smart about it."
           :type github
           :pkgname "Fuco1/smartparens"
           :features smartparens)

    (:name maps
           :type github
           :pkgname "megakorre/maps"
           :features maps)

    (:name pivotal
           :type github
           :pkgname "megakorre/pivotal"
           :depends (s dash maps)
           :features pivotal)

    smex
    (:name paredit
           :description "Minor mode for editing parentheses"
           :type http
           :prepare (progn (autoload 'enable-paredit-mode "paredit")
                           (autoload 'disable-paredit-mode "paredit"))
           :url "http://mumble.net/~campbell/emacs/paredit.el")))
