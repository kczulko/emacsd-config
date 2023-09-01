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
                "editing"
                "project"
                "todo"
                "haskell"
                "packages"
                )
      )

(dolist (config configs)
  (load (format "%s/%s" "~/.emacs.d/configs" config))
  )


;; enable envrc - intentionally done after all the startup sequence
(envrc-global-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(bazela daml-lsp daml-mode nix-mode magit monokai-theme key-chord hydra))
 '(safe-local-variable-values
   '((eval add-hook 'before-save-hook #'lsp-format-buffer nil nil)
     (lsp-metals-scalafmt-config-path . "scalafmt.conf")))
 '(sbt:prefer-nested-projects t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
