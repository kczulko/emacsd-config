;;; loads all the packages

(require 'use-package)

;; yasnippet
;; markdown
;; scala
;; haskell
;; go

(use-package use-package-chords
  :config (key-chord-mode 1))


(use-package nix-mode
  :mode "\\.nix\\'"
  )


(use-package daml-lsp
  :load-path load-path ;; yes... that's strange
  )


(use-package daml-mode
  :load-path load-path ;; yes... that's strange
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
  ;; :after (lsp)
  :interpreter
  ("scala" . scala-mode)
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
  ;; Optional - enable lsp-mode automatically in scala files
  :hook
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  ;; (haskell-mode . lsp)
  ;; (haskell-literate-mode . lsp)
  :chords
  ("zl" . 'lsp-avy-lens)
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
(use-package lsp-ui)


;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
(use-package yasnippet)


;; Use company-capf as a completion provider.
;;
;; To Company-lsp users:
;;   Company-lsp is no longer maintained and has been removed from MELPA.
;;   Please migrate to company-capf.
(use-package company
  :hook (scala-mode . company-mode)
  :config
  (setq lsp-completion-provider :capf))

;; Use the Debug Adapter Protocol for running tests and debugging
(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  )
(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  )



;; (use-package)

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


;; (use-package docker
;;   :bind ("C-c d" . docker))


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
;; for multiple cursors: https://www.google.com/search?client=firefox-b-d&q=emacs+multiple+cursors+edit+lines#kpvalbx=_KgGdY43vE66wrgTUqY-oCQ_25
