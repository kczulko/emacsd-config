(packages-conditional-install '(use-package yasnippet))

(require 'use-package)

;; Enable defer and ensure by default for use-package
(setq use-package-always-defer t
      use-package-always-ensure t)

;; Enable scala-mode and sbt-mode
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook (scala-mode . lsp)
  :config (setq lsp-prefer-flymake nil))

(setq lsp-file-watch-threshold nil)

;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package lsp-ui)

;; C-M-. for searching symbol like class or sth.
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(global-set-key (kbd "C-M-.") 'helm-lsp-workspace-symbol)

;; Add company-lsp backend for metals
(use-package company-lsp)

(require 'yasnippet)

(setq yas-snippet-dirs
     '("~/.emacs.d/snippets"
       "~/.emacs.d/my_snippets"
	))
(yas-reload-all)

;; lsp-mode -> what works:
;; lsp-format-buffer -> starts scalafmt
;; lsp-find-definition -> M-.
;; lsp-find-references -> works and it would be great to connect this with helm
