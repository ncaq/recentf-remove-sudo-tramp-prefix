(add-hook 'kill-emacs-hook '(lambda ()
			     (shell-command "./a.out")))
