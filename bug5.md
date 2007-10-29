= SAGE Bug Squash Day 5 =

The event will take place on '''SATURDAY, November 3rd''' and officially start at 10 am pacific standard time. It will "officially" go nonstop for 10 hours (until 8pm) and some people will usually meet the day after and finish up some of the leftovers.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.


 * [:bug5/status: STATUS]

 * [:bug5/irc: IRC log]

 * [:bug5/Results: Results]

 * The base version of SAGE we'll start will probably be 2.8.11.
Alternatively, do:
{{{
sage: hg_sage.pull(); hg_sage.merge(); hg_sage.ci(); hg_sage.update()
sage: hg_doc.pull(); hg_doc.merge(); hg_doc.ci(); hg_doc.update()
sage: hg_scripts.pull(); hg_scripts.merge(); hg_scripts.ci(); hg_scripts.update()
}}}
  followed by sage -br, to build all the latest patches.  
There is a prebuilt version on sage.math here, which you'll need to hg_sage.pull() on as above:
{{{
http://sage.math.washington.edu/tmp/
}}}
And I'll be posting a tar'd prebuilt version there too for sage.math. 


 * The trac server with all the bugs is here:
      http://trac.sagemath.org
   
 * Write to wstein@gmail.com for an account on the bug tracker. 

 * We'll all be on #sage-devel at irc.freenode.net.  
{{{
From Linux you can chat via a text console by installing "irssi", running it, and typing 
  /SERVER add irc.freenode.net 
  /SERVER irc.freenode.net
  /join #sage-devel
}}}


= Participants (with area they would like to work on) =

 1. Michael Abshoff (memory leaks, Solaris port, whatever else looks interesting ;) )
 1. William Stein

[[ImageLink(bugs.jpg)]] [[ImageLink(compact.jpg)]]

(from http://www.flickr.com/photos/electrasteph/689860347/ and http://www.ecosherpa.com/images/ )
