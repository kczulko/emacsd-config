;; highlight
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq inhibit-startup-screen t)

(defun i3lock ()
  "Locks i3 screen"
   (interactive)
   (shell-command "i3lock-pixeled"))

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


;; enable flyspell to spell checking
;; to disable it for some specific modes
;; repeat the same but assign -1 to those modes
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))


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


(key-chord-define-global "kw" 'kill-word)
(key-chord-define-global "bw" 'backward-kill-word)
(key-chord-define-global "mw" 'mark-word)
(key-chord-define-global "ms" 'mark-sexp)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c d") 'double-line)
(global-set-key [(control .)] 'goto-last-change)
;; (global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-L") 'i3lock)
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)
;;(global-undo-tree-mode 1)



