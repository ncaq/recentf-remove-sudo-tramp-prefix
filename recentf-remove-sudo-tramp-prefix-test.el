;; -*- lexical-binding: t -*-

(require 'recentf-remove-sudo-tramp-prefix)

(ert-deftest recentf-remove-sudo-tramp-prefix-remove-sudo:user ()
  (should (equal
           (recentf-remove-sudo-tramp-prefix-remove-sudo "~/.gitconfig")
           "~/.gitconfig"
           )))

(ert-deftest recentf-remove-sudo-tramp-prefix-remove-sudo:scp ()
  (should (equal
           (recentf-remove-sudo-tramp-prefix-remove-sudo "/scp:root@sonoda:/etc/systemd/system.conf")
           "/scp:root@sonoda:/etc/systemd/system.conf"
           )))

(ert-deftest recentf-remove-sudo-tramp-prefix-remove-sudo:sudo ()
  (should (equal
           (recentf-remove-sudo-tramp-prefix-remove-sudo
            "/sudo:root@akaza.localhost.ncaq.net:/usr/share/emacs/24.5/lisp/net/tramp.el")
           "/usr/share/emacs/24.5/lisp/net/tramp.el"
           )))

(ert-deftest recentf-remove-sudo-tramp-prefix-remove-sudo:sudo-properties ()
  (should (equal
           (recentf-remove-sudo-tramp-prefix-remove-sudo
            #("/sudo:root@akaza.localhost.ncaq.net:/usr/share/emacs/24.5/lisp/net/tramp.el"
              6 10 (tramp-default t)))
           "/usr/share/emacs/24.5/lisp/net/tramp.el"
           )))

;; sshを挟んだsudoでsshを残せるか?
(ert-deftest recentf-remove-sudo-tramp-prefix-remove-sudo:ssh ()
  (should (equal
           (recentf-remove-sudo-tramp-prefix-remove-sudo
            "/ssh:ncaq.net|sudo:root@ncaq.net:/etc/resolv.conf")
           "/ssh:ncaq.net:/etc/resolv.conf")))

(ert-deftest recentf-remove-sudo-tramp-prefix-remove-sudo:recentf-list ()
  (should (mapc 'recentf-remove-sudo-tramp-prefix-remove-sudo recentf-list)))

(ert-run-tests-interactively t)

(provide 'recentf-remove-sudo-tramp-prefix-test)
