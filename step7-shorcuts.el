;;; R
(add-hook 'ess-mode-hook
          (lambda () 
            (define-key ess-mode-map (kbd "\C-c m") 'brice-ess-browser-and-source-r)
            (define-key ess-mode-map (kbd "\C-c s") 'brice-ess-source-r)
            (define-key ess-mode-map (kbd "C-c M-p") 'brice-ess-packageSource-r)
	    (define-key ess-mode-map (kbd "\C-c b") 'brice-ess-browser-r)
	    (define-key ess-mode-map (kbd "C-M-d") 'ess-roxy-preview-HTML)
            (define-key ess-mode-map (kbd "C-M-u") 'ess-edit-indent-call-sophisticatedly)

))

;;; dired
(define-key dired-mode-map (kbd "e") 'dired-sort-extension)
(define-key dired-mode-map (kbd "\C-ce") 'dired-sort-extension)
(define-key dired-mode-map (kbd "\C-cn") 'dired-sort-name)
(define-key dired-mode-map (kbd "\C-ct") 'dired-sort-time)

;; edit directly dired buffer
;; C-x C-q (dired-toggle-read-only)
;; C-c C-c (wdired-finish-edit) 

;; find files
;; find-name-dired

;; find text in files
;; regrep

;;; windows
;; move from one window to another
(global-set-key (kbd "M-<left>")  'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>")    'windmove-up)
(global-set-key (kbd "M-<down>")  'windmove-down)
(global-set-key (kbd "M-,") 'other-frame)

;; necessary to specify for orgmode otherwise M-<left> is for moving one word
(add-hook 'org-mode-hook 
          (lambda ()
	    (local-set-key (kbd "M-<left>")  'windmove-left)
	    (local-set-key (kbd "M-<right>") 'windmove-right)
	    (local-set-key (kbd "M-<up>")    'windmove-up)
	    (local-set-key (kbd "M-<down>")  'windmove-down)
	    )
)

;; window cycling
(global-set-key "\M-o" 'other-window)          ; move to next window clockwise
(global-set-key "\M-O" '(lambda ()(interactive) (other-window -1))) ; move to next window anti-clockwise

;; open a windows explorer at the path of the current buffer
(global-set-key (kbd "<f9>") 'brice-open-directory-with-explorer)
(global-set-key (kbd "M-<f9>") 'brice-open-file-or-directory-in-external-app)


;;; Buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; Editing files

;; undo
(global-set-key (kbd "<f10>") 'undo-only)

;; comment
(global-set-key "\M-;" 'TAG-comment-or-uncomment-line-or-region)

;; duplicate a line of text
(global-set-key (kbd "C-M-y") 'brice-duplicate-line)

;; expanding text
(global-set-key "\M-e" 'hippie-expand)
(global-set-key "\M-i" 'dabbrev-expand)

;; copy-and-paste 
(global-set-key "\M-y" 'yank-or-pop)
(global-set-key "\M-r" 'copy-region-as-kill)

;; major-mode specific indentation
(global-set-key "\M-q" 'eg/indent-paragraph)
;;(define-key R-minor-mode-map "\M-q" 'eg/indent-paragraph)
;;(define-key LaTeX-mode-map "\M-q" 'eg/indent-paragraph)

(global-set-key "\M-Q" '(lambda () (interactive) (mark-paragraph) (fill-region-as-paragraph (region-beginning) (region-end))))

;; marking text
(global-set-key "\M-l" 'mark-line)
(global-set-key "\M-\C-l" 'mark-end-of-line)

;;; folding
;;;; package outshine
(global-set-key (kbd "<backtab>") 'outshine-cycle-buffer)
;;(define-key outline-minor-mode-map (kbd "<tab>") 'outline-cycle) ;;; already defined: \M-\C-i

;;(global-set-key (kbd "<C-tab>") 'outline-show-all)
(global-set-key "\M-n" 'outline-next-visible-heading)
(global-set-key "\M-p" 'outline-previous-visible-heading)
(add-hook 'org-mode-hook 
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
	    )
	  )



;;;; package folding
(global-set-key [(f12)] 'folding-mode)
(global-set-key [(meta f12)] 'fold-dwim-toggle)


;;; orgmode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook
	  #'(lambda nil
	      ;; complete on ess
	      (add-to-list 'hippie-expand-try-functions-list (lambda (old) (ess-complete-object-name)))
	      (define-key org-mode-map  "\C-c\C-v" 'brice-browse-this-file)
	      (define-key org-mode-map [(meta k)] 'brice-org-export-to-pdf)
	      (define-key org-mode-map [(meta j)] 'brice-org-export-to-pdf)
	      (define-key org-mode-map [(control tab)] 'hide-subtree)
	      (define-key org-mode-map [(meta e)] 'hippie-expand)
	      ))

;; org-beamer-export-as-latex
;; org-beamer-export-to-latex
;; org-beamer-export-to-pdf
;; org-laltex-export-to-pdf
;; org-laltex-export-to-pdf
