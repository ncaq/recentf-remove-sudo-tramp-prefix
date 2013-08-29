import std.regex;
import std.file;
import std.path;
import std.stdio;

void main()
{
	immutable default_recentf = expandTilde("~/.recentf");	///チルダ展開
	string filename;	///リンク取得
	if(isSymlink(default_recentf))
	{
		filename = expandTilde("~/") ~ readLink(default_recentf);
		writeln(filename," is symlink");
	}
	else
	{
		filename = default_recentf;
		writeln(filename," is not symlink");
	}
	auto oldstring = readText(filename);
	
	/**
	   "/sudo:root@gentoo-z9-u3:/etc/portage/package.use"
	   を
	   "/etc/portage/package.use"
	   にする,などを想定
	*/
	static auto r = regex(`/.+:.+@.+:`,"gm");
	auto newstring = replace(oldstring,r,"");

	std.file.write(filename,newstring);
	//重複とかはEmacs側が何とかしてくれるだろ…多分…
}
