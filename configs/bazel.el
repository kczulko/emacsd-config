;; bazel-build mode

(require 'url)
(url-copy-file "https://raw.githubusercontent.com/bazelbuild/emacs-bazel-mode/master/bazel-build.el" "~/.emacs.d/configs/bazel-build.el" "ok-if-already-exists")
(url-copy-file "https://raw.githubusercontent.com/bazelbuild/emacs-bazel-mode/master/bazel-mode.el" "~/.emacs.d/configs/bazel-mode.el" "ok-if-already-exists")
(load "~/.emacs.d/configs/bazel-build")
(load "~/.emacs.d/configs/bazel-mode")

(require 'bazel-mode)
(add-to-list 'auto-mode-alist '("BUILD\\'" . bazel-mode))
