= SAGE Bug Squash Day 2 =

The event will take place on '''THURSDAY September 6th, 2007''' and officially start around 10 am pacific standard time. It will go on for up to 16 hours and some people will usually meet the day after and finish up some of the leftovers.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * [:bug2/status: STATUS]

 * [:bug2/irc: IRC log]

 * [:bug2/Results: Results]

 * The base version of SAGE we'll start with is here: sage-2.8.3.6, which you can upgrade to.

 * The trac server with all the bugs is here:
      http://www.sagemath.org:9002/sage_trac/report/1 
 
 * We will focus on the bugs listed here:

      http://www.sagemath.org:9002/sage_trac/milestone/sage-2.8.4 and http://www.sagemath.org:9002/sage_trac/milestone/sage-2.9

   However, people with other interests can of course help out with fixing anything they want. 
   

 * Write to wstein@gmail.com for an account on the bug tracker. 

 * We'll all be on #sage-devel at irc.freenode.net.  
{{{
From Linux you can chat via a text console by installing "irssi", running it, and typing 
  /SERVER add irc.freenode.net 
  /SERVER irc.freenode.net
  /join #sage-devel
}}}


= Participants (with area they would like to work on) =

 * Michael Abshoff: mem-leaks, package issues on Solaris

 * William Stein: Fixing memory leaks in linear algebra and arithmetic, and fixing all other bugs in SAGE :-)

 * David Harvey: #424 (gmp fast gcd code) (http://www.sagemath.org:9002/sage_trac/ticket/424) is my main target. But I totally need help from someone who knows things like autoconf. Please add your name here if you're willing to help.  
     * William Stein -- I want to help.  I actually tried this for a while and made some progress.  It's not so bad if you know autoconf, and impossible otherwise...

 * Martin Albrecht: Helping David with GMP as far as possible and the usual memleak/SIGSEGV stuff.
