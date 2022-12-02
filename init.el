(require 'package)

(setq package-archives nil)

;;(setq package-check-signature nil)

;;(when (not package-archive-contents)
;;  (package-refresh-contents))

;; save when loosing focus
;; (add-hook 'focus-out-hook 'save-some-buffers)

;;read custom configuration, order matters!
(setq configs '(
                ;;"install" ;; uncomment when not using nix!
                "initial"
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

(require 'daml-mode)
(require 'daml-lsp)

;;(use-package daml-mode
;;  :load-path "~/.emacs.d/configs/daml"
;;  :mode "\\.daml\'"
;;  :bind (:map daml-mode-map
;;         ("M-n" . flymake-goto-next-error)
;;         ("M-p" . flymake-goto-next-error)
;;         ("<tab>" . haskell-indent-cycle))
;;  :config
;;  (require 'lsp-daml)
;;  )

;; enable envrc - intentionally done after all the startup sequence
(envrc-global-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(nix-mode magit monokai-theme key-chord hydra))
 '(sbt:prefer-nested-projects t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
