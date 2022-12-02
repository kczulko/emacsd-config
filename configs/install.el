;; util functions to instal packages if they don't exists

(add-to-list 'package-archives '("melpa-org" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

(defun package-conditional-install (package-name)
  "Install a package if it is not present"
  (unless (package-installed-p package-name)
    (package-refresh-contents) (package-install package-name)))

(defun packages-conditional-install (packages)
  "Install list of packages if not present"
  (when packages
    (package-conditional-install (car packages))
    (packages-conditional-install (cdr packages))))

(packages-conditional-install '(
    ace-window
    ag
    avy
    bazel
    company
    dockerfile-mode
    eno
    envrc
    go-mode
    goto-chg
    haskell-mode
    helm
    helm-ag
    helm-lsp
    helm-projectile
    highlight-symbol
    hydra
    key-chord
    lsp-haskell
    lsp-metals
    lsp-mode
    lsp-ui
    magit
    markdown-mode
    monokai-theme
    multiple-cursors
    nix-mode
    projectile
    smartparens
    solidity-mode
    string-edit
    string-inflection
    terraform-mode
    use-package
    visual-regexp-steroids
    yaml-mode
    yasnippet
    sbt-mode
    flycheck
                                ))

;; updated all packages on startup
;;(auto-package-update-maybe)



























