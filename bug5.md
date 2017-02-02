= SAGE Bug Squash Day 5 =
The event will take place on '''SATURDAY, November 3rd''' and officially start at 10 am pacific standard time. It will "officially" go nonstop for 10 hours (until 8pm) and some people will usually meet the day after and finish up some of the leftovers.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is 2.8.11.  Binaries are posted, or you can "sage -upgrade".
 * These are the main bugs we'll be working on.  If you're going to work on a bug not listed here, please make a trac ticket for it, and assign it to Milestone 2.8.12:
    http://trac.sagemath.org/sage_trac/milestone/sage-2.8.12
 * [[bug5/status|STATUS]]
 * [[bug5/irc|IRC log]]
 * [[/Results]]
 * Write to wstein@gmail.com for an account on the bug tracker.
 * We'll all be on #sage-devel at irc.freenode.net.
{{{
From Linux you can chat via a text console by installing "irssi", running it, and typing
  /SERVER add irc.freenode.net
  /SERVER irc.freenode.net
  /join #sage-devel
}}}

= Participants (with area they would like to work on) =
 1. Michael Abshoff (memory leaks, Solaris port, whatever else looks interesting ;-) )
 1. William Stein
 1. Nick Alexander (doctesting, administrivia)
 1. Robert Bradshaw (cleanup coercion model, cython memory leaks)
 1. Mike Hansen
 1. didier deshommes : bug #980
 1. Carl Witty (bugs #995, #211)
 1. Yi Qiang (dsage)
 1. Martin Albrecht (I won't make it on Saturday (GMT) but will be around on Sunday)

= IRC =

[12:29pm] was-527: that would seem sensible.
[12:29pm] was-527: RuntimeError, I guess.
[12:29pm] cwitty-995: mabshoff, if weak references are involved you may need to force a full garbage-collection before you look at memory usage.
[12:29pm] mhansen: Yeah, I can't think of anything better.
[12:29pm] You are now known as was-620.
[12:30pm] mabshoff: cwitty-995: ok, but it is odd that even upon termination of python those objects do
[12:30pm] mabshoff: not get deallocated.
[12:30pm] jvoight: craigcitro: I haven't forgotten that I owe you a patch.  It just finished compiling, and now I'm checking to make sure everything still works under 2.8.11.
[12:33pm] was-620: mhansen -- your patch I think breaks the example in trac #620!!
[12:33pm] was-620: I.e., after applying your patch, this line no longer works:
[12:33pm] was-620: m = ModularSymbols(501,2).decomposition(3);
[12:33pm] mhansen: The #61 patch?
[12:33pm] was-620: maybe.
[12:33pm] was-620: I can't think what else.
[12:33pm] mhansen: Yep
[12:34pm] was-620: I haven't tried inverting it to check yet though, but it looks likely.
[12:34pm] craigcitro-894: >jvoight: cool
[12:35pm] was-620: mhansen -- the requirement that the flag be mandatory as Jon Hanke wanted is stupid.
[12:35pm] was-620: Since rows should be the default.
[12:35pm] craigcitro-894: if someone does "char * buf = new char[n+1]" in C++ code
[12:35pm] mhansen: I might be raising a ValueError in a spot that's not necessary.  If the len of the tuples or lists passed to a MatrixSpace do not match up with either of the dimensions, then it raises a ValueError.
[12:35pm] craigcitro-894: that needs to be freed by "delete [] buf", right?
[12:35pm] mhansen: was-620: I made it so that rows are default, and the flag is not mandatory.
[12:36pm] mabshoff: craigcittro-984: yes
[12:36pm] was-620: ok maybe my modular symbols code is too lax.
[12:36pm] was-620: mhansen -- good.
[12:37pm] mabshoff: craigcittro-984: But I thing free also works in that case, but it isn't very clean.
[12:37pm] mabshoff: craigcittro-984: delete by itself is wrong in that case.
[12:38pm] was-620: I think my modular symbol code is producing input that should be considered invalid.
[12:38pm] was-620: It's input to the matrix constructor looks like this:
[12:39pm] was-620: [(1, -1), (0, 1, -1), (0, 1, -1), ..., (0, 0, 1, -1)]
[12:39pm] was-620: i.e., it is assuming 0 padding automatically.
[12:39pm] cwitty-995: mabshoff, craigcitro-894: I don't think using free is portable (although it probably works with most implementations of malloc).
[12:39pm] mhansen: Yep, I had just noticed that.  Should we assume 0 padding?
[12:39pm] mabshoff: cwitty-995: We do use it in some places.
[12:39pm] mabshoff: cwitty-995: But I don't think there is support for delete in Cython.
[12:40pm] cwitty-995: Well, then, maybe it's portable enough.
[12:41pm] jason__ joined the chat room.
[12:41pm] mabshoff: Sooner or later we will hopefully get support in Cython for delete and then can
[12:41pm] mabshoff: fix all of those unclean places.
[12:41pm] cwitty-995: I see in fplll.pxi that you can just do something like this:
[12:41pm] jvoight: craigcitro: The patch is available for you at /home/jvoight/totallyreal/totallyreal.hg.
[12:41pm] cwitty-995:     void wrapper_delete "delete "(wrapper *mem)
[12:42pm] mabshoff: but instead of new we can use malloc when allocating the char* buf
[12:42pm] jvoight: craigcitro: Though I'm never sure I do bundling right, so you'll let me know how/if it works.
[12:42pm] craigcitro-894: >jvoight: sweet. i'll get on that in 2 min.
[12:42pm] craigcitro-894: >jvoight: how do you bundle?
[12:42pm] craigcitro-894: >jvoight: hg bundle foo.hg http://www.sagemath.org/hg/sage-main/ will never fail you
[12:46pm] mhansen is now known as mhansen-554.
[12:46pm] jvoight: I've been doing sage: hg_sage.bundle('foo.hg'), which should be equivalent, no?
[12:47pm] was-620: yes.
[12:47pm] craigcitro-894: yep, that's exactly what that runs
[12:47pm] craigcitro-894: (i'm weird and do things from the command line for some reason.)
[12:49pm] jvoight: I never have any trouble with it on sage.math, but I get all sorts of weirdness when I try to apply such a bundle under Windows/VMware or even sometimes on the baby Ubuntu x86 in my office...
[12:49pm] jvoight: I've had to resort to copying the files manually!
[12:50pm] craigcitro-894: hahah ... yeah, that sounds bad.
[12:50pm] craigcitro-894: they're branches where you're sure they're current against sage-main?
[12:50pm] craigcitro-894: or, rather, www.sagemath.org/hg/sage-main/
[12:50pm] jvoight: Yup, I figured that out the first time.  I just do a sage -upgrade before I try to apply the patch.
[12:51pm] was-620: No.  You have to do hg_sage.pull()
[12:51pm] was-620: "sage -upgrade" need not be sufficient, though usually it is.
[12:51pm] jvoight: Aha!
[12:51pm] was-620: also, using plain text patches is often a very good idea.
[12:51pm] was-620: I use them more than bundles.
[12:51pm] jvoight: I also tried to cheat a couple of times because waiting for the upgrade to finish was beyond my patience at the time.
[12:52pm] rpw: I see a java3d package in the spkg dir. Does SAGE have Java bindings???
[12:53pm] cwitty-995: Sort of.
[12:53pm] was-620: java3d is used for 3d graphics.
[12:53pm] was-620: it is not bound to sage in any direct way.
[12:53pm] cwitty-995: There's a java applet that can run with the notebook, that reads 3d graphic files produced by Sage.
[12:53pm] mhansen-554: Patch for #554 is up.
[12:53pm] mhansen-554 is now known as mhansen.
[12:54pm] was-620: I posted a patch at http://trac.sagemath.org/sage_trac/ticket/61 for the modsym problem.
[12:54pm] rpw: ah. ok.
[12:54pm] was-620: mhansen --good.
[12:55pm] ncalexan joined the chat room.
[12:55pm] ncalexan: Hi everyone!
[12:56pm] was-620: hi!
[12:56pm] mabshoff: hi nick
[12:58pm] craigcitro-894: hey nick
[12:58pm] ncalexan: Hmm... '1040: bug in new ring extension constructor' looks like a good job for me.
[12:59pm] ncalexan: Is anyone working on that?
[12:59pm] craigcitro-894: you should add 1040 to your nick
[12:59pm] jvoight: yi: If you're there, apparently the changes you made fix #1078 for me.
[12:59pm] yi: jvoight: great!
[1:00pm] ncalexan: Oh, that's the system.  That's good.
[1:01pm] ncalexan is now known as ncalexan-1040.
[1:01pm] craigcitro-894: well, so far only a few people have started. i think it's a good idea, though.
[1:01pm] was-620: ncalexan -- please fix 1040.
[1:01pm] was-620: I noticed the problem.
[1:01pm] was-620: I'm pretty sure I'm responsible for the problem.
[1:01pm] was-620: And I would really like it fixed 
[1:02pm] was-620: But nobody is working on it.
[1:02pm] ncalexan-1040: was-620: do you remember me complaining about the way that stuff was handled, like a year ago?  Here it comes back 
[1:02pm] ncalexan-1040: I'll try to fix it, but it's not trivial.
[1:02pm] was-620: ncalexan-1040 -- I hope you don't have to rewrite the entire preparser just to fix that.
[1:02pm] was-620:
[1:02pm] ncalexan-1040: No, definitely not 
[1:02pm] cwitty-995: ncalexan-1040: I'm about to open a ticket with another ring preparser bug.  Maybe you could fix it at the same time 
[1:03pm] ncalexan-1040: cwitty-995: please, I'll try for both.
[1:03pm] was-620: 554 -- closed.
[1:05pm] was-620: hi -- I just pushed out all the bug fixes I've applied so far.
[1:05pm] was-620: They are all pretty harmless.
[1:05pm] was-620: ncalexan-1040 -- you might also want to do #683.
[1:06pm] was-620: I've re-assigned it to you.
[1:06pm] You are now known as was-836.
[1:06pm] was-836: I'm working on #836 now.
[1:08pm] mhansen is now known as mhansen-1042.
[1:09pm] mhansen-1042: was-836: I can't figure out why #1042 is failing, but a fix is to move 'x' into all.py instead of having it both in all_cmdline.py and all_notebook.py
[1:09pm] cwitty-995: ncalexan-1040, I just posted #1084.
[1:09pm] mabshoff is now known as mabshoff-620.
[1:09pm] ncalexan-1040: was: http://trac.sagemath.org/sage_trac/ticket/1083 is not a show-stopper but is probably best handled by you.
[1:09pm] fabio left the chat room. ("Konversation terminated!")
[1:10pm] ncalexan-1040: cwitty-995: assigned to me, thanks.
[1:11pm] was-836: yep, assign it to me.
[1:11pm] mabshoff-620: was: did you fix 620?
[1:12pm] was-836: no.
[1:12pm] was-836: I didn't look at it.
[1:12pm] mabshoff-620: ok
[1:12pm] was-836: But I fixed that modular symbols stopped working...
[1:15pm] craigcitro-894: mabshoff-620: 894 is ready to go, if you still want to test it.
[1:15pm] craigcitro-894: >jvoight: let's get a ticket for your code up, and i'll start working on it.
[1:15pm] mabshoff-620: Is the patch at #894?
[1:16pm] jvoight: OK, I'll create a ticket.
[1:16pm] mabshoff-620: Then I will try it.
[1:16pm] craigcitro-894: oh
[1:16pm] craigcitro-894: i just did
[1:16pm] craigcitro-894: >mabshoff-620: yep.
[1:17pm] jvoight: craigcitro: It's ticket #1086.
[1:17pm] craigcitro-894: grin ... it's also ticket 1085. oops. 
[1:18pm] mabshoff-620: dupe?
[1:18pm] craigcitro-894: yeah, you want to delete one of them for us?
[1:18pm] mabshoff-620: will do, we just close them as dup.
[1:18pm] mabshoff-620: It isn't the first time this happened.
[1:18pm] craigcitro-894: nods i can imagine
[1:19pm] craigcitro-894 is now known as craigcitro-1085.
[1:19pm] mabshoff-620: I am closing #1086
[1:19pm] jvoight: Sorry 'bout that.
[1:19pm] mabshoff-620: np
[1:19pm] jvoight: P or NP?  Ha!
[1:20pm] craigcitro-1085: grin
[1:20pm] mabshoff-620: math humor 
[1:21pm] jvoight: OK, won't happen again.  *Goes into the other room and engages in self-flagellation.*
[1:22pm] craigcitro-1085: jvoight: are the three totallyreal files the only new ones?
[1:23pm] jvoight: Um, can you tell me what the three files are?  I think they should be totallyreal.py, totallyreal_data.pyx, and totallyreal_phc.py.
[1:23pm] jvoight: (I'm saving the _dsage.py file until yi and I finish up.)
[1:23pm] was-836: jvoight -- I've done that about 6 times... (made a double-trac ticket)
[1:24pm] yi: jvoight: ok, i fixed the get_worker_count bug I think
[1:24pm] yi: jvoight: also, can you repro http://trac.sagemath.org/sage_trac/ticket/1077
[1:24pm] yi: on 2.8.11?
[1:24pm] craigcitro-1085: jvoight: yeah, the three files you just mentioned, in sage/rings/number_field/
[1:25pm] yi: jvoight: http://trac.sagemath.org/sage_trac/ticket/1079 has a link to the bundle that should fix the invalid worker count
[1:25pm] mabshoff-620: was-836: jvoight and craigcitro created a ticket at the same time.
[1:25pm] mabshoff-620: That also happen to mhansen and me once.
[1:25pm] mabshoff-620: great minds thing alike, I guess 
[1:25pm] jvoight: craigcitro: Yep, but I also had to change sage.combinat.combinat to remove a declaration of RR that was never used, and I also changed sage.libs.pari.gen to include polsturm_full.
[1:26pm] jvoight: And sage.rings.number_field.all, of course.
[1:26pm] craigcitro-1085: nods ... i just saw it compiling gen.pyx
[1:26pm] craigcitro-1085: hah nods
[1:26pm] jvoight: yi: About #1077: I'm running some stuff now, but none of the jobs are timing out.  Stay tuned.
[1:26pm] was-836: #836 is done 
[1:27pm] was-836: i'm looking at #894
[1:27pm] You are now known as was-894.
[1:27pm] jvoight: yi: About #1079: It'll be included in the release after the Bug Day today?
[1:27pm] cwitty-995: yi, when you post a patch, you shouldn't mark the ticket fixed -- only the release manager does that.
[1:27pm] mabshoff-620: You should add [with patch] in that case.
[1:27pm] cwitty-995: Otherwise, the release manager will never even notice the ticket and patch.
[1:27pm] yi: cwitty-995: oh ok, i'll change that
[1:27pm] was-894: yep, since if you mark it fixed, that means "totally done", so us release managers don't have to worry about... actually including it!
[1:28pm] craigcitro-1085: jvoight: oops ... your patch still has the totallyreal_dsage stuff in number_field/all.py 
[1:28pm] malb joined the chat room.
[1:28pm] mhansen-1042: Does someone who knows a bit more about globals() want to look at the comments I just added for #1042?
[1:28pm] craigcitro-1085: i'm commenting that out right now, should be fine.
[1:29pm] jvoight: yi: Should dsage.start_all() work?
[1:29pm] yi: jvoight: yes
[1:29pm] jvoight: I'm getting a <class 'sage.dsage.errors.exceptions.NotConnectedException'>: Not connected to a remote server.
[1:29pm] jvoight: I usually start it in several windows.
[1:30pm] yi: jvoight: can you check ~/.sage/dsage/server.log and see what it says?
[1:30pm] You are now known as was-546.
[1:30pm] jvoight: Or am I only allowed to have one server running at a time?
[1:30pm] was-546: #546 -- so I'm going to try to finally fix #546 -- i.e., making it so "sage -upgrade" doesn't delete your work in the extcode directory!
[1:30pm] yi: jvoight: no you should be able to have multiple running
[1:30pm] yi: jvoight: and it should connect to the correct port
[1:30pm] yi: if you use .start_all()
[1:31pm] jvoight: Nothing interesting.  It listens on port 8084, then it says "Received SIGINT, shutting down".
[1:32pm] jvoight: Nevermind--I forgot I have to do D = dsage.start_all() instead of just dsage.start_all().
[1:33pm] yi: oh yeah
[1:34pm] yi: actually there is a problem with that bundle, give me one second I'll post an updated one
[1:36pm] cwitty-995: was-546: I'm about to fix #211 by making polynomials over RR and CC (that is, with exactly 53 bits of precision) use numpy instead of Pari.  (Polynomials over RealField(54), etc., would still use Pari.)
[1:36pm] yi: jvoight: ok, bundle should be good now
[1:36pm] was-546: cwitty-995 -- cool; change your nick 
[1:36pm] yi: same url as in the ticket
[1:36pm] cwitty-995: Any objection?  This means that the output will probably become portable.
[1:37pm] was-546: I don't object.  It will be way way faster too.
[1:37pm] cwitty-995: Probably become NON-portable, I mean.
[1:37pm] was-546: I know.
[1:37pm] was-546: hmmm.
[1:37pm] cwitty-995: It's in the same function as #995, so I'm still working on it too.
[1:37pm] was-546: Make it so one can optionally still use pari, and document that.
[1:37pm] was-546: ??
[1:37pm] craigcitro-1085: jvoight: two things
[1:38pm] cwitty-995: Sure.
[1:38pm] craigcitro-1085: jvoight: make your nick jvoight-1085 
[1:38pm] craigcitro-1085: jvoight: so the db_odlyzko ... if they pick an n outside that range, what should the error message be?
[1:38pm] cwitty-995: mhansen-1042: I don't see any comments on #1042.
[1:39pm] jvoight: yi: I'll get back to you about #1079--I can't reproduce it right now.  Did you do something to fix it?
[1:39pm] yi: jvoight: yes
[1:39pm] jvoight is now known as jvoight-1085.
[1:39pm] yi: jvoight: it wasn't updating the sql table coorectly
[1:39pm] yi: *correctly
[1:39pm] jvoight-1085: craigcitro: Ugh, I suppose I really should just enter the full range of Odlyzko bounds.
[1:40pm] mhansen-1042: cwitty-995: Oops, they're there now.
[1:40pm] craigcitro-1085: well, there's still an issue that they're going to pick something out of range, right?
[1:40pm] jvoight-1085: craigcitro: It is true that the lower bound for n is true for all N >= n, so we don't need to return an error at all; but obviously the actual best bound should be returned.
[1:40pm] craigcitro-1085: i just don't know what the error message should say. 
[1:42pm] jvoight-1085: craigcitro: You mean if they input the degree n not in the range 1<=n<=10?  Or if they input n = 'Your mom'?
[1:42pm] craigcitro-1085: well, both. (the n='your mom' is less worrisome, but more entertaining.)
[1:43pm] jvoight-1085: craigcitro: OK, hold one.
[1:45pm] craigcitro-1085: jvoight-1085: why do you manually enter a value of pi in selberg_zograf_bound instead of just using sage's symbolic pi?
[1:45pm] craigcitro-1085: it seems like that expression should return a symbolic answer, or compute it and return the relevant integer
[1:49pm] ncalexan-1040: preparse('K.<a> = QQ[2^(1/3)]')
[1:49pm] ncalexan-1040: woops.
[1:49pm] was-546:
[1:49pm] was-546: I'm not a sage terminal.
[1:50pm] craigcitro-1085: though maybe people think your email address is 
[1:50pm] was-546: 'K = QQ["2^(1/3)"]; (a,) = K._first_ngens(Integer(1))'
[1:50pm] was-546:
[1:54pm] cwitty-995: was-546, mhansen-1042 has questions about this code (see #1042); since you wrote it, maybe you could help him?  http://www.sagemath.org/hg/sage-main/rev/01ef700db270
[1:54pm] was-546: ok.
[1:55pm] You are now known as was-548.
[1:57pm] jvoight-1085: craigcitro: I wrote an honest Odlyzko bound function, only changing totallyreal.py.  What is the fastest way to get it to you?  Another patch? 
[1:57pm] craigcitro-1085: yeah, another patch is probably the easiest.
[1:58pm] jvoight-1085: craigcitro: OK.  I think I'll send you the DSage stuff, too, just for kicks.
[1:58pm] craigcitro-1085: cool.
[1:59pm] was-548: cwitty-995 and mhansen-1042 -- OK, I fixed it based on mike's observation.
[1:59pm] craigcitro-1085: so it's weird to me that python doesn't have something like int_to_time built in, but i couldn't find anything.
[1:59pm] was-548: I'll post a patch in a second.
[1:59pm] jvoight-1085: craigcitro: OK, see if /home/jvoight/totallyreal/totallyreal.hg works for you.
[1:59pm] craigcitro-1085: how would you feel about putting spaces in the string? 
[1:59pm] was-548: import time; time.[tab]
[2:00pm] jvoight-1085: craigcitro: the selberg_zograf thing with a symbolic pi is useless to me.  I couldn't get it to work with an actual numerical value of pi, and so I figured I might as well just hard code it!  Just a sign of my ignorance.  (Anyway, that function will probably never get used by anyone else except for me; it's not even publically available unless you import it.)
[2:00pm] jvoight-1085: craigcitro: Yes!  What do you think we should call int_to_time?  I was just copying what the output looks like from SAGE.
[2:01pm] was-548: what do you mean by "int_to_time"?
[2:01pm] jvoight-1085: A function which converts a number of seconds into number of days, hours, minutes, seconds.
[2:02pm] jvoight-1085: Does it exist already?
[2:02pm] was-548: isn't it in the time module?
[2:02pm] was-548: import time; time.[tab]
[2:02pm] jvoight-1085: craigcitro: So now, an error message that says "n should be a positive integer" would be reasonable.
[2:02pm] craigcitro-1085: most of that stuff only works on time since the epoch
[2:02pm] was-548: oh.
[2:02pm] craigcitro-1085: jvoight-1085: yep.
[2:02pm] was-548: import datetime
[2:03pm] craigcitro-1085: aha
[2:04pm] was-548: I don't know if that works, but there is a lot about time stuff in python...
[2:05pm] jvoight-1085: Did you find something like int_to_time(3010) to return '50m10.0s'?
[2:05pm] craigcitro-1085: not yet
[2:05pm] craigcitro-1085: there's a "timedelta"
[2:05pm] jvoight-1085: Yeah, somehow those are all relative to the existing time or whatever.
[2:05pm] craigcitro-1085: but i don't see how to get it to take 827394872394 seconds
[2:05pm] mhansen-1042 is now known as mhansen.
[2:05pm] jvoight-1085: Exactly.
[2:06pm] jvoight-1085: I suppose for that, we should put in months and years, too!
[2:06pm] craigcitro-1085: hahah nods
[2:06pm] craigcitro-1085: was-548: datetime seems to only work on reading off a clock
[2:06pm] craigcitro-1085: are there more? 
[2:06pm] was-548: probably...
[2:06pm] craigcitro-1085: i only ran into time googling around
[2:06pm] was-548: time to reinvent the wheel, I guess 
[2:07pm] jvoight-1085: I know.  It's a pretty stupid function, and it needs a better name.
[2:08pm] craigcitro-1085: seconds_to_string ?
[2:08pm] jvoight-1085: seconds_to_timestring?
[2:08pm] craigcitro-1085: i like the latter more
[2:10pm] was-548: #894 -- craigcitro-1085 -- should I *close* it?
[2:10pm] was-548: I applied your patch, but maybe there are a lot of other problems?
[2:10pm] was-548: It's a confusingly written ticket, I guess.
[2:10pm] craigcitro-1085: yeah, it should be closed
[2:11pm] craigcitro-1085: and mabshoff can make new ones when he valgrinds again 
[2:11pm] mabshoff-620: I am about to rerun all ntl doctests under valgrind for #894
[2:11pm] mabshoff-620: Yep
[2:11pm] mabshoff-620: #894 certainly wasn't the best ticket I ever opened.
[2:12pm] mabshoff-620: I am waiting on some "baseline" numbers for 2.8.11 before applying patches and
[2:12pm] mabshoff-620: doing #984 and #620/621
[2:13pm] jvoight-1085: yi: Are you there?  I'm getting the cpu_time.sobj #1078 error again.
[2:13pm] jvoight-1085:
[2:14pm] yi: jvoight-1085: did you apply the patch using hg_sage.apply('dsage.hg') and doing a sage -br?
[2:14pm] jvoight-1085: Oh, did you do something else to fix it in a patch under a different ticket?
[2:15pm] jvoight-1085: #1079?
[2:15pm] craigcitro-1085: mabshoff-620: you shouldn't be too worried about the ntl wrapper
[2:15pm] mabshoff-620: why?
[2:15pm] mabshoff-620: Ifti's problem was a singe 8 byte leak that did happen many, many times 
[2:16pm] craigcitro-1085: anything that really intensely uses ntl shouldn't be using the wrapper ... it's an extra layer that just slows things down 
[2:16pm] yi: jvoight-1085: yup
[2:16pm] craigcitro-1085: or, at least, certain parts of it
[2:16pm] mabshoff-620: Well, I will test anyway 
[2:16pm] craigcitro-1085: actually, for ZZX, that might not be true
[2:17pm] craigcitro-1085: yeah, it's a good idea to not have memory leaks in general
[2:17pm] jvoight-1085: Okey, I'll apply the patch and see if I can break it again.  
[2:17pm] mabshoff-620: Even before the fix I am about to test Ifti's code only leaked 500 bytes (mostly python itself)
[2:17pm] mabshoff-620: I have 3 standard examples that I run on each release and after each memleak fix I do.
[2:18pm] yi: jvoight-1085: btw, does the log tell you the job id on when that happens?

[gap]

[3:33pm] mabshoff-620: Make it in such a way that it can be overwritten by some magiv env variable.
[3:33pm] was-575: can somebody tell me how to tell if a compiler is C99 capable?
[3:33pm] mabshoff-620: I still think the cygwin port is possible.
[3:33pm] mabshoff-620: use "gcc -dumpversion"
[3:33pm] was-575: ok.
[3:33pm] mabshoff-620: then parse the output, if \geq 3.4.0 we are fine.
[3:34pm] mabshoff-620: gcc -dumpversion works on OSX, Linux and Solaris,
[3:34pm] was-575: i can make sure they have gcc, while I'm at it, then 
[3:34pm] mabshoff-620: HPUX does some stupid stuff, but we don't care.
[3:34pm] was-575: I can't use python though.
[3:34pm] was-575: ouch.
[3:34pm] was-575: so I'm not going to do that
[3:34pm] was-575: Somebody who likes perl should do #954
[3:35pm] was-575: (Since sage assumes perl is installed.)
[3:35pm] rlm joined the chat room.
[3:35pm] mabshoff-620: Hi rlm
[3:35pm] rlm: hello michael
[3:35pm] mabshoff-620: Can you referee #1088, #1089?
[3:36pm] mabshoff-620: mhansen, too, if you have time.
[3:36pm] rlm: sure thing
[3:36pm] mabshoff-620: mahsen: the sfa doctest fails on OSX, but was-575 knows/has an idea what is wrong.
[3:36pm] was-575: I do?
[3:37pm] mabshoff-620: I thought you said so.
[3:37pm] was-575: ok.
[3:37pm] mabshoff-620: re gfortran on OSX 10.5: rpw said that he used the binary release from MacPorts and those work.
[3:37pm] was-575: is that hthe one that works fine with -gdb and -verbose, but not otherwise.
[3:37pm] mabshoff-620: yep, that one.
[3:38pm] mhansen: mabshoff-620 and was-575: I could take a guess from if I saw the failure.
[3:38pm] mabshoff-620: Give me a second, problem is that I don't know where it happens because it passes
[3:39pm] mabshoff-620: with verbose and otherwise segfaults.
[3:39pm] mhansen: Oh, I see.
[3:39pm] was-575: A mysterious error (perphaps a memory error?) occurred, which may have crashed doctest.
[3:39pm] was-575:  [32.7 s]
[3:39pm] was-575: exit code: 256
[3:39pm] was-575:
[3:39pm] mhansen: I'm guessing it's on line 256.
[3:40pm] mhansen:
[3:40pm] mabshoff-620: I think it says the line number of the doctest.sh
[3:40pm] mabshoff-620: Well, I would conjecture that all doctests fail on line number 2^k [if they do fail] 
[3:40pm] was-575: I get a crash with --gdb, which is good.
[3:40pm] was-575: (but not very useful).
[3:40pm] was-575: Program received signal EXC_BAD_ACCESS, Could not access memory.
[3:40pm] was-575: Reason: KERN_INVALID_ADDRESS at address: 0x6500f024
[3:40pm] jvoight-1085: yi: Looks like everything runs smoothly, so #1079 is probably fixed.  Sorry to be a dunce about merging.
[3:40pm] mabshoff-620: on bsd?
[3:41pm] was-575: on my laptop.
[3:41pm] was-575: Reason: KERN_INVALID_ADDRESS at address: 0x6500f024
[3:41pm] was-575: 0x000d117a in visit_decref ()
[3:41pm] was-575: (gdb) bt
[3:41pm] was-575: #0  0x000d117a in visit_decref ()
[3:41pm] was-575: #1  0x000429c6 in dict_traverse ()
[3:41pm] mabshoff-620: rpw said valgrind for OSX ought to be out soon, maybe even before SD6
[3:41pm] mabshoff-620: that's it?
[3:41pm] was-575: that would kick ass, because I'm switching to OSX for my full-time devel machine for the next few months.
[3:41pm] was-575: I like to switch back and forth, to keep myself sharp.
[3:41pm] was-575: (between linux and osx)
[3:42pm] mabshoff-620: yep, I do like that to very much.
[3:42pm] mabshoff-620: Next Laptop I will buy is a 64 bit capable mac Laptop.
[3:42pm] was-575: I once even used Windows full time for over 6 months.
[3:42pm] mabshoff-620:
[3:42pm] jvoight-1085: *gasp*
[3:42pm] was-575: It was pretty interesting.
[3:42pm] was-575: I learned Winedt, and everything.
[3:42pm] was-575: math software was painful though.
[3:43pm] was-575: winedt is nice.
[3:43pm] mabshoff-620: development on Windows is just different.
[3:43pm] was-575: yep.
[3:43pm] mabshoff-620: Their APIs suck, but that is a different story.
[3:43pm] was-575: there is a student in my class, who worked full time at Microsoft for the last few years, and tells a lot of stories about what it is like working there...
[3:44pm] jvoight-1085: I have quite a few friends that are former Microsoft employees, too.  Stories.
[3:44pm] mabshoff-620:
[3:44pm] mabshoff-620: "babarians lead by Bill Gates"
[3:44pm] was-575:
[3:45pm] mabshoff-620: It is about the early days at Microsoft, think around Windows 2.0
[3:45pm] jason__ left the chat room. (Remote closed the connection)
[3:45pm] mabshoff-620: Quite an interesting read.
[3:45pm] rlm: what does it mean when you apply a patch, and it asks you to check it in? does that mean the person exporting the patch didn't check it in?
[3:45pm] mabshoff-620: Jason's stuff?
[3:46pm] mabshoff-620: He uses original patch, so you need to commit manually.
[3:46pm] rlm: hg patch instead of hg_sage.patch?
[3:46pm] mabshoff-620: somebody ought to tell him, it surprised me too the first time I applied one of his patches.
[3:46pm] mabshoff-620: That doesn't make a difference.
[3:47pm] mabshoff-620: I think, let me check.
[3:47pm] rlm: what is "original patch"?
[3:47pm] mabshoff-620: I usually use hg import
[3:47pm] mabshoff-620: a patch produced with diffutils.
[3:47pm] rlm: oh i see
[3:47pm] mabshoff-620: Yep, like in the old days of RCS and CVS
[3:56pm] You left the chat by being disconnected from the server.
[3:56pm] You rejoined the room.
[3:56pm] was-575 left the chat room. (Read error: 104 (Connection reset by peer))
[3:56pm] was_: 575 is done (with some other minor improvements) 
[3:58pm] mabshoff-620: Did you see the email from Greg Marks?
[3:58pm] mabshoff-620: The NTL build failed because of a gmp in usr/local
[3:58pm] mabshoff-620: But it did so silently and the NTL build finished.
[3:58pm] was_: Yep -- you score 100%.
[3:58pm] mabshoff-620:
[3:58pm] was_: I'm impressed that you nailed the problem on the head.
[3:59pm] mabshoff-620: Well, 50% of the time it is gmp in usr/local, so it is a 50:50 chance
[3:59pm] was_: I listed about 6 possible problems, none of which was that.
[3:59pm] was_:
[3:59pm] was_: Maybe we should just refuse to build sage if gmp is installed in /usr/local...
[3:59pm] mabshoff-620: I might open a ticket for that and try to fix the problem.
[3:59pm] was_: By the way, this is getting ridiculous:
[4:00pm] mabshoff-620: It should be easy, the same as Justin's problem.
[4:00pm] was_: 57:standard was$ ls -lh sage-2.8.12.alpha0.spkg
[4:00pm] was_: -rw-r--r--  1 was  was    21M Nov  3 15:57 sage-2.8.12.alpha0.spkg
[4:00pm] was_: I think we need to "reset" the sage repo pretty soon.
[4:00pm] mabshoff-620: Yep. Can you purge part of the history or do you have to do it all?
[4:00pm] was_: That 21MB is almost all sage library history.
[4:00pm] was_: I don't know.
[4:00pm] was_: But something has to be done.
[4:01pm] was_: The simplest option is to start over, but make an optional package that has the old revision history.
[4:01pm] was_: The doc package is also huge:
[4:01pm] mabshoff-620: couldn't you export it for the binary build and offer an optional spkg with the history?
[4:01pm] was_: 57:standard was$ ls -lh doc-2.8.12.alpha0.spkg
[4:01pm] was_: -rw-r--r--  1 was  wheel    12M Nov  3 15:56 doc-2.8.12.alpha0.spkg
[4:01pm] was_: ??
[4:01pm] was_: I don't understand the question.
[4:01pm] mabshoff-620: If you install a binary chances are you do not do developement.
[4:02pm] mabshoff-620: So you just get the files in devel/sage with an empty history.
[4:02pm] was_: wrong.
[4:02pm] was_: Very often I start from a binary and do development.
[4:02pm] mabshoff-620: ok, never mind then.
[4:02pm] was_: someday what you say will be true, but not yet.
[4:03pm] mabshoff-620: Well, then you install the optional spkg which has sage.spkg with history.
[4:03pm] was_: yep.
[4:03pm] was_: probably cython-generated code also accounts for some chunk of that 21MB
[4:03pm] was_: (maybe 2MB)
[4:04pm] mabshoff-620: All the c files?
[4:04pm] mabshoff-620 is now known as mabshoff-894.
[4:04pm] was_: wow, starbucks wifi is so good here...  170KB/s upload; not bad for a coffee shop.
[4:04pm] was_: yes.
[4:04pm] mabshoff-894: ok
[4:04pm] cwitty-995: But the C files are deleted before you build the spkg, aren't they?
[4:05pm] was_: I don't remember.
[4:05pm] You are now known as was-1041.
[4:05pm] mabshoff-894: They ought to be regenerated when they are needed.
[4:05pm] was-1041: I'm going to fix #1041, since it's so easy.
[4:05pm] cwitty-995: I've got an spkg here that doesn't have the C files.
[4:05pm] was-1041: ok, so that's not it.
[4:05pm] was-1041: ok, cool.
[4:07pm] was-1041: we really need to have a sage-doctest-day.
[4:07pm] was-1041: Like bug day, but just write a heck of a lot of doctests...
[4:07pm] mabshoff-894: have you sage -coverage globally lately?
[4:07pm] was-1041: no.
[4:08pm] was-1041: trying now.
[4:08pm] was-1041: Overall weighted coverage score:  34.2%
[4:09pm] was-1041: It would be easy to measure progress for a sage-doc-day.  Increase 34% to 40%, say?
[4:09pm] mabshoff-894: Yep
[4:09pm] mabshoff-894: You should make roed write doctests for the padic code 
[4:10pm] mabshoff-894: It is above 0% now, but not by much.
[4:11pm] was-1041: i wrote a doctest for p-adics today...
[4:12pm] ncalexan-1040: I like the idea of doctest day.
[4:13pm] rlm: mabshoff-894: could you advise Jason to include more doctests with his submissions?
[4:14pm] rlm: he might listen to you...
[4:14pm] was-1041: we should reject any patches without doctests.
[4:14pm] was-1041: it's about time.
[4:15pm] cwitty-995: Any feature additions, anyway.  Sometimes it's hard to doctest a bugfix.
[4:15pm] was-1041: true.
[4:15pm] ncalexan-1040: cwitty-995: I find that the most important.
[4:15pm] rlm: true
[4:15pm] ncalexan-1040: And usually the easiest 
[4:15pm] was-1041: true, but *sometimes* it is hard.
[4:15pm] was-1041: I agree, that it is often easy.
[4:15pm] rlm: 2
[4:15pm] rlm: i mean, true true
[4:16pm] mabshoff-894: rlm: He doesn't listen to you?
[4:16pm] was-1041: rlm = robert miller?
[4:16pm] mabshoff-894: I knew there were some disagreements.
[4:16pm] rlm: yes
[4:16pm] was-1041: dang volunteers.
[4:16pm] cwitty-995: Yes, bugfixes should usually include doctests.  I was thinking of #1080... that would be quite difficult to doctest.
[4:17pm] rlm: well, he says he's open to suggestions, and i ask some questions about his submission, and he never replies
[4:17pm] was-1041: or #1005
[4:17pm] mabshoff-894: Well, I could comment and write him an email.
[4:17pm] was-1041: true, #1080 having doctests makes no sense.
[4:17pm] mabshoff-894: What about #1005? Doctests for 10.5?
[4:17pm] mabshoff-894:
[4:17pm] mabshoff-894: rlm: Should I comment on both tickets?
[4:18pm] mabshoff-894: craigcitro-1085: the NTL wrapper has definitely fewer leaks. I am compiling a list
[4:18pm] was-1041: #1041 closed.
[4:18pm] mabshoff-894: of open issues and will open a new ticket.
[4:18pm] mabshoff-894: Less verbose this time 
[4:18pm] rlm: well, i've only looked at 1088, but it definitely applies there...
[4:19pm] mabshoff-894: ok, let me know about the other one.
[4:19pm] mabshoff-894: We want to release on Wednesday, so he has some time.
[4:19pm] was-1041: #815 -- I'm going to take a look.
[4:22pm] was-1041: gees -- #815 -- the only reasonable way is to totally rewrite how doctesting of .sage files works.
[4:22pm] was-1041: not fun.
[4:23pm] roed_ left the chat room.
[4:23pm] was-1041: the old doctesting system for .sage files is really barbaric....
[4:23pm] was-1041: it's from a long long time ago.
[4:25pm] roed_ joined the chat room.
[4:28pm] was-1041: mabshoff -- I've put sage-2.8.12.alpha0.tar in /home/was/www/tmp/
[4:28pm] ncalexan-1040: was-1041: I did a lot of rewriting of doctesting (that I never finished and didn't merge) that might be useful.
[4:28pm] was-1041: ok.
[4:28pm] was-1041: which doctests?
[4:28pm] was-1041: for 1040?
[4:28pm] mabshoff-894: Cool
[4:28pm] was-1041: 2.8.12.alpha0 should be viewed as that tarball plus hg_sage.pull()
[4:28pm] ncalexan-1040: Sorry, no, in reference maybe to 815.
[4:28pm] was-1041: plus maybe hg_*.pull(), actually.
[4:29pm] was-1041: ah.
[4:29pm] You are now known as was-815.
[4:29pm] was-815: That 815 thing is because I have a completely custom script for going through .sage files and extracting docstrings and testing as it goes.
[4:29pm] was-815: That seems dumb now.
[4:29pm] was-815: Much better would be to just doctest the corresponding autogenerated .py file.
[4:30pm] was-815: I.e., (1) generate the.py file, then (2) make sure it has "from a import *" in it (where a.sage is the sage file), then (3) do whatever we do to doctest
[4:30pm] was-815: a .py file.
[4:30pm] was-815: The only other thing is to make sure the line numbers match up.
[4:30pm] rlm: mabshoff-894: 1088 is ready to go, 1089 needs work from jason
[4:31pm] was-815: nick -- what do you think of my proposal for #815.
[4:31pm] mabshoff-894: ok, did you comment on #1089 what need to be done?
[4:31pm] was-815: Basically, I just want to make it reduce to the case of .py.
[4:31pm] mabshoff-894: But #1088 still needs doctests I assume?
[4:31pm] rlm: yeah, and i moved it to 2.9
[4:31pm] was-815: So then whatever you are whoever else does to improve .py, will immediately work on .sage files.
[4:31pm] rlm: no 1088 is ready to go
[4:31pm] rlm: i patched it up
[4:31pm] mabshoff-894: Cool. was-815: can you merge #1088 then?
[4:32pm] was-815: yeah, #1088 doesn't have enough doctests.
[4:32pm] cwitty-995: Does sage have a cross product over Python tuples?  cross((1,2), (3,4)) == (1,3),(1,4),(2,3),(2,4)
[4:32pm] was-815: oh, with rlm's that's better.
[4:32pm] mabshoff-894:
[4:32pm] was-815: ok on 1088.
[4:33pm] mabshoff-894: Yep, I will write an email about #1089 to Jason and also ask about using mercurial instead
[4:33pm] mabshoff-894: of plain diff.
[4:33pm] was-815: sage: list(cartesian_product_iterator([(1,2), (3,4)]))
[4:33pm] was-815: [(1, 3), (1, 4), (2, 3), (2, 4)]
[4:33pm] was-815: cwitty-995 see above.
[4:33pm] cwitty-995: Thanks.
[4:34pm] was-815: tell jason he doesn't get credit or paid if he doesn't use mercurial 
[4:35pm] mabshoff-894: Hey, I can be mean to just about anybody because I live far enough away.
[4:35pm] mabshoff-894: And I look mean enough so that nobody will try to beat me up 
[4:36pm] was-815:   == rlm -- by the way, plotting code now doesn't generate pngs or popup windows if you do .show(), so it is safe to use foo.show() in doctests.
[4:36pm] rlm: hooray
[4:36pm] was-815: Doctests put the plot functions in a special only generate to a single temp file.
[4:36pm] rlm: goodbye sage.:
[4:36pm] was-815: I noticed a bunch of .png's in graphs/, so there still must be some doctests generating them.
[4:36pm] was-815: Actually "sage.:" is now a syntax error.
[4:36pm] was-815:
[4:36pm] ncalexan-1040: How should I flag a patch in TRAC?  [withpatch]?
[4:36pm] was-815: [with patch]
[4:37pm] rlm: the one .png i will miss is the digraph i have it draw in graph_isom to explain the finite state loop
[4:37pm] ncalexan-1040: Okay, then 1040 is [with patch] but not closed.
[4:37pm] ncalexan-1040: Hopefully I didn't break anything.  I doctested number_fields/*; that probably uses most of the R.<> notation.
[4:38pm] was-815: #1088 is closed and pushed out.
[4:38pm] was-815: nick -- awesome.
[4:39pm] was-815: i like how you factored out strip_prompts.
[4:39pm] ncalexan-1040: was-815: well, as long as nothing else is broken :)\
[4:39pm] ncalexan-1040: And parse_generators, although it's not exactly removed from the previous logic.
[4:39pm] ncalexan-1040 is now known as ncalexan-1084.
[4:40pm] was-815: good
[4:43pm] was-815: #815 -- closed.
[4:43pm] was-815: I mean #1040 -- closed.
[4:43pm] was-815: #815 -- I'm going to wait on that.  It requires some thought.
[4:43pm] was-815: #815 -- retagged for 2.9.
[4:44pm] roed_ left the chat room. (Read error: 110 (Connection timed out))
[4:44pm] was-815: any other patches I should apply?
[4:45pm] mabshoff-894: What about #61? It is still open.
[4:45pm] mabshoff-894: #766 also has a bundle attached.
[4:46pm] was-815: you're right - #61 is closed.
[4:46pm] was-815: cool, somebody fix #766.
[4:48pm] mabshoff-894: How about #1087?
[4:49pm] was-815: hmmm.
[4:49pm] mabshoff-894: #1079 has a bundle attached.
[4:49pm] was-815: mhansen are you here?
[4:49pm] jvoight-1085: Hey, may I ask a random question?
[4:51pm] mabshoff-894: sure
[4:51pm] jvoight-1085: I'll take that as a "no."    I need to enumerate all vectors in a lattice with norm in a bounded range.  Can't see how to do that.
[4:52pm] was-815: mabshoff -- there's a comment I put at #1087, which is quite importnat.
[4:52pm] was-815: don't apply the doc patch, but instead touch files in doc/ref/sage*.tex
[4:52pm] was-815: once we find out which files to touch.
[4:52pm] was-815: Also, there should be a doc patch that just modifies ref/ref.tex, and maybe creates a little file ref/combinat.tex.
[4:53pm] was-815: jvoight -- maybe pari can do it.
[4:54pm] mabshoff-894: ok, I will read that.
[4:55pm] jvoight-1085: Excellent, thanks was.  Pari has an implementation of the Fincke-Pohst algorithm.  Woot!
[4:57pm] was-815: Very cool.
[4:57pm] was-815: I'm so glad Sage doesn't have to compete with pari... :-0
[4:58pm] Topic changed to "Bug Day 5 - w00t" by mabshoff-894.
[5:02pm] cwitty-995: Has anybody tested how much slower Sage is if Cython-generated code is compiled with -O instead of -O3?
[5:03pm] mhansen: was-815: I just got back.
[5:03pm] mabshoff-894: No, but I didn't notice any huge difference when valgrinding the code 
[5:05pm] You left the chat by being disconnected from the server.
[5:06pm] You rejoined the room.
[5:06pm] was-815 left the chat room. (Read error: 104 (Connection reset by peer))
[5:07pm] jvoight-1085:
[5:08pm] mabshoff-894: craigcitro: #1091-#1094 are the remaining open leaks in the NTL wrapper code.
[5:08pm] was_: hi.  I'm about to go.
[5:08pm] mabshoff-894: I suspect for one ticket that the leak is in NTL itself.
[5:08pm] mhansen: was_: I commented on #1087
[5:08pm] mabshoff-894: was_: see you in about 2 hours.
[5:08pm] was_: mabshoff -- if you get the sage from /home/was/www/tmp/ and do hg_*.pull() for *all* repo's you can take over for me.
[5:09pm] was_: Also, get the new moin package I posted there and put it in the tarball, ok.
[5:09pm] mabshoff-894: np, I will work on #620 now.
[5:09pm] was_: wow, so we closed nearly 20 tickets today.  not bad.
[5:09pm] was_: not bad for a half day.
[5:09pm] was_: some were around for a long long time, too.
[5:09pm] mabshoff-894: craigcitro: another ticket is about Givaro, which you must call in the NTL wrapper somehow.
