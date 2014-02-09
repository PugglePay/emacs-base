
(paredit-mode 1)
;; this changes what emacs treats as a word
(modify-syntax-entry ?_ "w")
(modify-syntax-entry ?- "w")
(modify-syntax-entry ?/ "w")

;;=======================================
;; hooks
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;;=======================================
;; keybingings
(define-key (current-local-map) (kbd "C-c C-v") 'puggle/clone-parent-sexp)

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
