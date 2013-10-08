import std.regex;
import std.file;
import std.path;

immutable(string) recentfPath(in string[] path)
{
	switch(path.length)
	{
	case 1:
		return expandTilde("~/.recentf");
	case 2:
		break;
	default:
		throw new Exception("arg error." "\n" "arg is none and 1 only");
	}
	
	immutable tpath = expandTilde(path[1]);
	if(isSymlink(tpath))
	{
		return expandTilde("~/") ~ readLink(tpath); //todo ちゃんとディレクトリを読む
	}
	else
	{
		return tpath;
	}
}

void main(immutable string[] arg)
{
	immutable filename = recentfPath(arg);

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
