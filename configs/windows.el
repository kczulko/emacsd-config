(packages-conditional-install '(ace-window))

(global-set-key (kbd "C-c \\") 'ace-window)
(key-chord-define-global "gh" 'ace-window)

;; use letters as windows identifiers
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-[") 'previous-buffer)

(setq inhibit-startup-screen t)

(defun i3lock ()
  "Locks i3 screen"
   (interactive)
   (shell-command "i3lock-pixeled"))

(global-set-key (kbd "M-L") 'i3lock)

