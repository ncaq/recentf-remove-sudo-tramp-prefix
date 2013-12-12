(require 'recentf)

(defun delete-sudo-tramp (source)
  (replace-regexp-in-string "^/sudo:root@.+:" "" source))

(defun purge ()
  (setq recentf-list (mapcar 'delete-sudo-tramp recentf-list)))

(add-hook 'after-init-hook 'purge)

(provide 'recentf-purge-tramp)
