;;; Dired, file management
(define-key dired-mode-map (kbd "e") 'dired-sort-extension)
(define-key dired-mode-map (kbd "\C-ce") 'dired-sort-extension)
(define-key dired-mode-map (kbd "\C-cn") 'dired-sort-name)
(define-key dired-mode-map (kbd "\C-ct") 'dired-sort-time)
(define-key dired-mode-map (kbd "M-r") 'dired-omit-mode)
(define-key dired-mode-map (kbd "o") 'brice-dired-display-side)

(global-set-key (kbd "C-M-ø") 'lgrep)


;;; windows cycling
(global-set-key "\M-o" 'other-window)          ; move to next window clockwise
(global-set-key "\M-O" '(lambda ()(interactive) (other-window -1))) ; move to next window anti-clockwise
(global-set-key [(f8)] 'winner-undo)
(global-set-key [(meta f8)] 'genome/winner-cycle)
(global-set-key [(shift f8)] 'genome/winner-cycle-backwards)
;; move from one window to another
(global-set-key (kbd "M-S-<up>")  'windmove-up)
(global-set-key (kbd "M-S-<down>")  'windmove-down)
(global-set-key (kbd "M-S-<left>")  'windmove-left)
(global-set-key (kbd "M-S-<right>")  'windmove-right)
(global-set-key (kbd "M-,") 'other-frame)
;; necessary to specify for orgmode otherwise M-<left> is for moving one word

;; open a windows explorer at the path of the current buffer
(global-set-key (kbd "<f9>") 'brice-open-directory-with-explorer)
(global-set-key (kbd "M-<f9>") 'brice-open-file-or-directory-in-external-app)


;;; Buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-g") 'goto-line)

;;; Editing files

;; undo
(global-set-key (kbd "<f10>") 'undo-only)

;; comment
(global-set-key "\M-;" 'genome/comment-or-uncomment-line-or-region)
(global-set-key (kbd "\C-c ;") 'brice-comment-symbol)

;; duplicate a line of text
(global-set-key (kbd "C-M-y") 'brice-duplicate-line-or-region)

;; expanding text
(global-set-key "\C-ci" 'hippie-expand)
(global-set-key "\M-i" 'dabbrev-expand)

;; copy-and-paste 
(global-set-key "\M-y" 'genome/yank-or-pop)
(global-set-key "\M-r" 'copy-region-as-kill)

;; cycle
(global-set-key "\C-cy" '(lambda ()
                           (interactive)
                           (popup-menu 'yank-menu)))


;; major-mode specific indentation
(global-set-key "\M-q" 'genome/indent-paragraph)
;;(define-key R-minor-mode-map "\M-q" 'eg/indent-paragraph)
;;(define-key LaTeX-mode-map "\M-q" 'eg/indent-paragraph)

(global-set-key "\M-Q" '(lambda () (interactive) (mark-paragraph) (fill-region-as-paragraph (region-beginning) (region-end))))

;; marking text
(global-set-key "\M-." 'genome/mark-line)
(global-set-key (kbd "C-M-l") 'brice-copy-line)

;; go to the end of a function
(global-set-key (kbd "C-M-z") 'end-of-defun)

;; use count-words instead of count-words-region as it works on buffer
;; if no region is selected
(global-set-key (kbd "M-=") 'count-words)

;; insert current time
(global-set-key "\C-ct" 'brice-current-time)

;; move to the beginning of the line
(global-set-key (kbd "\C-a") 'brice-beginning-of-line)

;; iedit mode
(global-set-key (kbd "\C-c o") 'iedit-mode)

;; transport regular expression  m()=g(2)
(global-set-key (kbd "\C-x \C-t") 'transpose-sexps)

;; delete end of line
(global-set-key (kbd "C-S-e") 'kill-line)

;; move text up
;; (global-set-key (kbd "\C-\S-u") 'move-text-up)
(global-set-key "\C-d" 'delete-char)
(global-set-key (kbd "C-S-a") 'move-text-up) ;; above
(global-set-key (kbd "C-S-b") 'move-text-down) ;; below

;;; Snippet
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;;; Google
(global-set-key (kbd "\C-c g") 'google-this)

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
(add-hook 'python-mode-hook 
          (lambda ()
            (local-set-key (kbd "<backtab>") 'outshine-cycle-buffer)
	    )
	  )



;;;; package folding
(global-set-key [(f12)] 'folding-mode)
(global-set-key [(meta f12)] 'fold-dwim-toggle)

;;; R
(add-hook 'ess-mode-hook
          (lambda () 
            (define-key ess-mode-map (kbd "\C-c A") 'brice-ess-name-argument)
	    (define-key ess-mode-map (kbd "\C-c b") 'brice-ess-browser-r)	    
	    (define-key ess-mode-map (kbd "\C-c d") 'ess-tracebug)
            (define-key ess-mode-map (kbd "\C-c c") 'brice-ess-clone)
            (define-key ess-mode-map (kbd "\C-c D") 'brice-ess-dim-object)
            (define-key ess-mode-map (kbd "\C-c h") 'brice-ess-head-object)
            (define-key ess-mode-map (kbd "\C-c t") 'brice-ess-tail-object)
            (define-key ess-mode-map (kbd "\C-c T") 'brice-ess-traceback)
	    (define-key ess-mode-map (kbd "\C-c j") 'brice-jump-to-function)
            (define-key ess-mode-map (kbd "\C-c n") 'brice-ess-names-object)
            (define-key ess-mode-map (kbd "\C-c m") 'brice-ess-browser-and-source-r)
	    (define-key ess-mode-map (kbd "\C-c p") 'genome/ess-edit-insert-path)
	    (define-key ess-mode-map (kbd "\C-c P") 'brice-setwd-currentBuffer)
	    (define-key ess-mode-map (kbd "\C-c r") 'ess-switch-process)
            (define-key ess-mode-map (kbd "\C-c s") 'brice-ess-source-r)
	    (define-key ess-mode-map (kbd "\C-c v") 'genome/ess-edit-insert-vector)
            (define-key ess-mode-map (kbd "\C-c U") 'brice-ess-unique-object)
            (define-key ess-mode-map (kbd "\C-c H") 'brice-ess-str-object)
            (define-key ess-mode-map (kbd "\C-c y") 'brice-ess-script-object)
            (define-key ess-mode-map (kbd "\C-c 1") 'brice-ess-ggplot)
            (define-key ess-mode-map (kbd "\C-c 2") 'brice-ess-ggtheme)
            (define-key ess-mode-map (kbd "C-c M-p") 'brice-ess-packageSource-r)
	    (define-key ess-mode-map (kbd "C-M-d") 'ess-roxy-preview-HTML)
            (define-key ess-mode-map (kbd "C-M-u") 'genome/ess-edit-indent-call-sophisticatedly)
	    (define-key ess-mode-map (kbd "M-æ") 'genome/ess-switch-to-R)
	    (define-key ess-mode-map (kbd "M-H") 'genome/ess-get-help-R-object)
	    (define-key ess-mode-map (kbd "C-M-z") 'ess-goto-end-of-function-or-para)
	    (define-key ess-mode-map (kbd "M-<right>") 'windmove-right)
	    )
	  )

(add-hook 'inferior-ess-mode-hook
		  (lambda ()
			(define-key inferior-ess-mode-map (kbd "M-æ") 'ess-switch-to-inferior-or-script-buffer)
			)
		  )
;;; C++
(add-hook 'c++-mode-hook
		  (lambda ()
			(define-key c++-mode-map (kbd "\C-c s") 'brice-ess-source-rcpp)
			(define-key c++-mode-map (kbd "M-æ") 'genome/ess-switch-to-R)
			(define-key c++-mode-map (kbd "M-q") 'indent-region)
			(define-key c++-mode-map (kbd "C-c M-p") 'brice-ess-packageSource-r)	    
			))

;;; Python
(add-hook 'python-mode-hook
          (lambda () 
            (define-key python-mode-map (kbd "<C-return>") 'brice-python-shell-send-region)
   	    (define-key python-mode-map (kbd "M-æ") 'brice-python-switch-to-py)
    	    (define-key python-mode-map "\M-H" 'elpy-doc)
	    )
	  )
;; python -m pip install matplotlib.mlab


;;; orgmode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; never want tab to do a tab - see genome/org-tab below
(setq org-cycle-emulate-tab nil)

(add-hook 'org-mode-hook
	  '(lambda ()
	     ;; complete on ess
	     (add-to-list 'hippie-expand-try-functions-list (lambda (old) (ess-complete-object-name)))
	     (define-key org-mode-map (kbd "C-<left>") 'org-table-move-column-left)
	     (define-key org-mode-map (kbd "C-<right>") 'org-table-move-column-right)
	     (define-key org-mode-map [(tab)] 'genome/org-tab)	    
	     (define-key org-mode-map [(meta H)] 'brice-org-open-corresponding-tex)
	     (define-key org-mode-map [(meta j)] 'brice-org-export-to-pdf)
	     (define-key org-mode-map [(meta J)] 'brice-org-export-and-open-corresponding-pdf)
	     (define-key org-mode-map [(meta L)] 'brice-org-run-latexmk)
	     (define-key org-mode-map [(meta l)] 'brice-org-save-and-export-to-latex)
	     (define-key org-mode-map (kbd "\C-c v") 'brice-org-open-corresponding-preview)
	     (define-key org-mode-map (kbd "\C-c V") 'brice-org-open-corresponding-pdf)
	     (define-key org-mode-map [(control tab)] 'hide-subtree)
	     (define-key org-mode-map [(meta control i)] 'genome/org-indent)
	     (define-key org-mode-map ";" 'ess-insert-assign)
	     (define-key org-mode-map (kbd "M-æ") 'genome/ess-switch-to-R)
	     (define-key org-mode-map (kbd "\C-c \C-v c") 'genome/org-babel-clear-all-results)  
	     (define-key org-mode-map (kbd "M-S-<up>")  'windmove-up)
	     (define-key org-mode-map (kbd "M-S-<down>")  'windmove-down)
	     (define-key org-mode-map (kbd "M-S-<left>")  'windmove-left)
	     (define-key org-mode-map (kbd "M-S-<right>")  'windmove-right)
	     ))


;;; Auctex
(add-hook 'LaTeX-mode-hook
		  '(lambda ()
			 (define-key LaTeX-mode-map "\M-j" 'genome/latex-save-and-run)
			 (define-key LaTeX-mode-map [(meta L)] 'brice-tex-run-latexmk)))


;;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;;; spelling
(global-set-key (kbd "<f7>") 'ispell-buffer)
(global-set-key (kbd "M-<f7>") 'brice-flyspell-check-next-highlighted-word)

(global-set-key (kbd "\C-cf") 'flyspell-region)
;; (global-set-key (kbd "\C-cf") '(lambda ()
;; 				 (interactive)
;; 				 (let (pp mark-paragraph)
;; 				   (flyspell-region pp)
;; 				   ))
;; 		)

;; ispell
(dolist (mode '(emacs-lisp-mode-hook
                inferior-lisp-mode-hook))
  (add-hook mode '(lambda () (flyspell-prog-mode)))
  )



