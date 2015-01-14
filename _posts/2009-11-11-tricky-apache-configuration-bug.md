---
author: garret
comments: true
date: 2009-11-11 07:01:29+00:00
layout: post
slug: tricky-apache-configuration-bug
title: Tricky Apache configuration bug
wordpress_id: 239555172
categories:
- Tech
tags:
- apache
---

When using Apache’s [DirectoryIndex](http://httpd.apache.org/docs/2.2/mod/mod_dir.html#directoryindex) directive make sure you don’t separate the values with commas. If you do, Apache will be looking for filenames ending in commas!

    
    # Incorrect
    DirectoryIndex index.html, index.php, index.cgi
    
    # Correct
    DirectoryIndex index.html index.php index.cgi