;; bazel-build mode

(require 'url)
(url-copy-file "https://raw.githubusercontent.com/bazelbuild/emacs-bazel-mode/master/bazel.el" "~/.emacs.d/configs/bazel.el" "ok-if-already-exists")
(load "~/.emacs.d/configs/bazel")

(require 'bazel)
(add-to-list 'auto-mode-alist '("BUILD\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("WORKSPACE" . bazel-mode))
