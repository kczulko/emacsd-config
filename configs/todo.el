;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)


;; (setq todo-filepath "/home/kczulko/Projects/emacsd-config/todo.org")
(setq agenda-files (list
                        "~/org/agenda/work.org"
                        "~/org/agenda/home.org"
                        "~/org/agenda/misc.org"))

;;file to save todo items
(setq org-agenda-files agenda-files)
;; (setq org-agenda-files (quote todo-filepath))

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
      '(
        ("w" "work" entry (file+headline "~/org/agenda/work.org" "Tasks")
         "* TODO [#A] %?")
        ("h" "home" entry (file+headline "~/org/agenda/home.org" "Tasks")
         "* TODO [#A] %?")
        ("m" "misc" entry (file+headline "~/org/agenda/misc.org" "Tasks")
         "* TODO [#A] %?")
        ))
