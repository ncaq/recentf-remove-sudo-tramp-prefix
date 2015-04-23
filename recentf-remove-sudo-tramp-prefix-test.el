;; -*- lexical-binding: t -*-

(require 'recentf-remove-sudo-tramp-prefix)

(ert-deftest remove-sudo:user ()
  (should (equal
           (remove-sudo "~/.gitconfig")
           "~/.gitconfig"
           )))

(ert-deftest remove-sudo:scp ()
  (should (equal
           (remove-sudo "/scp:root@sonoda:/etc/systemd/system.conf")
           "/scp:root@sonoda:/etc/systemd/system.conf"
           )))

(ert-deftest remove-sudo:sudo ()
  (should (equal
           (remove-sudo "/sudo:root@akaza.localhost.ncaq.net:/usr/share/emacs/24.5/lisp/net/tramp.el")
           "/usr/share/emacs/24.5/lisp/net/tramp.el"
           )))

(ert-deftest remove-sudo:sudo-short ()
  (should-not (equal
               (remove-sudo "/sudo:root@akaza:/usr/share/emacs/24.5/lisp/net/tramp.el")
               "/usr/share/emacs/24.5/lisp/net/tramp.el"
               )))

(ert-deftest remove-sudo:sudo-properties ()
  (should (equal
           (remove-sudo #("/sudo:root@akaza.localhost.ncaq.net:/usr/share/emacs/24.5/lisp/net/tramp.el" 6 10 (tramp-default t)))
           "/usr/share/emacs/24.5/lisp/net/tramp.el"
           )))

(ert-deftest remove-sudo:recentf-list ()
  (should (mapc 'remove-sudo recentf-list)))

(ert-run-tests-interactively t)

(provide 'recentf-remove-sudo-tramp-prefix-test)
