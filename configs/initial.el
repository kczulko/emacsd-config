(require 'monokai-theme)

;; auto-refresh all buffers when files have changed on disk
(global-auto-revert-mode t)

;; add ability to bind actions to series of key strokes
(key-chord-mode 1)

;; Write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

(load-theme 'monokai t)

(tool-bar-mode 0) 
(menu-bar-mode 0)
;; with i3 it's not fully required now...
;; (toggle-frame-fullscreen)
(scroll-bar-mode 0)

(fset `yes-or-no-p `y-or-n-p)

;; s stands for 'super'
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)

;; package zoom-frm doesn't exist...
;;(global-set-key (kbd "C-=") 'zoom-frm-in)
;;(global-set-key (kbd "C--") 'zoom-frm-out)

;;(global-set-key (kbd "M-o M-t t") 'neotree-toggle)
;;(global-set-key (kbd "M-o M-t f") 'neotree-find)
