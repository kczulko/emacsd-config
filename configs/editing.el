(packages-conditional-install '(eno goto-chg multiple-cursors avy undo-tree string-edit highlight-symbol visual-regexp-steroids string-inflection))

(key-chord-define-global "kw" 'kill-word)
(key-chord-define-global "bw" 'backward-kill-word)
(key-chord-define-global "mw" 'mark-word)
(key-chord-define-global "ms" 'mark-sexp)

(require 'eno)
(key-chord-define-global "wj" 'eno-word-goto)

(key-chord-define-global "cj" 'avy-goto-subword-1)
(global-set-key (kbd "C-c j") 'avy-goto-subword-1)

;; highlight
(add-hook 'prog-mode-hook 'highlight-symbol-mode)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

;; zoom
(defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out"))

(global-set-key (kbd "C-c g") 'goto-line)

;; enable flyspell to spell checking
;; to disable it for some specific modes
;; repeat the same but assign -1 to those modes
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(defun uncomment-block ()
  "uncomments the /* block */"
  (interactive)
  (isearch-forward nil 1)
  (isearch-printing-char 42 1)
  (isearch-printing-char 47 1)
  (isearch-exit)
  (delete-backward-char 1 nil)
  (delete-backward-char 1 nil)
  (isearch-backward nil 1)
  (isearch-printing-char 47 1)
  (isearch-printing-char 42 1)
  (isearch-exit)
  (delete-forward-char 1 nil)
  (delete-forward-char 1 nil)
  (kmacro-end-or-call-macro nil))

(defun copy-line (arg)
    (interactive "p")
    (let ((beg (line-beginning-position))
          (end (line-end-position arg)))
      (when mark-active
        (if (> (point) (mark))
            (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
          (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
      (if (eq last-command 'copy-line)
          (kill-append (buffer-substring beg end) (< end beg))
        (kill-ring-save beg end)))
    (kill-append "\n" nil)
    (beginning-of-line (or (and arg (1+ arg)) 2))
    (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

(defun goto-next-line-with-ident ()
  (interactive)
  (end-of-line)
  (indent-new-comment-line)
  nil)
(global-set-key [(control return)] 'goto-next-line-with-ident)



(defun double-line (arg)
  "copy line and place it below the original"
  (interactive "p")
  (copy-line arg)
  (yank)
  (move-end-of-line))
(global-set-key (kbd "C-c d") 'double-line)

(global-set-key [(control .)] 'goto-last-change)
(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)


(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;(global-undo-tree-mode 1)

;; magit - ediff working without additional frames
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; regexps
(require 'visual-regexp-steroids)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s

