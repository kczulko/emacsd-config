
;; auto-refresh all buffers when files have changed on disk
(global-auto-revert-mode t)


;; Write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      ring-bell-function 'ignore; no beeping
      kept-old-versions      5) ; and how many of the old

(tool-bar-mode 0)
(menu-bar-mode 0)
;; with i3 it's not fully required now...
;; (toggle-frame-fullscreen)
(scroll-bar-mode 0)

(fset `yes-or-no-p `y-or-n-p)

