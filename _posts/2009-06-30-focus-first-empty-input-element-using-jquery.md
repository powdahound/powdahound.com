---
author: garret
comments: true
date: 2009-06-30 07:39:00+00:00
layout: post
slug: focus-first-empty-input-element-using-jquery
title: Focus first empty input element using jQuery
categories:
- Tech
tags:
- html
- javascript
- jquery
---

It's often helpful to auto-focus form elements for users of your site so they don't have to manually select them with the mouse. I'd been using the following code on a few sites:

<script src="https://gist.github.com/powdahound/153203.js"></script>

It will focus the first input element on the page that is visible, enabled, doesn't contain any text, and doesn't have the class 'nofocus' (so you can avoid search fields or other secondary inputs). One of the cool things about [jQuery](http://jquery.com) is that you can write some really short code to do very powerful things. Here's my jQuery implementation of the above code:

<script src="https://gist.github.com/powdahound/153214.js"></script>

The only functionality that is lost is focusing of text and password fields only. jQuery's [selectors](http://docs.jquery.com/Selectors) make it easy to select all input elements, just text, or just password, but not "text OR password" as far as I can tell. If you can make it any shorter please let me know!
