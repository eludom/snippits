:;exec emacs -batch -l "$0" -f main "$@"
; http://kitchingroup.cheme.cmu.edu/blog/2014/08/06/Writing-scripts-in-Emacs-lisp/

(defun main ()
  (print (version))
  (print (format "I did it. you passed in %s" command-line-args-left)))

;; Local Variables:
;; mode: emacs-lisp
;; End:
