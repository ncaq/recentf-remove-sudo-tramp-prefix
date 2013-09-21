recentf-purge-tramp
===================
GPLv3
.recentfのtramp経由(sudo)のファイルパスを通常の状態に戻す
例
/sudo:root@gentoo-z9-u3:/etc/portage/package.use
↓
/etc/portage/package.use

```emacs
(require 'recentf-purge-tramp)
```
で有効にしてください

Dropboxで.recentfを共有するときにでもどうぞ
sshとかには自分がsudoしかtrampの機能を使ってないので相当してません
尚,実行Binaryの関係でLinux以外はmain.dをビルドし直さなければ多分動きません
other Linuxの人はdmdをご利用ください
