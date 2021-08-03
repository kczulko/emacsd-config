(packages-conditional-install '(dante haskell-mode))

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'company-mode)
  (add-hook 'haskell-mode-hook 'dante-mode)
  :config
  (setq-default dante-repl-command-line
                '("cabal" "new-repl" dante-target "--builddir=dist-newstyle/dante"))
  (flycheck-add-next-checker 'haskell-dante '(warning . haskell-hlint))
  )
;; (setq company-minimum-prefix-length 0)

;; (packages-conditional-install '(lsp-mode lsp-ui lsp-haskell))
;; (require 'lsp)
;; (use-package lsp-ui)
;; (add-hook 'haskell-mode-hook #'lsp)
;; (add-hook 'haskell-literate-mode-hook #'lsp)

;; (add-to-list 'eglot-server-programs '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))

;; (use-package lsp-haskell

;; :ensure t

;; :config

;; (setq lsp-log-io t)

;; )

;; ;;------------------------------------------------------------------

;; (use-package lsp-mode

;; :ensure t

;; :hook

;; (haskell-mode . lsp)

;; (haskell-literate-mode . lsp)

;; :commands

;; (lsp)

;; :config

;; (setq lsp-prefer-flymake nil)

;; )

;; ;;------------------------------------------------------------------

;; (use-package lsp-ui

;; :ensure t

;; :commands

;; (lsp-ui-mode)

;; :config

;; (setq lsp-ui-flycheck-enable t)

;; )

;; ;;------------------------------------------------------------------

;; ;; flycheck configuration for linting errors:

;; (use-package flycheck

;; :ensure t

;; :init

;; (global-flycheck-mode t))

;; ;;------------------------------------------------------------------

;; (use-package yasnippet

;; :ensure t)


;; ----- haskell-language-server configuration: -----

;;------------------------------------------------------------------

;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (haskell-mode . lsp)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; ;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; ;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package haskell-dap) to load the dap adapter for your language

;; ;; (define-key haskell-mode-map "\C-h o" 'haskell-hoogle)


(global-set-key (kbd "C-h C-o") 'haskell-hoogle)

;; (use-package lsp-haskell
;;   :ensure t
;;   :config
;;   (setq lsp-log-io t))

;;------------------------------------------------------------------

;; (use-package lsp-mode

;; :ensure t

;; :hook

;; (haskell-mode . lsp)

;; (haskell-literate-mode . lsp)

;; :commands

;; (lsp)

;; :config

;; (setq lsp-prefer-flymake nil)

;; )

;;------------------------------------------------------------------

;; (use-package lsp-ui
;;   :ensure t
;;   :commands
;;   (lsp-ui-mode)
;;   :config
;;   (setq lsp-ui-flycheck-enable t))

;;------------------------------------------------------------------

;; flycheck configuration for linting errors:
;; (use-package flycheck
;;   :ensure t
;;   :init
;;   (global-flycheck-mode t))

;;------------------------------------------------------------------

;; (use-package yasnippet

;; :ensure t)

;;------------------------------------------------------------------


;; (use-package dap-mode
  ;; :hook
  ;; (lsp-mode . dap-mode)
  ;; (lsp-mode . dap-ui-mode)
  ;; )
