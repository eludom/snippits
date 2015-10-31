; http://stackoverflow.com/questions/3313210/converting-this-untabify-on-save-hook-for-emacs-to-work-with-espresso-mode-or-a

;; untabify some modes
(setq alexott/untabify-modes '(python-mode emacs-lisp-mode lisp-mode))
(defun alexott/untabify-hook ()
  (when (member major-mode alexott/untabify-modes)
     (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'alexott/untabify-hook)
