---
author: garret
comments: true
date: 2009-06-27 05:02:34+00:00
layout: post
slug: using-gmail-as-sendmails-relay
title: Using Gmail as Sendmail’s relay
wordpress_id: 130820931
categories:
- Tech
tags:
- gmail
- sendmail
---

Comcast just started [blocking port 25](http://news.zdnet.com/2100-3513_22-136518.html) at my house which caused sendmail to be unable to connect to external mail servers to deliver mail. Some people have been able to convince Comcast to open up the port for them but we weren’t so lucky. Instead, I changed sendmail to use Gmail’s SMTP server as its relay server.

Before making these changes I’d see lots of errors in /var/log/mail.log ending in _stat=Deferred: Connection timed out with aspmx2.googlemail.com._ or something similar. Trying to `telnet aspmx2.googlemail.com 25` would result in a timeout.

I found all the information on how to do this in these two articles; [Yan Li’s Words: Gmail, Fetchmail and Sendmail on UNIX/Linux](http://elliotli.blogspot.com/2007/08/gmail-fetchmail-and-sendmail-on.html) and [Linux, Sendmail and Gmail.com](http://www.linuxha.com/other/sendmail/gmail.html).

All of this was done on a server running Ubuntu 8.04.2 and sendmail 8.14.2.


### Step 1


Edit your /etc/mail/sendmail.mc and add the following above the _MAILER_DEFINITIONS_ block at the bottom. I tried putting these lines at the very bottom of the file the first time and it didn’t work. I suggest copy/pasting because the quotes are very strange.

    
    define(`SMART_HOST',`smtp.gmail.com')dnl
    define(`RELAY_MAILER_ARGS', `TCP $h 587')dnl
    define(`ESMTP_MAILER_ARGS', `TCP $h 587')dnl
    define(`confAUTH_MECHANISMS', `EXTERNAL GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
    FEATURE(`authinfo',`hash /etc/mail/auth/client-info')dnl




### Step 2


Create the /etc/mail/auth/client-info file by running:

    
    $ mkdir -p /etc/mail/auth
    $ chmod 700 /etc/mail/auth
    $ touch /etc/mail/auth/client-info
    $ chmod 600 /etc/mail/auth/client-info




### Step 3


Edit /etc/mail/auth/client-info and fill it with the lines below. Replace **user_id** with your Gmail user id (**user_id**@gmail.com) and **password** with your password. Make sure there is a blank line at the end of the file.

    
    AuthInfo:smtp.gmail.com "U:smmsp" "I:user_id" "P:password" "M:PLAIN"
    AuthInfo:smtp.gmail.com:587 "U:smmsp" "I:user_id" "P:**password" "M:PLAIN"




### Step 4


Compile the client-info.db file.

    
    $ cd /etc/mail/auth
    $ makemap -r hash client-info.db < client-info




### Step 5


Compile update sendmail.cf with our sendmail.mc changes.

    
    $ cd /etc/mail
    $ make




### Step 6


Reload the sendmail configuration.

    
    /etc/init.d/sendmail reload


Now if you check your /var/log/mail.log you should see any queued messages being sent properly. You should see _relay=smtp.gmail.com_ and _stat=Sent_. If not, make sure you didn’t miss a step above.
