---
title: Analysis paralysis and the Node.js ecosystem
categories:
- Tech
---

For the past 5 years [@SquawSnow](https://twitter.com/squawsnow) has been sending out a tweet whenever it snows at [Squaw Valley](http://squawalpine.com/) (which is not often enough these past few years).

<blockquote class="twitter-tweet" lang="en"><p>Saturday, December 20, 2014 — New: 8&quot; at 6200&#39;, 10&quot; at 8000&#39; — Totals: 28&quot;/101&quot;</p>&mdash; Squaw Snow Updates (@SquawSnow) <a href="https://twitter.com/SquawSnow/status/546334221917503488">December 20, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

This was done by a PHP script that scraped Squaw's [snowfall tracker](http://squawalpine.com/skiing-riding/weather-conditions-webcams/squaw-valley-snowfall-tracker) every hour to check for changes. But last month I was looking to build something “real” in Node and decided that rewriting this script would be a good place to start.

### Node noob

<img src="/assets/Node.js_logo.svg.png" class="right" style="width: 250px">

I’d never built anything in Node before. In fact, the last time I did [serious JavaScript work](/2007/06/plaxo-30-wap-and-pulse/) was in the days when we still had to consider IE6 (ugh). But I figured it wouldn’t be too hard to get a basic project set up, especially since I didn't need the power of a full framework. I was quickly slowed by the ~120,000 [npm](http://npmjs.org) packages, multiple async styles (classic callbacks, fibers, ES6 generators), and an overwhelming feeling of choice. These are signs of a rich ecosystem and progress, but I was overcome with [analysis paralysis](http://en.wikipedia.org/wiki/Analysis_paralysis).

> Analysis paralysis is the state of over-analyzing (or over-thinking) a situation so that a decision or action is never taken, in effect paralyzing the outcome. ([Wikipedia](http://en.wikipedia.org/wiki/Analysis_paralysis))

It's natural to want to do things "the right way", and I just kept thinking; Is this package already outdated? Is this random person on GitHub actually maintaining this package? Will X play nicely with Y? What would someone experienced use here? Didn't I just read something about a [fork of Node](https://iojs.org/) that was going to progress *even faster*?

Perhaps this is just typical of all newer languages/frameworks and I had false expectations about Node feeling more mature given its popularity. Turns out that the Node ecosystem poses a challenge for some experts as well:

> It's easy to see all of these new things flying by, combined with changes to JavaScript itself, and feel completely overwhelmed. To be honest, over the past two years, even as a maintainer of Ember, I have experienced very serious hype fatigue.
>
> — Yehuda Katz of Ember.js/jQuery/etc on [HN](https://news.ycombinator.com/item?id=8679624) discussing [The State of JavaScript in 2015](http://www.breck-mckye.com/blog/2014/12/the-state-of-javascript-in-2015/) (worth a read)

So maybe that's just the way it's gonna be. Time to make some choices and start coding.

### Making choices

After a reading a few tutorials and opinions I decided a few things:

1. I'd use Node 0.11x invoked with the `--harmony` flag for ES6 for generator support ([details](https://github.com/joyent/node/wiki/ES6-%28a.k.a.-Harmony%29-Features-Implemented-in-V8-and-Available-in-Node)). After using [Twisted's deferred.inlineCallbacks](http://twistedmatrix.com/documents/current/api/twisted.internet.defer.inlineCallbacks.html) for years I can't imagine returning to [callback hell](http://callbackhell.com/). And flow control libraries like [async](https://github.com/caolan/async) still feel dirty to me. Language-level support is where it's at.
1. [Koa](http://koajs.com/) looked like a nice basic web framework to start with.
1. Heroku would make a nice host since they [support Node well](https://devcenter.heroku.com/articles/getting-started-with-nodejs).

### It works!

<img src="/assets/squaw_thumbs_up.jpeg" class="right" style="width: 200px">

And here's the code: [https://github.com/powdahound/squawsnow](https://github.com/powdahound/squawsnow)

It really doesn't do all that much, so didn't take too long to put together. The hardest part was probably figuring out which external packages were going to play nicely with ES6 generators/Promises for Koa. There are surely things I've done wrong but it's in the wild and I learned a lot along the way. If this project were of more importance, this might even be [one to throw away](http://stackoverflow.com/questions/78806/refactor-mercilessly-or-build-one-to-throw-away).

Now I wonder how things will change before my next Node project...
