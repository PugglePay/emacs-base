
;;; puggle/init-mail.el

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

;;=======================================
;; keybingings
;; Automate the fetching of mail.

(require 'gnus-demon)

;; Check for new mail once in every this many minutes.
(gnus-demon-add-handler 'gnus-demon-scan-news 5 nil)
(define-key message-mode-map (kbd "C-c C-p") 'puggle/toogle-mail-public-private)
(define-key gnus-summary-mode-map (kbd ";") 'bbdb-mua-edit-field)

(add-hook (puggle/mode-hook) 'puggle/use-gravatar)

(defun puggle/use-gravatar ()
  (interactive)
  (gnus-treat-mail-gravatar)
  (gnus-treat-from-gravatar))

(defvar puggle/mail-toggle-var nil)

(defun puggle/toogle-mail-public-private ()
  (interactive)
  (save-excursion
    (message-goto-from)
    (kill-whole-line)
    (if puggle/mail-toggle-var
        (insert "From: patrik.karlin@gmail.com (Patrik Kårlin)")
      (insert "From: patrik@pugglepay.com (Patrik Kårlin)"))
    (setq puggle/mail-toggle-var (not puggle/mail-toggle-var))
    (newline)))

(defun puggle/vcard-emails (vcard)
  (->> (split-string vcard "\n")
    (--filter (string-match-p "EMAIL:" it))
    (--map    (substring it 6))))

(defun puggle/vcard-notes (vcard)
  (->> (split-string vcard "\n")
    (--filter (string-match-p "FN;" it))
    (--map    (substring it 17))))

(defun puggle/highrise-dropboxes ()
  (let* ((api-token "e2c9c043c7a8c5e52cfa060ffbb8ec95:x")
         (vcard
          (shell-command-to-string
           (concat "curl -s https://pugglepay1.highrisehq.com/users/1008432/dropboxes.vcf -u "
                   api-token)))
         (dropboxes (-zip
                     (puggle/vcard-notes vcard)
                     (puggle/vcard-emails vcard))))
    (-map
     (lambda (it)
       (concat (car it) " | " (cdr it)))
     dropboxes)))

(defun puggle/forward-to-highrise (dropbox)
  (interactive
   (list (completing-read "Story: " (puggle/highrise-dropboxes))))
  (message (second (split-string dropbox "|"))) )

(defun puggle/add-highrise-bcc (dropbox)
  (interactive
   (list (completing-read "Story: " (puggle/highrise-dropboxes))))
  (save-excursion
    (mail-bcc)
    (kill-whole-line)
    (mail-bcc)
    (insert (s-trim (second (split-string dropbox "|"))))))
