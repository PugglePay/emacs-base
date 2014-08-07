
(local-set-key "M-k" 'puggle/clear-shell)

(defun puggle/clear-shell ()
  (interactive)
  (erase-buffer)
  (comint-send-input))
