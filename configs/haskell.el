;; (require 'lsp)
;; (require 'lsp-haskell)
;; Hooks so haskell and literate haskell major modes trigger LSP setup
;; (add-hook 'haskell-mode-hook #'lsp)
;; (add-hook 'haskell-literate-mode-hook #'lsp)

;; hoogle search key binding
;; (global-set-key (kbd "C-h C-o") 'haskell-hoogle)


;; bind avy lens and enable lens mode
;; (key-chord-define-global "zl" 'lsp-avy-lens)
;; (setq lsp-lens-enable t)

;; (lsp-register-custom-settings
 ;; '(("haskell.plugin.ghcide-completions.config.autoExtendOn" nil))
 ;; )

;; function for generating mouse event
;; created for clicking into Source or Documentation links
(defun make-mouse-event-at-point (base-event)
  (let ((posn (posn-at-point))
        (prefix "")
        (basic-type (event-basic-type base-event))
        (modifiers (event-modifiers base-event)))
    (cond
     ((and (integerp basic-type) (>= basic-type ?0) (<= basic-type ?9))
      ;; click
      (let* ((mouse-type (intern (format "%smouse-%d" prefix (- basic-type ?0))))
             (click-count 1)
             (type (event-convert-list (append modifiers (list mouse-type)))))
        (list type posn click-count)))
     (t
      (error "Unsupported key for mouse event: %s" (event-basic-type base-event))))))
(defun simulate-mouse-event-at-point ()
  (interactive)
  (let ((event (make-mouse-event-at-point last-input-event)))
    (setq unread-command-events (cons event unread-command-events))))

(defvar simulate-mouse-event-map (make-sparse-keymap))
(global-set-key [f11] simulate-mouse-event-map)
(define-key simulate-mouse-event-map [t] 'simulate-mouse-event-at-point)

