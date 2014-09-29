;; -*- lexical-binding: t -*-
(require 'recentf)

(defun delete-sudo-tramp (source)
  (replace-regexp-in-string "^/sudo:root@.+:" "" source))

(defun purge ()
  (setq recentf-list (mapcar 'delete-sudo-tramp recentf-list))
  (recentf-cleanup))

(if recentf-mode
    (purge)
  (add-hook 'recentf-load-hook 'purge))

(provide 'recentf-purge-tramp)
