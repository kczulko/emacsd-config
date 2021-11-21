;; bazel-build mode

(package-conditional-install 'bazel)

(require 'bazel)
(add-to-list 'auto-mode-alist '("BUILD\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("WORKSPACE" . bazel-mode))
