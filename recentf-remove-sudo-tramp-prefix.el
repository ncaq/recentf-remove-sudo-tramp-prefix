;; -*- lexical-binding: t -*-

(require 'recentf)
(require 'tramp)

(defun remove-sudo (x)
  (if (tramp-tramp-file-p x)
      (let ((tx (tramp-dissect-file-name x)))
        (if (tramp-local-host-p tx)
            (tramp-file-name-localname tx)
          x))
    x))

(defun delete-sudo-from-recentf-list ()
  (setq recentf-list (mapcar 'remove-sudo recentf-list)))

(advice-add 'recentf-cleanup :before 'delete-sudo-from-recentf-list)

(provide 'recentf-remove-sudo-tramp-prefix)
