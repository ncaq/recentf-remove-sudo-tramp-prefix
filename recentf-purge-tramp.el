(require 'recentf)
(require 'recentf-ext)
(defvar current-dir (file-name-directory load-file-name))

(defun purge ()
  (recentf-save-list)
  (call-process (expand-file-name (concat current-dir "a.out")))
  (recentf-load-list))

(add-hook 'after-init-hook 'purge)
(add-hook 'kill-emacs-hook 'purge)

(provide 'recentf-purge-tramp)
