import std.regex;
import std.file;
import std.path;

void main()
{
	///チルダ展開
	///リンク取得
	///相対パスを絶対パスにするrel2absもう廃止されたそうです
	immutable default_recentf = expandTilde("~/.recentf");
	string filename;
	if(isSymlink(default_recentf))
	{
		filename = expandTilde("~/") ~ readLink(default_recentf);
	}
	else
	{
		filename = default_recentf;
	}
	auto oldfile = readText(filename);
	
	///        "/sudo:root@gentoo-z9-u3:/etc/portage/package.use"
	///を
	///        "/etc/portage/package.use"
	///にする,などを想定
	auto r = regex(`/.+:.+@.+:`,"gm");
	auto newfile = replace(oldfile,r,"");

	write(expandTilde(filename),newfile);
	//重複とかはEmacs側が何とかしてくれるだろ…多分…
}
