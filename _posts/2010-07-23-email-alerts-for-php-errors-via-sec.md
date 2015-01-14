---
author: garret
comments: true
date: 2010-07-23 14:19:52+00:00
layout: post
slug: email-alerts-for-php-errors-via-sec
title: Email alerts for PHP errors via SEC
categories:
- Tech
tags:
- apache
- hipchat
- monitoring
- php
- sec
---

Production systems should always have PHP's [display_errors](http://www.php.net/manual/en/errorfunc.configuration.php#ini.display-errors) disabled and [log_errors](http://www.php.net/manual/en/errorfunc.configuration.php#ini.log-errors) enabled so errors are logged instead of displayed to users. Of course, you'll want a to be notified when errors happen and that's where a nifty tool called [SEC](http://simple-evcorr.sourceforge.net/) (Simple Event Correlator) comes in. It's not very sexy, but its incredibly powerful and can be used for all sorts of log watching tasks.

Here are some helpful guides for getting started:

 * [Working with SEC- the Simple Event Correlator](http://sixshooter.v6.thrupoint.net/SEC-examples/article.html)
 * [](http://arstechnica.com/open-source/news/2005/05/linux-20050519.ars)[Monitoring with Simple Event Correlator](http://arstechnica.com/open-source/news/2005/05/linux-20050519.ars)
 * [sec man page](http://www.estpak.ee/~risto/sec/sec.pl.html)

At [HipChat](http://www.hipchat.com) we use a config like the following to to monitor Apache's error_log for PHP errors and send us emails:

{% highlight text %}
# Capture error lines and store them in apache-php-errors
type=Single
ptype=RegExp
pattern=^\[.+\] \[error\] \[client .+\] PHP .+$
desc=PHP error or warning
action=add apache-php-errors $0

# Report errors every minute if apache-php-errors is set
type=Calendar
time=* * * * *
desc=Mail web errors
context=apache-php-errors
action=report apache-php-errors /usr/bin/mail -s "PHP errors" alerts@company.com; delete apache-php-errors;
{% endhighlight %}

Assuming you put this config in `/etc/sec/apache.conf` you'd run:

{% highlight bash %}
$ sec --conf=/etc/sec/apache.conf --input /var/log/apache2/error_log
{% endhighlight %}

Try writing a few of your own rules (the --debug flag is very helpful) or the examples in the tutorials above. SEC is incredibly powerful and can make complex monitoring tasks very simple.
