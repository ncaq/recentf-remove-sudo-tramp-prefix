;;; recentf-remove-sudo-tramp-prefix.el --- Normalise recentf history -*- lexical-binding: t -*-

;; Author: ncaq <ncaq@ncaq.net>
;; Version: 0.0.0
;; Package-Requires: ((emacs "24.4"))
;; URL: https://github.com/ncaq/recentf-remove-sudo-tramp-prefix

;;; Commentary:

;; recentf save duplicate history, for instance.
;; "/sudo:root@akaza:/usr/share/emacs/24.5/lisp/net/tramp.el"
;; "/usr/share/emacs/24.5/lisp/net/tramp.el"
;; This Package normalise to after.

;;; Code:

(require 'recentf)
(require 'tramp)

(defun recentf-remove-sudo-tramp-prefix-remove-sudo (x)
  "Remove sudo from path.  Argument X is path."
  (if (tramp-tramp-file-p x)
      (let ((tx (tramp-dissect-file-name x)))
        (if (string-equal "sudo" (tramp-file-name-method tx))
            (tramp-file-name-localname tx)
          x))
    x))

;;;###autoload
(defun recentf-remove-sudo-tramp-prefix-delete-sudo-from-recentf-list ()
  "Do `mapcar' `recentf-sudo' to `recentf-list'."
  (setq recentf-list (mapcar 'recentf-remove-sudo-tramp-prefix-remove-sudo recentf-list)))

(advice-add 'recentf-cleanup :before 'recentf-remove-sudo-tramp-prefix-delete-sudo-from-recentf-list)

(provide 'recentf-remove-sudo-tramp-prefix)

;;; recentf-remove-sudo-tramp-prefix.el ends here
