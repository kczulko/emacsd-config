;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

(setq todo-filepath "/home/kczulko/Projects/emacsd-config/todo.org")

;;file to save todo items
(setq org-agenda-files todo-filepath)

;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?B)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;;capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline todo-filepath "Tasks")
         "* TODO [#A] %?")))
