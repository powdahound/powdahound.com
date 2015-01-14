---
author: garret
comments: true
date: 2010-07-18 16:39:11+00:00
layout: post
slug: dynamic-hosts-file-using-chef
title: Dynamic hosts file using Chef
categories:
- Tech
tags:
- aws
- chef
- cloud
- dns
- ec2
- network
---

**Note:** This post is quite old. There are probably better methods for this now.

There are a number of ways to setup your infrastructure so that you can refer to machines by hostname. I currently prefer the "dynamically generated [hosts file](http://en.wikipedia.org/wiki/Hosts_(file))" approach because it's simple to understand and setting up a DNS server is intimidating (as well as a single point of failure).

Shlomo Swidler has [a great article](http://www.shlomoswidler.com/2010/06/track-changes-to-your-dynamic-cloud-services-automatically.html) comparing different DNS configurations as well as some sample code for dynamically updating hosts files. However, if you're already using [Chef](http://wiki.opscode.com/display/chef/Home) you can achieve the same thing with a very simple cookbook.

First, create a new cookbook:

{% highlight bash %}
$ cd chef-repo/
$ rake new_cookbook COOKBOOK=hosts CB_PREFIX=site-
{% endhighlight %}

Place the following in `site-cookbooks/hosts/recipes/default.rb`:


{% highlight ruby %}
# Find all nodes, sorting by Chef ID so their
# order doesn't change between runs.
hosts = search(:node, "*:*", "X_CHEF_id_CHEF_X asc")

template "/etc/hosts" do
  source "hosts.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
    :hosts => hosts,
    :fqdn => node[:fqdn],
    :hostname => node[:hostname]
  )
end
{% endhighlight %}

Then create the template, `site-cookbooks/hosts/templates/default/hosts.erb`:

{% highlight ruby %}
127.0.0.1   localhost

<% @hosts.keys.sort.each do |fqdn| %>
<%= @hosts[fqdn][:ipaddress] %> <%= fqdn %> <%= @hosts[fqdn][:hostname] %>
<% end %>

# The following lines are desirable for IPv6 capable hosts
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
{% endhighlight %}

Add the recipe to your node's run_list and run chef-client and your /etc/hosts should contain all the Chef nodes on your network. Note that one downside to this approach is that updates will be slow (since chef-client only runs every 30 minutes by default).

Now what if you wanted to point at a specific service, like having chef.example.com point at your Chef master? Just search for it in your recipe (and add it to the variables list):

{% highlight ruby %}
chef_server = search(:node, 'run_list:recipe\[chef\:\:server\]')
{% endhighlight %}

And add a line to the template:

{% highlight ruby %}
# Chef master server
<%= @chef_server[:ipaddress] %> chef.example.com
{% endhighlight %}

Sure beats [setting up a DNS server](http://elwoodicious.com/2009/08/12/ec2-bind9-dns-pancakes-and-you/)!
