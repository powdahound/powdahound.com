---
slug: mkscript-test-script-creator
title: mkscript - test script creator
categories:
- Tech
---

I usually do something wrong when I create test scripts (typo in shebang, not executable, missing open PHP tag, etc) so I wrote a small tool called mkscript that can create them for me.

Basically, instead of doing:

{% highlight bash %}
$ echo '#!/usr/bin/python' > test.py
$ chmod a+x test.py
{% endhighlight %}

You just do:
{% highlight bash %}
$ mkscript test.py
{% endhighlight %}

It knows how to create scripts for bash, perl, php, python, and ruby based on the extension you provide. You can get it [here](http://gist.github.com/188362).

Pair it with [this vim function to execute the current file](/2009/05/execute-current-file-in-vim) and you have a really quick way to create and run test scripts!
