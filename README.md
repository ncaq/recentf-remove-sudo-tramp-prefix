recentf-purge-tramp
===================
GPLv3  
.recentfのtramp経由(sudo)のファイルパスを通常の状態に戻す  
例  
/sudo:root@localhost:/etc/portage/package.use  
↓  
/etc/portage/package.use  

```emacs
(require 'recentf-purge-tramp)
```
で有効にしてください

Dropboxで.recentfを共有する時にどうぞ
sshとかは残してます
名前変えたほうが良い気がしてきた

Copyright 2014 ncaq
GPLv3