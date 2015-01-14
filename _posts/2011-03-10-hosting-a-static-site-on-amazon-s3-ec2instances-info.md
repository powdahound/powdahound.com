---
author: garret
comments: true
date: 2011-03-10 05:22:54+00:00
layout: post
slug: hosting-a-static-site-on-amazon-s3-ec2instances-info
title: 'Hosting a static site on Amazon S3: ec2instances.info'
wordpress_id: 537367165
categories:
- Tech
tags:
- amazon
- ec2
- s3
---

![](http://powdahound.com/wp-content/uploads/2011/03/awslogo-500x250.png)Amazon added the ability to [host static sites on S3](http://aws.typepad.com/aws/2011/02/host-your-static-website-on-amazon-s3.html) recently so to try it out I made a small site comparing the different types of EC2 instances: [www.ec2instances.info](http://www.ec2instances.info). It's not much of a site but it was the only thing in my ideas list that didn't require some sort of database backend.

The setup was very simple:



	
  1. Buy the domain ([name.com](http://name.com/) is so much nicer than GoDaddy by the way).

	
  2. Point domain's nameservers at my [slicehost](http://slicehost.com/) account.

	
  3. Add a new DNS domain in slicehost and add a single CNAME record with a name of 'www' and data of 's3-website-us-east-1.amazonaws.com.'

	
  4. Install the latest [Cyberduck](http://cyberduck.ch) (Mac). Windows users can use one of the tools [here](http://aws.typepad.com/aws/2011/02/host-your-static-website-on-amazon-s3.html).

	
  5. Create a new S3 bucket called 'www.ec2instances.info' and [configure it for static site hosting](http://trac.cyberduck.ch/wiki/help/en/howto/s3#WebsiteConfiguration).

	
  6. Upload all my files and [change their permissions](http://trac.cyberduck.ch/wiki/help/en/howto/s3#AccessControlACL) to make them readable by everyone.

	
  7. Done!


Updating the site is easy - just select the file in Cyberduck and click the 'Edit' icon in the toolbar (or hit ⌘K) and it will automatically upload the file whenever you save. If I needed a real deploy system it'd be pretty easy to whip up something with [Fabric](http://docs.fabfile.org/en/1.0.0/index.html) and [Boto](http://code.google.com/p/boto/).

Overall it seems like a great way to host a static site on the cheap (~$1.50/year for this). The only real downside is that you can't have your root domain hit the bucket because a CNAME must be used. This means that [ec2instances.info](http://ec2instances.info) does not resolve properly. More details [here](https://forums.aws.amazon.com/thread.jspa?messageID=228100).

Note: I tried to use Amazon's new [Route 53](http://aws.amazon.com/route53/) DNS service instead of my slicehost account but [the configuration](http://dmz.us/2010/12/amazon-route-53-dns/) is still a bit more involved than I'd like. Hopefully they'll add it to the AWS web console soon.




