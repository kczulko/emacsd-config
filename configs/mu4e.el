;; (load (format "%s/%s" (getenv "MU4E_PATH") "mu4e.el"))

(load "/nix/store/9m57lyr6sb0lbmkr49m8ipj2398fm0hg-mu-1.4.15/share/emacs/site-lisp/mu4e/mu4e.el")

(require 'mu4e)

(setq mu4e-maildir "~/.mail"
mu4e-attachment-dir "~/Downloads")

(setq user-mail-address "example@example.com"
user-full-name  "John Doe")

;; Get mail
(setq mu4e-get-mail-command "mbsync protonmail"
mu4e-change-filenames-when-moving t   ; needed for mbsync
mu4e-update-interval 120)             ; update every 2 minutes

;; Send mail
(setq message-send-mail-function 'smtpmail-send-it
 smtpmail-auth-credentials "~/.authinfo"
smtpmail-smtp-server "127.0.0.1"
smtpmail-stream-type 'starttls
smtpmail-smtp-service 1025)

