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
(require 'org-mu4e)
;; (require 'org-mime)			

;; http://pragmaticemacs.com/emacs/use-org-mode-tables-and-structures-in-emails-and-elsewhere/
;; use org structures and tables in message mode
(add-hook 'message-mode-hook 'turn-on-orgtbl)
(add-hook 'message-mode-hook 'turn-on-orgstruct++)


;; ;; via orgmode
;; ;; https://kitchingroup.cheme.cmu.edu/blog/2016/10/29/Sending-html-emails-from-org-mode-with-org-mime/
;; (defun mu4e-compose-org-mail ()
;;  (interactive)
;;  (mu4e-compose-new)
;;  (org-mu4e-compose-org-mode))

;; (defun htmlize-and-send ()
;;   "When in an org-mu4e-compose-org-mode message, htmlize and send it."
;;   (interactive)
;;   (when (member 'org~mu4e-mime-switch-headers-or-body post-command-hook)
;;     (org-mime-htmlize) 
;;     (message-send-and-exit)))

;; (add-hook 'org-ctrl-c-ctrl-c-hook 'htmlize-and-send t)
