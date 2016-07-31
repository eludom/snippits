:;exec emacs -batch -l "$0" -f main "$@"
; http://kitchingroup.cheme.cmu.edu/blog/2014/08/06/Writing-scripts-in-Emacs-lisp/

(defun main ()
  ;; run-org.el blockname org-file
  ;; run a code block in an org file
  (let ((blockname (pop command-line-args-left))
        (org-file (pop command-line-args-left))
        (src))
    (print (version))    
    (find-file org-file)
    (setq src
          (org-element-map (org-element-parse-buffer) 'src-block
            (lambda (element)
              (when (string= blockname (org-element-property :name element))
                element))
            nil ;info
            t )) ; first-match
    (when src
      (goto-char (org-element-property :begin src))
      ;; since we start with a fresh emacs, we have to configure some things.
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((python . t)))
      (let ((org-confirm-babel-evaluate nil))
        (org-babel-execute-src-block)))
    (print (format "Done." ))))



;; Local Variables:
;; mode: emacs-lisp
;; End:


