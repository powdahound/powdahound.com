---
author: garret
comments: true
date: 2006-10-28 20:26:44+00:00
layout: post
slug: serverside-css-preprocessor
title: Serverside CSS Preprocessor
categories:
- Tech
---

Had an idea to make a CSS preprocessor that would help solve many of the issues I have with CSS currently. Ideally it would:

**Allow nesting of styles**
Being able to nest styles 'inside' other styles would solve the problem of writing out tons of selector chains.

Automatically insert necessary attributes
For IE and other browsers. IE: automatically add 'cursor:hand' whenever 'cursor:pointer' is seen. Could also add the IE-specific opacity property

**Allow use of variables**
It'd be great to be able to reference a color by variable in multiple styles instead of having to update multiple styles when the color changes.

Looks like someone [had a similar idea](http://www.shauninman.com/post/heap/2005/08/20/css_ssc_quickie) (but currently only does variables).
