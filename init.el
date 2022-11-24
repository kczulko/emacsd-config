(require 'package)

;; bug workaround!
;; (setq package-check-signature nil)

(add-to-list 'package-archives '("melpa-org" . "https://melpa.org/packages/") t)
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

(defvar symbolp)
;;read custom configuration, order matters!
(setq configs '(
                "install"
                "ui"
                "editing"
                "windows"
                "project"
                "dockerfile"
                "markdown"
                "nix"
                "scala"
                "others"
                "todo"
                "yasnippet"
                "haskell"
                "go"
                "bazel-install"
                )
      )

(dolist (config configs)
  (load (format "%s/%s" "~/.emacs.d/configs" config))
  )

(use-package daml-mode
  :load-path "~/.emacs.d/configs/daml"
  :mode "\\.daml\'"
  :bind (:map daml-mode-map
         ("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-next-error)
         ("<tab>" . haskell-indent-cycle))
  :config
  (require 'lsp-daml)
  ;; (setq lsp-daml-extra-arguments '("--scenarios" "no" "--telemetry" "--ghc-option" "-XMonoLocalBinds" "--ghc-option" "-W" "--ghc-option" "-Wno-unused-binds" "--ghc-option" "-Wno-unused-matches" "--RTS" "--jobs" "16" "+RTS" "-N16" "-H10G" "-M12G" "-A20M" "-RTS"))
  )

;; enable envrc - intentionally done after all the startup sequence
(envrc-global-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(nix-mode magit monokai-theme neotree key-chord hydra auto-package-update))
 '(sbt:prefer-nested-projects t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
