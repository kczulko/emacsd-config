;; dockerfile mode
(package-conditional-install 'dockerfile-mode)
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
