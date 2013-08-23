(require 'recentf)
(require 'recentf-ext)
(defvar current-dir (file-name-directory load-file-name))

(defun purge ()
  (recentf-save-list)
  (shell-command (expand-file-name (concat current-dir "a.out")))
  (recentf-load-list))

(defun recentf-purge-tramp-stand-by ()
  (add-hook 'kill-emacs-hook 'purge))

(defun recentf-purge-tramp ()
  (purge)
  (recentf-purge-tramp-stand-by))

(provide 'recentf-purge-tramp)
