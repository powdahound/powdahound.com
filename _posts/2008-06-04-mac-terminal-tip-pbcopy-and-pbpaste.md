---
slug: mac-terminal-tip-pbcopy-and-pbpaste
title: 'Mac Terminal tip: pbcopy and pbpaste'
categories:
- Tech
---

Just found two helpful programs in OS X; pbcopy and pbpaste ([man page](http://developer.apple.com/documentation/Darwin/Reference/ManPages/man1/pbcopy.1.html)). They let you write and read from the OS X clipboard and allow you do to things like:

`$ cat file.txt | pbcopy`

That's a lot faster than opening the file, selecting everything, and copying it!

`$ pbpaste > example.css`

Quicker than firing up emacs/TextMate/whatever.

Of course you can even do fancier things like:

`$ tail -n 10 /var/log/messages | pbcopy`

So good!
