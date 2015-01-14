---
author: garret
comments: true
date: 2010-06-28 02:33:57+00:00
layout: post
slug: redis-plugin-for-collectd
title: Redis plugin for collectd
categories:
- Tech
tags:
- collectd
- drraw
- monitoring
- open source
- redis
- rrdtool
---

Last weekend I wrote a small [collectd](http://collectd.org/) plugin for monitoring [Redis](http://code.google.com/p/redis/) and put it on GitHub: [http://github.com/powdahound/redis-collectd-plugin](http://github.com/powdahound/redis-collectd-plugin).

If you haven't heard of Redis before, it's a key-value store similar to [memcached](http://memcached.org/) with support for more complex [data types](http://code.google.com/p/redis/wiki/IntroductionToRedisDataTypes) like lists, sets, and hashes. collectd is a stats collection daemon which recently added support for [plugins written in Python](http://collectd.org/wiki/index.php/Plugin:Python). This is great because there's no way I'd write a plugin in C! Anyway, you can use this plugin to collect data about your Redis server like number of active connections, database size, commands processed per second, and memory usage. You can then use a tool like [drraw](http://web.taranis.org/drraw/) to generate nice graphs:

![](http://github.com/powdahound/redis-collectd-plugin/raw/master/screenshots/graph_memory_used.png)

![](http://github.com/powdahound/redis-collectd-plugin/raw/master/screenshots/graph_commands_per_sec.png)

More info and installation instructions on the [GitHub page](http://github.com/powdahound/redis-collectd-plugin).
