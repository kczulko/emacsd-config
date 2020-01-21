(packages-conditional-install '(use-package yasnippet))

(require 'yasnippet)
(setq yas-snippet-dirs
     '("~/.emacs.d/snippets"
       "~/.emacs.d/my_snippets"
       ))

(yas-global-mode 1)
(yas-reload-all)
