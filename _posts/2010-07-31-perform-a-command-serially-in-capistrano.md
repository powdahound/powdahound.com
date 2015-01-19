---
slug: perform-a-command-serially-in-capistrano
title: Perform a command serially in Capistrano
categories:
- Tech
---

[Capistrano](http://www.capify.org) is a great tool for doing software deployments and other system maintenance tasks (although for anything larger, I'd recommend [Chef](http://wiki.opscode.com/display/chef/Home)).  One small Capistrano issue I ran into this week is that there's no way to run a command in serial across multiple machines (commands are always [run](http://www.capify.org/index.php/Run) in parallel). You might want to do this if you need to make sure that at least one service in a group is available at all times, or if the service restarting is going to put some load on another resource such as a database.

Here's the solution I came up with:

{% highlight ruby %}
desc "Do a rolling restart of <service>"
deploy.task :restart do
  hosts = self.roles[:server].to_ary # change :server to your role
  num_hosts = hosts.size
  hosts.each_with_index do |host, i|
    puts "Restarting <service> on #{host} (#{i+1} of #{num_hosts})"
    sudo "/etc/init.d/<sevice> restart", :hosts => host
    if i < num_hosts-1
      puts "Waiting 3s before next host."
      sleep(3)
    end
  end
end
{% endhighlight %}
