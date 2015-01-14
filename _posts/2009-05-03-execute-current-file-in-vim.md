---
author: garret
comments: true
date: 2009-05-03 16:55:42+00:00
layout: post
slug: execute-current-file-in-vim
title: Execute current file in Vim
wordpress_id: 147
categories:
- Tech
tags:
- scripts
- vim
---

Here's a helpful function you can drop in to your .vimrc that binds F5 to execute the current file if it has a [shebang](http://en.wikipedia.org/wiki/Shebang_(Unix)).


    
    function! RunShebang()
      if (match(getline(1), '^\#!') == 0)
        :!./%
      else
        echo "No shebang in this file."
      endif
    endfunction
    map <F5> :call RunShebang()<CR>
    



You'll need to make sure the file is executable. A [similar tip](http://dailyvim.blogspot.com/2009/04/chris-sutter-writes-i-have-script-and.html) was posted the other day on the Daily Vim blog.
