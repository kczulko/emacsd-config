(require 'package)

;; bug workaround!
;; (setq package-check-signature nil)

(add-to-list 'package-archives '("melpa-org" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

(setq package-check-signature nil)

;;(when (not package-archive-contents)
;;  (package-refresh-contents))

;; save when loosing focus
;; (add-hook 'focus-out-hook 'save-some-buffers)

;; bug workaround!
(require 'subr-x)

;;read custom configuration, order matter!
(setq configs '(
                "install"
                "ui"
                "editing"
                "dockerfile"
                "markdown"
                "nix"
                "windows"
                "project"
                "scala"
                "yaml"
                "yasnippet"
                "haskell"
                "go"
                "bazel"
                )
      )

(dolist (config configs)
  (load (format "%s/%s" "~/.emacs.d/configs" config))
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nix-mode magit monokai-theme neotree key-chord hydra auto-package-update))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
