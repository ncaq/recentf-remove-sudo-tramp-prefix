;; -*- lexical-binding: t -*-
(require 'recentf)

(defun remove-prefix (source)
  (replace-regexp-in-string "^/sudo:root@.+:" "" source))

(defun remove-from-recentf-list ()
  (setq recentf-list (mapcar 'remove-prefix recentf-list))
  (recentf-cleanup))

(if recentf-mode
    (remove-from-recentf-list)
  (add-hook 'recentf-load-hook 'purge))

(provide 'recentf-remove-sudo-tramp-prefix)
