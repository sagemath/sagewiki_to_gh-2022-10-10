= SAGE Bug Squash Day 2 =

The event will take place on '''THURSDAY September 6th, 2007''' and officially start around 10 am pacific standard time. It will go on for up to 16 hours and some people will usually meet the day after and finish up some of the leftovers.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * [[bug2/status| STATUS]]

 * [[bug2/irc| IRC log]]

 * [[bug2/Results| Results]]

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

= IRC =
Irc log for Bug Squash Day 2

[10:00] <wstein> hey, it's 10.
[10:00] <wstein> I declare Bug Squash Day 2 officially started.
[10:00] <wstein> Let's see if SAGE is ready for prime time or not.
[10:00] <wstein> Could everybody maybe just mention where they are physically right now?
[10:00] <wstein> I'm in Seattle.
[10:00] <robertwb> Seattle
[10:01] <wstein> (2 feet from me.)
[10:01] <syazdani> Hamilton
[10:01] <burcin> linz, austria
[10:01] <-- dmharvey2 has left this server.
[10:03] <wstein> make sure to do a "sage -upgrade" if you havne't already.
[10:03] <burcin> even from .6?
[10:03] <wstein> no sage-2.8.3.6 is the latest.
[10:03] <burcin> yes.. it just told me now :)
[10:04] <wstein> And if you'rein a hurry, doing hg_sage.pull() form sage 2.8.3.5 is fine.
[10:04] <malb> London
[10:04] <mhansen> Madison, WI
[10:05] <wstein> Our ultimate goal is to close every genuine bug attached to sage-2.8.4 and 2.9 in trac.
[10:05] --> dmharvey2 has joined this channel (n=dmharvey@c-24-61-47-91.hsd1.ma.comcast.net).
[10:05] <wstein> Of course, working on other things is fine....
[10:05] <dmharvey> boston, USA
[10:06] --> boothby has joined this channel (n=boothby@c66-235-37-221.sea2.cablespeed.com).
[10:06] <timothyclemans> so is there a way to share vmware files over network?
[10:06] <malb> FTP?
[10:07] <boothby> web 2.0!  gmail!
[10:07] <malb> where does sage -valgrind write the logfile?
[10:07] <wstein> david joyner emailed me that he has posted fixes for trac #568, #569 #570.  Does anybody want to verify that these work.
[10:07] <wstein> Be nice.  You maybe mean NFS.  This is off topic for sage-devel though.
[10:08] <timothyclemans> i know but i don't have working linux so i'm stuck with vmware for development
[10:08] <wstein> I'm looking at #568
[10:09] <malb> I am looking at #558
[10:09] <wstein> By the way, if you weren't here last time, basically scan the list of open bugs listed at trac for sage-2.8.4 or sage-2.9.
[10:09] <wstein> When you're working on one note that in irc.
[10:09] <mabshoff|away> Well, I am back for a second: I am in Dortmund/Germany.
[10:09] <boothby> I'm working on #503
[10:09] <wstein> When you refer to one in chat prefix the message with tthe trac number, e.g., 
[10:09] <wstein> #568: this is nuts.
[10:10] <wstein> Since lots of different bugs will get discussed at the same time.
[10:10] <wstein> Also, if you want to help somebody say --
[10:10] <wstein> #568 -- that looks interesting, I'm looking at it too.
[10:10] <burcin> I'm trying #563..
[10:10] <wstein> #503 - is the "0^0" issue.  comments welcome.
[10:11] <mabshoff|away> Is anybody doing the official logging?
[10:11] <mabshoff|away> Who wants to keep track of the bugs fixed? Or are we just using trac to sort that out after?
[10:11] <wstein> I think keeping trac would be very good.
[10:11] <wstein> Though trac does do it.
[10:11] <wstein> Hmmm.
[10:12] <wstein> mabshoff -- you're still marked as "away"
[10:12] <mabshoff|away> I think mostly to aassign proper credit.
[10:12] <wstein> I can log.
[10:12] <wstein> yep.
[10:12] <mabshoff|away> I know, just got out the shower, going shopping now.
[10:12] <mabshoff|away> And on the internet I could be mabshoff's cat, just incredibly lucky that it can spell and type ;)
[10:14] <malb> mabshoff where does sage-valgrind but its logfile?
[10:14] <-- dmharvey2 has left this server.
[10:16] <wstein> also, I will update the official sage repo as things are closed, so people can do hg_sage.pull() to get the fixes.
[10:17] <wstein> #568 -- closed; thanks to David Joyner.
[10:17] <burcin> malb: local/bin/sage.$PID
[10:17] <malb> ah, thanks
[10:18] <wstein> that's a dumb plce, no?
[10:18] <wstein> maybe it should be in the current directory?
[10:18] <malb> yes, or SAGE_ROOT
[10:18] <wstein> make moving that a trac enhancement.
[10:18] <malb> maybe one doesn't have write access there, so cwd would be good
[10:18] <wstein> yep!
[10:18] <wstein> I'm working on #569 now.
[10:21] <burcin> SAGE_ROOT is better I think..
[10:21] <burcin> who's opening the ticket?
[10:21] <malb> can we assume that we have write access there?
[10:21] <malb> think about a system-wide SAGE install
[10:21] <burcin> hmm.. good point.. no
[10:21] <burcin> ok, so cwd?
[10:22] <malb> sounds good to me, or .sage/<something>
[10:22] <wstein> I've mad #599 the valgrind log file issue.
[10:22] <burcin> as soon as we agree on the place.. I can implement it..
[10:23] <wstein> #569 -- closed (David Joyner had fixed it and his patch looks good).
[10:23] <malb> I vote for $HOME/.sage/sage-memcheck.PID
[10:24] <wstein> #599: +1
[10:24] <burcin> ok.. $HOME/.sage/sage-memcheck.$PID it is then
[10:25] <malb> mabshoff might have strong feelings about it
[10:25] <wstein> #594 -- I'm working on incorporating and testing this patch "Teach the MAGMA interface how to handle GF(q) conversions"
[10:25] <malb> cool
[10:26] <-- craigcitro has left this server.
[10:26] --> pdehaye has joined this channel (n=pdehaye@12.19-64-87.adsl-dyn.isp.belgacom.be).
[10:26] <wstein> hi pdehaye -- welcome to bug squash day 2.
[Sun Sep 2 2007] [11:19:41] <sage> I don't remember, to be honest.
[Sun Sep 2 2007] [11:19:53] <sage> You could remove setting it and do a complete build of SAGE and see if it works.
[Sun Sep 2 2007] [11:20:03] <mabshoff> I could :)
[Sun Sep 2 2007] [11:20:30] <mabshoff> Problem might be that "LIBRARY_PATH=/tmp/Work2/sage-2.8.3.rc3/local/lib/:" has the trailing ":"
[Sun Sep 2 2007] [11:20:39] <sage> ah. you could change that too
[Sun Sep 2 2007] [11:21:06] <mabshoff> If LD_WHATEVER is empty skip the $LD_WHATEVER on export :
[Sun Sep 2 2007] [11:21:08] <mabshoff> .
[Sun Sep 2 2007] [11:22:13] <mabshoff> Removing the trailing ":" makes configure work.
[Sun Sep 2 2007] [11:22:42] <mabshoff> May be a bug in the configure macro,
[Sun Sep 2 2007] [11:23:01] <mabshoff> because "empty string" after the separator ":" is not equal to "."
[10:30] --> You have joined the channel #sage-devel (n=was@c66-235-37-221.sea2.cablespeed.com).
[10:31] *** Channel modes: secret, no messages from outside
[10:31] *** This channel was created on 08/17/2007 01:03:33 PM.
[10:31] <malb> I see
[10:31] <dmharvey> back
[10:31] <sage-log> sage-log == "William's home desktop"
[10:33] <burcin> #599: it's a very simple change in local/bin/sage-valgrind
[10:33] <burcin> #599: one can do it by hand, but there is a patch in trac too
[10:33] <wstein> good.
[10:34] <burcin> is there a way of making the sage shell not print out the output, without using assignments?
[10:35] <wstein> no
[10:35] <wstein> ;
[10:36] <wstein> put a semicolon at the end of the line?
[10:37] *** syazdani is now known as syazdani|away.
[10:37] <-- pdehaye has left this server.
[10:39] <wstein> #599 -- why is it "sage-memcheck" instead of "sage-valgrind"?
[10:40] <wstein> #599 -- also, why remove the pid from the filename?
[10:40] <burcin> valgrind puts the pid itself..
[10:40] <wstein> oh, good.
[10:40] <malb> there are several valgrind tools
[10:40] <malb> we are using memcheck right now
[10:40] <sage-log> ok, that's clear.
[10:40] <malb> but there is also massif and cachegrind and so on
[10:41] <malb> so its good to allow different names for different valgrind tools
[10:41] <mabshoff|away> hi
[10:41] *** mabshoff|away is now known as mabshoff.
[10:41] <mabshoff> I have patches for the proper place of logfiles,
[10:41] <mabshoff> and massif + cachegrind
[10:41] <mabshoff> support.
[10:41] <dmharvey> hi mabshoff, do you want to work on gcd now?
[10:42] <mabshoff> Give me about half am hour for valgrind patches.
[10:42] <dmharvey> ok
[10:42] <mabshoff> And I have two Solaris build issues I would like to get merged ASAP.
[10:42] <mabshoff> 1 is in scons: prefer g++ over SunPro for compiler,
[10:42] <mabshoff> the other two are build fixes in sage_lib for Solarisl
[10:42] <mabshoff> .
[10:43] <mabshoff> For valgrind: -valgrind becomes an alias for -memcheck
[10:43] <mabshoff> I also add -massif and -cachegrind.
[10:43] <mabshoff> For now they use the "default" flags I use, but we could add env variables to overwrite.
[10:44] <mabshoff> That is not implemented yet.
[10:44] <mabshoff> Should I send you the patch??
[10:44] <mabshoff> Or does anybody prefer something different?
[10:45] <mabshoff> re pid & valgrind: That can be changed per default.
[10:45] <malb> I am all for PID
[10:46] <malb> maybe printing the PID at startup when run with valgrind would be nice
[10:46] <mabshoff> Of which process?
[10:46] <timothyclemans> i'm working on 549
[10:46] <mabshoff> The problem is that the output from 3.3.0svn no longer put the pid *inside* the logfile.
[10:46] <mabshoff> But that let's you potentially diff output from different runs much better.
[10:47] --> dmharvey2 has joined this channel (n=dmharvey@c-24-61-47-91.hsd1.ma.comcast.net).
[10:47] <malb> process: SAGE the most interesting one
[10:47] <wstein> #594 -- it's closed (and in) -- this is Malb's magma ideal patch.
[10:47] <malb> cool
[10:47] <wstein> malb -- i added a docstring to your magma.py ideal function.  hg_sage.pull() and look to make sure it is ok.
[10:47] <mabshoff> Is there an obvious non-racy way to getermine the SAGE pid?
[10:48] <mabshoff> Also for the patch: Where is the official sage-script hg repo in the tarball?
[10:48] <wstein> #549 -- I'm trying to replicate that too.
[10:49] <timothyclemans> i see it
[10:49] <timothyclemans> empty lines need <br />
[10:50] <timothyclemans> maybe do a loop and if i == '\n' add '<br />' ?
[10:52] <malb> wstein, magma docstring looks good
[10:53] <wstein> #549 -- no.
[10:53] <wstein> since it's a pre environment.
[10:54] <timothyclemans> in the html code i see the line spaces but they need to be <br />
[10:54] <wstein> #549 -- maybe the css is broken.
[10:54] <timothyclemans> huh to do a line space don't you do <br />
[10:55] <wstein> In a pre that isn't needed.
[10:55] <wstein> Try it by itself.
[10:55] <timothyclemans> i am
[10:56] <timothyclemans> i see
[10:57] <wstein> #549 -- look at pre.shrunk in css.py.
[10:58] <wstein> it has "display:inline"
[10:58] <wstein> which evidently gets rid of blank spaces.
[10:58] <wstein> If you comment it out, then the blank *lines* come back.
[10:58] <wstein> Unfortunately there is way too much padding around the pre then.
[10:58] <timothyclemans> also tidy says that you can't have span around pre
[11:01] <mabshoff> malb, burcin: Suggestion now is: log to sage-memcheck.PID, sage-massif.PID, sage-cachegrind.PID in $SAGE_ROOT
[11:01] <mabshoff> depending on the tool used.
[11:01] <malb> no, not in $SAGE_ROOT we might not have write access there
[11:01] <dmharvey2> #424: apart from the new files and lines of code, it looks like the following files *may* need to be modified: configure, configure.in, gmp-h.in, mpn/asm-defs.m4, mpn/Makefile.am, mpn/Makefile.in. I don't totally understand the relationship between these files, I know that automake or autoconf or something generates some of these files from others. But we don't want SAGE to depend on automake/autoconf etc, correct? So does that m
[11:01] <mabshoff> true.
[11:01] <mabshoff> $SAGE_RC?
[11:02] <burcin> mabshoff: $HOME/.sage/ was suggested..
[11:02] <mabshoff> Okay, that works.
[11:02] <mabshoff> but how about sage-$TOOL.$PID?
[11:02] <wstein> #549 -- thanks timothy -- good point!
[11:02] <burcin> mabshoff: yes.. I think that was the spirit of malb's sage-memcheck idea
[11:03] <wstein> #549 -- your hint about span and pre was enough for tom to claim to know what to do.
[11:03] <wstein> I'm going to stop working on #549 and let you and he work on it.
[11:03] <mabshoff> Yep, will do.
[11:03] <mabshoff> And I wil add the extra -massif & -cachegrind flags.
[11:03] <mabshoff> -valgrind will stay an alias for memcheck
[11:04] <mabshoff> Everybody happy that way?
[11:04] <wstein> #424 -- SAGE can't depend on autoconf.
[11:04] <burcin> mabshoff: yep, that great
[11:04] <burcin> sorry.. can't type :)
[11:04] <wstein> So whatever files you get when you do autoreconf --all you have to copy out to patches, then copy in during spkg-install.
[11:04] <wstein> This is for #424
[11:05] <dmharvey> #424: I remember last time I tried using autoconf for this I had problems with a version mismatch
[11:05] <dmharvey> #424: so maybe I'll try doing it manually
[11:05] <wstein> #549 -- boothby has actually fixed this before and it got lost, evidently...
[11:05] <wstein> dmharvey -- if possible you may want to work on sage.math for this, so others can look directly at what you're doing...
[11:06] <dmharvey> wstein: okay, good idea, I'll move over there. Everything will be in /home/dmharvey/424/. (in a few minutes)

