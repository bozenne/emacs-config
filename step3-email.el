;;; Email

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
;;(use-package mu4e :ensure t)

;; default
;; (setq mu4e-maildir "~/Maildir")
(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

;; something about ourselves
(setq
user-mail-address "brice.ozenne@orange.fr"
user-full-name  "Brice Ozenne"
mu4e-compose-signature
(concat
"Brice Ozenne\n"
"brice.ozenne@orange.fr\n"))
