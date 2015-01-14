---
author: garret
comments: true
date: 2008-09-15 15:33:58+00:00
layout: post
slug: s3-directory-browser-01-released
title: S3 Directory Browser 0.1 released
wordpress_id: 83
categories:
- Tech
tags:
- open source
---

A few months ago I created [a small PHP tool](http://code.google.com/p/s3-directory-browser/) to generate file listings for Amazon S3 buckets. The concept is the same as Apache's [mod_autoindex](http://httpd.apache.org/docs/2.0/mod/mod_autoindex.html). Check out [my shared files](http://files.powdahound.com/) for an example. This weekend I finished the install instructions, config documentation, and stuck a 0.1 label on it. I guess that means it's [officially released](http://code.google.com/p/s3-directory-browser/)! Hopefully someone else finds it useful and provides some feedback.

Unfortunately the process of uploading files to an S3 account still sucks -- especially from Windows & Mac. I've been using [Bucket Explorer](http://www.bucketexplorer.com/) but it's not free AND the UI is nasty. The problem is that all the tools assume you're using S3 for personal storage or backup and make it difficult or impossible to upload files and mark them as publicly accessible. [JungleDisk](http://www.jungledisk.com/) works great for automatic backup but they have intentionally avoided supporting public buckets because they want to be seen as a backup app.

[Dropbox](http://www.getdropbox.com/) will probably become a better solution for people looking to share files if they ever support truly public folders. They provide 5gb of storage for free and can also sync your files to all your computers.
