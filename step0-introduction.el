;;; check path-emacs-config
(if (not (boundp 'path-emacs-config) )
    (let ((mess "Cannot load emacs-config: Variable path-emacs-config not defined \n
                 Consider adding (setq path-emacs-config '~/path-emacs-config/') to your init file (e.g., ~/.emacs"))
      (pop-to-buffer "*EG load error*")
      (erase-buffer)
      (insert mess) 
      (error mess)))

(if (not (file-directory-p path-emacs-config) )
    (let ((mess "Cannot load emacs-config: the directory defined by path-emacs-config is not valid \n
                 Consider modifying (setq path-emacs-config '...') in your init file (e.g., ~/.emacs"))
      (pop-to-buffer "*EG load error*")
      (erase-buffer)
      (insert mess) 
      (error mess)))

(message (concat "Loading emacs-config from: " path-emacs-config))
