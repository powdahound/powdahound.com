---
slug: formatting-json-on-the-command-line
title: Formatting JSON on the command line
categories:
- Tech
---

If you ever work with JSON on the command line, try out the json_reformat tool included in [yajl-tools](http://packages.ubuntu.com/lucid/yajl-tools) package (or install from [source](http://lloyd.github.com/yajl/)).

**Without json_reformat**

{% highlight bash %}
$ curl http://github.com/api/v2/json/user/show/powdahound
{"user":{"gravatar_id":"d5894734b9f67c07b276319fdc2e5d88","company":"HipChat",
"name":"Garret Heaton","created_at":"2009/04/04 08:36:09 -0700",
"location":"Sunnyvale, CA","public_repo_count":18,"public_gist_count":67,
"blog":"http://powdahound.com","following_count":8,"id":70472,"type":"User",
"permission":null,"followers_count":7,"login":"powdahound",
"email":"powdahound@gmail.com"}}
{% endhighlight %}

**With json_reformat**

{% highlight bash %}
$ curl -s http://github.com/api/v2/json/user/show/powdahound | json_reformat
{
  "user": {
    "gravatar_id": "d5894734b9f67c07b276319fdc2e5d88",
    "company": "HipChat",
    "name": "Garret Heaton",
    "created_at": "2009/04/04 08:36:09 -0700",
    "location": "Sunnyvale, CA",
    "public_repo_count": 18,
    "public_gist_count": 67,
    "blog": "http://powdahound.com",
    "following_count": 8,
    "id": 70472,
    "type": "User",
    "permission": null,
    "followers_count": 7,
    "login": "powdahound",
    "email": "powdahound@gmail.com"
  }
}
{% endhighlight %}

So much nicer!

It will even tell you if there are syntax syntax errors (as will json_verify).
