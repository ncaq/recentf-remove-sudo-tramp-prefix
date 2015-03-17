;; -*- lexical-binding: t -*-

(require 'recentf)

(defun remove-prefix (source)
  (replace-regexp-in-string "^/sudo:root@.+:" "" source))

(defun recentf-list-nothing-sudo ()
  (mapcar 'remove-prefix recentf-list))

(with-eval-after-load 'helm-files
  (setf (cdr (assoc 'candidates helm-source-recentf)) 'recentf-list-nothing-sudo)
  )

(defun remove-from-recentf-list ()
  (setq recentf-list (recentf-list-nothing-sudo)))

(advice-add 'recentf-cleanup :before 'remove-from-recentf-list)

(provide 'recentf-remove-sudo-tramp-prefix)
