---
title: Winter cleaning
categories:
- Tech
---

Since 2011 this site has been powered by WordPress running on m1.medium Amazon EC2 instance. It became neglected once [HipChat](https://www.hipchat.com) took off and the version of Ubuntu it was running, Natty Narwhal (11.04), stopped being supported on October 2012... Oops! Instead of trying to upgrade the host I figured I’d take the opportunity to simplify things and try out some new tools.

<img src="{{ site.image_url }}jekyll-logo-2x.png" class="right" style="width: 10rem">


### From WordPress to Jekyll

First off, I really don’t need a beefy database-backed CRM powering the site, so WordPress is out. In its place I’ve chosen [Jekyll](http://jekyllrb.com/), the static website tool that powers GitHub Pages. [Hugo](http://gohugo.io/) also looked appealing but lacks the ecosystem of themes and support that Jekyll has. Since I’d like to spend more time writing for the blog instead of tinkering with it, Jekyll wins. (I'm sure Hugo will catch up in time - it seems like a very well run project.)

Jekyll is also nicely supported by [GitHub Pages](https://pages.github.com/) but I saw [scattered](http://discuss.gohugo.io/t/hosting-amazon-s3-vs-github-gh-pages-vs/340) [complaints](http://www.jhsheridan.com/2012/06/25/goodbye-github-pages-hello-amazon-s3/) about their CDN settings and limitations placed on Jekyll plugins so have decided to host the content on Amazon S3 instead.

Ideally I wouldn’t have to worry about deploying site updates to S3 at all, and [Travis CI](https://travis-ci.org) is the tool to make that happen. It watches the site's [GitHub repo](https://github.com/powdahound/powdahound.com) for changes and pushes them over to S3 with the help of the [s3_website](https://github.com/laurilehmijoki/s3_website) gem. [This post](http://www.paperplanes.de/2013/8/13/deploying-your-jekyll-blog-to-s3-with-travis-ci.html) from one of the Travis CI employees shows how easy it is to set up.

Note to self: [ec2instances.info](http://ec2instances.info) would benefit from some Travis CI love as well!


### Over to Heroku

The few other non-static services and sites I hosted have been moved to Heroku and run fine on their free tier.

* [s3browser](https://github.com/powdahound/s3browser), which powers [files.powdahound.com](http://files.powdahound.com), got some minor updates so it will run nicely on Heroku
* The nasty PHP script powering [@SquawSnow](https://twitter.com/squawsnow) was rewritten as a node.js app (will do a followup post on this)


### Simple and cheap

I now have zero servers to worry about maintaining and will save $60/month in hosting costs. Now to kick off some of the other projects on my list and blog about them so this new setup gets some use!
