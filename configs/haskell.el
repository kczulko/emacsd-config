;; TODO: this could be done with a keynav!
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

