(packages-conditional-install '(haskell-mode dante))

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  ;; OR:
  ;; (add-hook 'haskell-mode-hook 'flymake-mode)
  (add-hook 'haskell-mode-hook 'dante-mode)
  (add-hook 'haskell-mode-hook 'company-mode)
  )

;; ===========================================
;; old intero configuration
;; ===========================================
;; (packages-conditional-install '(haskell-mode intero hasky-stack))

;; (require 'hasky-stack)
;; (add-hook 'haskell-mode-hook 'intero-mode)
