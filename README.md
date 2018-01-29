# recentf-remove-sudo-tramp-prefix

```txt
/sudo:root@localhost:/etc/portage/package.use
↓
/etc/portage/package.use
```

のように,recentfの記録を正規化してくれるパッケージです.
sudoを使ったものと,sudoを使ってないもので履歴が2重に登録されてしまうのを後から正規化することが出来ます.
後はrecentfの標準機能で重複したものは削除されます.

# How to

~~~
(require 'recentf-remove-sudo-tramp-prefix)
(recentf-remove-sudo-tramp-prefix-mode 1)
~~~

これを実行してマイナーモードを有効化していれば`(recentf-cleanup)`を実行した時に自動で削除されます.
