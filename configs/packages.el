;;; loads all the packages

(require 'use-package)

(use-package use-package-chords
  :config
  (key-chord-mode 1)
  (key-chord-define-global "kw" 'kill-word)
  (key-chord-define-global "bw" 'backward-kill-word)
  (key-chord-define-global "mw" 'mark-word)
  (key-chord-define-global "ms" 'mark-sexp)
  :custom
  ;; https://github.com/emacsorphanage/key-chord/issues/6
  (key-chord-safety-interval-forward 0.1)
  (key-chord-safety-interval-backward 0)
  (key-chord-safety-interval-forward 0)
)


(use-package nix-mode
  :mode "\\.nix\\'"
  )


(use-package daml-lsp)


(use-package daml-mode
  :mode "\\.daml"
  :bind (:map daml-mode-map
         ("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-next-error)
         ("<tab>" . haskell-indent-cycle))
  ;; :requires daml-lsp
  :after (daml-lsp)
  )


(use-package bazel
  :mode
  ("BUILD$" . bazel-mode)
  ("WORKSPACE$" . bazel-mode)
  ("\\.bazel$" . bazel-mode)
  ("\\.bzl$" . bazel-mode)
  )


(use-package dockerfile-mode
  :mode
  ("Dockerfile\\'" . dockerfile-mode)
  )


(use-package scala-mode
  :interpreter
  ("scala" . scala-mode)
  :hook
  ((scala-mode . lsp)
   ;; TODO: move to common function/value
   (scala-mode . (lambda ()
                   (add-hook 'before-save-hook #'lsp-format-buffer t t)
                   (add-hook 'before-save-hook #'lsp-organize-imports t t))))
  )


(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false"))
)


(use-package flycheck
  :init (global-flycheck-mode))


(use-package lsp-mode
  :commands (lsp lsp-deferred)
  ;; Optional - enable lsp-mode automatically in scala files
  :hook
  ;; (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  ;; (go-mode . lsp-deferred)
  ;; (haskell-mode . lsp)
  ;; (haskell-literate-mode . lsp)
  :chords
  ("zl" . 'lsp-avy-lens)
  :bind (:map lsp-mode-map
         ("C-c i" . lsp-find-implementation)
         )
  :config
  ;; Uncomment following section if you would like to tune lsp-mode performance according to
  ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
  ;;       (setq gc-cons-threshold 100000000) ;; 100mb
  ;;       (setq read-process-output-max (* 1024 1024)) ;; 1mb
  ;;       (setq lsp-idle-delay 0.500)
  ;;       (setq lsp-log-io nil)
  ;;       (setq lsp-completion-provider :capf)
  (setq
   lsp-prefer-flymake nil
   lsp-lens-enable t)
  )


;; Add metals backend for lsp-mode
(use-package lsp-metals)


;; Enable nice rendering of documentation on hover
;;   Warning: on some systems this package can reduce your emacs responsiveness significally.
;;   (See: https://emacs-lsp.github.io/lsp-mode/page/performance/)
;;   In that case you have to not only disable this but also remove from the packages since
;;   lsp-mode can activate it automatically.
(use-package lsp-ui
  :commands lsp-ui-mode)


;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
(use-package yasnippet)


;; To Company-lsp users:
;;   Company-lsp is no longer maintained and has been removed from MELPA.
;;   Please migrate to company-capf.
(use-package company
  :hook (scala-mode . company-mode)
  :config
  (setq lsp-completion-provider :capf))

;; Use the Debug Adapter Protocol for running tests and debugging
;; Posframe is a pop-up tool that must be manually installed for dap-mode
(use-package posframe)
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )


(use-package eno
  :chords
  (("wj" . eno-word-goto))
  )


(use-package avy
  :chords
  (("cj" . avy-goto-subword-1))
  (("hj" . avy-goto-char)))


(use-package yaml-mode
  :mode
  ("\\.yml\\'" . yaml-mode)
  ("\\.yaml\\'" . yaml-mode)
  :bind (:map yaml-mode-map
              ("C-m" . 'newline-and-indent))
  )


(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


(use-package helm-lsp
  :bind
  ("C-c C-a" . helm-lsp-code-actions)
  )


(use-package lsp-mode
  :chords
  ("zl" . lsp-avy-lens)
  :init
  (setq lsp-lens-enable t)
  )


(use-package lsp-haskell
  ;; :after (lsp)
  :hook
  ((haskell-mode . lsp)
  (haskell-literate-mode . lsp))
  :bind
  ("C-h C-o" . haskell-hoogle)
  :config
  (lsp-register-custom-settings
   '(("haskell.plugin.ghcide-completions.config.autoExtendOn" nil))
   )
  )


(use-package visual-regexp-steroids
  :bind
  ("C-c r" . vr/replace)
  ("C-c q" . vr/query-replace)
  ("C-c m" . vr/mc-mark)
  (:map esc-map
        ("C-r" . vr/isearch-backward)
        ("C-s" . vr/isearch-forward))
  )


(use-package ace-window
  :chords
  (("gh" . ace-window)
   ("sw" . ace-swap-window)
   )
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )


(use-package go-mode
  :hook
  (go-mode . lsp)
  (go-mode . (lambda ()
               (add-hook 'before-save-hook #'lsp-format-buffer t t)
               (add-hook 'before-save-hook #'lsp-organize-imports t t)))
  ;; TODO: this is a function that adds save/import hooks
  ;; move it to global functions and reuse here for e.g. scala
  ;; (defun lsp-go-install-save-hooks ()
    ;; (add-hook 'before-save-hook #'lsp-format-buffer t t)
    ;; (add-hook 'before-save-hook #'lsp-organize-imports t t))
  ;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  )


(use-package helm-projectile
  :chords
  (("cm" . helm-projectile-switch-project)
   ("pf" . helm-projectile-find-file))
  )


(use-package helm-ag
  :chords
  (("qw" . helm-do-ag-this-file)
   ("gm" . helm-do-ag-project-root))
  )


(use-package helm
  ;; :preface (require 'helm-config)
  :demand
  :chords
  (("fm" . helm-mini)
   ("ui" . helm-imenu)
   ("hb" . helm-bookmarks))
  :bind
  (("M-x" . helm-M-x)
  ("C-x C-m" . helm-M-x)
  ("C-c C-m" . helm-M-x)
  ("C-x C-b" . helm-buffers-list)
  ("C-x b" . helm-mini)
  ("C-x C-f" . helm-find-files))
  :init
  (setq helm-always-two-windows t
        helm-display-buffer-default-height 23
        ;; This doesn't work since nix 24.05 update
        ;; helm-default-display-buffer-functions '(display-buffer-in-side-window))
        helm-default-display-buffer-functions nil)
  )


(use-package recentf
  :init
  (recentf-mode 1)
  (setq
   recentf-max-saved-items 200
   recentf-max-menu-items 15)
  )


(use-package projectile
  :config
  (projectile-global-mode 1)
  )


(use-package smartparens
  :bind
  (("C-c p" . sp-rewrap-sexp))
  :custom
  (smartparens-global-mode 1)
  )


(use-package magit
  :bind
  (("C-c S" . magit-status))
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  )


(use-package monokai-theme
  :config
  (load-theme 'monokai t)
  )


(use-package yasnippet
  :config
  (setq yas-snippet-dirs
     '(
       "~/.emacs.d/my_snippets"
       ))
  (yas-global-mode 1)
  (yas-reload-all)
  )


;; for multiple cursors: https://www.google.com/search?client=firefox-b-d&q=emacs+multiple+cursors+edit+lines#kpvalbx=_KgGdY43vE66wrgTUqY-oCQ_25
(use-package multiple-cursors
  :bind
  (("C-s-c C-s-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))
  )


(use-package hydra
  :config
  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out"))
  )


(use-package tramp)
(use-package kubel)

(use-package groovy-mode
  :config
  (setq-default groovy-indent-offset 2)
  )


(use-package elm-mode)


(use-package drag-stuff
  :config
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys)
  )


(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq-default
   undo-tree-visualizer-diff 1
   undo-tree-auto-save-history nil)
  )


(provide 'packages)
;;; packages.el ends here
