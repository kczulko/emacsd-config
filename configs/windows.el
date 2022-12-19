
(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-[") 'previous-buffer)

(setq inhibit-startup-screen t)

(defun i3lock ()
  "Locks i3 screen"
   (interactive)
   (shell-command "i3lock-pixeled"))

(global-set-key (kbd "M-L") 'i3lock)

