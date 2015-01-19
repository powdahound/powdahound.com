---
slug: setting-up-ubuntu
title: Setting up Ubuntu
categories:
- Tech
---

I installed Ubuntu on my desktop again since I felt like desktop Linux was getting much closer to a state where I'd be willing to make the switch. My experience has been so much better than previous Gentoo and Ubuntu installs (even my wireless worked out of the box!) but there were still a few critical things I had to fix myself.

**1. Fonts**
Fonts in Linux look like crap by default. The [Sharp Fonts](http://www.sharpfonts.com/) tutorial solved all my ugly font problems in about 5 minutes. This is a problem I never actually solved the other times I tried Linux on the desktop. Now pages in Firefox look just like they would in Windows Firefox (crical for web development!). I realize that Microsoft won't let anyone repackage and redistribute their fonts, but someone could still automate the Sharp Fonts tutorial and distribute the script with the default installation.

**2. Mouse buttons**
I have a Microsoft Habu mouse with buttons on the side that I like to use as forward/back buttons while browsing. Of course these didn't work with the default xorg config but [this tutorial](http://gentoo-wiki.com/HOWTO_Advanced_Mouse/Individual_Configurations#Microsoft_Habu) on the Gentoo Wiki had the exact config I needed! Debugging this yourself can take a long, long time.

**3. Sound**
It turns out that Linux or Ubuntu aren't really to blame for my sound issues. The Sound Blaster X-Fi card I have just has really bad Linux support. Is Creative good at making drivers for _any_ OS? Luckily the onboard sound on my motherboard (Asus M2N32-SLI) works just fine and is supported by ALSA and OSS.

**4. Firefox's backspace action**
I hadn't realized this before, but I hit backspace all the time in Firefox to navigate back. I'm not sure why this is disabled in the default install, but it's easily switched in [about:config](http://kb.mozillazine.org/About:config) by setting the `browser.backspace_action` preference to 0.

Some other thoughts about the switch...

 * [IEs 4 Linux](http://www.tatanka.com.br/ies4linux/) - testing stuff in IE6 is now really easy! I'm not able to test IE7 without booting a VM, but luckily it behaves well most of the time.
 * [Thunderbird](http://www.mozilla.com/en-US/thunderbird/) works much better with IMAP than I expected it to.
 * I was hoping [gedit](http://www.gnome.org/projects/gedit/) would be more like [Textmate](http://macromates.com/) than it is. [This tutorial](http://grigio.org/textmate_gedit_few_steps) helps a lot, but I can't find a way to get the keybinds to be the same. At the very least, I'd like emacs-style keybinds in gedit.

I've also been using Ubuntu as the OS on my new VPS from [VPSLink.com](http://vpslink.com/) which is hosting this site. More on them in the future...