[11:07] <timothyclemans> I'm unable to fix #549 from the html
[11:08] <timothyclemans> i do see that display:inline gets rid of the line spaces like william said
[11:11] --> janwil has joined this channel (n=jan@193.40.41.10).
[11:11] <-- dmharvey2 has left this server.
[11:12] <mhansen> Does anyone know how to fix a "not previously declared in definition part of extension type" error?
[11:12] <janwil> hello
[11:12] <mabshoff> hi janwil
[11:13] <wstein> #518 dmharvey -- i can't apply your patch.
[11:13] <wstein> mhansen -- declare whatever it is in the corresponding .pxd file.
[11:14] <mhansen> Thanks.  I figured it out -- I had been looking in the wrong pxd file.
[11:15] <dmharvey> #518: incorrect parent or something?
[11:15] <wstein> #106 -- I'm working on this: "maple (etc?) tab completion -- asking for a list of all completions gives a bad error message if maple isn't installed"
[11:15] <wstein> no.
[11:15] <wstein> #518 -- see the trac ticket.
[11:15] <wstein> #518 -- way too many conflicts to merge
[11:15] <wstein> if it were an .hg bundle there might be hope.
[11:16] <wstein> or maybe you had made other changes and "patches don't commute"
[11:16] <wstein> this is a typical example of where bundles are better than .patch...
[11:16] <wstein> (maybe)
[11:18] <timothyclemans> regarding notebook is huge white space between buttons and worksheet area on purpose?
[11:18] <dmharvey> #518: okay, I guess I'll just go through and do it again at some point. I think the real problem here is to do with trac. I posted the patch a while back, but it didn't get rolled into the repository until now. But meanwhile you and robert had done a bunch of things.
[11:19] <sage-log> yep.
[11:19] <boothby> #549 is fixed, I'll put a patch up in a minute
[11:19] <sage-log> dmharvey -- by the way #549 was your bug report.
[11:20] <sage-log> #518: yep.
[11:20] <sage-log> I hope it isn't too hard fixing the spacing.
[11:23] <dmharvey> #518: no it's just boring
[11:23] <sage-log> write a script to do it?
[11:23] <boothby> #549 has patch up in trac.
[11:24] <dmharvey> #518: would take longer than just doing it
[11:24] <wstein> #518 -- but would be more fun :-)
[11:24] <dmharvey> #518: i've got other funner things to do :-)
[11:24] <malb> robertwb could you look at #558 I've posted a first patch to address the leak in the integer_pool
[11:25] <robertwb> ok
[11:26] <boothby> I'm gonna take a crack at #518 with sed.
[11:27] <dmharvey> #518: boothby, ok but be careful, because only *some* of the file needs to be re-indented, some of it is fine already
[11:27] *** syazdani|away is now known as syazdani.
[11:27] <mabshoff> Just use emacs ;)
[11:27] <robertwb> malb: what happens if there are integers laying around that are deallocated after exit is called?
[11:27] <timothyclemans> since i can't look at the results of #549 patch could a notebook be ran with examples of the spacing?
[11:28] <robertwb> this needs to be copied over to RDF as well
[11:28] <boothby> ok, that's not gonna work.
[11:28] <malb> robert: memleak I guess
[11:28] <mabshoff> technically: missing deallocation.
[11:28] <mabshoff> for robert.
[11:29] <malb> So I should set the the counter to full and hope no integers are allocated afterwards?
[11:31] <wstein> I propose creating a file sage/module_cleanup.py
[11:31] <robertwb> Maybe set the pool size to 0
[11:31] <wstein> This will have a function that calls cleanup methods on modules that need them.
[11:31] <wstein> This will be guaranteed to be called on exit.
[11:32] <wstein> what do you think?
[11:32] <boothby> #518 would take way more regular expression than I've got in me today.
[11:32] <malb> isn't that the same as the quit stuff right now?
[11:33] <dmharvey> #518: right, which is why I did it by hand :-)
[11:33] <mabshoff> malb, burcin: massif output in txt or html? create ps visualization per default?
[11:33] <robertwb> we should set integer_pool_size and integer_pool_count to 0
[11:34] <malb> mabshoff: don't know massif enough to answer
[11:34] <malb> robertwb: ack
[11:34] <mabshoff> ok
[11:34] <mabshoff> let's go with txt for now.
[11:34] <mabshoff> problem is that massigf always write the aux file to cwd :(
[11:35] <burcin> mabshoff: test is good..
[11:35] <burcin> mabshoff: text.. :)
[11:35] <burcin> mabshoff: but there should be a pointer to a document explaining how to get the others..
[11:36] <robertwb> malb: ???
[11:36] <malb> that meant: yes
[11:37] <mabshoff> burcin: I am about to open a ticket for "Sage & valgrind doc"
[11:37] <mabshoff> I wrote something in sage-devel a while ago, but I think I should start a wiki page first.
[11:37] <robertwb> ah... you're not disgusted...
[11:37] <wstein> malb: awesome.
[11:37] <mabshoff> Then after some editing move it into sagedoc
[11:38] <malb> malb: disgusted?
[11:38] <malb> erm robertwb: disgusted?
[11:38] <boothby> lol
[11:38] <mabshoff> talkig to yourself already :)
[11:38] <burcin> mabshoff: wiki is a good idea..
[11:39] <burcin> I wouldn't mind if the developer documentation was only in a wiki actually..
[11:39] <mabshoff> Yeah, throw some text in there, sort it all out ..
[11:40] <mabshoff> hmm, cachegrind doesn't honour --log-file=$HOME/.sage/.. either.
[11:40] <mabshoff> time to file some bugs.
[11:42] <wstein> #106 -- closed.
[11:42] <wstein> a vintage bug.
[11:42] <mabshoff> :)
[11:46] <malb> robertwb: I've uploaded a patch to make sure nothing gets added to the pool once its free, but there are still memleaks in there somewhere
[11:46] <robertwb> hmm...
[11:46] --> jbmohler_ has joined this channel (n=joel@pool-71-162-181-38.phlapa.east.verizon.net).
[11:47] <malb> these might be caused by optimizations in higher level code, though
[11:49] <robertwb> valgrind still tracks it down to the integer pool though?
[11:49] <robertwb> they might be integers still in use...
[11:49] <malb> true
[11:49] <syazdani> I was trying to upgrade sage, and it seems to fail on building maxima.
[11:50] <mabshoff> Which platform?
[11:50] <mabshoff> Upgrading from which version?
[11:50] <syazdani> Hold on, I'm checking.
[11:50] <malb> __pyx_f_7integer_fast_tp_dealloc (integer.c:14315)
[11:50] <malb> tupledealloc (tupleobject.c:169)
[11:50] <malb> initmatrix_integer_dense (matrix_integer_dense.c:18898)
[11:50] <mabshoff> What is the exact  error message?
[11:50] <syazdani> going from 2.8.2
[11:50] <wstein> what operating system!?!?!
[11:50] <malb> if I do the small example from my comment for the ticket
[11:50] <syazdani> Linux,
[11:50] <syazdani> 32 bit,
[11:50] <syazdani> Linux ms017 2.6.12-25mdksmp-pfaff-20060906 #1 SMP Wed Sep 6 16:49:16 EDT 2006 i686 Intel(R) Pentium(R) 4 CPU 2.80GHz unknown GNU/Linux
[11:51] <syazdani> I will post the error message in a second...
[11:51] <mabshoff> Isn't that the 5.12->5.13 upgrade?
[11:51] <wstein> which linux distribution?
[11:51] <wstein> mandriva?
[11:51] <mabshoff> mandrake
[11:51] <syazdani> Yes, Mandriva or Mandrake.
[11:52] <syazdani> I guess this is a known problem then?
[11:52] <wstein> I'm trying an upgrade on my mandriva box right now (32bit).
[11:52] <janwil> I tried to download 2.8.3 binary distribution for Mandriva this morning and run ./sage, but I got a bunch of Floating point exceptions
[11:52] <wstein> I hadn't tested upgrading from sage-2.8.3 on.
[11:52] <mabshoff> Nope, you can see it by the name of tke kernel.
[11:53] <syazdani> Summary:
[11:53] <syazdani> clisp enabled. Executable name: "clisp"
[11:53] <syazdani> clisp runtime is ""
[11:53] <syazdani> default lisp: clisp
[11:53] <syazdani> wish executable name: "wish"
[11:53] <syazdani> make[1]: Entering directory `/1/scratch/syazdani/sage/spkg/build/maxima-5.13.0/src'
[11:53] <syazdani> Making all in src
[11:53] <wstein> maxima-5.13.0 built fine before on my mandriva box.
[11:53] <syazdani> make[2]: Entering directory `/1/scratch/syazdani/sage/spkg/build/maxima-5.13.0/src/src'
[11:53] <syazdani> test -d binary-clisp || mkdir binary-clisp
[11:53] <syazdani> clisp -norc -q -x '(progn (load "../lisp-utils/defsystem.lisp") (funcall (intern (symbol-name :operate-on-system) :mk) "maxima" :compile :verbose t))' && \
[11:53] <syazdani> clisp -norc -q -x '(progn (load "../lisp-utils/defsystem.lisp") (funcall (intern (symbol-name :operate-on-system) :mk) "maxima" :load :verbose t) (ext:saveinitmem "binary-clisp/maxima.mem" :init-function (function cl-user::run)))'
[11:53] <syazdani> clisp: /1/scratch/syazdani/sage/sage-2.6/local/lib/clisp/base/lisp.run: No such file or directory
[11:53] <syazdani> make[2]: *** [binary-clisp/maxima.mem] Error 1
[11:53] <syazdani> make[2]: Leaving directory `/1/scratch/syazdani/sage/spkg/build/maxima-5.13.0/src/src'
[11:53] <syazdani> make[1]: *** [all-recursive] Error 1
[11:53] <syazdani> make[1]: Leaving directory `/1/scratch/syazdani/sage/spkg/build/maxima-5.13.0/src'
[11:53] <wstein> Did you move your install?
[11:53] <syazdani> ***********************************************************
[11:53] <syazdani> Failed to make Maxima.
[11:53] <syazdani> sorry for that giant post...
[11:53] <syazdani> the problem seems to be in clisp.
[11:54] <syazdani> I don't think so...
[11:54] <wstein> hmmm.
[11:54] <syazdani> Hmm, actually, maybe..
[11:54] <syazdani> let me check.
[11:54] <wstein> How about if you force rebuild of the clisp package too.
[11:54] <wstein> Just do rm spkg/installed/clisp*
[11:54] <mabshoff> wstein: #473 has four valgrind patches attached.
[11:54] <wstein> then "sage -upgrade"
[11:54] <mabshoff> That also covers #599
[11:55] <mabshoff> But there are bugs in valgrind, some file for cachegrind and massif still end up in $CWD
[11:55] <syazdani> ok, I will try that.
[11:55] <-- timothyclemans has left this server ("leafChat IRC client: http://www.leafdigital.com/Software/leafChat/").
[11:56] <wstein> syazdani -- I am also building a 32-bit mandriva binary, which will take about 10-14 minutes...
[11:56] <dmharvey> #424: when running a program in linux, how do I tell which shared libraries are actually being loaded; specifically how do I tell whether it's using the new GMP I just built, or the system one?
[11:56] <mabshoff> ldd
[11:56] --> pdehaye has joined this channel (n=pdehaye@12.19-64-87.adsl-dyn.isp.belgacom.be).
[11:57] <wstein> ldd
[11:57] <syazdani> was: ok, right now I'm rebuilding clisp...
[11:57] <dmharvey> thanks
[11:57] <mabshoff> dmharvey: I gotta make three more (easy) patches, then I can help out.
[11:58] <mabshoff> Hey Oliver
[11:58] <wstein> #473 -- I'm taking a look
[11:58] <mabshoff> Cool, it is classic diffs.
[11:59] <mabshoff> but you can actually commit via hg commit -u mabshoff :)
[12:00] <wstein> #549 -- closed and pushed out.
[12:01] <wstein> But caused #601 (a new bug).
[12:01] <boothby> Exposed, not caused.
[12:01] <wstein> mabshoff -- re valgrind, can you just send me an hg patch bundle?
[12:01] <wstein> #473.
[12:02] <mabshoff> I tried, but I have other changes in that directory.
[12:02] <wstein> then I can merge if necessary.
[12:02] <mabshoff> Where is the official hg repo for sage-script in the tree?
[12:02] <wstein> its in local/bin/
[12:02] <mabshoff> ok
[12:02] <wstein> Or you can do "hg_scripts.ci(); hg_scripts.send('scripts.hg')
[12:02] <wstein> from in sage.
[12:02] <mabshoff> Once sec.
[12:04] <mabshoff> Okay, problem is that hg shows lots and lots of files with "?"
[12:04] <janwil> I am trying to build 2.8.3.6 on Ubuntu ... let's see whether I will have more luck than 12 hours ago with 2.8.3.5 on Arch ..
[12:04] <mabshoff> I did hg add on the new files.
[12:05] <mabshoff> hg diff now shows my changes
[12:05] <dmharvey> #424: breakthrough. It compiles and works. And it's pretty friggin fast. I think I know what to do from here. Mabshoff: when I've made a proper patch I'll ask you to take a look.
[12:06] <mabshoff> :)
[12:06] <mabshoff> very nice.
[12:06] <mabshoff> wstein: Now I have
[12:06] <mabshoff> changeset:   392:ca63d81a880b
[12:06] <mabshoff> tag:         tip
[12:07] <mabshoff> user:        mabshoff
[12:07] <mabshoff> date:        Thu Sep 06 21:18:50 2007 +0200
[12:07] <mabshoff> summary:     add cachegrind and massif support from valgrind
[12:07] <mabshoff> changeset:   391:d4b5e94af89d
[12:07] <mabshoff> user:        mabshoff
[12:07] <mabshoff> date:        Thu Sep 06 20:23:19 2007 +0200
[12:07] <mabshoff> summary:     rename logfiles and store them in $HOME/.sage/ per default
[12:07] <mabshoff> How do I send the last two changesets?
[12:07] <dmharvey> heh and that's without the AMD64 patches.... will be interesting to compare against Magma when they're in there too :-)
[12:07] <syazdani> wstein: It compiles.
[12:07] <syazdani> thanks
[12:08] <wstein> hg_scripts.send('foo.hg') will send me all changesets you've recorded
[12:08] <mabshoff> Yep, the AMD64 patches brought about 10% for GBasis computations over Q
[12:08] <wstein> then just make foo.hg available to me.
[12:08] <mabshoff> ok, I will try .
[12:09] <mabshoff> wstein: trac_ticket_473.hg is on the way.
[12:11] <boothby> patch up for 601
[12:14] <wstein> thanks.
[12:16] <dmharvey> wstein: so if I modify the gmp spkg, how do I tell SAGE to rebuild from that spkg? Is it something like sage -i path/to/new-package.spkg?
[12:16] <mabshoff> add "-f"
[12:17] <dmharvey> sage -f -i path/to/package.spkg?
[12:17] <mabshoff> In case the time stamp doesn't change
[12:17] <mabshoff> Yep, that should work.
[12:17] <mabshoff> -f is "force"
[12:17] <dmharvey> ok
[12:17] <mabshoff> And instead of "time stamp" I mean spkg name.
[12:18] <malb> I am looking into #566 now
[12:18] <wstein> I am dealing with the proof=True/False option in number fields sage-devel, before the serious number theorists kill me.
[12:19] <mabshoff> malb: What was the discussion with Robert about "pools" about - somehting different than #566?
[12:19] <malb> yes, 566 are leaks in gmp.pxi
[12:19] <mabshoff> Does Sage use a slab allocator for mpz's?
[12:19] <mabshoff> ok
[12:19] <malb> the pool leaked by itself
[12:20] <mabshoff> Okay, then I understood that correctly.
[12:20] <malb> I am not confided I killed all leaks in the pool, though
[12:20] <mabshoff> burcin, are you still on #519?
[12:20] <mabshoff> Well, every little bit of progress is good.
[12:20] <dmharvey> wstein: btw I agree with nils etc
[12:21] <burcin> mabshoff: #559..
[12:21] <wstein> #602 -- boothby is working on that.
[12:21] <burcin> it might have been a better idea to look at the linear algebra directly though... too late now
[12:22] <burcin> I didn't now sage had so much code for modular symbols..
[12:22] <mabshoff> Okay, I thing #559 isn't too bad.
[12:23] <mabshoff> It looks like we leak a single mpz of 8 bytes a bunch of times.
[12:24] <mabshoff> If you want I can post the correspinding pyx line number where the leak is.
[12:24] <mabshoff> The run were done before the sage_lib scons rework, so they might be a little off.
[12:24] <burcin> mabshoff: for #559?
[12:25] <mabshoff> yep
[12:25] <mabshoff> Or are you sure where the problem is?
[12:27] <burcin> I know several functions leak in sage.modular.modsym.relation_matrix
[12:27] <burcin> I don't know why..
[12:27] <mabshoff> :)
[12:27] <mabshoff> You are not alone, but #559 is a single mpz.
[12:30] <wstein> hi -- I've pushed out a clean proof=True by default, but easy to change, option for number fields.
[12:33] <wstein> #473 -- mabshoff -- where is the bundle?
[12:33] <wstein> I didn't get it in email.
[12:33] <mabshoff> I send it, but who knows what happened.
[12:33] <mabshoff> Let me check the logs on that box. No sendmail/postfix running as daemon.
[12:33] <jbmohler_> I'm getting doc_test failures on vanilla 2.8.3.6 for sage/rings/number_field/number_field.py and sage/rings/number_field/number_field_ideal.py
[12:33] <wstein> could you post a link?  I didn't get the email.
[12:33] <wstein> 32-bit?
[12:33] <wstein> maybe I screwed up.
[12:33] <mabshoff> How do I save the bundle?
[12:34] <wstein> hg_scripts.send('a.hg') creates the file.
[12:34] <mabshoff> Found it in $SAGE_LOCAL
[12:34] <jbmohler_> Yes, 32-bit, it looks like precision issues on one of them
[12:34] <wstein> then you send the file a.hg.
[12:34] <mabshoff> ehh SAGE_ROOT
[12:34] <wstein> I ust got that on a machine -- i'll fix it in a minute.
[12:34] <wstein> jbmohler_ -- I did a huge amount on number fields.  I added hundreds of doctests.
[12:35] <mabshoff> burcin: opened #603, i.e. valgrind doc and assigned it to you.
[12:35] <wstein> so some issues will creap up on some platforms with doctests.
[12:35] <mabshoff> The abuse of power :)
[12:35] <jbmohler_> wstein:  Yes, I thought so, did they pass for you?
[12:35] <wstein> on 64-bit linux.
[12:35] <wstein> and a few other platforms.
[12:35] <burcin> mabshoff: thanks.. :)
[12:35] <wstein> but I just noticed a problem on 32-bit osx.
[12:35] <mabshoff> Well, I can send more your way if you prefer ...
[12:36] <jbmohler_> common failure:
[12:36] <wstein> I'll fix it in 10 minutes or so and push it so you can do hg_sage.pull()
[12:36] <jbmohler_> Expected:  Fractional ideal (-2*a^2 - 1) of Number Field in a with defining polynomial x^4 + 3
[12:36] <jbmohler_> Got:   Fractional ideal (2*a^2 - 1) of Number Field in a with defining polynomial x^4 + 3
[12:36] <mabshoff> But I will help out on the documentation, it is just better if we have more input.
[12:36] <wstein> yep -- pari give slightly different results on 32 versus 64 bit.
[12:36] <jbmohler_> 3 of these (with slightly different fractional ideas (but all having to do with a minus sign different)
[12:36] <burcin> mabshoff: I'd prefer non documentation bugs...
[12:38] <mabshoff> Oh, in that case wait a minute ;)
[12:38] <mabshoff> We can assign it to malb *ducks*
[12:38] <wstein> jbmohler_ -- yep.
[12:38] <wstein> It would be desirable to somehow normalize the generators, I guess.
[12:38] <mabshoff> wstein: send the bundle to you gmail address.
[12:38] <mabshoff> brb
[12:38] <wstein> But otherwise we should just mark the output as slightly random for now.
[12:39] <wstein> #473 -- got it.
[12:40] <wstein> ok, #473 is officially in.
[12:41] <mabshoff> :)
[12:41] <wstein> jbmohler_ -- could you try hg_sage.pull() then do the doctests in number_field?
[12:42] <wstein> syazdani -- did sage build for you on mandriva.
[12:42] <wstein> ?
[12:45] <wstein> #601 -- now closed.
[13:07] <sage-log>    
[13:07] <sage-log>    
[13:08] [CTCP] Received Version request from freenode-connect.
[13:08] --> You have joined the channel #sage-devel (n=was@c66-235-37-221.sea2.cablespeed.com).
[13:08] [Error] sage-dev: No such channel.
[13:09] *** Channel modes: secret, no messages from outside
[13:09] *** This channel was created on 08/17/2007 01:03:33 PM.
[13:09] <dmharvey> ummm how does that work?
[13:09] <mabshoff> What does "ulimit -n" say
[13:09] <dmharvey> 256
[13:10] <mabshoff> Try to raise that: "ulimit -n 512"
[13:10] <dmharvey> ok
[13:10] <mabshoff> might have to do that as suo.
[13:10] <mabshoff> sudo
[13:10] <mabshoff> I think you can set those permanently on OSX; I don't remember the details, though.
[13:10] <mabshoff> The limits on OSX are pretty tight and cause easily trouble when building Sage.
[13:11] <dmharvey> nah that doesn't help. I must be getting in an infinite loop in the spkg-install script or something.
[13:11] <dmharvey> i'm trying to make it apply my patch in the gmp install script
[13:11] <mabshoff> ok, that would explain the problem.
[13:11] <mabshoff> That is a bash script?
[13:11] --> pdehaye has joined this channel (n=pdehaye@12.19-64-87.adsl-dyn.isp.belgacom.be).
[13:11] <mabshoff> Then set "#!/bin/bash -x" as shebang
[13:12] <mabshoff> it activates debug output for bash, i.e. each line is printed as it is executed.
[13:12] <dmharvey> ok thanks i'll try that
[13:12] <sage> mabshoff -- what is Solaris9-fixes.hg a bundle for / against, etc?
[13:12] <mabshoff> 2.8.3ish
[13:13] <dmharvey> meanwhile: i tried sage -ba on sage.math, still getting stupid import errors. I might just have to rebuild the whole bloody thing
[13:13] <mabshoff> It fixes two missing symbol problems  when starting sage on neron.
[13:13] <sage> no.
[13:13] --> boothby has joined this channel (n=boothby@c66-235-37-221.sea2.cablespeed.com).
[13:13] <mabshoff> It doesn't apply?
[13:13] <sage> dmharvey -- i can take a look (as you).
[13:13] <sage> which directory.
[13:14] <dmharvey> in /home/dmharvey/sage-2.8.3
[13:14] <dmharvey> i was just upgrading in preparation for trying to apply my gcd stuff (i'm working on the gcd stuff locally instead right now)
[13:15] <sage> You have colorful prompts ;-)
[13:15] <dmharvey> colourful actually
[13:15] <sage> did you do a "sage -ba"?
[13:16] <mhansen> sage: for #396, I have a patch disabling support for vector multiplication and moving it instead to .pairwise_product().
[13:16] <mhansen> sage: it passes all doc tests
[13:17] <dmharvey> wstein: yes I did, same thing happened
[13:18] <sage> that's weird -- I've never seen that error.
[13:18] <sage> What is "stack_chk_fail"
[13:18] <syazdani> Hmm, I ran the command "./sage -t" about an hour ago, and the tests are still happening.
[13:19] <syazdani> Is it supposed to take this long?
[13:19] <mabshoff> where is it at?
[13:19] <sage> you moved your install.
[13:19] <mabshoff> caculus.py?
[13:19] <sage> and it is having trouble maybe finding something in ntl?
[13:20] <dmharvey> I can't remember
[13:21] <dmharvey> mabshoff: can you take a look at /home/dmharvey/temp/spkg-install? That's the install script I'm working on, from the gmp spkg. I added the lines after "# apply fast gcd patch". For some reason it's getting into an infinite loop. I don't really know how to write shells scripts. Can you see what's going wrong?
[13:21] <sage> DAVID!
[13:21] <sage> I figured it out.
[13:21] <sage> dmharvey -- stack_chk_fail is defined in libgmp.
[13:21] <sage> You are screwing with your libgmp, so you suddenly don't have it for some reason.
[13:22] <sage> Hence libcsage.so, which wants it, can't find it.
[13:22] <dmharvey> but I haven't touched gmp in there yet!
[13:22] <dmharvey> ????
[13:22] <mabshoff> I will take a look at the script.
[13:22] <sage> On my system my libgmp has it and on yours it doesn't.
[13:22] <sage> for me:
[13:22] <sage> was@ubuntu:~/s/local/lib$ nm libgmp.so.3 |grep stack_c U __stack_chk_fail@@GLIBC_2.4
[13:22] <mabshoff> maybe it picks up the "wrong one"
[13:22] <sage> for you -- nothing:
[13:22] <sage> sage$ nm /home/dmharvey/sage-2.8.3/local/lib/libgmp.so.3 |grep stack_chk
[13:23] <dmharvey> well that's just weird
[13:23] <sage> weird.
[13:23] <sage> sage = (william stein, by the way)
[13:24] <sage> anyway, stack_chk is in gmp.
[13:24] <sage> so your problem has something to do with gmp.
[13:24] <dmharvey> i guess i might have accidentally overwritten something in there
[13:24] <dmharvey> but I can't remember ever touching it
[13:24] <sage> you didn't change it recently.
[13:25] <sage> weird.
[13:25] <sage> the mod time is aug 31.
[13:25] <dmharvey> i'll try rebuilding the usual gmp package to see if that helps
[13:25] <jbmohler_> dmharvey:  Do you have gmp outside your sage tree?
[13:25] <dmharvey> yes I have multiples GMPs outside the sage tree
[13:25] <dmharvey> i mess around with GMP all the time
[13:25] <jbmohler_> Which the scons build is finding for some reason...
[13:25] <sage> wait -- on my sage.math gmp I also don't have stack_chk.
[13:26] <dmharvey> well that's no good
[13:26] <sage> It's only my my laptop gmp that I have it.
[13:26] <sage> and libcsage doesn't link it in for me on sage.math.
[13:26] <dmharvey> im' rebuilding from gmp-4.2.1.p9.spkg now
[13:26] <sage> I.e., it doesnt have that symbol.
[13:26] <mabshoff> dmharvey: you have a procedure called patch() in spkg-install, but you want to invoke the external patch command.
[13:26] <mabshoff> Instand inifinte loop :)
[13:27] <dmharvey> mabshoff!!!!!!!! thanks
[13:27] <mabshoff> I am here to serve
[13:27] <dmharvey> i should have my programming license taken away
[13:27] <sage> dmharvey -- don't use patch.
[13:27] <sage> it's not a dependency of SAGE
[13:27] <mabshoff> Don't worry. I have had more than enough "brown paperbag over my head" moments
[13:27] <dmharvey> oh
[13:27] <mabshoff> In fact, once was just last week, got scooled by malb.
[13:28] <mabshoff> schooled
[13:28] <sage> i prefer that prepatched versions of files be put in the patches directory,
[13:28] <sage> since otherwise people have to install patch to build SAGE, which is annoying.
[13:28] <sage> stack_chk_fail is part of libc: http://www.fabbrication.net/pro/indexed-source/glibc24/html/stack__chk__fail_8c-source.html
[13:28] <dmharvey> well it starts getting a little dangerous when you have all these patches interacting
[13:28] <sage> maybe.
[13:29] <dmharvey> especially since my patch touches all the auto/config related fiels
[13:29] <dmharvey> can hg patch things?
[13:31] <sage> jbmohler -- how do you force scons to rebuild everything?
[13:31] <dmharvey> ok, well i suppose as long as my patch doesn't touch the same files as the AMD64 or core duo patches, we should be okay (for now)
[13:32] <sage> got it -- just scons -c
[13:32] <sage> then scons install
[13:32] <dmharvey> wstein: I'm going to leave that sage-2.8.3 alone for the moment, in case you want to play with it.
[13:32] <sage> i'm stuck on it. you should try reinstalling ntl too
[13:33] <jbmohler_> sage:  right, they don't have a force option like make does
[13:34] <sage> dmharvey -- i rebuild your libcsage.so and now it doesn't have any stack_* stuff in it.
[13:34] --> craigcitro has joined this channel (n=cc@pool-71-106-26-87.lsanca.dsl-w.verizon.net).
[13:34] <mabshoff> Hey Craig
[13:34] <craigcitro> hey michael
[13:34] <dmharvey> wstein: sage still doesn't start though
[13:34] <craigcitro> how goes the bug squash? i just got back from climbing, gonna eat and shower real quick
[13:35] <mabshoff> Check out the roadmap .)
[13:35] <mabshoff> Is anybody around here familiar with bober's partition code?
[13:35] <mabshoff> I have an off linking issue at runtime on Solaris
[13:36] <mabshoff> off->odd
[13:36] <craigcitro> >mabshoff: where's the roadmap?
[13:36] <sage> scons is a pain in the ass.
[13:36] <sage> how do I get it to *actually* copy libcsage.so over?
[13:36] <syazdani> craig: http://sagemath.org:9002/sage_trac/roadmap
[13:36] <sage> It just refuses...
[13:37] <syazdani> (Hi Craig!)
[13:37] <sage> dmharvey -- i fixed your problem!
[13:37] <sage> With  1 line:
[13:37] <sage> ~/sage-2.8.3/devel/sage/c_lib
[13:37] <sage> sage$ cp libcsage.so ../../../local/lib/libcsage.so
[13:37] <sage> That this was needed is deeply annoying.
[13:37] <jbmohler_> yes, you need to specify the actual install directory as a target
[13:37] <sage> i see.
[13:37] <sage> so dmharvey -- your sage now works on sage.math
[13:37] <dmharvey> ok thanks
[13:37] <jbmohler_> or, we often alias with Alias
[13:38] <dmharvey> i hope you guys understand what actually happened
[13:38] <sage> too bad that wasn't a ticket...
[13:38] <jbmohler_> The default target is '.' -- the current directory
[13:38] <sage> syazdani -- are you up to speed?
[13:38] <sage> if not i built a mandriva binary.
[13:38] <syazdani> I think so.
[13:38] <sage> it's in sagemath.org under linux 32-bit binaries...
[13:39] <syazdani> I'm running the tests one directory at a time,
[13:39] <jbmohler_> sage:  Was there a scons issue, or a confusion?
[13:39] <syazdani> and it seems to work fine.
[13:39] <sage> syazdani -- did you do "sage -t" from the SAGE_ROOT?
[13:39] <sage> 'cause if so, that makes no sense.
[13:39] <sage> YOu have to do "make test"
[13:39] <sage> Or cd into devel/sage/sage and do "sage -t".
[13:39] <syazdani> yes, I did...
[13:40] <syazdani> that explains why it was running so many tests, I guess.
[13:40] <craigcitro> (hey soroosh!)
[13:41] <mabshoff> "partitions.so: symbol _Z4cosle: referenced symbol not found" is the Solaris problem.
[13:41] <mabshoff> Any ideas?
[13:42] <sage> mabshoff -- still. ick.
[13:42] <mabshoff> I never looked at it.
[13:42] <mabshoff> So I was hoping that somebody in here would pay it forward ;)
[13:43] <mabshoff> sage: How about another try about the other Solaris fixes?
[13:44] <mabshoff> Okay, I see the trouble with the last bundle.
[13:45] <craigcitro> sage: i'm just coming into this in the middle, but where are you having the scons copy problem?
[13:46] <sage> mabshoff -- on it regarding solaris.
[13:46] <sage> craigcitro -- "scons install" doesn't know the target, which confused me.
[13:47] <craigcitro> yeah, it only copies it over to $SAGE_ROOT/local/lib if it actually does something to update it
[13:47] <craigcitro> that's exactly the problem we were having with branch switching
[13:47] <craigcitro> in fact, if you do scons branch_switch
[13:47] <craigcitro> it'll force the copy
[13:47] <mabshoff> sage: the bundle was only the last uncomitted workaround to avoid doctesting the singulat interface.
[13:49] <sage> mabshoff -- yeah, it sucks.
[13:49] <sage> it hardcodes your paths for CC.
[13:49] <sage> chick in something good and send it to me.
[13:49] <sage> or?
[13:49] <mabshoff> Yeah, that bit sucked.
[13:50] <mabshoff> I got a better fix for scons that switches the preferred compiler on Solaris to gcc vs. SunPro
[13:50] <wstein> hard coding it to your home directory always isn't good :-)
[13:51] <mabshoff> That was after about 10 hours, I didn't care anymore, I just wanted to make it compile.
[13:51] <sage> :-)
[13:51] <jbmohler_> craigcitro:  Why did you have to hard-code the copies?
[13:51] <mabshoff> An hour later I found the real workaround, but I never reverted the earlier "fix"
[13:52] <jbmohler_> Scons should check the actual file contents to see if things are out of date ... or is this more complicated?
[13:52] <mabshoff> wstein: I can export the two relevant fixes and send them to you.
[13:52] <sage> ok.
[13:52] <mabshoff> At least they are hg patches ;)
[13:54] <-- mhansen has left this server (Remote closed the connection).
[13:55] <craigcitro> >jbmohler_: i didn't know how to tell scons that it should check to see if $SAGE_ROOT/local/lib was up to date.
[13:55] <craigcitro> so when we'd switch branches, it would see sage-branch/c_lib/libcsage.dylib was up to date
[13:55] <craigcitro> and not do the Install
[13:56] <craigcitro> i asked in the scons-dev channel, and they suggested the forced copy.
[13:56] <craigcitro> i'm just curious where you guys ran into a situation that it was updated but not copied, so i can fix it. ;)
[13:57] <wstein> jbmohler -- did you see Kiran's email?
[13:57] <wstein> I want to do:
[13:57] <wstein> env = Environment(ENV = os.environ)
[13:57] <mabshoff> That is quite interesting
[13:57] <mabshoff> He should post his "env"
[13:58] <jbmohler_> wstein:  Feel free, it feels like the right thing in our context.  In general, scons devs don't copy the environment so that funny user environment variables don't corrupt the build.
[13:59] <jbmohler_> However, the whole sage "chroot" relies on funny user environment variables
[13:59] <jbmohler_> craigcitro:  was there a situation when it didn't copy and should have?  It seems like a bug in sage
[13:59] <craigcitro> no, it wasn't a bug in sage. it was just whenever you do sage -b
[13:59] <jbmohler_> oops, not sage scons
[13:59] <craigcitro> the issue is this
[14:00] <craigcitro> whenever you switch branches, you don't care about file timestamps or anything
[14:00] <jbmohler_> right, scons actually hashes the file contents
[14:00] <craigcitro> you just *always* need to make sure that the $SAGE_ROOT/local/lib is a copy of sage-branch/c_lib/libcsage.dylib
[14:00] <mabshoff> wstein: check out http://fsmath.mathematik.uni-dortmund.de/~mabshoff/patches/Sage-2.8.3-roundf%2Bisinf_workaround_on_Solaris.patch
[14:00] <craigcitro> but scons doesn't know to check the install target
[14:00] <craigcitro> it only knows to check the local target
[14:01] <craigcitro> or, at least, this is what it always does
[14:01] <jbmohler_> What if you called 'scons install'?
[14:01] <craigcitro> it says sage-branch/c_lib/libcsage.dylib looks up to date, i must be done
[14:01] <craigcitro> even if you call scons install
[14:01] <craigcitro> because it decides to run commands based on seeing that sage-branch/c_lib/libcsage.dylib does or does not need updating
[14:02] <jbmohler_> but, that's not true ... or, I'm confused
[14:02] <craigcitro> at least, this is what i found by experimenting with scons
[14:02] <mabshoff> Craig: who "maintains" the scons package?
[14:02] <mabshoff> (in Sage)
[14:02] <wstein> mhansen #396 -- are you around?
[14:03] <craigcitro> oh, i have no idea ... i've never played with it. i had assumed joel did. ;)
[14:03] <wstein> applying /home/was/Desktop/Sage-2.8.3-roundf+isinf_workaround_on_Solaris.patch
[14:03] <wstein> /usr/bin/patch: **** malformed patch at line 37: --- a/sage/rings/rqdf_fix.h    Tue Sep 04 08:51:32 2007 -0400
[14:03] <wstein> sage/modular/modsym/solaris_fix.h: No such file or directory
[14:03] <wstein> mabshoff -- your patch doesn't work...
[14:03] <mabshoff> Arrg, damn mercurial
[14:04] <mabshoff> Wait one second, I removed one hunk.
[14:04] <wstein> #396 -- i'm working on it.
[14:04] <jbmohler_> mabshoff:  What do you mean by "maintains"?  Google for scons and you'll get their main page
[14:04] <jbmohler_> The scons spkg is pretty much vanilla
[14:05] <wstein> jbmohler_ is the official scons spkg maintainer.
[14:05] <mabshoff> I wanted to add a patch that switched the default Compiler on Solaris to g++
[14:05] <mabshoff> away fom sun's cc & CC
[14:05] <mabshoff> On neron there is a "dummy" cc which just says: please install the real cc
[14:05] <jbmohler_> I hope we could do that in the SConstruct
[14:06] <mabshoff> And since we cannot build with Sun's CC anyway.
[14:06] <jbmohler_> We already have exceptions for darwin there
[14:06] <mabshoff> I tried, it worked for C, but not for C++
[14:06] <mabshoff> I imported CXX from env, no dice.
[14:06] <mabshoff> But you might get it to work.
[14:07] <craigcitro> jbmohler_: what was the error that sage & dmharvey ran into above? i came in just as they working around it, so i didn't see what the problem was
[14:07] <jbmohler_> let me look at the docs a bit for cc switch
[14:07] <mabshoff> ok, np.
[14:08] <jbmohler_> I didn't quite understand sage & dmharvey's problem ever
[14:08] <mabshoff> I have a local workaround that I can just patch into "my" scons on Solaris package for now.
[14:08] <-- pdehaye has left this server.
[14:08] <dmharvey> and I don't understand it at all :-(
[14:08] <craigcitro> hahahah
[14:08] <craigcitro> hey david
[14:08] <craigcitro> so what was happening?
[14:10] <dmharvey> my sage broke
[14:10] <dmharvey> i would run it and weird error messages came up
[14:10] <mabshoff> wstein: I got the original patch up on fsmath.
[14:10] <mabshoff> But there is one hung in there which shouldn't go in.
[14:10] <dmharvey> william logged in as me and fixed it
[14:10] <craigcitro> by just recopying c_lib/libcsage.so into place?
[14:10] <mabshoff> The bit about "b/sage/rings/real_rqdf.pyx"
[14:10] <mabshoff> was a mismerge.
[14:11] --> mhansen has joined this channel (n=mike@adsl-76-204-91-188.dsl.mdsnwi.sbcglobal.net).
[14:11] <craigcitro> dmharvey: had you done a sage -b or anything recently? do you maintain multiple branches?
[14:12] <dmharvey> i've forgotten
[14:12] <dmharvey> it's all way too complicated
[14:12] <craigcitro> grin ok
[14:12] <wstein> off for lunch (with Robertwb and boothby)
[14:12] <dmharvey> sorry craig, i'm planning to ignore the problem for now
[14:12] <craigcitro> hah, it's all good
[14:14] <jbmohler_> mabshoff:  Environment( CC='<desired compiler>', CXX='<your desired compiler>' ) would appear the correct thing to me
[14:15] <dmharvey> hmmmm.... now when I do sage -i gmp-4.2.1.p9.spkg, it doesn't seem to be applying the AMD64 patches correctly
[14:15] <dmharvey> it's sending them to entirely the wrong directory, whcih doesn't even exist
[14:15] <mabshoff> odd, got an update spkg-install?
[14:16] <mabshoff> jbmoehler_: I will try that.
[14:16] <dmharvey> no I mean even with the original gmp-4.2.1.p9.spkg
[14:16] <dmharvey> not with my modifications
[14:16] <mabshoff> jbmoehler_: I did something very similar, but it might be that the shell on William's Solaris box if fubar
[14:16] <jbmohler_> craigcitro:  Where is scons actually called from now?
[14:17] <dmharvey> crap my build is such a mess, maybe I should start from scratch
[14:17] <jbmohler_> found it -- sage-build
[14:18] <craigcitro> jbmohler_: $SAGE_ROOT/local/bin ...
[14:18] <craigcitro> i moved it there so that i didn't have to pass flags around about whether or not we were switching branches
[14:18] <craigcitro> because it's where you know whether or not you're switching
[14:18] <craigcitro> ok, i'm afk for a few to shower, and then i'll be back and ready to work
[14:19] <mabshoff> Is anybody working on the Lie.spkg?
[14:19] <mabshoff> I want to fix the curses vs. ncurese issue.
[14:20] <-- mhansen has left this server (Remote closed the connection).
[14:23] --> mhansen has joined this channel (n=mike@adsl-76-204-91-188.dsl.mdsnwi.sbcglobal.net).
[14:27] <syazdani> Ok, after several hours, I finally got sage to build, and run bunch of tests.
[14:28] <syazdani> I mean, run "make test"
[14:28] <mabshoff> And, how is it going?
[14:28] <syazdani> All of the tests, except for 7 of them passed:
[14:28] <syazdani> sage -t  devel/sage-main/sage/modular/modform/ambient_g1.py
[14:28] <syazdani> sage -t  devel/sage-main/sage/modular/modform/eisenstein_submodule.py
[14:28] <syazdani> sage -t  devel/sage-main/sage/modular/modform/submodule.py
[14:28] <syazdani> sage -t  devel/sage-main/sage/rings/number_field/number_field.py
[14:28] <syazdani> sage -t  devel/sage-main/sage/rings/number_field/number_field_ideal.py
[14:28] <syazdani> sage -t  devel/sage-main/sage/rings/morphism.py
[14:28] <syazdani> These ones failed.
[14:28] <mabshoff> Did you do a "sage -upgrade"
[14:29] <syazdani> I did "sage -upgrade" few hours ago.
[14:29] <mabshoff> I believe those were issues with 32 bit only and fixed in the meantime.
[14:29] <syazdani> I'm doing it again.
[14:29] <mabshoff> try again :)
[14:29] <syazdani> Ok, I just did sage upgrade.
[14:29] <syazdani> Let me check.
[14:29] <mabshoff> Bug Day is special, rapid progress.
[14:29] *** dmharvey is now known as dmharvey|away.
[14:29] *** dmharvey|away is now known as dmharvey.
[14:30] <mabshoff> With the upgrade from about 30 minutes ago I have a failure in "sage -t  coding/guava.py2
[14:30] <burcin> is anybody looking at the memleaks in linear algebra?
[14:30] <burcin> #533?
[14:30] <mabshoff> In a while.
[14:30] <mabshoff> ------------------------------------------------------------
[14:30] <syazdani> no, I just did "./sage upgrade", and ran these tests, and they still fail.
[14:30] <mabshoff> Unhandled SIGSEGV: A segmentation fault occured in SAGE.
[14:30] <mabshoff> This probably occured because a *compiled* component
[14:30] <mabshoff> of SAGE has a bug in it (typically accessing invalid memory)
[14:30] <mabshoff> or is not properly wrapped with _sig_on, _sig_off.
[14:30] <mabshoff> You might want to run SAGE under gdb with 'sage -gdb' to debug this.
[14:30] <mabshoff> SAGE will now terminate (sorry).
[14:30] <mabshoff> ------------------------------------------------------------
[14:30] <mabshoff> Okay, interesting.
[14:31] <mabshoff> wstein is at lunch, and he added a lot of doctest in that area.
[14:31] <syazdani> make there are some packages that I need to force it to upgrade again?
[14:31] <syazdani> well, I looked at the one in morphism.py just now,
[14:31] <mabshoff> Try a hg_sage.pull()
[14:31] <syazdani> and the the doctest is correct, and sage is returning the incorrect value.
[14:32] <mabshoff> If there are any updates exit sage and do a ./sage -b
[14:32] <syazdani> hmm, there were 21 changes....
[14:32] <mabshoff> You can rerun those failed tests.
[14:33] <syazdani> ok, I will wait for it to recompile, and then try again. :)
[14:33] <mabshoff> okay
[14:34] <mabshoff> Phew, adding -t  the failed test with guave no longer makes it segfault,
[14:34] <mabshoff> but there are failed tests.
[14:35] <mabshoff> burcin: #533 is quite hard.
[14:35] <mabshoff> William and I looked at it for about 2 hours and he fixed two leaks. But there is still one more.
[14:36] <burcin> mabshoff: I think #563 is caused by something similar..
[14:38] <burcin> mabshoff: anyway.. I'm looking at sparse matricies now..
[14:38] <mabshoff> ok
[14:38] <mabshoff> the guava issue goes away once you nuke the gap workspace.
[14:38] <mabshoff> I though that was fixed. Damn  it.
[14:39] <mabshoff> Hehe, #563 is deep in LinBox.
[14:39] <mabshoff> I reported that one and another one to LinBox-use in the hope that they would fix it.
[14:42] <syazdani> Ok, out of those seven, the first six now pass,
[14:42] <syazdani> but the morphism bug is still there.
[14:42] <mabshoff> Interesting.
[14:44] <syazdani> Hmm, running the same commands on sage gives the right answer.
[14:44] <syazdani> Let me try the tests again...
[14:44] <mabshoff> :)
[14:45] <syazdani> I'm very confused...
[14:46] <syazdani> it still fails when I run "sage -t .../morphism.py",
[14:46] <syazdani> but running the tests inside sage works fine.
[14:47] <mabshoff> Hmm, definitely very odd.
[14:47] <mabshoff> That is with mandriva or whatever it is called these days.
[14:47] <mabshoff> Which doctest fails? Is it always the same?
[14:48] <craigcitro> hey soroosh -- which test is it that's failing?
[14:48] <syazdani> Yes, it's always the same. It fails on line 514
[14:48] <syazdani> Also, when I ask for verbose output, it passes.
[14:48] <craigcitro> it's sage/modular/morphism.py ?
[14:48] <craigcitro> err, probably not, since that doesn't exist ;)
[14:49] <mabshoff> +devel
[14:49] <craigcitro> oh, sage/ring/morphism.py
[14:49] <syazdani> devel/sage-main/sage/rings/morphism.py
[14:49] <syazdani> :)
[14:52] <syazdani> I'm heading out right now
[14:53] <syazdani> I will be back in few hours though.
[14:53] <syazdani> quit
[14:53] <syazdani> :)
[14:53] <syazdani> \quit
[14:53] <syazdani> Ok, how does one quit from the irc channel? :)
[14:54] <craigcitro> forward slash quit
[14:54] <mabshoff> "/" instead of \
[14:54] <dmharvey> I could tell you but I would have to kill myself
[14:54] <syazdani> thanks
[14:54] <mabshoff> :)
[14:54] <craigcitro> hah
[14:54] <syazdani> :) bye for now.
[14:54] <-- syazdani has left this server ("leaving").
[14:54] <craigcitro> i think it would have been funny if mabshoff and i had logged out in response, since we'd typed the right command.
[14:54] <dmharvey> that's what I almost did
[14:54] <craigcitro> grin
[14:54] <craigcitro> then come back in and say "just like that!"
[14:55] <mabshoff> Hey, this isn't bash.org
[14:55] <jbmohler_> The moebius function used to accept polynomial arguments, but now it only takes integer arguments -- is that a good change?
[14:55] <mabshoff> And you can play games with noobies so they log themselves out.
[14:56] <mabshoff> classic line: How do I install X
[14:56] <jbmohler_> The polynomials I was using it for where over a finite field ... if that makes a difference
[14:56] <mabshoff> answer: First quit all programs.
[14:56] <mabshoff> Then user who asked question drops out of channel - brilliant.
[14:56] <dmharvey> Moving .asm files that are to be replaced to .asm.disabled ...
[14:56] <dmharvey> mv: cannot stat `/home/dmharvey/sage-2.8.3.6/spkg/build/gmp-4.2.1.p9/gmp/mpn/x8\
[14:56] <dmharvey> 6_64/addmul_1.asm': No such file or directory
[14:57] <dmharvey> mv: cannot stat `/home/dmharvey/sage-2.8.3.6/spkg/build/gmp-4.2.1.p9/gmp/mpn/x8\
[14:57] <dmharvey> 6_64/submul_1.asm': No such file or directory
[14:57] <dmharvey> mv: cannot stat `/home/dmharvey/sage-2.8.3.6/spkg/build/gmp-4.2.1.p9/gmp/mpn/x8\
[14:57] <dmharvey> 6_64/add_n.asm': No such file or directory
[14:57] <dmharvey> mv: cannot stat `/home/dmharvey/sage-2.8.3.6/spkg/build/gmp-4.2.1.p9/gmp/mpn/x8\
[14:57] <dmharvey> 6_64/sub_n.asm': No such file or directory
[14:57] <dmharvey> mv: cannot stat `/home/dmharvey/sage-2.8.3.6/spkg/build/gmp-4.2.1.p9/gmp/mpn/x8\
[14:57] <dmharvey> 6_64/x86_64-defs.m4': No such file or directory
[14:57] <craigcitro> did anyone else run into soroosh's problem?
[14:57] <dmharvey> Copying new .asm and x86_64-defs.m4 files ...
[14:57] <dmharvey> cp: target `/home/dmharvey/sage-2.8.3.6/spkg/build/gmp-4.2.1.p9/gmp/mpn/x86_64/\
[14:57] <dmharvey> ' is not a directory: No such file or directory
[14:57] <dmharvey> cp: target `/home/dmharvey/sage-2.8.3.6/spkg/build/gmp-4.2.1.p9/gmp/mpn/x86_64/\
[14:57] <dmharvey> ' is not a directory: No such file or directory
[14:57] <dmharvey> Copying new gmp-mparam.h...
[14:57] <dmharvey> cp: target `/home/dmharvey/sage-2.8.3.6/spkg/build/gmp-4.2.1.p9/gmp/mpn/x86_64/\
[14:57] <wstein> hi -- we're back.
[14:57] <dmharvey> ' is not a directory: No such file or directory
[14:57] <dmharvey> Done.
[14:57] <dmharvey> You can now go to /home/dmharvey/sage-2.8.3.6/spkg/build/gmp-4.2.1.p9/gmp and c\
[14:57] <mabshoff> Nope, cannot reproduce it (the doctest failure)
[14:57] <dmharvey> onfigure/make/make_check as usual.
[14:57] <dmharvey> oops
[14:57] <dmharvey> well, what I was trying to say was:
[14:57] <dmharvey> I don't think the AMD64 patch is being applied properly
[14:57] <dmharvey> in 2.8.3.6
[14:57] <mabshoff> Does it work mannually?
[14:58] <mabshoff> maybe the "-pX" level is wrong. i.e. X=2
[14:57] <mabshoff> Does it work mannually?
[14:58] <mabshoff> maybe the "-pX" level is wrong. i.e. X=2
[15:00] <malb> #566 -- fixed, see trac
[15:00] <dmharvey> yeah, and magma is now faster than sage at basic arithmetic, where it should just be using GMP
[15:01] <dmharvey> so why should AMD64 patches have become broken?
[15:01] <jbmohler_> mabshoff:  Did you notice Kiran's latest post on sage-devel where he says that passing the environment straight through fixes his LONG_BIT?
[15:01] <dmharvey> does anyone have a pre-2.8 build available on sage.math?
[15:02] <mabshoff> yep, that is very odd.
[15:02] <mabshoff> dmharvey: you might have to patch with a different directory depth.
[15:02] <mabshoff> Do you have the spkg around somewhere?
[15:03] <mabshoff> Have you checked in /home/was?
[15:03] --> pdehaye has joined this channel (n=pdehaye@12.19-64-87.adsl-dyn.isp.belgacom.be).
[15:03] <-- pdehaye has left this server (Client Quit).
[15:03] <mabshoff> malb: I found another issue with valgrind: sage -t  -valgrind doesn't work properly yet.
[15:03] <mabshoff> Will fix that next.
[15:03] <mabshoff> it spews the log files all over the place.
[15:05] <dmharvey> mabshoff: yeah I think I see what's going wrong. I just don't understand why something like that broke and why no-one noticed. That's really annoying. Who knows how long it's been like that.
[15:05] --> pdehaye has joined this channel (n=pdehaye@12.19-64-87.adsl-dyn.isp.belgacom.be).
[15:06] <mabshoff> Well, external patches have a tendancy to break, and the gmp project is reluctant to merge stuff like the better AMD64 assembly.
[15:06] <mabshoff> gmp 4.1.4 just sucked on Opterons.
[15:06] <-- pdehaye has left this server (Client Quit).
[15:07] <wstein> dmharvey -- locate sage-2.7 finds many
[15:07] <dmharvey> well what must have happened is that someone rearranged the gmp spkg and didn't bother reading the warning messages that bash was spitting out
[15:07] <mabshoff> malb: your patch also fixes #519, I believe.
[15:07] <wstein> what's up with gmp?
[15:07] <wstein> warning -- the gmp spkg pre 2.8 is bad bad bad.
[15:07] <dmharvey> it's not applying the AMD64 patches
[15:07] <wstein> ah
[15:08] <dmharvey> probably not the core 2 duo either
[15:08] <mabshoff> wstein: a little time for that Solaris patch again?
[15:08] <wstein> this wouldn't have mattered pre 2.8, since they were pre-applied to the src/ directory.
[15:08] <wstein> mabshoff - sure, what's the latest?
[15:08] <mabshoff> This is the original, with one file merged that shouldn't
[15:08] <mabshoff> same url
[15:08] <mabshoff> http://fsmath.mathematik.uni-dortmund.de/~mabshoff/patches/Sage-2.8.3-roundf+isinf_workaround_on_Solaris.patch
[15:09] <mabshoff> I am working on more fixes for -valgrinf
[15:09] <mabshoff> d
[15:09] <mabshoff> the doc-test case needs the same fixes as the sage-sage case.
[15:09] <dmharvey> wstein: right, for sage 2.7 we have:
[15:10] <dmharvey> sage: a = ZZ.random_element(2^100000)
[15:10] <dmharvey> sage: b = ZZ.random_element(2^100000)
[15:10] <dmharvey> sage: timeit c = a * b
[15:10] <dmharvey> 1000 loops, best of 3: 872 µs per loop
[15:10] <dmharvey> for sage 2.8.3.6 we have:
[15:10] <dmharvey> 1000 loops, best of 3: 1.18 ms per loop
[15:10] <wstein> dmharvey -- ok.
[15:10] <wstein> we can fix that.
[15:10] <dmharvey> they were pre-applied??
[15:10] <wstein> yes.
[15:11] <dmharvey> even on the wrong system?
[15:11] <wstein> this caused some major problems.
[15:11] <wstein> YES.
[15:11] <dmharvey> since both of them touched x86_64?
[15:11] <wstein> It meant, e.g., that binaries built on one system would not work on others.
[15:11] <wstein> In some cases.
[15:11] <wstein> So now I test that src is exactly identical to the vanilla gmp distro.
[15:12] <dmharvey> so what's the right way to fix this?
[15:12] <malb> mabshoff: it probably also fixes this one
[15:13] <wstein> dmharvey -- which trac ticket is this?
[15:13] <jbmohler_> mabshoff:  Did you get your scons compiler selection issue resolved in a nice way?
[15:13] <dmharvey> doesn't have one yet, should I make one?
[15:13] <dmharvey> i only just noticed it while working on #424
[15:13] <wstein> i'll make one now.
[15:13] <dmharvey> ok
[15:14] <dmharvey> if you have time to do that now, I can do the stupid monsky-washnitzer one, and come back for #424 when you're done with that
[15:14] <wstein> it's now http://trac.sagemath.org/sage_trac/ticket/605
[15:15] <mabshoff> malb: you mean #519 - it believe so because the rand_state_init() was moved.
[15:15] <malb> yes, but it's not free'd on clear yet
[15:15] <mabshoff> jbmohler_: haven't gotten around to it. Want to get the Solaris patches merged first before I start building again.
[15:15] <malb> but only leaks one instance now
[15:15] <mabshoff> malb: exactly.
[15:16] <mabshoff> instead of about 40!
[15:16] --> pdehaye has joined this channel (n=pdehaye@12.19-64-87.adsl-dyn.isp.belgacom.be).
[15:16] <mabshoff> Once your patch is in for the gmp issues I will rerun some tests just to see how much of the noise has disappeared.
[15:17] <malb> also you might consider a python suppression file
[15:17] <malb> I've added one at it's much easier on the eyes
[15:17] <burcin> malb: where can I get your gmp patch?
[15:18] <wstein> I want to finish up #396 since I was halfway through it.
[15:18] <wstein> mabshoff -- your patch is applied and pushed.
[15:18] <mabshoff> Yeah about that supression, I have also thought about using --pydebug.
[15:18] <mabshoff> Cool, did you revert the one "Blah" bit?
[15:18] <malb> its not a gmp patch, its for c_lib and gmp.pxi, but you can get it at http://www.sagemath.org:9002/sage_trac/ticket/566
[15:18] <wstein> dmharvey -- i should be able to do #396 in about 15 minutes.  Then I'll work on gmp with you.
[15:19] <dmharvey> wstein: ok
[15:19] <burcin> malb: thanks.. I got that.. the linear algebra leaks seem to point to __gmpz_realloc
[15:19] <burcin> malb: so I want to run a test with your patch too
[15:19] <-- pdehaye has left this server (Client Quit).
[15:19] <mabshoff> malb: There is some old docs at the python site that show how to use pydebug macros to look at reference counts and so on.
[15:19] <mabshoff> I think we should add those as a debug option to the Cython generated code, but this is a long term issue.
[15:20] <malb> burcin: the __gmpz_realloc thing should be unrelated
[15:20] <mabshoff> doesn't sage "hook" gmp_alloc?
[15:20] <malb> somehow module level ZZs are not deallocated properly sometimes I guess
[15:20] <malb> yeah, but we seldomly realloc by hand only in the integer_pool
[15:20] <mabshoff> Then I assume we would also have to hook realloc.
[15:21] <mabshoff> ok.
[15:21] <mabshoff> where is the integer_pool? (codewise)
[15:21] <boothby> patch up for #602
[15:21] <malb> integer.pyx
[15:21] <mabshoff> ok, thanks
[15:21] <mabshoff> wstein needs to patch faster ;)
[15:21] <wstein> :-)
[15:22] <mabshoff> And he doesn't scale past one core *ducks*
[15:23] <wstein> hey, how many people are subscribed to sage-devel :-)
[15:23] <mabshoff> About 197, but 40 are banned spammers.
[15:24] <burcin> malb: do you have time to look at modules/vector_rational_sparse_c.pxi
[15:25] <burcin> I can't understand what's happening with add_mpq_vector_init
[15:25] <malb> ytes
[15:25] <malb> which ticket is that
[15:25] <sage> burcin -- if you can't figure it out, I might be able to, since I wrote that...
[15:25] <sage> at least you can blame me.
[15:25] <malb> by the way: burcin nice to meet you in real time
[15:26] <burcin> we free only the entries of z at the end of the function
[15:26] <burcin> malb: yes.. how's london?
[15:27] <malb> good, well, 1:30h to and from uni sucks big time but besides that, it's great
[15:27] <dmharvey> wstein: I think I can manage both #424 and #605 myself
[15:28] <sage> cool -- #396 is more involved than I expected.
[15:28] <dmharvey> but i'll need a linux core 2 duo to try it out on
[15:28] <sage> dmharvey -- would a xeon mac running linux work?
[15:28] <malb> so what exactly is the problem ith ad_mpq_vector_init?
[15:28] <dmharvey> ummmm I don't know, I can see
[15:28] <dmharvey> you mean bsd?
[15:29] <dmharvey> wait a second, that's not linux
[15:29] <burcin> malb: we do mpq_vector_init(z), but no mpq_vector_clear
[15:29] <dmharvey> all I mean is, we don't have any 64-bit support on mac OS's as far as I know
[15:30] <malb> and you wonder where that should happen?
[15:30] <sage> dmharvey -- i have about 10 vmware linux's running on bsd under vmware.
[15:30] <burcin> but I don't get why we're clearing the entries anyway.. isn't z the sum?
[15:30] <mabshoff> burcin: That is partially by design, but there is one ticket which I thought it needed a clear at the end.
[15:30] <mabshoff> Which ticket are you looking at?
[15:31] <malb> okay, will read source now
[15:31] <dmharvey> wstein: how do I log into one of those?
[15:31] <burcin> mabshoff: I saw #564.. I also don't have a test case..
[15:32] <mabshoff> one second .. checking
[15:33] <mabshoff> "for n in range(10,100): a=ModularSymbols(n,sign=1).decomposition(); print n, get_memory_usage()"
[15:33] <dmharvey> #424: I just got the fast gcd code running in SAGE on my laptop :-)
[15:33] <mabshoff> it is right at the top of the ticket.
[15:33] <mabshoff> It had two out of three leaks closed.
[15:33] <craigcitro> >dmharvey: do you have sage on your laptop? did you get a new laptop?
[15:33] <mabshoff> And #533 seemed to trigger the other issue.
[15:33] <craigcitro> i thought you were still working remotely ...
[15:34] <dmharvey> craig: yes! about two weeks old I think
[15:34] <malb> burcin: did you test the code actually works?
[15:34] <mabshoff> Those leaks all hit similar code paths, so it might be a good idea to rerun the tests and see which ones are left/the bif ones.
[15:34] <mabshoff> bif->big
[15:35] <burcin> mabshoff: i'm still tracking that one.. echelonize is leaking..
[15:35] <mabshoff> burcin: For the test case under valrgind reduce the range() thingy.
[15:35] <mabshoff> cool.
[15:35] <burcin> mabshoff: will try to narrow it down further
[15:36] --> bobmoretti has joined this channel (n=bob@D-69-91-157-199.dhcp4.washington.edu).
[15:36] <bobmoretti> hello bug squashers
[15:36] <malb> hi
[15:37] <mabshoff> Yeah, try to create a specific test case for say echelonize
[15:38] <wstein> hi bobmoretti.
[15:38] <mabshoff> Hello
[15:38] <malb> burcin: "but I don't get why we're clearing the entries anyway.. isn't z the sum?" we are only clearing the entries > k
[15:38] <wstein> bobmoretti -- when using screen, how do you go to the beginning of the line in bash without going nuts?
[15:38] <mabshoff> CTRL-A + escape
[15:39] <wstein> that switches to scroll mode.
[15:39] <wstein> I just want to do what "ctrl-a" does when not using screen.
[15:39] <mabshoff> okay, I misunderstood.
[15:39] <bobmoretti> CTRL-A A
[15:39] <bobmoretti> I think
[15:39] <mabshoff> lol
[15:39] <wstein> bobmoretti ctrl-a a goes to the previous screen window.
[15:39] <malb> burcin: we definitely don't want to clear that vector at the end of the function call it is our result
[15:39] <bobmoretti> yeah, it's \C-a a
[15:39] <bobmoretti> not \C-a \C-a
[15:40] <burcin> malb: ok.. I got it now.. thanks..
[15:40] <wstein> ah!  thanks!
[15:40] <bobmoretti> no problem. Are seattle people meeting  somewhere physically?
[15:40] <dropdrive> wstein: You can also use C-something-else for the escape in screen.  Handy if you use C-a a lot.
[15:41] <wstein> dropdrive -- i couldn't figure out how to change that to something I liked.
[15:41] <wstein> The man page explains how to change it, but the  "something-else" uses a very strange
[15:41] <wstein> notation, which isn't explained at all.  So I had no clue how to actually do it.
[15:41] <dropdrive> wstein: I personally use C-\ which I like a lot.
[15:41] <wstein> how do you change to that?
[15:42] <dropdrive> wstein: Put "escape ^\\\" in ~/.screenrc
[15:42] <dropdrive> wstein: It's a bit disconcerting if you use keyboards with "\" in different positions though :)
[15:43] <bobmoretti> wstein: are you folks in your office or the SAGE lab or somewhere else?
[15:43] <wstein> bobmoretti -- we're at my house.
[15:43] <wstein> feel free to come by
[15:43] <bobmoretti> doh! I just biked back from capitol hill
[15:44] <wstein> doh!
[15:44] <mabshoff> In a Nelson voice: ha ha
[15:44] <bobmoretti> how late will you guys be going at this tonight?
[15:44] <sage> don't know.... probably 8pm ?
[15:45] <bobmoretti> well, it's probably not worth it for me to come by then
[15:45] <mabshoff> wstein: "sage -valgring -t blah" works but not "sage -t -valgring  blah" doesn't
[15:45] <bobmoretti> I can just work over IRC
[15:45] <wstein> ok.
[15:45] <mabshoff> Would you consider that a problem?
[15:45] <wstein> mabshoff: sage-sage would do well to be rewritten to parse args better...
[15:46] <mabshoff> Oh well, somebody elses problem then I guess ;)
[15:46] <mabshoff> I also found out that "--help" was broken for ./sage - fix is coming.
[15:48] <dmharvey> arrggggh. I just did a totally clean build of sage-2.8.3.6, and it's having that same import error from before, with libcsage or whatever it was.
[15:48] <wstein> you have this in your default path:
[15:48] <wstein> declare -x LD_LIBRARY_PATH="/home/dmharvey/gmp/install/lib/"
[15:48] <wstein> This could cause trouble...
[15:49] <dmharvey> ah
[15:49] <jbmohler_> sage-sage rewritten to parse args .... that would make me utterly ecstatic!
[15:49] <sage> jbmohler -- we could rewrite it in python...
[15:49] <sage> that would be much nicer.
[15:49] <malb> I am looking into #532 (memleak I caused)
[15:49] <dmharvey> wstein: oh and that explains some totally weird stuff I noticed a few weeks ago too.....
[15:50] <jbmohler_> yes, I think it will be necessary to write it in python to handle the gnu long-options correctly (optparse is a wonderful module and would make it quite easy to write)
[15:51] <mhansen> wstein: #230/#236 can be closed.  I can add an enhancement ticket to allow for the loading of spyx/pyx files.
[15:51] <dmharvey> oh does that mean I have to rebuild AGAIN????
[15:51] <mhansen> wstein: #387 can be closed
[15:52] <mhansen> wstein: I attached patches for #334 and #553
[15:53] <wstein> mhansent -- I'm working on #396
[15:53] <mhansen> wstein: I have a patch for #396 which throws an error when multiplying two vectors.  Instead, I moved all that functionality to .pairwise_product().
[15:53] <wstein> mhansen -- ok, make it an enhancement.
[15:54] <wstein> dmharvey -- just rebuild your libcsage.
[15:54] <mhansen> wstein: sage -testall passes with my patch for #396.
[15:54] <wstein> maybe ntl too
[15:54] <wstein> mhansen -- * should be defined.
[15:55] <wstein> Also, there are 6 places where vector * vector is implemented.
[15:55] <mhansen> wstein: I changed all of those.
[15:55] <wstein> These need to all be changed to componentwise_product.
[15:55] <wstein> to what?
[15:55] <mhansen> _pairwise_product_c_impl
[15:55] <wstein> there is nothing attached to ticket #396.
[15:56] <wstein> did you implement dot products though, and leave _vector_times_vector_c_impl as dot product?
[15:56] <wstein> _vector_times_vector_c_impl should return the dot product
[15:57] <wstein> #396 -- i think we just replicated work in different directions for #396.
[15:57] <mhansen> didn't implement the dot products
[15:58] <wstein> can you send me your patch for #396.
[15:58] <wstein> I'll take your _pairwise_product_c_impl code.
[15:58] <wstein> But I'll keep the _vector_time_vector_c_impl dot product code I've written.
[15:58] <wstein> That will work well together.
[15:59] <mabshoff> wstein: I send you additional support for valgrind with sage-doctest
[16:00] <mhansen> wstein: I attached it to #396.  I changed all the doctests to show my error when doing v*v, but there are relatively few of them.
[16:01] <wstein> ok, i'll merge it in.
[16:03] <mabshoff> #396, my patch or both?
[16:04] <dmharvey> wstein: I'm going out for some dinner. I'll be back in < 2 hours probably, I'm planning to finish off #424, #605, and probably #518 tonight. I think I've got #424 and #605 covered, I've just got to wait for some things to finish building.
[16:04] <wstein> cu
[16:04] <mabshoff> cu
[16:09] <malb> mhh, are module level variables (e.g. "RR = RealField()") free'd at the end or does Python just not bother?
[16:09] <mabshoff> Might be a reference count issue, we haven't really gotten that deep into the code.
[16:10] <malb> I see
[16:10] <mabshoff> Or is that are of the code just missing deallocation routines?
[16:10] <malb> nope
[16:10] <mabshoff> Well, reference counts in python is an advanced topic. At least for me.
[16:11] <malb> Pyrex doesn't seem to clean them up
[16:11] <malb> robertwb are you around -- oh Cython guru
[16:11] <robertwb> hi
[16:11] <mabshoff> come speak with is mortals.
[16:12] <robertwb> so, let me get up to speed
[16:12] <malb> module level PyObjects in Cython
[16:12] <robertwb> yes
[16:12] <mabshoff> Some of us might buy you some real beer in England, st SD6
[16:12] <mabshoff> at
[16:12] <malb> i.e. real_mpfr.pyx
[16:12] <malb> RR = RealField()
[16:12] <robertwb> uh huh
[16:13] <malb> any hook to clean it up again?
[16:13] <robertwb> oh, this is probably related to that dict issue that we were seeing before
[16:13] <robertwb> RR lives in the dict that was never garbage collected
[16:13] <malb> Pyx_InternTabEntry?
[16:14] <malb> that's an array
[16:14] <malb> I am looking at the C code
[16:14] <malb> there are three occurences of "RR"
[16:14] <robertwb> The dict that belongs to the module
[16:14] <malb> cannot find where it is added to it
[16:15] <robertwb> It's being created in Py_InitModule4
[16:16] <robertwb> see line 14700 or real_mpfr.c
[16:17] <malb> so basically, if we manage to garbage collect that dictionary we get rid of most of the noise valgrind produces right now for a clean start-up and close?
[16:17] <robertwb> a lot of it
[16:17] <robertwb> if there are cdef module level objects, those would probably still be hanging around
[16:17] <malb> sure
[16:17] <robertwb> but those are rare
[16:18] <malb> can you estimate how difficult this would be: the garbage collecting?
[16:20] <robertwb> I have no idea...
[16:20] <mabshoff> It might be very interesting to try this on a small stand alone cython module as robert suggested.
[16:20] <robertwb> can you instruct me on how to run valgrind?
[16:20] <mabshoff> plus --pydebug & reference count macros.
[16:20] <robertwb> yeah
[16:20] <mabshoff> ./sage -valgrind
[16:20] <malb> first, you'll need valgrind
[16:20] <mabshoff> spkg -i ...
[16:20] <malb> mabshoff has an optional SAGE package
[16:20] <robertwb> ah
[16:21] <mabshoff> Yeah, but somebody needs to upload it to the official repo.
[16:21] <mabshoff> You can get it from
[16:21] <malb> if you quit sage right away you'll get the import memleaks only
[16:21] <malb> they are written to $SAGE_LOCAL/bin right now as sage.$PID
[16:21] <mabshoff> http://fsmath.mathematik.uni-dortmund.de/~mabshoff/sage/valgrind-3.3.0svn-r1787.spkg
[16:21] <mhansen> Is the documentation in a separate repository?
[16:22] <robertwb> on exit, we could always decref the dict until its count is 0, but bad things might happen if you ever need to use it again
[16:22] <malb> mhansen: yes
[16:22] <dmharvey> how do I rebuild libcsage?
[16:22] <mabshoff> if you upgrade they do get written to $HOME/.sage
[16:22] <mabshoff> wstein merged that patch already.
[16:22] <craigcitro> dmharvey: scons install in c_lib
[16:22] <mabshoff> including massif and cachegrind support.
[16:23] <craigcitro> or, first, rm -f c_lib/libcsage.*
[16:23] <craigcitro> then scons install
[16:23] <dmharvey> scons is installed in the sage tree somewhere?
[16:23] <craigcitro> oh, yeah, sorry
[16:23] <craigcitro> source $SAGE_ROOT/local/bin first
[16:23] <craigcitro> er
[16:23] <craigcitro> $SAGE_ROOT/local/bin/sage-env
[16:23] <mabshoff> the above valgrind spkg needs automake-1.9 installed, haven't corrected that I believe.
[16:24] <craigcitro> it's just sage_root/local/bin/scons i believe
[16:24] <mabshoff> (the external dependency.
[16:24] <mabshoff> )
[16:24] <craigcitro> how was dinner?
[16:24] <dmharvey> this is driving me so crazy. I've spent like 6 hours on this gcd thing, just because I'm a unix idiot
[16:24] <dmharvey> haven't had dinner yet
[16:24] <dmharvey> still fighting unix
[16:24] <craigcitro> grin
[16:24] <craigcitro> unix is mighty
[16:25] <mabshoff> it gives you enough rope to hang yourself
[16:25] <robertwb> sage: An error occurred while installing valgrind-3.3.0svn-r1787
[16:25] <mabshoff> That is its strength and weakness at once.
[16:25] <robertwb> configure: error: cannot find install-sh or install.sh in . ./.. ./../..
[16:25] <robertwb> error configuring valgrind 3.3.0svn
[16:25] <mabshoff> Yep, that is the automake problem.
[16:26] <mabshoff> You can rerun autogen.sh in src
[16:26] <malb> mabshoff how to I produce pictures with massif?
[16:26] <sage-log> c
[16:31] [Nick] Nickname already in use. Trying wstein.
[16:31] [error] Closing Link: 127.0.0.1 (Connection Timed Out)
[16:31] --> You have joined the channel #sage-devel (n=was@c66-235-37-221.sea2.cablespeed.com).
[16:31] [Error] sage-dev: No such channel.
[16:31] <mabshoff> There goes UW
[16:31] <craigcitro> is sage-log our new logging bot?
[16:31] *** Channel modes: secret, no messages from outside
[16:31] *** This channel was created on 08/17/2007 01:03:33 PM.
[16:32] <mabshoff> Nope, just another irssi session.
[16:32] <craigcitro> ah, ok
[16:32] <burcin> well.. you got dropped.. not us :)
[16:32] <mabshoff> trac has a pretty cool irc log extesion.
[16:32] <mabshoff> 8)
[16:32] <mabshoff> your 4 vs, us 8, I guess not.
[16:33] <mabshoff> anyway:
[16:33] <mabshoff> malb: the ps output still ends up in local/bin, that seems to be a bug in valgrind.
[16:33] <mabshoff> in case you didn't get it.
[16:33] <mabshoff> I will report that bug.
[16:33] <mabshoff> The same happens with cachegrind.
[16:35] <malb> which filename?
[16:35] <malb> got it
[16:35] <mabshoff> massif$PID.ps
[16:35] <malb> sorry for the noise
[16:35] <mabshoff> np
[16:36] <mabshoff> malb: you migth want to increase "--depth=<number> [default: 3]"
[16:36] <mabshoff> I set it to 6 in sage for now.
[16:37] <malb> the number of heaps watched?
[16:37] <malb> this ps stuff is really cool
[16:37] <mabshoff> depth of the call chain.
[16:37] <mabshoff> The deeper the more detail, but the slower it gets.
[16:38] [CTCP] Received Version request from freenode-connect.
[16:38] <mabshoff> The svn build I package is substancially faster for code with lots of allocs.
[16:38] <mabshoff> And for our gmp on Core Duo we need some SS2/3 fixes that are not in 3.2.3
[16:39] <malb> that's why I use your package instead of the debian one
[16:39] <mabshoff> :)
[16:40] --> bobmoretti has joined this channel (n=bob@D-69-91-157-199.dhcp4.washington.edu).
[16:40] <malb> robertwb are you looking into that module dict deallocation thing?
[16:40] <robertwb> upgrading my copy of SAGE on sage.math (which I presume has valgrind installed)
[16:41] <malb> cool, so I stop working on memleaks involving module loading for now
[16:41] <robertwb> ok
[16:41] <mabshoff> Add /usr/local/valgrind-3.3.0svn-r6793/bin/ to $PATH on sage.math
[16:41] <mabshoff> w00000t
[16:41] <mabshoff> Nice.
[16:44] <mabshoff> hehe, we can also add callgrind support to sage for profiling.
[16:44] <malb> definitely!
[16:44] <malb> I used it before, its quite valueable
[16:45] <malb> I used it before *with* SAGE
[16:45] <mabshoff> Sage, more debugging/profiling tools than any other CAS.
[16:45] <mabshoff> Good.
[16:45] <mabshoff> I put it on my list.
[16:45] <mabshoff> Once my last patch is merged.
[16:45] <malb> that's the beauty of not reinventing-the-wheel
[16:46] <mabshoff> Oh, I can't even express how much I agree with that point.
[16:47] <sage> :-)
[16:47] <mabshoff> wb
[16:48] <malb> strange, just debugging a function I've -- apparently -- written (solve_iml)
[16:48] <mabshoff> :)
[16:48] <malb> forgot about it, that was in a coffee shop in Seattle
[16:48] <mhansen> sage: I attached a patch for #544.
[16:48] <sage> thanks.
[16:48] <sage> i'm *still* working on #396.
[16:48] <sage> that was a very painful merge.
[16:49] <sage> almost there.
[16:49] <sage> then I can apply everything else.
[16:49] <mabshoff> Good
[16:49] <mhansen> Cool.
[16:51] <robertwb> where is the valgrind output?
[16:51] <mabshoff> What did you run?
[16:51] <robertwb> sage -valgrind
[16:51] <mabshoff> If you upgrade it is in $HOME/.sage
[16:51] <mabshoff> otherweis in $SAGE_LOCAL/bin
[16:51] <robertwb> what's it called?
[16:52] <mabshoff> sage.$PID[.$THREAD]
[16:52] <mabshoff> ls -altr
[16:52] <mabshoff> then it is at the end of the listing
[16:53] <mabshoff> There are usually at least three logs from one run.
[16:53] <mabshoff> The big one is Sage's python process itself
[16:53] <mabshoff> Skip over the first 3rd or so, that is from pymalloc being active.
[16:54] <mabshoff> There are some small issues in there, but those are not related to the dictionary issue.
[16:54] <mabshoff> search for ini$NAME_OF_CYTHON_CLASS and you should find the dictionary leak.
[16:54] <mabshoff> init$NAME_OF_CYTHON, sorry
[16:57] <-- bobmoretti has left this server (Read error: 110 (Connection timed out)).
[16:58] <mabshoff> robertwb: One more fun fact: before the first valgrind cleanup patches the start up & quit default valgrind log was about 5.5MB, now it is less than 2.5MB
[16:59] <robertwb> wow
[16:59] <mabshoff> I can show you some before and after output for LinBox some time.
[16:59] <mabshoff> Pretty scary.
[16:59] <mabshoff> There is still one example in LinBox that leaks 8MB in about 3 seconds.
[17:01] <sage> hi -- i finished and pushed out #396
[17:01] <mhansen> Nice work!
[17:01] <sage> now I'm applying patches.
[17:01] <boothby> does anybody use power_series_mpoly?  the file says that it should be deleted.
[17:02] <sage> mhansen -- you may want to revert your then pull.
[17:02] <sage> I copied a lot of your work in manually.
[17:02] <sage> leave it.
[17:03] <sage> don't delete.
[17:03] <mhansen> I have it in a separate branch.
[17:03] <sage> good.
[17:03] <sage> #602 -- i'm applying this.
[17:05] <burcin> I still can't find where echelonize leaks, can anybody help?
[17:06] <mabshoff> We should wait for malb's patch to be applied and have another look.
[17:06] <malb> which echelonize?
[17:06] <mabshoff> Do you have a simple exmaple that does just echelonize?
[17:06] <mabshoff> Sparse or dense?
[17:06] <malb> I am looking into solve_iml right now, and actually it doesn't leak
[17:07] <burcin> matrix2.pyx echelonize..
[17:07] <mabshoff> isn't that the "abstract" class=
[17:07] <mabshoff> ?
[17:07] <malb> over which field are you working?
[17:07] <malb> but abstract in a sense that it is implemented but slow
[17:07] <mabshoff> ok
[17:08] <burcin> over integers, or mod p.. doesn't seem to make a difference
[17:08] <mabshoff> Has anybody ever tested the IML itself?
[17:08] <malb> they all have their own implementations
[17:08] <burcin> matricies are sparse in my case..
[17:08] <malb> ah, okay
[17:08] <malb> they don't have their own implementations
[17:08] <malb> I'll have a look
[17:09] <malb> the solve_iml stuff DOES NOT leak
[17:09] <mabshoff> Did you tests?
[17:09] <malb> yes
[17:09] <mabshoff> ok
[17:09] <burcin> yes.. it uses _echelon_in_place_classical in matrix2.pyx
[17:09] <malb> its just that the result has a reference from the prompt which doesn't get cleared for some reason
[17:10] <mabshoff> Okay, but even if you create a bunch of object in python they get destroyed at exit if the reference count is zero.
[17:10] <malb> if C is the result from _solve_iml then
[17:11] <malb> if you "del C" right away ==> No leak
[17:11] <mabshoff> So there might be (another) reference count issue around there somewhere.
[17:11] <mabshoff> But C gets passed into python?
[17:11] <malb> if tou print C, and del afterwards ==> leak
[17:11] <malb> sure, C prompt
[17:11] <malb> I'll write it down in the ticket
[17:11] <mabshoff> How is C printed? Python?
[17:11] <mabshoff> Cython?
[17:13] <malb> Cython
[17:13] <malb> I'll look at it
[17:13] <-- jbmohler_ has left this server ("using sirc version 2.211+KSIRC/1.3.12").
[17:15] <malb> if I do c = str(C); del c, del C it also doesn't leak
[17:15] <mabshoff> mmh, robertwb - any input on this?
[17:16] <robertwb> so, you have something that doesn't leak if you delete it right away, but does if you leave it laying around?
[17:17] <malb> if I print it
[17:17] <malb> i.e. sage: C
[17:17] <malb> ipython maybe?
[17:17] <robertwb> oh, if you print it
[17:17] <robertwb> yeah, I've run into this too, I think
[17:18] <robertwb> I think it affects the notebook too though
[17:18] <malb> burcin: GF(p) has its own sparse implementation
[17:18] <malb> robertwb: okay so the problem seems to be deeper
[17:18] <mhansen> sage: #606 replaces #236
[17:19] <malb> I think we'll need to assign someone to reading Python source :-)
[17:19] <burcin> malb: it's Zmod(p)
[17:19] <robertwb> FYI, a very simple cython module, loaded with "load simple_c.spyx" does not seem to leak
[17:19] <wstein> mhansen -- closed #236
[17:19] <mabshoff> python startup+quit leaks about 500kb.
[17:20] <mabshoff> So there are definitely issues there, too.
[17:20] <malb> burcin: but that's GF(p)?
[17:20] <mabshoff> Also the parser: some doctests just segfault when python is compiled without pymalloc.
[17:22] <burcin> malb: ok.. Zmod(n) then.. the library doesn't detect that p is prime, and use a GF(p) instead
[17:22] <malb> I see
[17:22] <malb> so you are working over rings instead of fields and then it leaks
[17:23] <burcin> yes.. I think it is just the function _echelon_in_place_classical, nothing special about the domain
[17:26] <malb> so if we are working with say ZZ we are actually working over QQ
[17:26] <-- robertwb has left this server (Read error: 104 (Connection reset by peer)).
[17:26] --> robertwb has joined this channel (n=robert@c66-235-37-221.sea2.cablespeed.com).
[17:28] <malb> burcin: ZZ --> QQ (special implementation), GF(p) --> special implementation, Z/modN --> Exception
[17:29] <malb> what are you using as base ring/field?
[17:29] <burcin> I use _mod_int to get the matrix.. I didn't tried generating one directly
[17:29] <mabshoff> wstein: around?
[17:30] <mabshoff> I have a fixed lie.spkg which now links against ncurses except for Solaris.
[17:30] <mabshoff> See http://fsmath.mathematik.uni-dortmund.de/~mabshoff/sage/lie-2.2.2.p3.spkg
[17:30] <mhansen> wstein: patch added for #606
[17:31] <mabshoff> The Lie problem is #595.
[17:31] <malb> you are actually working with mod_n_sparse (which only works for mod_p sparse)
[17:31] <malb> matrix2.spyx is not involved as far as I can see
[17:31] <malb> and there is a leak in matrix_modn_sparse.pyx
[17:34] <burcin> the implementation of the echelonize is in matrix2.pyx.. but that doesn't matter...
[17:35] <-- boothby has left this server (Read error: 104 (Connection reset by peer)).
[17:35] <burcin> so what do you mean by a leak in matrix_modn_sparse.pyx?
[17:36] <malb> Let's agree on an example first:
[17:36] <malb> sage: A = random_matrix(ZZ,10,10)
[17:36] <malb> sage: B = A._mod_int(7)
[17:37] <malb> now B is of type: Matrix_modn_sparse
[17:37] --> soroosh has joined this channel (n=syazdani@dsl-67-55-12-152.acanac.net).
[17:37] <mabshoff> welcome back
[17:37] <soroosh> thanks
[17:37] <malb> A.echelonize is in matrix2.spyx you are right
[17:37] <malb> it calls A._echelon_in_place_classical in matrix_modn_sparse.pyx
[17:38] <malb> and there seems to be at least one leak (according to valgrind)
[17:38] <burcin> yes.. we're on the same example..
[17:39] <malb> so we should look at echelon_in_place_classical in matrix_modn_sparse
[17:39] <burcin> ModularSymbols(n,sign=1) calls this, so I'm hoping this will get rid of some of the leaks there
[17:40] <malb> also at modules/vector_modn_sparse_c.pxi
[17:41] <burcin> ?? but verbose doesn't produce the output I see in that function..
[17:41] <burcin> hmm.. just a sec
[17:42] <soroosh> wstein: you told me you made a binary for Mandrake. Where is it again?
[17:43] <burcin> ok.. you're right..
[17:47] <malb> the leak should be related to add_c_vector_modint_init ?
[17:47] <wstein> on sagemath.org in the linux 32-bit binaries.
[17:48] <mabshoff> wstein: I will be working on a new M2 spkg next, this might take a while.
[17:48] <burcin> I can only reproduce it without the _mod_int now.. I don't know where I messed up my example code
[17:48] <sage> does sage have any bugs left?
[17:48] <mabshoff> Well, I am sure.
[17:49] <mabshoff> Do you really mean sage by the way?
[17:49] <burcin> sage: I get a memory leak besides an exception.. it's very useful
[17:49] <sage> yes.  :-)
[17:49] <malb> reproduce the leak you were working on in somethign != GF(p)?
[17:49] <sage> I'm trying to figure out what to do next..
[17:49] <burcin> malb: not it leaks if I echelonize over the integer ring
[17:50] <mabshoff> close #595, apply the patch for #606
[17:50] <sage> jbmohler found a nice bug -- trac #608 -- core dump.
[17:50] <sage> I'm going to work on that now.
[17:50] <mabshoff> or is there even more outstanding/with patch/ready to go in.
[17:50] <sage> oh, I'll look at 595 and 606 first.
[17:50] <soroosh> There is a bit of problem with rings/morphisms on my build.
[17:50] <mabshoff> I see if valgrind says anything about #608, or gdb
[17:50] --> dmharvey_ has joined this channel (n=david@c-24-61-47-91.hsd1.ma.comcast.net).
[17:51] <soroosh> I'm checking to see if it exists in the build you have on sagemath as well.
[17:51] <dmharvey_> back
[17:51] <mabshoff> #wb
[17:52] <sage> #595 -- posted and closed.
[17:52] <sage> it would be good if he could test it though...
[17:52] <mabshoff> it goes boom in libpari (#608)
[17:52] <sage> on sagemath.org when I try to install lie I get:
[17:52] <sage> /usr/bin/ld: cannot find -lncurses
[17:52] <sage> collect2: ld returned 1 exit status
[17:52] <sage> make[1]: *** [Lie.exe] Error 1
[17:52] <sage> so I will reopen #595.
[17:53] <mabshoff> it is still open.
[17:53] <mabshoff> I can do something a little bit more sophisticated then.
[17:53] <mabshoff> i.e. test to link against each lib, but pick ncurses over curses.
[17:53] <sage> is it supposed to build without curses?
[17:53] <sage> is curses a dependency?
[17:53] <mabshoff> Damn Debian people.
[17:54] <sage> I don't have that installed on sagemath.org.
[17:54] <mabshoff> Yep, cannot be build without [n]curses
[17:54] <mabshoff> readline depends on it.
[17:54] <mabshoff> at least the current version.
[17:54] <sage> i didn't have any curses installed with or without an n.
[17:54] <sage> readline depends on it???
[17:54] <mabshoff> ncurses is pretty small, so we could make it a standard package.
[17:55] <sage> readline doesn't.
[17:55] <malb> burcin, maybe it doesn't even leak? e.g. the modn_sparse leak I was look into: If I delete "A" right away, it doesn't leak
[17:55] <mabshoff> maybe you are right, but lie does need  [n]curses.
[17:55] <malb> the interpreter seems to hold on to global stuff
[17:55] <sage> so it's a bug in the build that it requires ncurses or curses?!
[17:55] <burcin> malb: let me see..
[17:55] <mabshoff> Nope, lie is just a little old.
[17:56] <sage> ok.
[17:56] <mabshoff> I couldn't even get it to build on neron without readline and curses.
[17:56] <sage> it installed fine for me once I installed ncurses.
[17:56] <mabshoff> It might be that lie has some magic defined to avoid readline & libcurses.
[17:56] <mabshoff> Haven't looked at the sources in great detail.
[17:57] <sage> I'll open a new ticket for moving lie to standard, which involves either removing
[17:57] <burcin> malb: over the integers I still get a leak, even if I delete A right away
[17:57] <sage> the curses dependency, or packaging curses for SAGE.
[17:57] <malb> okay, so at least you got a real leak
[17:57] <malb> that's good, I guess
[17:57] <mabshoff> Couldn't we reuse the old ticket?
[17:58] <sage> different though.
[17:58] <sage> it's different.
[17:58] <sage> getting it to build is different than moving it into standard.
[17:58] <mabshoff> So we use ncurses for now, but once it becomes standard we should remove the dependency.
[17:58] <sage> moving into standard presupposes removing dependencies, worrying about longterm quality and stability, etc.
[17:58] <soroosh> sage: I can't run the binary version I downloaded off of sagemath.org (gives me floating point exceptions) Maybe the mandrive I'm running on is too old (2006.0)?
[17:59] <mabshoff> Do we use lie via pexpect or as a library?
[17:59] <sage> pexpect
[17:59] <mabshoff> Okay, so that makes it likely that we need at least readline.
[18:00] <mabshoff> Haha, read http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/185359
[18:00] <sage> soroosh -- your processor is probably too different, and the mandriva too old.
[18:00] <sage> oh well.
[18:00] <sage> You could try http://sagemath.org/SAGEbin/linux/32bit/sage-2.8.2-OLD-32bit-i686-Linux.tar.gz
[18:00] <sage> bit O dpm
[18:00] <sage> It'll likely run, but I'm not sure what the point will be.
[18:00] <mabshoff> Well, I meant not to be gloating. Getting a litle tired, making some tea
[18:00] <sage> sage includes readline.
[18:00] <sage> pexpect hates readline.
[18:01] <mabshoff> I hate pexpect :)
[18:01] <mabshoff> I am invariant about readline, though
[18:01] <sage> ok -- see trac #609
[18:01] <mabshoff> the bt for #608 looks very odd by the way.
[18:02] <mabshoff> Damn, why me? But for sage-3 I have some time :)
[18:02] <soroosh> oh well. Then my build has the funny feature that when I run "sage -t sage/rings/morphism.py" it fails on line 514, but running the same code in sage prompt gives the right answer. Any ideas what I should do about it?
[18:03] <mabshoff> Does it actually crash or "just" fail?
[18:03] <soroosh> It just fails. Returns (a-b+1) instead of (a-b)
[18:04] <mabshoff> mmh, this is another odd one, just like janwil's issue. Sorry, no clue.
[18:04] <sage> soroosh -- i saw that before.
[18:04] <sage> Did you do an upgrade?
[18:05] <sage> I saw that after an upgrade on an osx machine recently.
[18:05] <sage> That same input even gives the right result on the command line.
[18:05] <soroosh> I did an upgrade before joining the chat room
[18:05] <sage> Too bad you didn't start a clean build.
[18:05] <sage> It would be fine.
[18:05] <soroosh> so, if I was starting from a clean build, this should be fine?
[18:05] <sage> yes.
[18:06] <-- dmharvey has left this server (Read error: 110 (Connection timed out)).
[18:06] <soroosh> ok, so maybe we can just ignore it. :)
[18:06] <sage> perhaps.
[18:06] <malb> I'm out
[18:06] <sage> Doing "sage -ba" might fixing it...
[18:07] <sage> see you later malb.
[18:07] <sage> thanks.
[18:07] <burcin> thanks malb, now I'm lost with my leaks :)
[18:07] <robertwb> malb: I added a function to get the refcount of and object
[18:07] <malb> cool, any results yet?
[18:08] <robertwb> no, but it might help with the issue you've been looking at above
[18:08] <robertwb> the module function seems to be an exiting issue
[18:08] <soroosh> ok, I'm doing that now. It is going to take a while though...
[18:09] <robertwb> I'm making a ticket for the patch
[18:09] <mabshoff> cu malb,
[18:12] <sage> mhansen -- your patch for #606 is bogus.
[18:12] <robertwb> ticket #611
[18:12] <robertwb> is the refcount patch
[18:13] <mhansen> sage: What arch does it fail on?
[18:13] <mabshoff> Hey wstein - wanna participate in a LinBox devel conference call?
[18:13] <wstein> mabshoff -- sure.
[18:14] <mabshoff> You should have gotten the LinBox-devel email, too.
[18:14] <wstein> #606 --mhansen -- loading/attaching spyx files in the notebook is not so trivial as a one line patch.
[18:14] <mabshoff> saunders likes the idea of switching LinBox's buildsystem to SCons :)
[18:14] <mabshoff> weeeee
[18:16] <dmharvey_> #424: patch attached. Also addresses #605 I hope. See comments on ticket #424. Only tested on OSX so far, I'm still trying to fix my sage.math build.
[18:18] *** dmharvey_ is now known as dmharvey.
[18:18] *** dmharvey is now known as dmharvey_.
[18:18] *** dmharvey_ is now known as dmharvey.
[18:21] <mabshoff> re 608: nothing jumps out, but there are a couple "invalid read of size 4" reports from within the coercion model.
[18:21] <mabshoff> I have seen those before, but they never cause a crash as far I can tell.
[18:21] <mabshoff> Does " ***   not an integer argument in an arithmetic function" come from within Sage or is that pari already?
[18:26] <mabshoff> strings on libpari didn't turn up anything at all, so it must be in Sage's code?
[18:27] <sage> I just posted #611 --
[18:27] <mabshoff> Can anybody decode "
[18:27] <mabshoff> find_module (fullname=0x7fffa6400e60 "c", subname=0xac6d140 "", path=<value optimized out>,
[18:27] <mabshoff>     buf=0x7fffa63ffde1 ".pyc", buflen=4097, p_fp=0x7fffa6400da0, p_loader=0xacce908) at Python/import.c:1427
[18:27] <mabshoff> "
[18:27] <mabshoff> You mean you merge it?
[18:27] <sage> yes.
[18:28] <mabshoff> Cool, one more tool in our arsenal :)
[18:28] <mabshoff> I will be off for 30 minutes, getting some air.
[18:28] <mabshoff> You guys in Seattle have to leave soon? Going camping tomorrow or something?
[18:29] <sage> i can fix #608
[18:29] <mabshoff> :)
[18:29] <sage> i caused #608 --- the mobius function was *insanely* slow before, and I needed it to
[18:29] <sage> be fast for the course I was teaching on the Riemann Hypothesis.
[18:29] <sage> But I didn't correctly deal with the non-integer case.
[18:29] <dmharvey> #518: new patch attached (monsky-washnitzer indentation)
[18:29] <mabshoff> Well, that is different. If you broke it you usually know where to look .
[18:29] <sage> I didn't realize it even made sense then.
[18:30] <mabshoff> ok, cu in about 30
[18:30] *** mabshoff is now known as mabshoff|away.
[18:30] <sage> cu
[18:30] <dmharvey> wstein: please get #518 in soon if possible, I don't want to have to indent that file a third time :-)
[18:34] <craigcitro> so apparently i don't understand something ...
[18:34] <craigcitro> if i have class Foo
[18:34] <craigcitro> and someone does Foo(3)
[18:34] <craigcitro> that calls Foo.__call__, right?
[18:34] <craigcitro> so if Foo.__call__?? shows "print 'hi'" as the first line
[18:35] <craigcitro> Foo(3) should print "hi" ?
[18:35] <sage> ok, #608 is fixed.
[18:35] <dmharvey> craig: I would think so
[18:35] <craigcitro> k
[18:36] <dmharvey> no hang on
[18:36] <dmharvey> craig: if X is an *instance* of a Foo
[18:36] <dmharvey> Foo(3) calls __init__
[18:36] <craigcitro> ohh
[18:36] <craigcitro> right, k
[18:36] <craigcitro> thank you. ;)
[18:37] <soroosh> well, finished with "sage -ba", but still has the same error.
[18:37] <soroosh> It also got an error regarding (1/2)^(2^100)
[18:38] <soroosh> For some odd reason my sage is returning 1.
[18:38] <soroosh> this is true for command prompt as well.
[18:38] <sage> soroosh -- that's because I just added a doctest to expose a bug.
[18:38] <soroosh> right...
[18:38] <sage> it has been that way for years due to an overflow.
[18:38] <soroosh> thats #602.
[18:38] <sage> if you did hg_sage.pull() it fixes it.
[18:38] <sage> however, you might have to wait a while to rebuild if you do that...
[18:39] <sage> note, of course, that (1/2)^(2^100) would not fit in your memory -- it's supposed to give an error.
[18:39] <dmharvey> ok this makes no sense. I unpacked a fully built copy of sage 2.8.3 that works perfectly well. Then I upgrade using sage -upgrade. And I get all those crazy import errors now whenever I try to run it.
[18:39] <sage> is there anything i need to apply anybody?
[18:39] <dmharvey> i'm going to have to keep working with only sage-2.8.3 for the moment, since I can't get 2.8.3.6 working.
[18:39] <dmharvey> wstein: yes, try #518 now
[18:40] <sage> dmharvey.  where?
[18:40] <dmharvey> on the ticket
[18:40] <sage> And does "all those crazy import errors" mean exactly that one error involving libcsage.so?
[18:40] <dmharvey> yes
[18:40] <sage> on what system?
[18:40] <sage> sage.math?
[18:40] <dmharvey> sage.math
[18:40] <sage> your laptop?
[18:40] <dmharvey> no, my laptop is fine, as is my desktop
[18:40] <sage> let me check your environment.
[18:41] <sage> which directory is your build in?
[18:41] <dmharvey> ~/sage-2.8.3
[18:41] <sage> I'll fix it again.
[18:41] <dmharvey> but why does it keep doing this? I don't understand what's going on.
[18:42] <dmharvey> is there still something wrong in my environment?
[18:43] <sage> Ok, fixed.
[18:43] <sage> no.
[18:43] <sage> I think there was when you first built.
[18:43] <sage> Doing "sage -ba", etc., doesn't redo the scons stuff.
[18:43] <sage> All I did was: (1) . local/bin/sage-env
[18:43] <dmharvey> Here's what I just did:
[18:43] <sage> (2)  515  scons -c ../../../local/lib/ 516  scons install ../../../local/lib/
[18:43] <sage> I just did a clean scons in c_lib, and all was immediately fixed.
[18:43] <dmharvey> I don't understand what all that means
[18:44] <sage> That isn't in sage -ba, but I'll add it right now.
[18:44] <sage> OK -- (1) cd SAGE_ROOT
[18:44] <sage> (2) . local/bin/sage-env   # setup the sage environment
[18:44] <sage> (3) cd devel/sage/
[18:44] <sage> (4) cd c_lib
[18:44] <sage> (5) scons -c $SAGE_LOCAL/lib/   # delete target
[18:44] <sage> (6) scons install $SAGE_LOCAL/lib/ # rebuild all c_lib stuff and install it in target.
[18:45] <dmharvey> but why do I get this problem whenever I do sage -upgrade? Does anyone else get this problem?
[18:45] <sage> Nobody else got that.
[18:45] <dmharvey> maybe my old sage-2.8.3 build was screwed
[18:45] <sage> I'm sure it has to do with your LD_LIBRARY_PATH grabbing the wrong gmp.
[18:45] <sage> or something else like that.
[18:45] <dmharvey> probably my LD_LIBRARY_PATH was wrong for my *old* build
[18:45] <dmharvey> which I just upgraded
[18:45] <dmharvey> anyway,
[18:46] <sage> That said, I think "sage -ba" should be changed so it would fix your problem, hence "sage -upgrade"
[18:46] <dmharvey> I'm going to ignore this now, since I'll build from scratch again in a day or two once all the patches are in
[18:46] <sage> would fix your problem.  I'll make that chagne right now.
[18:46] <dmharvey> I just want to test the gcd thing now
[18:46] <dmharvey> thanks for your help
[18:46] <sage> I can't wait!
[18:46] <sage> I can help as soon as I fix "sage -ba".
[18:50] <dmharvey> it's building now.... seems to be okay so far.....
[18:51] <burcin> what does _pari_ do exactly?
[18:51] <craigcitro> returns the pari version of your object
[18:52] <burcin> is there a specific implementation for matricies? dense integer matricies..
[18:52] <burcin> where is it defined?
[18:52] <dmharvey> #424: BINGO. Check this out:
[18:53] <dmharvey> Magma V2.13-5     Thu Sep  6 2007 18:49:13 on sage     [Seed = 2094699641]
[18:53] <dmharvey> > a := Random(2^10000000); b := Random(2^10000000);
[18:53] <dmharvey> > time t := XGCD(a, b);
[18:53] <dmharvey> Time: 16.550
[18:53] <dmharvey> sage: a = ZZ.random_element(2^10000000); b = ZZ.random_element(2^10000000);
[18:53] <dmharvey> sage: time t = XGCD(a, b)
[18:53] <dmharvey> CPU times: user 16.03 s, sys: 0.39 s, total: 16.42 s
[18:53] <dmharvey> Wall time: 16.41
[18:53] <dmharvey> sage: t[0] == t[1]*a + t[2]*b
[18:53] <dmharvey> True
[18:53] <craigcitro> burcin: it's defined in each class. do M._pari_?? to see, if your obj is M
[18:54] <dmharvey> wstein: how do I log into the vmware thing on bsd?
[18:54] <burcin> craigcitro: I didn't know about the ?? trick.. that's very useful
[18:54] <burcin> craigcitro: thanks a lot :)
[18:54] <craigcitro> ? and ?? are both good
[18:54] <dmharvey> wstein: actually.... maybe I'm done for tonight. I've got patches for #424, #518, and probably #605 read to go.
[18:54] <craigcitro> no sweat
[18:57] <dmharvey> bye guys, I'm spent
[18:57] <-- dmharvey has left this channel.
[19:00] <burcin> I'm also leaving..
[19:00] <burcin> At the moment, A = random_matrix(ZZ, 100, 120); leaks..
[19:00] <burcin> A._pari_() also does.. and that's why echelonize (or echelon_form) is leaking..
[19:00] <sage> burcin -- just creating it.
[19:01] <sage> anyidea why?
[19:01] <burcin> I have no experience about what the function pari does..
[19:02] <burcin> I got to look at the linear algebra code a lot today though..
[19:02] <burcin> do you still need a fast hermite normal form implementation? or is pari good enough?
[19:02] <burcin> I was thinking of doing that as homework for a symbolic linear algebra course..
[19:03] <burcin> i.e., bug #174
[19:03] <sage> burcin -- i'm not sure.  i think a certain student in canada is actually working on that.
[19:04] <sage> also, i think linbox is going to get one soon.
[19:04] <sage> But honestly I've been waiting a very long time for one and don't have anything yet.
[19:04] <sage> if you want to try, that would be good.
[19:05] <burcin> I didn't think of it so seriously.. I'll see what I can do..
[19:06] <burcin> I'm a bad student, just trying to get around solving exercises for homework..
[19:06] <burcin> anyway.. I'll try to get back to the leaks tomorrow..
[19:06] <burcin> bye for now..
[19:07] <craigcitro> see ya burcin
[19:07] <mhansen> sage: I put a real patch for #606 ;)
[19:12] <-- burcin has left this server ("Leaving").
[19:16] <sage> mhanse -- i'm looking at #606 now.
[19:20] <sage> I just tried David's xgcd in sage on the same machine, but without his patch:
[19:20] <sage> CPU times: user 954.37 s, sys: 0.08 s, total: 954.46 s
[19:21] <sage> It's very very curious that magma is the same speed as GPL-only patched GMP.  I wonder if
[19:21] <sage> they are violating the GPL...
[19:22] <craigcitro> that's some crazy good code that GMP has
[19:22] <craigcitro> it would be pretty interesting if magma was violating the gpl ...
[19:22] <craigcitro> so i just fixed ticket #376
[19:23] <craigcitro> it took me an inordinate amount of time to figure out *what* to fix ... i suppose this is always the case.
[19:26] <mabshoff|away> Magma has allegedly written some arbitrary precision code on their own.
[19:26] <mabshoff|away> And then they put out some special benchmarks claiming superiority over the gmp.
[19:26] <mabshoff|away> That went over really well on the gmp mailing list as you can imagine,.
[19:28] *** mabshoff|away is now known as mabshoff.
[19:28] <craigcitro> sage -- you around?
[19:28] <craigcitro> or soroosh -- you here?
[19:29] <wstein> I'm around.
[19:29] <craigcitro> hey
[19:29] <craigcitro> can you try out the patch for 376 when you get a chance? i'm pretty sure it's solid.
[19:29] <wstein> mabshoff -- maybe the gmp people are aiming to beat magma's timings, which would explain
[19:29] <craigcitro> i even added doctests! ;)
[19:29] <wstein> why they are so close.
[19:30] <wstein> i'm working on mhansen's patch for loading spyx files in the notebook.
[19:30] <wstein> it sort of worked but was too broad and didn't work when the file contained an error message.
[19:30] <craigcitro> ah, ok
[19:30] <craigcitro> well, put it in your queue of patches to check out. ;)
[19:31] <sage> it'll only be a minute..
[19:31] <soroosh> Hey Craig, I'm around.
[19:31] <soroosh> I can try doing it.
[19:31] <soroosh> Is the patch on the trac?
[19:32] <craigcitro> yep
[19:32] <craigcitro> just try out some various finite field homomorphisms
[19:32] <craigcitro> let me know if they fail or succeed
[19:32] <craigcitro> (or, if they do correctly, that is)
[19:32] <mabshoff> Okay, caught uo.
[19:32] <mabshoff> up
[19:32] <soroosh> ok, first let me see if I can apply the patch.
[19:33] <craigcitro> grin ... if you can't, i might cry.
[19:33] <craigcitro> because i think i've finally stopped making broken patches.
[19:33] <mabshoff> wstein: At least some of the INRIA people release their code that is GPLed for gmp 5 at the moment also under a BSD license
[19:33] <wstein> interesting.
[19:33] <mabshoff> So it might be the same code in Magma, but I seriously doubt that they violate the  GPL.
[19:34] <mabshoff> They are pretty adament in listing the LGPLed bits they use like ATLAS and gmp.
[19:35] <wstein> they build magma statically, so you can't drop in your own gmp, which is annoying.
[19:36] <mabshoff> Well, I can understand that.
[19:36] <sage> maple and mathematica don't do that.
[19:36] <craigcitro> ooh ... i just found a bug that my fix exposed: the homomorphisms can be defined just fine, and their definition looks good ... but they don't work.
[19:36] <sage> and the lgpl requires one to make available a version that doesn't do that.
[19:36] <mabshoff> Back during 4.1.4 the default alloc was alloca. So you could pretty much smash the stack at will with anything that linked dynamically.
[19:36] <sage> mhansen -- #606 is closed.
[19:37] <mhansen> Thanks for cleaning up my stuff.
[19:37] <sage> welcome.
[19:37] <sage> Thanks for finally writing that -- it's absense was a problem for a long long time.
[19:37] <sage> #376 -- i'm checking it out right now.
[19:37] <mabshoff> They habe to make changes available to people who request it, and depending on one's interpretation that might only inlucde customers.
[19:39] <wstein> They don't say they will make the modified version of GMP available anywhere.
[19:39] <wstein> They only say they will make a version of magma that can link against GMP so
[19:40] <wstein> This is the code specifically under discussion " This is Niels Möller's sub-quadratic GCD code, implementing both plain gcd and extended gcd. It is believed to be quite stable at this point."
[19:40] <wstein> as listed on http://gmplib.org/devel/
[19:40] <mabshoff> Is the gmp an official gnu project, i.e. with copyright assignment to the FSF?
[19:40] <sage> i think so..
[19:40] <mabshoff> I don't think so, but in that case I think Granlund would have done something about that by now if he intended to do so.
[19:41] <sage> maybe not.
[19:41] <sage> looking at random code it does have FSF copyrights...
[19:41] <mabshoff> I think people like Zimmermann and Granlund were very possed.
[19:41] <mabshoff> ok
[19:41] <mabshoff> maybe it is time to write RMS an email :)
[19:42] <craigcitro> hey william -- here's another question
[19:42] <craigcitro> a lot of this morphism code has functions named with underscores before and after the name
[19:42] <craigcitro> _internal_func_ instead of _internal_func
[19:42] <craigcitro> is this just an old habit? or is it someone else's code?
[19:43] <sage> This is for functions that are supposed to be viewed like Python __*__ functions...
[19:43] <sage> E.g., _add_
[19:44] <craigcitro> ahh, ok
[19:44] <soroosh> Craig: I applied your patch. It is a bit late for me to think properly, but running the example on the ticket, what should I get back?
[19:44] <soroosh> I get "Not valid homomorphism" exception.
[19:44] <craigcitro> ok, so that's bad
[19:44] <craigcitro> you should get back two valid homomorphisms
[19:45] <soroosh> hmm, maybe I haven't quite applied that patches yet.
[19:45] <sage> I'm trying too.
[19:45] <mabshoff> Did burcin open another ticket for the leak in echelonize? It seems like a pretty good isolated leak to look at.
[19:45] <sage> it works!
[19:45] <sage> I don't know.
[19:45] <mabshoff> Ok, will check
[19:45] <soroosh> I ran, hg_sage.apply, heads, merge, and then commit
[19:46] <craigcitro> yeah, but you can't yet *apply* morphisms
[19:46] <craigcitro> does hg heads tell you that you only have one head?
[19:46] <sage> I added that one as a doctest.
[19:46] <sage> to apply morphisms you have to implement a function on elements.  See number_field_element.pyx for
[19:46] <sage> an example.
[19:47] <craigcitro> k ... i'm working on doing that right now.
[19:47] <craigcitro> ah, i can probably just copy-paste that code. :P
[19:47] <soroosh> Oh, it works now.
[19:48] <soroosh> I forgot to rebuild it. :P
[19:48] <craigcitro> awesome
[19:48] <craigcitro> hahah
[19:48] <craigcitro> that'll get you every time. ;)
[19:48] <soroosh> :)
[19:48] <sage> i've closed this ticket and pushed out the patch.
[19:48] <mabshoff> wstein: could you apply the patch by malb for #566
[19:49] <sage> 25 tickets closed today so far.
[19:49] <mabshoff> That one also fixes most of #519, i.e. we leak only one rand_state in total.
[19:49] <sage> #566 -- looking into it now.
[19:49] <mabshoff> Yep, pretty good night so fat.
[19:49] <mabshoff> far
[19:49] <soroosh> Wow! That's impressive.
[19:50] <mabshoff> The last bug Day + the next day closed a totol of 70 tickets.
[19:50] <mabshoff> But there were many worksforme
[19:50] <mabshoff> but today has been very impressive, because many of the bugs were harder.
[19:50] <mabshoff> (in my humble opinion=
[19:50] <mabshoff> )
[19:59] --> boothby has joined this channel (n=boothby@c66-235-37-221.sea2.cablespeed.com).
[19:59] <sage> and those are just closed tickets.  that doesn't count, e.g., #566
[19:59] <sage> I couldn't apply the patch since it depends on another.
[19:59] <sage> but I'll track that down.
[19:59] <sage> #558
[20:00] <mabshoff> So there is also a patch fir #558? malb was very busy.
[20:00] <sage> yep!
[20:01] <mabshoff> Just answered Saunder's linbox-devel email. Mentioned the problem with Solaris vs. that __SunOS_5_9 broken fix.
[20:05] <mabshoff> Wow, #33 closed, that is a rather old one.
[20:06] <mhansen> sage: Do you want some more patches at the moment?
[20:08] <sage> i've applied and pushed 558 and 560.
[20:08] <mabshoff> #566?
[20:08] <sage> yes.  that's what I'm doing now is applying patche.s
[20:09] <mhansen> There's one for 544.
[20:10] <sage> but I'm also cooking spaghetti right now :-)
[20:10] <mhansen> Mmm...
[20:10] <mhansen> I made a curry that was way spicier than I intended.
[20:10] <mabshoff> I am getting near the end.
[20:10] <sage> mhansen -- thanks for fixing #544!!!!
[20:10] <sage> that was driving me crazy forever.
[20:10] <sage> mabshoff -- of all sage bugs :-)
[20:11] <mabshoff> ?
[20:11] <mabshoff> Oh, I think I got it now.
[20:11] <mabshoff> My brain is getting tired.
[20:11] <mabshoff> I think I will do some more work on M2.
[20:11] <mabshoff> Just to get something compiling out the door.
[20:12] <mabshoff> Dan is subscribed to sage-devel by the way.
[20:12] <mhansen> There's also ones for 553, but I feel kind of iffy about the solution.  I couldn't think of anything better to do though.
[20:12] <mabshoff> Good that I never wrote anything bad about M2 :)
[20:13] <boothby> dammit, timothy's never around when you need him.
[20:13] <mhansen> There is also one for #334.
[20:13] <craigcitro> hey sage ... i have another patch that makes it so you can apply finite field morphisms
[20:13] <craigcitro> should i make a ticket just to post it?
[20:13] <craigcitro> or tag it on 376?
[20:14] <sage> mabshoff -- did I accidently close #560 thinkingit was #566?!?!
[20:14] <sage> pasta calls...
[20:14] <mabshoff> ok
[20:15] <mabshoff> I reopened #560
[20:17] <craigcitro> so i think 539 is a dead ticket
[20:17] <craigcitro> i'm pretty sure i fixed that when i fixed up the c_lib install stuff
[20:17] <mabshoff> sage: there is a patch attached to #604 that fixes a memleak.
[20:17] <craigcitro> can someone check that for me?
[20:17] <craigcitro> x = 3
[20:18] <craigcitro> x.__int__??
[20:18] <craigcitro> make sure you see pyintlong ;)
[20:18] <mabshoff> Yeah, that problem sounds familiar.
[20:18] <craigcitro> it was causing a weird issue -- actually, i think on kiran's machine
[20:18] <craigcitro> man, we need to get an account and do tests on kiran's machine
[20:18] <craigcitro> oh, no, that's not right
[20:18] <craigcitro> it was the one on 64 bit linux
[20:19] <craigcitro> because there was code duplication with c_lib and sage/ext/
[20:19] <mabshoff> That issue got solved with the LONG_BIT problem or whatever.
[20:19] <mabshoff> Or which issue are you talking about?
[20:19] <mabshoff> I am currently rebuilding, will take a little while.
[20:20] <mabshoff> With malb's gmp.pxi changes a lot of code has to be recompiled.
[20:20] <craigcitro> nah, it was something else
[20:20] <craigcitro> grin nods
[20:20] <mabshoff> ticket?
[20:20] <craigcitro> 539
[20:20] <mabshoff> But that code duplication was fixed after 2.8.3.x?
[20:21] <mabshoff> Okay, never mind.
[20:21] <craigcitro> yeah, i got rid of it a while back
[20:21] <mabshoff> Read the ticket in details.
[20:21] <craigcitro> i forget what version ... too many versions. ;)
[20:21] <mabshoff> well, let was decide.
[20:21] <mabshoff> it is just one blurry continuum for me.
[20:21] <sage> craig -- #539 isn't dead. it's still commented out.
[20:22] <craigcitro> hmm ... it's not on my machine.
[20:22] <sage> look at __int__ integer
[20:23] <craigcitro> yeah, this is apparently a fix i never pushed back your way.
[20:23] <craigcitro> but that made it into my sage-main ... *shrugs*
[20:23] <craigcitro> what should i do with this other finite field patch? add it to 376?
[20:23] <sage> no -- unless you *open* 376.
[20:23] <craigcitro> make a new ticket then?
[20:24] <sage> regarding #539 -- i just fixed that, so good.
[20:24] <sage> yes, a new ticket.
[20:24] <craigcitro> k, good times.
[20:26] <sage> i'm now building the latest hg_sage.pull() on 3 machines and doing a full doctest.
[20:26] <sage> dinner...
[20:26] <mabshoff> ok
[20:26] <craigcitro> k, 612 made and ready to be closed. ;)
[20:26] <sage> back in 20 or 30 minutes.
[20:26] <sage> ...
[20:26] <craigcitro> cool
[20:26] <mabshoff> I did a build about 10 minutes ago and running doctest before I revisit the valgrind issues.
[20:26] <sage> ok.
[20:30] <soroosh> I am looking at #252, regarding creating number fiels when polynomial not integral, and I was wondering, is there a danger of modifying polynomial in __init__ function, or should I be a bit more careful?
[20:30] <soroosh> I have a small patch that modifies the polynomial to be monic.
[20:31] <craigcitro> william is the person to ask about this -- he's just spent the last two days combing the number fields code
[20:33] <soroosh> ok, then I should wait a bit.
[20:33] <soroosh> How does one make a patch, btw?
[20:33] <craigcitro> so the right way is within sage :
[20:33] <craigcitro> hg_sage.send('new_bundle.hg')
[20:34] <craigcitro> that will look at the main sage repo, pack up everything it needs, and ask you to edit a description
[20:34] <craigcitro> some monkeys like me tend to do it with hg from the command line, and annoy william to death with our hg bundles that can't be applied. ;)
[20:35] <craigcitro> but hg_sage.send?? tells all:
[20:35] <soroosh> cool.
[20:35] <soroosh> thanks
[20:35] <craigcitro> hg bundle name.hg http://www.sagemath.org/hg/sage-main/
[20:35] <craigcitro> that works from the command line, and does the same thing
[20:38] <craigcitro> hey, so ticket 461 also seems to be fixed.
[20:38] <craigcitro> can you guys look at that and tell me if it works for you?
[20:38] <craigcitro> M = ModularForms(17,4) ; N = M.new_subspace()
[20:38] <craigcitro> that's what you need to run ... working means not throwing an error in this case. ;)
[20:40] <mhansen> No error for me.
[20:40] <craigcitro> k
[20:40] <craigcitro> william has also finished 585
[20:41] <craigcitro> 585 612 461 all ready to go
[20:41] <sage> hi
[20:41] <soroosh> craig: it works for me too.
[20:41] <sage> now suffering from memory leak fixes..
[20:41] <sage> sage -t  devel/sage-main/sage/coding/linear_code.py         *** glibc detected *** /home2/sage/s/local/bin/python: double free or corruption (out): 0x00000000017d7c50 ***
[20:41] <craigcitro> grin
[20:42] <soroosh> :)
[20:42] <craigcitro> yeah, when you have time william -- 585 612 461 ready to go, soroosh has a number field question
[20:42] <soroosh> oh yeah, I was looking at #252, regarding non-monic polynomials,
[20:42] <sage> craigeciro -- i already did 585 a day or 2 ago...
[20:42] <sage> oops.
[20:42] <sage> it should be in hg_sage.pull()
[20:43] <craigcitro> oh, well, the ticket is ready to be closed. ;)
[20:43] <craigcitro> yeah, that was the one you did the other day while we were talking -- but the ticket was open
[20:43] <soroosh> and I was wondering if I should add another variable in the class, defining_polynomial,
[20:43] <craigcitro> how was the pasta?
[20:43] <sage> we even chose the same examples, but I got rid of the numerical parts.
[20:43] <sage> i also put a warning about denominators.
[20:43] <soroosh> and have polynomial be a monic, integral polynomial all the time.
[20:43] <sage> pasta was good.
[20:44] <sage> soroosh -- we're going to do a major rewrite of number fields...
[20:44] <sage> that's one of the plans.
[20:44] <sage> but it should be transparent to the user.
[20:45] <soroosh> oh, so I shouldn't worry too much about this fix.
[20:47] <soroosh> ok, it's getting late in here.
[20:48] <soroosh> I think I'm going to go to sleep.
[20:48] <soroosh> Cheers guys.
[20:48] <-- soroosh has left this channel.
[20:49] <sage> goodnight soroosh.
[20:49] <sage> the crash above was caused by the integer freeing memleak "fix".
[20:50] <craigcitro> grin
[20:54] <-- robertwb has left this server.
[20:54] <sage> #461?
[20:55] <mhansen> Craig nor I were able to reproduce 461.
[21:00] <sage> maybe I just fixed it.
[21:01] <sage> i fixed some things just like this recently when adding doctests.
[21:01] <sage> cool -- taht can be closed.
[21:01] <mhansen> Surprise bug fixes are always fun.
[21:03] <sage> ok.  is anything else left for me to close...
[21:03] <sage> ?
[21:03] <mhansen> Could you look at 553 and 334?
[21:03] <sage> #503 -- robertwb just finished that with tom b.
[21:04] <sage> i'm going to check out #503.
[21:04] <sage> it would be great if somebody else could too.
[21:04] <sage> hey, i already applied that.
[21:04] <sage> never mind.
[21:05] <craigcitro> grin
[21:05] <sage> ok, on to #553.
[21:05] <craigcitro> so 461 also worked for you?
[21:05] <mhansen> #553:  The solution in that patch was the most reasonable thing I could come up with.
[21:05] <sage> mhansen -- what if a variable name happens to be "substitute" ? :-)
[21:06] <sage> yes #461 works.
[21:06] --> mabshoff_ has joined this channel (n=mabshoff@p5090E171.dip.t-dialin.net).
[21:07] <mhansen> sage: Then they have more problems than I know what to do with ;-]
[21:07] <sage> no seriously.
[21:08] <mhansen> I guess you could also add a check that subtitute==True
[21:08] <sage> yes, that's reasonable.
[21:08] <sage> i'll add that.
[21:08] <mhansen> Thanks
[21:10] <mhansen> It's still possible to get the unexpected behavior, but this takes out a few of the cases where it could happen.
[21:10] <-- boothby has left this server (Read error: 110 (Connection timed out)).
[21:10] <sage> this segfaults: sage -t  devel/sage-main/sage/modular/abvar/torsion_subgroup.py
[21:10] <sage> ouch.
[21:11] <sage> i've pushed the change out.
[21:11] <sage> and closed the ticket #553.
[21:11] <sage> now looking at #334
[21:12] <sage> with the current bugfixes (do hg_sage.pull()) the following doctests all fail:
[21:12] <sage>         sage -t  devel/sage-main/sage/modular/modsym/space.py
[21:12] <sage>         sage -t  devel/sage-main/sage/modular/modsym/subspace.py
[21:12] <sage>         sage -t  devel/sage-main/sage/modular/abvar/abvar.py
[21:12] <sage>         sage -t  devel/sage-main/sage/modular/abvar/cuspidal_subgroup.py
[21:12] <sage>         sage -t  devel/sage-main/sage/modular/hecke/submodule.py
[21:12] <sage>         sage -t  devel/sage-main/sage/modular/hecke/module.py
[21:12] <sage>         sage -t  devel/sage-main/sage/modular/hecke/ambient_module.py
[21:12] <sage>         sage -t  devel/sage-main/sage/modular/modform/cuspidal_submodule.py
[21:12] <sage>         sage -t  devel/sage-main/sage/structure/element.pyx
[21:12] <sage>         sage -t  devel/sage-main/sage/combinat/sloane_functions.py
[21:12] <sage> ouch.
[21:12] <craigcitro> whoa
[21:12] <sage> #334 -- looks good.
[21:12] <mhansen> Yikes -- hopefully it's all for the same underlying reason.
[21:12] <craigcitro> i'll start looking at the modform stuff
[21:12] <sage> some will be because of 0^0.
[21:13] <sage> Others will be because of memleak cleanups, I bet.
[21:13] <sage> I'm going to see what I can do about them now.
[21:13] <sage> help would be appreciated.
[21:13] <sage> ?
[21:13] <craigcitro> well, i'm familiar with the modular/modform code right now
[21:13] <craigcitro> so i'll get on those.
[21:13] <sage> if you do hg_sage.pull()
[21:13] <sage> then doctest something about, see what happens.
[21:13] <craigcitro> nod
[21:14] <mhansen> Will do.
[21:14] <sage> is anybody else working on anything?
[21:15] <mhansen> #387 can be closed
[21:15] <sage> sure?
[21:15] <sage> it could be a 64 or 32-bit only problem.
[21:16] <mhansen> Hmm...  both mabshoff and I tested it out a few days ago, and I did today as well.
[21:16] <sage> it works on my 64-bit laptop.
[21:16] <sage> it works on my 32-bit os x box.
[21:16] <sage> ok, closing it.
[21:17] <sage> #607 -- looks fixed.
[21:17] <sage> I'll apply that.
[21:18] <mhansen> sloane_functions is just 0^0, I'll do a ticket and patch for that.
[21:18] <sage> mhansen go.
[21:18] <sage> go go.
[21:18] <sage> thanks.
[21:18] --> robertwb has joined this channel (n=robert@c-67-171-19-168.hsd1.wa.comcast.net).
[21:18] <-- mabshoff has left this server (Read error: 110 (Connection timed out)).
[21:22] <sage> robertwb -- we're trying to fix all the errors caused by the 0^0 patch and other bug fixes.
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/modular/modsym/space.py
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/modular/modsym/subspace.py
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/modular/abvar/abvar.py
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/modular/abvar/cuspidal_subgroup.py
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/modular/hecke/submodule.py
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/modular/hecke/module.py
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/modular/hecke/ambient_module.py
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/modular/modform/cuspidal_submodule.py
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/structure/element.pyx
[21:22] <sage> after applying your hyperelliptic_padic_field patch, it also crashes on exit.
[21:22] <robertwb> ok
[21:22] <sage> 21:15 < sage>         sage -t  devel/sage-main/sage/combinat/sloane_functions.py
[21:22] <sage> these fail
[21:23] <mhansen> patch attached for #613
[21:23] <robertwb> pull to get the latest?
[21:23] <sage> this is a bad interaction -- it's becaue you actually have examples..
[21:23] <sage> yes hg_sage.pull()
[21:23] <sage> mhansen -- thanks.
[21:23] <sage> craigcitro, me, mhansen, and you are working on this.
[21:24] <sage> all other doctests pass except those listed above.
[21:24] <mhansen> I'll do element.pyx.
[21:25] <robertwb> I'll look at modsym/*
[21:25] <sage> I'm going to apply a few more very easy patches.
[21:25] <sage> i.e., the indentation fix of monsky_washnitzer.
[21:25] <sage> i'll apply your #613 first.
[21:26] <craigcitro> is the system-wide sage on sage.math up to date?
[21:26] <sage> ok, #613 is good.
[21:26] <craigcitro> i was trying doctests there while i wait for my sage -br
[21:26] <sage> craigcitro -- no.
[21:26] <craigcitro> k
[21:29] --> boothby has joined this channel (n=boothby@71-212-6-218.tukw.qwest.net).
[21:29] <sage> #570 -- robertwb -- I'm applying your patch for that now.
[21:29] <robertwb> ok
[21:29] <sage> I guess I already got it with the 0^0 stuff.
[21:30] <robertwb> that makes sense
[21:30] <mhansen> sage: #614 (element.pyx) patch is up.
[21:30] <sage> thanks!
[21:31] <sage> applying it...
[21:31] <craigcitro> geez ... i'm still waiting on my sage -br. do you guys just have faster systems? ;)
[21:32] <sage> we've been doing it all along.
[21:32] <sage> you maybe hadn't pulled in a while
[21:32] <mhansen> I'm running the tests on the modular stuff.
[21:33] <sage> robertwb -- did you fix #573
[21:33] <robertwb> let's see
[21:33] <robertwb> yes
[21:34] <sage> looks good. i'll close it now.
[21:34] --> pdehaye has joined this channel (n=pdehaye@156.134-65-87.adsl-dyn.isp.belgacom.be).
[21:37] <robertwb> having trouble getting an error for /sage/modular/modsym/space.py
[21:37] <mhansen> I segfault on space.py
[21:37] <-- pdehaye has left this server (Client Quit).
[21:38] <sage> robertwb -- it doesn't segfault on osx intel.
[21:38] <sage> weird.
[21:38] <robertwb> ok
[21:38] <robertwb> someone else better take those ones then
[21:38] <sage> these all fail on osx in intel:
[21:38] <sage>         sage -t  devel/sage-main/sage/modular/abvar/torsion_subgroup.py
[21:38] <sage>         sage -t  devel/sage-main/sage/modular/hecke/ambient_module.py
[21:38] <sage>         sage -t  devel/sage-main/sage/modular/hecke/hecke_operator.py
[21:38] <sage>         sage -t  devel/sage-main/sage/modular/modsym/space.py
[21:39] <craigcitro> oh, we're down to just those four?
[21:39] <craigcitro> or just on a diff arch?
[21:39] <sage> no -- on just x86 os x it's those four.
[21:39] <mhansen> I'm looking at modsym/subspace.py and failures are not being consistently reproducible.
[21:40] <sage> it must be a memory leak cleanup causes hell issue then.
[21:40] <sage> dang.
[21:42] <mhansen> For example, on space.py, sometimes I get the sage segfault message, and sometimes I get this:
[21:42] <mhansen> fatal error:
[21:42] <mhansen>    Internal error: can't free this _ntl_gbigint
[21:42] <mhansen> exit...
[21:43] <robertwb> ok, I was able to get a segfault on modsym/space.py once, though nothing by piping it into sage -gdb
[21:44] <mhansen> I got subspace.py to pass on one of the attempts ;)
[21:45] <sage> hi.
[21:45] <sage> I've applied every patch for sage-2.8.4 and moved all tickets not for sage-2.8.4 to sage-2.9.
[21:45] <sage> If you look at http://trac.sagemath.org/sage_trac/milestone/sage-2.8.4
[21:45] <sage> you'll see that everything (all 60 tickets) are closed, except 1, which is David Harvey's
[21:46] <sage> GMP patches, which vastly speed up big rational number arithmetic.
[21:46] <sage> If you do hg_sage.pull() you'll get this version.
[21:46] <sage> It has the fixes of mhansen from a few minutes ago too.
[21:46] <sage> It'll take a few minutes to compile though.
[21:46] <sage> Then to release sage-2.8.4, all that we need to do is fix the above doctest failures.
[21:46] <sage> what is  _ntl_gbigint?
[21:48] <mhansen> No idea -- I've never looked at the NTL code before.
[21:48] <craigcitro> where does it say it's appearing? or does it?
[21:49] <mhansen> That was an error I had on one of the crashes of modsym/space.py
[21:49] <sage> ah.
[21:49] <craigcitro> k
[21:49] <sage> the error happens on exit/cleanup for me.
[21:50] <craigcitro> the only references to "bigint" i could find in the sage source tree are all in mwrank
[21:51] <craigcitro> does that get called at all in your modular symbols doctests? weight two spaces?
[21:52] <sage> gmp gives this on crash:
[21:52] <sage> Program received signal SIGSEGV, Segmentation fault.
[21:52] <sage> [Switching to Thread 47729433847536 (LWP 12470)]
[21:52] <sage> 0x00002b68e0b88070 in __gmpn_submul_1 () from /home/was/s/local/lib/libgmp.so.3
[21:52] <sage> (gdb) Hangup detected on fd 0
[21:52] <sage> no
[21:52] <sage> mwrank is not used.
[21:52] <craigcitro> k
[21:53] <sage> i made a cutdown version of the input doctest, and get a serious hang.
[21:53] <sage> let me see if it is reproducible.
[21:53] <sage> it's a double free.
[21:53] <robertwb> try commenting out the code that frees the integer pool (patch 7284d5caf725 is mis-labeled)
[21:53] <sage> it's not reproducible.
[21:53] <sage> i did -- that doesn't help.
[21:54] <sage> this time I got this:
[21:54] <sage> Program received signal SIGSEGV, Segmentation fault.
[21:54] <sage> [Switching to Thread 47931549828848 (LWP 12567)]
[21:54] <sage> visit_decref (op=0x1, data=0x0) at Modules/gcmodule.c:270
[21:54] <sage> 270     Modules/gcmodule.c: No such file or directory.
[21:54] <robertwb> the pool, not just the mpz_globals?
[21:54] <sage> yes, but I'll try again just in case.
[21:55] <sage> no, that doesn't fix the problem.
[21:55] <craigcitro> what machine had the larger set of failures? is it one we can log into?
[21:56] <sage> sometime free_module.py fails.
[21:56] <sage> sometimes not.
[21:57] <mhansen> This is fun :)
[21:57] <craigcitro> hey, so here's a good question: when sage -t with a sigsegv, is there an easy way to find out which doctest did it?
[21:57] <sage> free_module.py crashes about 10% of the time.
[21:57] <craigcitro> or a quick way to run it interactively or the like?
[21:57] <sage> sage -t --verbose
[21:57] <sage> sage -t --gdb
[21:58] <sage> these are your friends.
[21:58] <craigcitro> grin ... indeed
[21:58] <robertwb> ooooh, I've been wanting sage -t --gdb for a long time
[21:59] <sage> i suspect matrix_integer_dense.pyx is a problem.
[21:59] <sage> I'll try reverting it to an old version.
[22:00] <sage> that didn't help.
[22:01] <sage> doing this a few times always leads to problems:
[22:01] <sage> sage -t --verbose free_module.py
[22:01] <sage> mhansen -- by the way your subst fix breaks piecewise.py
[22:02] <sage> matrix_integer_dense.pyx hasn't changed recently.
[22:03] <robertwb> no, the only change in the 6000's is a comment
[22:03] <mhansen> I'll look at piecewise now.
[22:03] <sage> maybe martin's gmp.pxi changes got us?
[22:03] <sage> that move to libcsage.so
[22:04] <robertwb> that'd be my guess...
[22:05] <robertwb> too bad we're not using darcs
[22:05] <sage> robertwb -- do you see any problems, by the way?
[22:05] <sage> on osx?
[22:05] <sage> robertwb -- i can record the inverse of a changeset, e.g., of 6207, to undo
[22:05] <robertwb> yes, I got free_module.py to crash now
[22:05] <sage> martin's thing.
[22:05] <robertwb> nothing regular though
[22:06] <sage> record ==> apply.
[22:06] <craigcitro> i've got inconsistent crashes in modular/modsym/space.py on osx ppc
[22:07] <sage> craigcitro -- subspacepy now fails.
[22:07] <sage> what happend?
[22:07] <sage> it's not a crash issue at all.
[22:07] <sage> it's never mind -- it is a crash issue.
[22:08] <craigcitro> so i've had space.py have one crash, then work fine for a while, and now a different crash elsewhere in the file
[22:08] <mhansen> I have like 4 logs of different "flavors" of subspace.py crashes.
[22:08] <sage> hg backup.
[22:09] <craigcitro>     sage: S = ModularSymbols(389,sign=1)[3]; S
[22:09] <craigcitro>       File "/sage/local/lib/python/site-packages/sage/modular/hecke/module.py", line 305, in __getitem__
[22:09] <craigcitro>         D = self.decomposition()
[22:09] <craigcitro>       File "/sage/local/lib/python/site-packages/sage/modular/hecke/module.py", line 560, in decomposition
[22:09] <craigcitro>         height_guess=height_guess, proof=proof)
[22:09] <craigcitro>       File "matrix2.pyx", line 1682, in matrix2.Matrix.decomposition_of_subspace
[22:09] <craigcitro>       File "matrix_rational_dense.pyx", line 1158, in matrix_rational_dense.Matrix_rational_dense.decomposition
[22:09] <craigcitro>       File "matrix_rational_dense.pyx", line 1250, in matrix_rational_dense.Matrix_rational_dense._decomposition_rational
[22:09] <craigcitro>       File "/sage/local/lib/python/site-packages/sage/rings/polynomial/polynomial_element_generic.py", line 1142, in __floordiv__
[22:09] <craigcitro>         return Polynomial.__floordiv__(self, right)
[22:09] <craigcitro>       File "polynomial_element.pyx", line 855, in polynomial_element.Polynomial.__floordiv__
[22:09] <craigcitro>       File "/sage/local/lib/python/site-packages/sage/rings/polynomial/polynomial_element_generic.py", line 1042, in quo_rem
[22:09] <craigcitro>         v = self.__poly.quo_rem(right.__poly)
[22:09] <craigcitro>     RuntimeError
[22:09] <craigcitro> **********************************************************************
[22:09] <craigcitro> ooh, i feared that would boot me. sorry about the spam.
[22:10] <mhansen> sage: for piecewise.py, do you want me to change the doctests to use substitute=True?
[22:10] <sage> sure.
[22:11] <robertwb> oh, I got something with gdb in free_module.py
[22:11] <sage> i'm waiting for the backup of martin's patch to finish building.  it takes a while.
[22:11] <robertwb> (I think you've seen it before)
[22:11] <robertwb> visit_decref (op=0x1, data=0x0) at Modules/gcmodule.c:270
[22:11] <sage> yep.
[22:12] <sage> there's definitely a lesson here.
[22:13] <sage> any time anything purports to address a memleak, it has to be fully tested in isolation on the
[22:13] <sage> entire doctest suite.
[22:13] <mhansen> That sounds like a good plan.
[22:13] <craigcitro> yeah, seriously.
[22:13] <robertwb> I concur
[22:14] <craigcitro> so the thing i posted above, i just did with sage -gdb
[22:14] <craigcitro> and it's actually throwing the error in an NTL function
[22:14] <craigcitro> so assuming it's not really an NTL issue, does that mean we're calling into NTL with something we accidentally freed?
[22:14] <sage> craig -- is it sporadic?
[22:15] <sage> was it from subspace.py?
[22:15] <sage> i backed out martin's patch and the problem vanishes with space.py!!!!
[22:16] <mhansen> Excellent news!
[22:16] <craigcitro> this is modsym/space.py, and yep, it's sporadic
[22:16] <sage> that's probably the cause of the all the problems.
[22:16] <sage> robertwb -- thoughts?
[22:16] <mhansen> sage: patch for #615 up
[22:16] <sage> what should I do.
[22:17] <sage> thanks.
[22:17] <sage> hmmm.
[22:17] <sage> (1) just leave it backed out.
[22:17] <sage> (2) try to fix the problem by understanding what he did.
[22:17] <sage> hmmm.
[22:18] <robertwb> so, how sure are you that you didn't have a lucky run?
[22:18] <robertwb> If it is, I bet that's all our issues
[22:18] <sage> space.py failed for  me every single time.
[22:18] <sage> now it passes every single time.
[22:18] <sage> so 100%
[22:18] <robertwb> excellent
[22:18] <sage> i'll doctest modsym directory, to be surer.
[22:19] <sage> all tests pass.
[22:19] <robertwb> so, I'd say release without that patch, and ask him to take a closer look at it/work with him
[22:20] <sage> except I applied 25 patches after it and hg has no extract patch from the past command.
[22:20] <sage> so it's a little werid.
[22:20] <sage> actually maybe just recording the inverse is fine.
[22:21] <sage> but then how does he undo that.
[22:21] <robertwb> Yeah, I'd just record the inverse.
[22:21] <robertwb> He can extract the patch as a diff to play with it.
[22:21] <sage> good point.
[22:22] <sage> he can probably backout my backout, actually!
[22:22] <robertwb> it's not a patch that merges into a lot of other stuff...
[22:23] <sage> interestingly, if i remove it, then anybody who pull from me would not have it removed from theirs.
[22:24] <sage> i'm very very curious though what was going wrong...
[22:25] <robertwb> me too
[22:25] <sage> i'm going to try for a few minutes to fix his code.
[22:25] <robertwb> ok
[22:26] <robertwb> I wonder if one of the global variables leaked out into a sage object...
[22:26] <robertwb> that would mean its not really his patch's fault, but it just exposed another bug
[22:26] <sage> interesting.
[22:27] <robertwb> brb
[22:32] <sage> very interesting -- there is a libcsage.a in $SAGE_LOCAL/lib/
[22:32] <sage> that is bad news waiting to happen.
[22:32] <sage> if anything links that in, then there are multiple copies of "global unique data",
[22:32] <sage> and only one copy is initialized!!!!!
[22:33] <sage> weird -- on one of my build machines getting rid of libcsage*a seems to have fixed the problem...
[22:33] <sage> nope.
[22:33] <sage> false alarm
[22:40] <craigcitro> but that is a good point ... maybe the sage install should try to clean those up?
[22:40] <wstein> they were left from the pre-scons days on that install, I think.
[22:43] <craigcitro> nods ... but it might be that way on several machines in the world
[22:43] <wstein> it doesn't really cause a problerm.
[22:43] <craigcitro> k
[22:45] <boothby> sage -- python has trademarked their logo + the word python.  debian has a wierd license on their logo.
[22:45] <wstein> we should.
[22:45] --> boothby_ has joined this channel (n=boothby@71-212-6-218.tukw.qwest.net).
[22:46] <boothby_> wstein / sage -- python has trademarked their logo + the word python.  debian has a wierd license on their logo.
[22:46] <-- boothby has left this server ("leaving").
[22:46] <-- boothby_ has left this server (Client Quit).
[22:47] --> boothby has joined this channel (n=boothby@71-212-6-218.tukw.qwest.net).
[22:47] <wstein> robertwb -- i've made a slight modification to gmp.pxi that restores the old behavior,
[22:48] <wstein> but makes it easy to switch to the new behavior.
[22:48] <wstein> I pushed it out.
[22:54] --> janwil has joined this channel (n=jan@edro.at.mt.ut.ee).
[22:55] <craigcitro> hey william -- i added the functionality we were talking about to sage -coverage
[22:55] <craigcitro> so the way i have it working is this
[22:56] <craigcitro> if the doctests for a function don't contain the name of the function, it adds it to another list
[22:56] <wstein> great!
[22:56] <craigcitro> and then prints that list at the end in a set called "possibly wrong (missing name of function in doctests)"
[22:56] <craigcitro> but then if you have an environment variable called "SAGE_IGNORE_NAMEFREE_DOCTESTS"
[22:56] <craigcitro> then it doesn't do that printing
[22:56] <craigcitro> is that reasonable?
[22:56] <sage> i don't like the enviro variable thing.
[22:56] <sage> nobody will want to use that.
[22:57] <janwil> good morning everyone
[22:57] <craigcitro> well, you want to be able to ignore it sometimes
[22:57] <craigcitro> morning janwil
[22:57] <sage> it's too long, and if you go to the trouble of defining it just to cheat...
[22:57] <sage> it would be better to have a notation, e.g.,
[22:57] <sage>    def foo(...):   # doctest doesn't involve foo
[22:57] <sage> or
[22:57] <craigcitro> ah, ok
[22:57] <sage>    def foo(...):  # indirect doctest
[22:57] <sage> then it's clear what's up when you look at the code.
[22:57] <craigcitro> that works
[22:57] <sage> and it works the same for everybody.
[22:58] <craigcitro> sure, i just wanted some way of overriding the extra output
[22:58] <craigcitro> so where does that comment have to go? in one of the doctests?
[22:58] <craigcitro> (i'm just figuring out where to put the search for it.)
[22:59] <sage> that's a good idea.
[22:59] <sage> if the word "indirect" is anywhere in the docstring, then just
[22:59] <craigcitro> so i'll search for it at the same time i search for the function name?
[22:59] <sage> don't knock the function for not doctesting exactly that name of function.
[22:59] <sage> simple.
[22:59] <craigcitro> well, we might want something less likely to occur than just that word
[22:59] <craigcitro> because i could imagine that occurring anyway
[22:59] <craigcitro> doctest_indirect ?
[23:00] <sage> "indirect doctest".
[23:00] <craigcitro> indirect_doctests
[23:00] <sage> NO -- it should be english.
[23:00] <craigcitro> k
[23:00] <sage> and if it happened accidently it isn't a problem really.
[23:00] <craigcitro> i'll look for the string 'indirect doctest'
[23:00] <craigcitro> oh, sure, as long as it's pretty unlikely
[23:00] <craigcitro> a single english word seems to likely, though
[23:01] <craigcitro> too, rather
[23:02] <craigcitro> k, that's good to go. i'll make a ticket and submit a patch.
[23:04] <craigcitro> and i'm going to tag the scons -Q onto that same patch, unless you tell me you've recently decided against it.
[23:05] <sage> From somebody using sage.math for serious work: " Anyway, I do want to say thanks for letting
[23:05] <sage> me use the machine.  I'ts a huge improvement ovver trying to
[23:05] <sage> use the Westgrid machine where you have to submit your job
[23:05] <sage> to a queue and then, well, I've been waiting 6 dayws now for
[23:05] <sage> craigcitro -- good.
[23:05] <sage> one job to start.  It's just hopeless to try to develope
[23:05] <sage> code on that network when you have to wait days for a job to start.""
[23:05] <craigcitro> hah that's awesome
[23:06] <robertwb> hi
[23:06] <robertwb> I like the indirect doctest thing
[23:06] <robertwb> special functions (e.g. __add__) should all be indirect by default
[23:06] <sage> robertwb -- hyperellipic_padic still crashes for me.
[23:07] <robertwb> william: I'm trying to understand your gmp_globals patch
[23:07] <sage> All I did was comment out what was added, and put back what was there before in gmp.pxi.
[23:07] <sage> I didn't touch anything else (hopefully).
[23:08] <robertwb> what about the "add gmp_globals" patch?
[23:08] <craigcitro> ooh, good point robert
[23:08] <craigcitro> so do we have a list of what functions i should totally skip? or everything wrapped in __ ?
[23:08] <robertwb> that still uses gmp_globals.c, right?
[23:09] <robertwb> everything wrapped in __ is probably safe
[23:09] <craigcitro> k
[23:09] <robertwb> oh, but _add_c_impl and stuff too... hmm... maybe there should be a big list
[23:09] <sage> cdef methods are all skipped.
[23:10] <robertwb> looking at hyperelliptic_padic ... sage -t --gdb brings you to a gdb prompt, how do you go from there?
[23:10] <sage> r
[23:10] <sage> type "r"
[23:10] <robertwb> ah
[23:11] <robertwb> stuff like _add_c_impl should still have a doctest (to test it), right?
[23:14] <robertwb> hyperelliptic_padic looks like it has nothing to do with my patch...
[23:15] <wstein> your doctests expose the problem.
[23:15] <robertwb> some memory error in free modules over Q, still looking into it
[23:15] <robertwb> lesson: doctests are bad :)
[23:15] <wstein> when i use gmp i get an error in GCD in doing arithmetic over QQ.
[23:15] <wstein> maybe you should delete teh doctests...
[23:16] <robertwb> yep, same here, but at least its reproducible and in the same spot every time
[23:16] <robertwb> it worked on the previous version of SAGE
