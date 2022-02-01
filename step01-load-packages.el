;;; load path to package repositories
(require 'package)
(setq eg-elpa-sources '(("gnu" . "http://elpa.gnu.org/packages/")
			("org" . "https://elpa.nongnu.org/nongnu/")
			("melpa" . "http://melpa.org/packages/")
			("melpa-stable" . "http://stable.melpa.org/packages/")
			;;			("marmalade" . "http://marmalade-repo.org/packages/")
			))
(dolist (source eg-elpa-sources) (add-to-list 'package-archives source t))
(add-to-list 'package-directory-list package-user-dir)
(setq orig-package-user-dir package-user-dir)

;;; Prevent initialising twice
(setq package-enable-at-startup nil)  

(if (eq system-type 'windows-nt)
	(package-initialize)
  )


;;; To use the nice command use-package :ensure t when loading packages
;; install package if necessary
(unless (package-installed-p 'use-package)
 (package-refresh-contents)
 (package-install 'use-package)
 )

;; load package
(require 'use-package)
(setq use-package-verbose t)		

;;; load all list file from a directory
(defun load-directory (dir)
  "from https://www.emacswiki.org/emacs/LoadingLispFiles"
   (let ((load-it (lambda (f)
		       (load-file (concat (file-name-as-directory dir) f)))
		     ))
     (mapc load-it (directory-files dir nil "\\.el$")))
   )

