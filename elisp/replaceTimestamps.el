(message "%s▮foo" "bar")

(repl

(defun replace-greek-region (start end)
  "Replace “alpha” to “α” and other greek letters in current region."
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward " alpha" nil t) (replace-match " α" nil t))
    (goto-char (point-min))
    (while (search-forward " beta" nil t) (replace-match " β" nil t))
    (goto-char (point-min))
    (while (search-forward " gamma" nil t) (replace-match " γ" nil t))
    ))

(

(re-search-forward "REGEXP▮" &optional BOUND 'NOERROR COUNT)


(insert "fooo")fooo

(progn
  (defun foo ()
    "about the foo"
    (interactive)
    (let (where)
      (goto-char (point-min))
      (while (re-search-forward ":date[a-zA-Z]+:" nil t) (insert "FOO"))
      (message "Done")
    )
  )
(foo))



* account
  :PROPERTIES:
  :dateUpdated: foo
  :dateCreated: foo
  :dateExpires:
  :END:
