---
author: garret
comments: true
date: 2009-10-11 07:52:19+00:00
layout: post
slug: colorize-log-output-with-ack
title: Colorize log output with ack
categories:
- Tech
tags:
- ack
- apache
- programming
---

Adding color to log files makes them a lot easier to understand, especially when [tailing](http://en.wikipedia.org/wiki/Tail_%28Unix%29) them. That’s why tools like [MultiTail](http://www.vanheusden.com/multitail) were created, and [some](http://log4perl.sourceforge.net/releases/Log-Log4perl/docs/html/Log/Log4perl/Appender/ScreenColoredLevels.html) [logging](http://wiki.osuosl.org/display/howto/ANSI+Color+logging+with+log4j+for+any+appender) tools can output in color. Last night I realized color could be added to any log file using [ack](http://betterthangrep.com), an awesome [grep](http://en.wikipedia.org/wiki/Grep) replacement that I recently found.

For example, to make 404s red in a standard Apache access log:

{% highlight bash %}
$ tail -f /var/log/apache2/access.log \
  | ack --passthru --color-match=red "^.* 404 .*$"
{% endhighlight %}

The `--passthru` option makes it so no lines are discarded. You can use multiple colors by piping the output through `ack` multiple times. The `--flush` option is needed to prevent pipe buffering issues and the `--color` option is needed to pass colors through. Here’s an example:

{% highlight bash %}
$ tail -f /var/log/apache2/access.log \
  | ack --flush --passthru --color --color-match=green "^.* 200 .*" \
  | ack --flush --passthru --color --color-match=yellow "^.* 302 .*" \
  | ack --flush --passthru --color --color-match=red "^.* 404 .*"
{% endhighlight %}

![Apache access log colored with ack](/assets/colored_logs.png)

You can use more complex colors like `--color="white on_red"` to make errors stand out even more.

I wonder what other cool things ack can do…

**Note:** You could also [do this with perl](http://fixunix.com/unix/83044-tail-color.html), but it looks a lot less maintainable.
