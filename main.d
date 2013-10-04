import std.regex;
import std.file;
import std.path;

void main()
{
	immutable default_recentf = expandTilde("~/.recentf");	///チルダ展開

	//immutableにしたかったため一行に詰め込むことに.
	//Symbolic-Linkの場合,本当のファイルを追うようになっています
	immutable filename = (isSymlink(default_recentf)) ? (expandTilde("~/") ~ readLink(default_recentf)) : default_recentf;

	immutable oldstring = readText(filename);
	
	/**
	   "/sudo:root@gentoo-z9-u3:/etc/portage/package.use"
	   を
	   "/etc/portage/package.use"
	   にする,などを想定
	*/
	static auto r = ctRegex!(`/sudo:root@.+:`,"gm");//機械語正規表現,ctRegex
	immutable newstring = replace(oldstring,r,"");//なんでimmutableの正規表現は受付ない仕様なんだろう…?

	std.file.write(filename,newstring);
	//重複とかはEmacs側が何とかしてくれるだろ…多分…
}
