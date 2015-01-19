---
slug: tricky-apache-configuration-bug
title: Tricky Apache configuration bug
categories:
- Tech
---

When using Apache's [DirectoryIndex](http://httpd.apache.org/docs/2.2/mod/mod_dir.html#directoryindex) directive make sure you don't separate the values with commas. If you do, Apache will be looking for filenames ending in commas!

{% highlight apache %}
# Incorrect
DirectoryIndex index.html, index.php, index.cgi

# Correct
DirectoryIndex index.html index.php index.cgi
{% endhighlight %}
