---
slug: safeway-weekly-specials-rss
title: Safeway Weekly Specials RSS
categories:
- Tech
---

In order to learn a bit more about [screen scraping](http://en.wikipedia.org/wiki/Screen_scraping) with [cURL](http://curl.haxx.se/), I coded up a script to generate an RSS feed of [Safeway](http://safeway.com)'s weekly specials. The number of frames and strange redirects on [Safeway.com](http://www.safeway.com) shows that they probably paid some lifeless company a ton of money to develop it for them ([Vertis](http://www.vertisinc.com/), in this case). I can only imagine the frustration their engineers must have while trying to debug this stuff.

Try it out, and let me know how it works for you: [Safeway Weekly Specials RSS](http://www.powdahound.com/safeway-specials/).

Btw the code is on GitHub: [http://github.com/powdahound/safewayspecials](http://github.com/powdahound/safewayspecials)

### Update (January 2015)
I've stopped hosting this service as it was receiving very little use and am shutting down my old web host. Feel free to grab the code and run it yourself if needed, though it seems likely that it'll stop working soon anyway. It's surprising that Safeway hasn't changed their site enough to break the parsing logic yet, which is very brittle.
