;;; Opening emacs
;; generates somewhere a warning "Package cl is deprecated"

;; Start emacs in full screen ;;
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized))))
)

;;; Closing emacs

;; emacs ask y or n instead of yes or no ;;
(fset 'yes-or-no-p 'y-or-n-p)

;; remember buffers for next time emacs will be opened ;;
(global-auto-revert-mode 1)


;;; Encoding 
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; https://zhangda.wordpress.com/

;;; Parenthesis

;; highlight parenthesis
(use-package powerline
  :init
  (setq powerline-default-separator 'slant)
  (setq powerline-gui-use-vcs-glyph 't)
  (setq powerline-height 20)
  (setq powerline-image-apple-rgb 't)
  :config (powerline-default-theme))
;;(use-package powerline :ensure t)
;;(powerline-default-theme)
;;(setq powerline-height 10)
;;(powerline-vim-theme)

;; color parentesis
(use-package rainbow-delimiters :ensure t)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ess-mode-hook 'rainbow-delimiters-mode)

;; match parentesis on different screen
(show-paren-mode t)
;(setq show-paren-style 'parenthesis)
(setq show-paren-style 'expression)
(setq show-paren-style 'mixed)
(setq blink-matching-paren t)

;; automatically close bracket and parentheses
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\`") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\(") 'skeleton-pair-insert-maybe)
;; https://www.emacswiki.org/emacs/ESSAutoParens
;; https://github.com/emacs-ess/ESS/issues/296#issuecomment-189614821

;;; Theme
(use-package moe-theme :ensure t)
(powerline-moe-theme)
;;(setq moe-theme-highlight-buffer-id nil)
(moe-dark)
(setq moe-theme-highlight-buffer-id t)
(moe-theme-random-color)

;; Resize titles (optional).
(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

;;; Moving within files
;;;; Scrolling

;; restaure initial point after scrolling
(use-package scroll-restore :ensure t)
(scroll-restore-mode 1)

;;;; Moving text
(use-package move-text :ensure t)
(move-text-default-bindings)

;;; Moving between open/marked files
;;;; Buffers

;; activate winner mode (i.e. restaure previous configurations of the windows)
(when (fboundp 'winner-mode)
  (winner-mode 1))

(use-package ido :config (ido-mode 'buffers)
  ;;flexibly match names via fuzzy matching
  (setq ido-enable-flex-matching t)
  ;; use ido-mode everywhere, in buffers and for finding files
  (setq ido-everywhere nil)
  ;;(setq ido-use-filename-at-point 'guess); for find-file-at-point
  ;;(setq ido-use-url-at-point t); look for URLs at point
  ;; sort-order, gives preferences to org 
  (setq ido-file-extensions-order '("org" "R" "pdf" "tex" "el"))
  (setq ido-default-buffer-method 'selected-window)
  ;; Last visited files appear in ido-switch-buffer C-x b
  (setq ido-use-virtual-buffers t)
  )

(use-package ido-completing-read+ :ensure t)
;; buffer cycling

;;;; move to other frames/windows

;; transpose frames
(use-package transpose-frame :ensure t)

(customize-set-variable 'display-buffer-base-action '(display-buffer-use-some-frame))

;;;; Bookmark

;; bookmark within orgmode
(use-package org-bookmark-heading :ensure t)

;;;; Remember recent files
(use-package recentf
  :commands recentf-open-files)
(recentf-mode 1)

;;; Dired
;; Collection of useful dired additions [does not seems to work]
;; (use-package dired-hacks-utils :ensure t)
;; see https://github.com/Fuco1/dired-hacks for more info

;; ignore uninteresting files in dired
(require 'dired-x)
(setq-default dired-omit-files-p t)
(setq dired-omit-files "^.+~$\\|^.+#$\\|^\\...+$\\|\\.fls$\\|\\.log$\\|\\.nav$\\|\\.out$\\|\\.snm$\\|\\.soc$\\|\\.synctex.gz$\\|\\.fdb_latexmk$\\|\\.tar.gz$")
;; ^.+~$ : any file with at least one character ending with ~ (version)
;; \\| or
;; ^.+~$ : any file with at least one character ending with # (unsaved file)
;; \\| or
;; ^\\...+$: any file starting by a point an having at least two character after the point

;; move file from one window to another in direct mode ;;
(setq dired-dwim-target t)
;; https://emacs.stackexchange.com/questions/5603/how-to-quickly-copy-move-file-in-emacs-dired

;; filter files dynamically by type
(use-package dired-narrow
  :ensure t
  :bind (:map dired-mode-map
              ("/" . dired-narrow)))


;; color in dired (HTML color codes group)
(use-package dired-rainbow :ensure t)

(defconst dired-R-file-extensions
  '("R" "r")
  "Dired R files extensions")
(dired-rainbow-define R "#329EE8" dired-R-file-extensions)

(defconst dired-tex-file-extensions
  '("tex")
  "Dired tex file extensions")
(dired-rainbow-define tex "#B3CCFF" dired-tex-file-extensions)

(defconst dired-org-file-extensions
  '("org")
  "Dired org file extensions")
(dired-rainbow-define org "#9370DB" dired-org-file-extensions)

(defconst dired-pdf-file-extensions
  '("pdf")
  "Dired pdf file extensions")
(dired-rainbow-define pdf "#ACE1AF" dired-pdf-file-extensions)

;;; Completion

(use-package hippie-exp :commands hippie-expand)
(use-package auto-complete :ensure t)
(use-package popup-complete :ensure t)

;;; Snippet
(use-package yasnippet :ensure t)
(use-package yasnippet-snippets :ensure t)
(use-package auto-yasnippet :ensure t)
(setq yas-snippet-dirs '(path-emacs-snippet))
(yas-global-mode 1)
;; (use-package r-autoyas :ensure t)
;; (setq yas-snippet-dirs
;;       '(expand-file-name "packages/yasnippet-ess/ess-mode" path-emacs-config)
;;       )

;;; Back up files
;; https://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq make-backup-files t               ; backup of a file the first time it is saved.
backup-by-copying t               ; don't clobber symlinks
version-control t                 ; version numbers for backup files
delete-old-versions t             ; delete excess backup files silently
delete-by-moving-to-trash t
kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
auto-save-default t               ; auto-save every buffer that visits a file
auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
)
;;; Reverting files

;; do not ask whenever it is a pdf file
(setq revert-without-query (quote (".*.pdf" ".*.tex")))

;;; Doc view
(add-hook 'doc-view-mode-hook 'doc-view-fit-width-to-window)

;;; Miscellaneous
;; paste: replace region
(delete-selection-mode 1)
;; https://stackoverflow.com/questions/2627289/how-to-replace-a-region-in-emacs-with-yank-buffer-contents

;; browse kill ring
(use-package browse-kill-ring :ensure t)
(use-package kill-ring-search :ensure t)

;; scroll to bottom of the consol after imput
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)

;; display line number in each editor
;; (add-hook 'ess-mode-hook (lambda () (linum-mode)))
;; (add-hook 'prog-mode-hook 'linum-mode)
;; (global-linum-mode t)

