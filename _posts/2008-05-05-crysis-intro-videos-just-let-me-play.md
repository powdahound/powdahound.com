---
slug: crysis-intro-videos-just-let-me-play
title: Crysis intro videos; just let me play!
categories:
- Tech
image:
- url: crysis-cover.jpg
  caption: But can it run Crysis?
---

One of my main reasons for [upgrading my computer](http://powdahound.com/2008/03/25/a-partial-hardware-upgrade/) recently was so I could play [Crysis](http://en.wikipedia.org/wiki/Crysis), and for the most part I've really enjoyed the game.

{% figure_img 0 caption %}

But the one thing I just don't get is why they make you sit through so many damn intro videos each time you load the game. I realize that companies need to advertise, but the time it takes to load Crysis is ridiculous and creates enough friction that I'm sometimes just too lazy to play. Here's what you have to go through:

 1. **[EA](http://www.ea.com/) logo** - Just in case I forgot who published this (and almost every other) game. Luckily Crytek did such a good job with Crysis that even EA couldn't mess it up.
 1. **Crytek "Maximum Game" logo** - Since Crytek actually made the game, it seems fair to let them use this space. They should let me skip the screen by hitting Esc, however.
 1. **NVIDIA logo** - I've already given you hundreds of dollars by buying your video cards and motherboards. Now you're just wasting my time.
 1. **Intel logo** - Same as above, although I'm running an AMD in this machine. Maybe this tricks some people into thinking they should be using Intel for playing this game.
 1. **[ESRB](http://en.wikipedia.org/wiki/Entertainment_Software_Rating_Board) Notice: Online interactions not rated by the ESRB** - Great. Isn't putting this on the box enough? Does anyone care besides parents when they're in the store buying the game for their kids?
 1. **"Crysis, by Crytek"** - In case I had become so bored waiting through the previous screens that I actually forgot what game I was waiting to play. WTF?

Is it really worth it for publishers (not that EA is known for being kind) to jam so much advertising into my gaming experience? Luckily you can just rename a few files in order to bypass the videos (what a great and accessible user experience). Just go to the `Crytek\Crysis\Game\Localized\Video\` directory and rename (or remove) all the .sfd files starting with `Trailer_`, including the one in the 'English' directory. Next time you start the game you'll find yourself at the menu within seconds! Sorry NVIDIA, but _this_ is [the way it's meant to be played](http://en.wikipedia.org/wiki/The_Way_It%27s_Meant_to_be_Played).
