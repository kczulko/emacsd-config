(packages-conditional-install '(haskell-mode intero hasky-stack))

(require 'hasky-stack)
(add-hook 'haskell-mode-hook 'intero-mode)


