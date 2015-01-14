---
author: garret
comments: true
date: 2010-08-08 00:00:28+00:00
layout: post
slug: use-git-hooks-to-make-sure-you-never-check-in-ugly-code-again
title: Use git-hooks to make sure you never check in ugly code again
wordpress_id: 537367096
categories:
- Tech
tags:
- code
- git
- open source
---

The [git-hooks](http://github.com/icefox/git-hooks) project provides a way to run git hooks locally before you check in your code. This is especially useful if your code is hosted on [GitHub](http://github.com) because you don't have access to install server side hooks.

From the README:


<blockquote>Hooks can be very powerful and useful.  Some common hooks include:

- Spell check the commit message.
- Check that the code builds.
- Verify that any new files contain a copyright with the current year in it.

Hooks can be very project specific such as:

- Verify that the project still builds
- Verify that autotests matching the modified files still pass with no errors.
- Pre-populate the commit message with the 'standard' format.
- Verify that any new code follows the 'standard' coding style.

or very specific to one person such as:

- Don't allow a push to a remote repository after 1am in case I break something and will be asleep.
- Don't let me commit between 9-5 for projects in ~/personal/ as I shouldn't be working on them during work hours.
</blockquote>



I wrote some hooks for [checking PHP syntax](http://github.com/powdahound/git-hooks/blob/master/contrib/pre-commit/php_syntax) and checking Python files using [PEP-8](http://github.com/powdahound/git-hooks/blob/master/contrib/pre-commit/python_pep8) and [PyFlakes](http://github.com/powdahound/git-hooks/blob/master/contrib/pre-commit/python_pyflakes).

Hopefully they'll integrate this functionality into the git core at some point.
