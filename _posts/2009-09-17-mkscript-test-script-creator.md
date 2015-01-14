---
author: garret
comments: true
date: 2009-09-17 05:50:00+00:00
layout: post
slug: mkscript-test-script-creator
title: mkscript - test script creator
wordpress_id: 189982500
categories:
- Tech
tags:
- scripts
- tool
---

I usually do something wrong when I create test scripts (typo in shebang, not executable, missing open PHP tag, etc) so I wrote a small tool called mkscript that can create them for me.

Basically, instead of doing:

    
    $ echo '#!/usr/bin/python' > test.py
    $ chmod a+x test.py


You just do:

    
    $ mkscript test.py


It knows how to create scripts for bash, perl, php, python, and ruby based on the extension you provide. You can get it [here](http://gist.github.com/188362).

Pair it with [this vim function to execute the current file](http://blog.powdahound.com/post/124883176/execute-current-file-in-vim) and you have a really quick way to create and run test scripts!
