;;; Receive email

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
;;(use-package mu4e :ensure t)

;; 
(setq mu4e-view-show-images t
      mu4e-view-show-addresses t)

;; don't save message to Sent Messages, GMail/IMAP will take care of this
(setq mu4e-sent-messages-behavior 'delete)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;;
(setq message-kill-buffer-on-exit t)

;;; Send email
(require 'smtpmail)
