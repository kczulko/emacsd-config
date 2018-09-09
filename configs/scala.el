(packages-conditional-install '(use-package yasnippet))

(require 'use-package)

(use-package ensime
  :ensure t
  :pin melpa-stable)

;;(require 'ensime)


;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;(require 'yasnippet)


;;(setq yas-snippet-dirs
;;      '("~/.emacs.d/snippets"
;;        "~/.emacs.d/my_snippets"
;;	))
;;(yas-reload-all)
;;(add-hook 'scala-mode-hook #'yas-minor-mode)
;;(with-eval-after-load 'company
;;  (define-key company-active-map [tab] nil)
;;  )

;;(add-hook 'scala-mode-hook #'linum-mode)
