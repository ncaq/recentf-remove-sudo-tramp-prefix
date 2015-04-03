;; -*- lexical-binding: t -*-

(require 'recentf-remove-sudo-tramp-prefix)

(ert-deftest test:user ()
  (should (equal
           (remove-sudo "~/.gitconfig")
           "~/.gitconfig"
           )))

(ert-deftest test:scp ()
  (should (equal
           (remove-sudo "/scp:root@sonoda:/etc/systemd/system.conf")
           "/scp:root@sonoda:/etc/systemd/system.conf"
           )))

(ert-deftest test:sudo ()
  (should (equal
           (remove-sudo "/sudo:root@akaza.localhost.ncaq.net:/usr/share/emacs/24.5/lisp/net/tramp.el")
           "/usr/share/emacs/24.5/lisp/net/tramp.el"
           )))

(ert-deftest test:tramp-dissect-file-name ()
  (should (equal
           (tramp-dissect-file-name "/sudo:root@akaza:/usr/share/emacs/24.5/lisp/net/tramp.el")
           ["sudo" "root" "akaza" "/usr/share/emacs/24.5/lisp/net/tramp.el" nil]
           )))

(ert-deftest test:tramp-local-host-p ()
  (should-not (tramp-local-host-p ["sudo" "root" "akaza" "/usr/share/emacs/24.5/lisp/net/tramp.el" nil])))

(ert-deftest test:sudo-short ()
  (should-not (equal
               (remove-sudo "/sudo:root@akaza:/usr/share/emacs/24.5/lisp/net/tramp.el")
               "/usr/share/emacs/24.5/lisp/net/tramp.el"
               )))

(ert-deftest test:sudo-properties ()
  (should (equal
           (remove-sudo #("/sudo:root@akaza.localhost.ncaq.net:/usr/share/emacs/24.5/lisp/net/tramp.el" 6 10 (tramp-default t)))
           "/usr/share/emacs/24.5/lisp/net/tramp.el"
           )))

(ert-deftest test:recentf-list ()
  (should (mapc 'remove-sudo recentf-list)))

(ert-deftest test:recentf-list-all-clear ()
  (should (-none-p 'tramp-local-host-p (mapc 'remove-sudo recentf-list))))

(ert-run-tests-interactively t)

(provide 'recentf-remove-sudo-tramp-prefix-test)
