---
slug: textmate-tip-validate-your-php-syntax-when-saving
title: 'TextMate tip: Validate PHP syntax when saving'
categories:
- Tech
---

The [JavaScript Tools](http://andrewdupont.net/2006/10/01/javascript-tools-textmate-bundle/) bundle for [TextMate](http://www.textmate.com/) automatically runs [JavaScript Lint](http://www.javascriptlint.com/) on your files when saving and shows a little tooltip if there are any errors (like the missing semicolon below).

![](/assets/js_lint_tooltip.png)

It's very easy to enable similar functionality for PHP files. The default TextMate PHP bundle already comes with a 'Validate Syntax' command but it's bound to Ctrl+Shift+V. Here's what you need to change:

 1. Open up the Bundle Editor by hitting Ctrl+Option+Apple+B or opening the Bundles menu and selecting Bundle Editor > Show Bundle Editor.
 1. Find the PHP bundle in the list on the left and open it up.
 1. Select the 'Validate Syntax' command and then change it's 'Save' option to 'Current File' in the dropdown on the right.
 1. Change the keyboard shortcut to Apple+S (or whatever you use to save) in the lower right. Your settings should now look like [this](http://powdahound.com/wp-content/uploads/2008/05/textmate_php_syntax.png).
 1. Close the Bundle Editor (it saves your changes automatically).

Below is an example of what you'll see when saving. It will even move your cursor to the line with the error!

![](/assets/textmate_php_validate.png)

### Update (2008-5-23)

You can prevent the tooltip from displaying when there are no syntax errors by changing the command to:

{% highlight ruby %}
#!/usr/bin/env ruby
require ENV['TM_SUPPORT_PATH'] + '/lib/textmate'
version = %x{#{ENV['TM_PHP'] || 'php'} -v}.split[0..2].join(' ')
#puts "Running syntax check with " + version + ""
result = `#{ENV['TM_PHP'] || 'php'} -d display_errors=on -l`
puts result.gsub('in -', '') unless result =~ /No syntax errors/
TextMate.go_to :line => $1 if result =~ /line (\d+)/
{% endhighlight %}
