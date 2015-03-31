;; -*- lexical-binding: t -*-

(require 'recentf)

(defun remove-prefix (source)
  (replace-regexp-in-string "^/sudo:root@.+:" "" source))

(defun uniq (xs)
  "omit repeated lines only adjacent"
  (reduce (lambda (x a)
            (if (string-equal x (car a))
                a
              (cons x a)))
          xs
          :initial-value '()
          :from-end t))

(defun recentf-list-nothing-sudo ()
  (uniq (mapcar 'remove-prefix recentf-list)))

(with-eval-after-load 'helm-files
  (setf (cdr (assoc 'candidates helm-source-recentf)) 'recentf-list-nothing-sudo))

(defun remove-from-recentf-list ()
  (setq recentf-list (recentf-list-nothing-sudo)))

(advice-add 'recentf-cleanup :before 'remove-from-recentf-list)

(provide 'recentf-remove-sudo-tramp-prefix)
