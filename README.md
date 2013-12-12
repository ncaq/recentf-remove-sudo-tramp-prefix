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

Dropboxで.recentfを共有する時にどうぞ
自分がsudoしかtrampの機能を使ってないのでsshとかには対応してません
