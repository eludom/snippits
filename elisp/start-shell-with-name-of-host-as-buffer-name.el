

(defun gmjShell ()
  "Start a shell in a buffer named *shell*<hostname>

Start a shell in a buffer named '*shell*<hostname>'
For now, it assumes the syntax of the filename contains something like

  /ssh:george@domus:...

(e.g. that we're editing a file in tramp).  This should be more general
(e.g. get the hostname if it's just local).  It should also handle 
(prompt?) for creating 2nd (3rd...) shells on a host and name the
buffers something like 

  *shell*<hostname_2>

There is currently no error handling.....

George Jones <gmj@pobox.com> 
"
  (interactive)
(progn
  (setq file-name (buffer-file-name))
  (message file-name)
  (setq hostname (replace-regexp-in-string "/ssh:.*@" "" file-name))
  (setq hostname2 (replace-regexp-in-string ":.*" "" hostname))  
  (message (concat "Hostname: " hostname2))
  (shell (concat "*shell*<" hostname2 ">"))
))

(global-set-key (kbd "<f5>") 'gmjShell)
