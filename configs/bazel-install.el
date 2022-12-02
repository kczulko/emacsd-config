;; bazel-build mode

(require 'bazel)
(add-to-list 'auto-mode-alist '("BUILD\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("WORKSPACE" . bazel-mode))
