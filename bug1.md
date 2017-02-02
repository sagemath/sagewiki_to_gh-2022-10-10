= SAGE Bug Day 1 =

Sage Bug Day 1 took place from 10 am PST August 18th until 2 am August 19th 2007.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * [[bug1/status| STATUS]]

 * [[bug1/irc| IRC log]]

 * [[bug1/Results| Results]]

 * The base version of SAGE we'll start with is here:
      http://sage.math.washington.edu/bug/

 * The trac server with all the bugs is here:
      http://www.sagemath.org:9002/sage_trac/report/1
 
 * We will focus on the bugs listed here:

      http://www.sagemath.org:9002/sage_trac/milestone/sage-2.8.2

   However, people with other interests can of course help out with fixing anything they want. 
   

 * Write to wstein@gmail.com for an account on the bug tracker. 

 * We'll all be on #sage-devel at irc.freenode.net.  
{{{
From Linux you can chat via a text console by installing "irssi", running it, and typing 
  /SERVER add irc.freenode.net 
  /SERVER irc.freenode.net
  /join #sage-devel
}}}

= IRC =
SAGE Bug squash IRC LOG


[Thu Aug 16 2007] [02:11:25] <william> It'll be fixed in sage-2.8.1
[Thu Aug 16 2007] [02:11:38] <malb> sounds difficult to track down
[Thu Aug 16 2007] [02:12:00] <william> I looked through all the code in our src/ versus the one in GMP's generic install, and it didn't look like anything nefarious.
[Thu Aug 16 2007] [02:12:07] <william> it just looks like a patch was preapplied.
[Thu Aug 16 2007] [02:12:15] <william> anyway, fixed.
[Thu Aug 16 2007] [02:12:27] <william> it was hard to track.  i got lucky.
[Thu Aug 16 2007] [02:27:48] |Quit| malb has left this server ("Konversation terminated!").
[Thu Aug 16 2007] [02:27:55] |Join| malb has joined this channel (n=malb@p5B105CBC.dip.t-dialin.net).
[Thu Aug 16 2007] [04:09:46] |Quit| malb has left this server (Remote closed the connection).
[Thu Aug 16 2007] [04:28:45] <mabshoff> Hey william
[08:53] --> You have joined the channel #sage-devel (n=was@206.135.48.98).
[08:53] *** Channel modes: secret, no messages from outside
[08:53] *** This channel was created on 08/17/2007 01:03:33 PM.
[08:54] <burcin> hello?
[08:55] <was_> hi.
[08:55] <burcin> is there a reason why the channel is secret?
[08:55] <was_> no
[08:56] <was_> i hardly know anything about irc
[08:56] <burcin> it's been a while since I used irc.. I was surprised when I couldn't find this channel in the list
[08:56] <was_> bug  :-)
[08:57] <burcin> if we're going to be using this often.. and it seems we will be..
[08:57] <burcin> we should also register the group with freenode...
[08:58] <was_> when we made @sage-dev a while ago, bobby moretti and i tried several times
[08:58] <was_> to officially register the group, but got ignored.
[08:58] <was_> it was weird.
[08:59] <was_> We just changed from using #sage-dev to #sage-devel a few days ago for
[08:59] <was_> consistency with the mailing list name.
[08:59] <was_> Maybe we were registering incorrectly.
[09:00] --> pdenapo has joined this channel (i=pablo@201.255.49.80).
[09:00] <burcin> this seems to be the first step:
[09:00] <burcin> http://freenode.net/group_registration.shtml
[09:00] <burcin> or maybe it's overkill...
[09:01] <burcin> anyway.. I'm just making remarks about nonsense.. as I won't be able to join in the bug squash..
[09:02] <burcin> unfortunately, this weekend the dorms don't have internet access.. and I'll be leaving the institute in 30 minutes..
[09:02] <burcin> so proper questions..
[09:02] <was_> where do you live?
[09:02] <burcin> is there anything I need to do, to get cython to build code with debug symbols?
[09:03] <was_> cython always builds such code by default.
[09:03] <burcin> I live in linz, austria.. the institute, RISC, is in Hagenberg, about 25 km's away.. long distance for this place..
[09:04] <burcin> so how does one go about attacking bug #274
[09:05] <was_> first confirm that it is still a bug.
[09:05] <burcin> it is..
[09:06] <was_> yep.
[09:06] <burcin> the number increases much more significantly, if one adds a couple of zeroes to the parameter of range...
[09:06] <was_> i would try to simplify the loop -- take the random stuff out.
[09:07] <was_> yep.
[09:07] <was_> without the random stuff the leak is still there.
[09:07] <was_> that's good because it is much simpler.
[09:07] <was_> Is both the + and * needed?
[09:08] <was_> nope.
[09:08] <was_> just doing t*X exhibits a leak
[09:08] <burcin> yes.. you're much faster :)
[09:10] <-- pdenapo has left this server ("Leaving").
[09:10] <was_> the problem is also *only* over GF(10007^2)
[09:10] <was_> not over GF(10007)
[09:10] <was_> so it's givaro, probably.
[09:11] <was_> wait -- it's pari at that size!
[09:11] <was_> it's not givaro.
[09:11] <was_> so now I would try to narrow it down as much as possible in this class sage.rings.finite_field.FiniteField_ext_pari
[09:13] <burcin> thanks.. but I need to leave now..
[09:13] <burcin> I'll try to read the logs...
[09:13] <burcin> and definitely be here for next time..
[09:13] <was_> excellent.
[09:13] <was_> cu
[09:14] <-- burcin has left this server ("Leaving").
[09:42] --> d has joined this channel (n=dorian@adsl-75-11-167-13.dsl.sndg02.sbcglobal.net).
[09:43] --> dropdrive has joined this channel (n=user@c-24-128-50-102.hsd1.ma.comcast.net).
[09:56] --> robert457965 has joined this channel (n=rlmill@c-71-197-245-35.hsd1.or.comcast.net).
[09:57] <robert457965> any intel mac binaries?
[09:58] <william> somebody somehow messed up my office computer where
[09:58] <william> the intel mac binary is.
[09:58] <william> I can't connect to it.
[09:58] <william> either it crashed, or tom changed something or ??
[09:58] <william> I don't know.
[09:59] <william> so, no intel mac binaries.
[09:59] <william> there is one -- it's just no accessible.
[09:59] <robert457965> ok, well my intel mac is building now
[09:59] <robert457965> we could make binaries from that?
[09:59] <william> please post when you are done, if you have a fast connection.
[09:59] <william> yes.
[09:59] <william> just do sage -bdist 2.8.1
[09:59] <robert457965> ok cool
[10:01] <dmharvey> good morning/afternoon/evening
[10:01] <was_> hi.
[10:01] <was_> welcome.
[10:01] <was_> it's 10am, so I official declare this bug squash started.
[10:01] <was_> Did everybody get my email?
[10:01] <was_> (from last night)
[10:02] <was_> this is the key thing: http://www.sagemath.org:9001/bug1
[10:02] <dmharvey> yes
[10:02] <dmharvey> so how is this going to work?
[10:03] <robert457965> i'm starting on ticket 206, once my build finishes
[10:03] <william> could everbody who is here maybe write where they are physically or something?
[10:03] <mabshoff|away> hi
[10:03] <robert457965> reporting from my gf's apartment, capitol hill seattle
[10:03] <william> I'm in San Diego
[10:03] *** mabshoff|away is now known as mabshoff.
[10:03] <william> So you're Robert Miller?
[10:03] <dmharvey> boston, in my apartment, with a somewhat flaky internet connection
[10:03] <robert457965> yeah
[10:03] <william> ok.
[10:03] <robert457965> surprisingly the nickname "robert" was taken
[10:04] <dmharvey> "william" == "was_"?
[10:04] <william> i am logged in twice.
[10:04] <william> I have two different irc clients.
[10:04] <william> anyway, i made this page:
[10:04] <dmharvey> lemme guess... one is on your iphone?
[10:04] <mabshoff> I am near Dortmund, Germany with a DSL connection locally, but fat pipes at work.
[10:04] <william> http://www.sagemath.org:9002/sage_trac/milestone/sage-2.8.2
[10:05] <william> what about dropdrive and d?
[10:06] <robert457965> was- how is that delete script doing?
[10:06] <william> 79% done.
[10:06] <william> :-)
[10:06] <robert457965> oy
[10:07] <robert457965> lesson learned
[10:07] <william> how about if somebody chooses a specific bug and we all think about it for a few minutes?
[10:08] <william> optimally, somebody will have an idea, convince everybody else it is a good way to go, and
[10:08] <william> write up a patch, which everybody else could try.
[10:08] <dropdrive> william: I'm just an interested observer :)
[10:08] <dmharvey> i'm going to see if #319 still exists after all the changes to the coercion code
[10:08] <william> ok.
[10:08] <william> ok, i'm looking at it too.
[10:08] <dmharvey> unfortunately i'm still building 2.8.1 on two machines....
[10:08] <william> just try in 2.8
[10:09] <william> Or do hg_sage.pull()
[10:09] <dmharvey> yep it's fixed in 2.8 :-)
[10:09] <dmharvey> ha ha
[10:09] <william> The underlying SAGE library code is almost the same in 2.8.1.
[10:09] <dmharvey> one bug squashed
[10:09] <william> Most packages build better.
[10:09] <william> In particular ** GMP **.
[10:09] <william> We found a major issue this week in how GMP was being built.
[10:09] <robert457965> here's something warranting discussion
[10:09] <william> The gmp-*/src directory had some patches for specific architectures already applied,
[10:09] <robert457965> what is the best way to handle factoring poly
[10:10] <robert457965> 's over RDF?
[10:10] <william> instead of it being the generic upstream code.
[10:10] <william> wait -- let's finish #319.
[10:10] <robert457965> k
[10:10] <william> did anybody else verify that it is fixed?
[10:10] <dmharvey> sage: Matrix(QQ, 2, 2, [1, 1, 1, 1]) / 2
[10:10] <dmharvey> 
[10:10] <dmharvey> [1/2 1/2]
[10:10] <dmharvey> [1/2 1/2]
[10:11] <robert457965> same here
[10:11] <william> somebody volunteer to make that a doctest and attach the patch to the bug report?
[10:11] <william> then we'll close it.
[10:11] <william> (same here)
[10:11] <william> i volunteer.
[10:12] <dmharvey> wow you are too fast for me
[10:12] <william> :-)
[10:12] <robert457965> something just occurred to me
[10:12] <william> question -- is this behavior generic?  we should test more base rings.
[10:12] <robert457965> anyone claiming to have lives outside of sage might say something... we can just say we were playing video games all day
[10:12] <william> let's do it!!
[10:12] <william> online gaming.
[10:12] <william> or whatever it is called these days.
[10:13] <robert457965> Matrix(ZZ, 2, 2, [1, 1, 1, 1]) / 2    works
[10:13] <robert457965> m.m.o.r.p.g.?
[10:13] <william> not so massive
[10:13] <mabshoff> not yet, who knows who else will show up.
[10:14] <william> i just found a bug.
[10:14] <william> in sage-2.8.1
[10:14] <william> i tried to start a secure server on sage.math, and it fails.
[10:15] <robert457965> RDF and RR work with the same example
[10:15] <mabshoff> @william: Do you have a changelog with the changes in between 2.8 and the "bug" release?
[10:15] <william> excellent.
[10:15] <mabshoff> The one in sage:/bug/ is empty excpet the date.
[10:15] <william> can somebody make sure nobody is in sage-dev.
[10:15] <william> I think malb is there.
[10:16] <william> it sage:lj/bug
[10:16] <robert457965> only people who are checking...
[10:17] <robert457965> so is that it for 319?
[10:18] <mabshoff> That Changelog.txt starts with
[10:18] <mabshoff> Sun Aug 12 14:24:58 2007
[10:18] <mabshoff> ------------------------
[10:18] <mabshoff> Sun Aug 12 14:10:37 2007
[10:18] <mabshoff> ------------------------
[10:18] <dmharvey> I think #319 is okay, as long as william carries through on his promise to writ a doctest
[10:18] <mabshoff> And then the changes for 2.8
[10:18] <dmharvey> I am going to take a look at #350
[10:18] <william> I update the changelog on my laptop, but couldn't use my laptop all week.
[10:18] <william> so no change log.
[10:18] <william> yep.
[10:19] <mabshoff> Ok
[10:19] <william> mabshoff -- would you consider making a build change log?
[10:19] <william> you know about as much as I do about it.
[10:20] <mabshoff> Well, I am not exactly sure what happened in the details except: Most stuff now compiles better :)
[10:20] <mabshoff> And I wonder about the details, i.e. die the Solaris lcalc compile fixes go in?
[10:20] <william> maybe that's the entry.
[10:20] <william> no.
[10:21] <william> send me a new lcalc spkg :-)
[10:21] <mabshoff> Will do in a while.
[10:21] <mabshoff> I had planned to work mostly on neron to see how things go with ""out of the box" sage.
[10:22] <mabshoff> #389 (bug in mpfi C library) is still present.
[10:22] <dmharvey> Question regarding #350. Originally you could do something like "f = x^8 + x^4" and then call f.change_ring(some ring). That no longer works since f is now a SymbolicArithmetic object rather than a polynomial. Does anyone think it would be good for SymbolicArithmetic objects to have a change_ring() method? My preferred answer is no, but I wanted to raise it since the example code in that bug report doesn't currently work.
[10:22] <william> no.
[10:22] <william> it doesn't make any sense.
[10:22] <dmharvey> ok good
[10:22] <william> Have to add x = polygen(QQ) at the beginning of the log.
[10:22] <mabshoff> re changelog: There is always was/lj/todo.txt
[10:23] <william> yes, great idea mabshoff.
[10:23] <william> summarize something from that.
[10:24] <dmharvey> look at that! #350 is already fixed too! I am jinxed!
[10:24] <mabshoff> :)
[10:24] <robert457965> question for #430: Would it be better to use GSL or numpy to find roots of a polynomial?
[10:24] <dmharvey> I don't suppose anyone has any other bugs that they want fixed just by my magical gaze?....
[10:25] <robert457965> sorry, a polynomial of doubles
[10:25] <william> doing hg_sage.pull() gets you the doctests for #319
[10:26] <william> oh yeah, somebody fixed #350.
[10:26] <william> 2 down :-)
[10:26] <william> mabshoff -- want to fix #389?
[10:27] <william> robert457965 -- use numpy.
[10:27] <william> it will be way easier to code.
[10:27] <william> however, it might be worth doing some benchmarking.
[10:28] <william> what do people think aabout #190?
[10:28] <william> The issue is that detecting fractional matrix indices will slow matrix indexing down.
[10:28] <dmharvey> that's pretty funny
[10:28] <mabshoff> Not sure yet.
[10:29] <william> Maybe a[0.5] could be the average of rows 0 and 1 ??  :-)
[10:29] <mabshoff> I am checking if the patch for #226 still applies.
[10:29] <robert457965> well, if it were a 0 by 0 matrix, you could just call iszero()
[10:29] <dmharvey> where is the code for that indexing method?
[10:29] <william> matrix/matrix0.pyx
[10:29] <william> around line 538
[10:30] <william> by the way, when people fix things, if you give them to me somehow, I can post them so
[10:30] <william> everybody else can get them with hg_sage.pull().
[10:30] <mabshoff> re #226 (with slight editing to account for pyrex->Cython:
[10:30] <mabshoff> patching file Cython/Compiler/ExprNodes.py
[10:30] <mabshoff> Hunk #1 succeeded at 2823 with fuzz 1 (offset 229 lines).
[10:31] <mabshoff> I will rebuild cython and then sage-2.8
[10:31] <william> does the bug still happen?
[10:32] <william> are you sure the patch is needed?
[10:32] <mabshoff> you mean: is it fixed without applying the patch?
[10:32] <william> yes
[10:32] <mabshoff> Not yet, but I will test with the original cython.
[10:32] <william> what's your test input?
[10:32] <william> i'll just wait..
[10:33] <mabshoff> There is a regression.pyx attached to the ticket. Give me a minute to sort it all out.
[10:34] <william> ok.
[10:34] <william> dmharvey -- are you looking at #190?
[10:34] <dmharvey> #190: do matrix subclasses generally override the getitem/setitme methods?
[10:34] <william> one bad thing is:  return self.row(int(key))
[10:35] <mabshoff> [mabshoff@m940 sage-2.8.1]$ cython regression.pyx
[10:35] <mabshoff> [mabshoff@m940 sage-2.8.1]$
[10:35] <william> no, they enver do.
[10:35] <mabshoff> That is without the patch.
[10:35] <dmharvey> ok
[10:35] <william> (regarding #190)
[10:35] <mabshoff> So #226 can be closed then.
[10:35] <william> not until i have the patch and have tested it too :-)
[10:36] <mabshoff> It was the original cython without the patch applied.
[10:36] <dmharvey> #190: so I guess the real question is: if someone tries to index on something like a Rational, which happens to be an integer, should that be allowed?
[10:36] <william> it's a simple patch.
[10:36] <william> ok.
[10:36] <william> #226 - oh -- it already works -- no patch needed?
[10:36] <mabshoff> Yes.
[10:36] <william> #190: yes.
[10:37] <william> #226: where is regression.pyx
[10:37] <mabshoff> The report for #226 was for pyrex 0.9.4.1, roughly 7 months old.
[10:37] <william> ok. mabshoff - you can have the honors of closing the bug.
[10:37] <mabshoff> attached to the ticket.
[10:38] <dmharvey> #190: well then it's tricky.... at some point you need to just trying to coerce to an integer index. But floats get rounded when you do that.
[10:38] <mabshoff> Mmh, I have to remember my trac password.
[10:38] <william> #190: what does magma do?
[10:39] <mabshoff> re #226: Reported by:  was
[10:39] <dmharvey> #190: actually there are two separate issues. One is speed; we could make the pathway faster by adding special code to test for Integer/int index. Second is sanity; are fractional indices allowed.
[10:39] <dmharvey> #190: let me check on magma; never done matrices before so gimme a few minutes
[10:39] <william> you are convincing me that we should just give an error if the input isn't int,long,Integer.
[10:39] <william> wait -- can't we have a fast version, and if that doesn't work, have a slow version?
[10:40] <mabshoff> william: How should we handle fixed bugs?
[10:40] <mabshoff> Add some text (in this case) stating: Was fixed in a previous release of cython.
[10:40] <william> for the sage library, make them available to me in any way, and I'll (1) put them in the official
[10:40] <mabshoff> cython regressioin.pyx works.
[10:40] <william> hg repository; for other things, I'll put them in /home/was/bug/
[10:41] <william> oh -- and post verbosely to trac!
[10:41] --> ncalexan has joined this channel (n=user@d207-216-25-207.bchsia.telus.net).
[10:41] <william> hi nick.
[10:41] <william> where you at?
[10:41] <ncalexan> Hi folks... I can't stay long, relaxing with the family, but thought I'd see how things were.
[10:41] <ncalexan> Victoria, BC.
[10:41] <dmharvey> #190: magma raises an error "Runtime error in '[]': Bad argument types"
[10:41] <ncalexan> You?
[10:41] <william> i wonder what nick things.
[10:41] <william> nick thinks.
[10:42] <william> nick, if a is a matrix, and n = QQ(5), should a[n,n] be an error or not?
[10:42] <dmharvey> #190: my preference is to allow only int/long/Integer
[10:42] <dmharvey> hi nick
[10:42] --> paulolivier_sage has joined this channel (i=8143024e@gateway/web/cgi-irc/ircatwork.com/x-f7a7e0b894111559).
[10:42] <william> wait!
[10:42] <-- paulolivier_sage has left this server (Client Quit).
[10:42] <william> we should do whatever python lists do, shouldn't we?
[10:42] <ncalexan> Yes.  That's a reasonable answer.
[10:43] <william> also, we should look at what numpy arrays and matrices do.
[10:43] <dmharvey> sure
[10:43] <ncalexan> That probably means calling __int__ or something similar, no?
[10:43] <william> python lists have an __index__ protocol as of python 2.5.
[10:43] --> pauloliviersage has joined this channel (i=8143024e@gateway/web/cgi-irc/ircatwork.com/x-539b7d4cf887a650).
[10:43] <william> NO.
[10:43] <ncalexan> Yeah, I think we best stick with that then.
[10:43] <ncalexan> ?
[10:43] <william> #190: A python list will call __index__ and if that works, use it. otherwise fail.
[10:44] <william> So anybody can make their own new class that can index into lists, etc., if they want.
[10:44] <dmharvey> #190: ah that explains why you can index on an Integer
[10:44] <william> I used to have to do this crap in the preparser: v = [1,2,3]
[10:44] <william> v[Integer(2)]
[10:44] <william> it totally sucked.
[10:44] <william> We don't want to make SAGE users who make new classes suffer that way.
[10:44] <william> #190 -- where?
[10:45] <dmharvey> #190: sorry, I mean for a python list
[10:45] <william> there must be a python/c api call to get foo.__index__()
[10:45] <dmharvey> #190, i.e. v[Integer(2)] works, but v[2.5] doesn't
[10:45] <ncalexan> Why was it bad?
[10:45] <william> #190: yep, that's good.
[10:45] <william> but if somebody wanted to make their own "2.5" and define an index method on it, then it would work.
[10:45] <william> That's the best way to go.
[10:45] <mabshoff> Ok, I close #226
[10:45] <mabshoff> +d
[10:46] <william> thanks!
[10:46] <william> 3 down.
[10:46] <ncalexan> Ah, so it was too slow?
[10:46] <mabshoff> But I think I found a bug in cython.
[10:46] <william> 33 to go.
[10:46] <william> report the cython bug to track
[10:46] <mabshoff> cython -v doesn't work as expected.
[10:46] <dmharvey> #190: so conclusion is that Matrix.__getitem__ should use call __index__? instead of coercing to int?
[10:46] <william> #190: no -- the problem was that it wasn't meaningful
[10:46] <mabshoff> It just prints the standard help text.
[10:46] <william> #190 http://www.sagemath.org:9002/sage_trac/ticket/190
[10:47] <william> mabshoff -- agreed.  report it.
[10:47] <william> #190: use.
[10:47] <william> #190: dmharvey -- yes.
[10:47] <dmharvey> #190: ok I will try to code thisup
[10:48] <william> thanks!!
[10:48] <william> i'm pasting this part of the transcript from irc into trac, since it explains the decision well.
[10:48] <mabshoff> Which component in trac is cython?
[10:49] <william> packages.
[10:49] <mabshoff> ok
[10:49] <william> it actually has its own bug tracker in berliOS too.  see cython.org
[10:49] <william> maybe that is a better place to post the bug.
[10:49] <mabshoff> Too late, I gues.
[10:49] <william> ?
[10:49] <mabshoff> It is in now.
[10:49] <william> no prob.
[10:50] * pauloliviersage says hi
[10:50] <mabshoff> It is #438
[10:50] <william> hi paul
[10:50] <mabshoff> hello
[10:50] <william> where are you at physically?
[10:50] <pauloliviersage> oxford
[10:50] <pauloliviersage> btw, william, if you have a chance at sage days bristol you should come around here and give a talk
[10:50] <william> cool.
[10:51] <pauloliviersage> let me know if you think you would have time, i am sure you will be busy
[10:51] <mabshoff> the milestone pages updates itself in real time, pretty cool.
[10:54] <william> i'm tracking status of what people ware working on here: http://sage.math.washington.edu/bug/status.html
[10:54] <william> robert miller -- how is #430 going?
[10:55] <william> I just looked at #248.  it works fine now. can somebody else confirm this?
[10:55] <pauloliviersage> i am working on the remote stuff
[10:55] <william> I'm going to add a doctest and close it.
[10:55] <william> what is "the remote stuff"?
[10:55] <william> which trac number?
[10:55] <dmharvey> #190: unfortunately this solution will slow down indexing, basically because I reckon the Integer.__index__() method is currently not all that optimised (it always goes via a python long!). Luckily Python has a special slot and fast calling convention for __index__, which pyrex knows about, so if we make Integer.__index__ faster, then this shouldn't be a serious problem. Should I add an enhancement ticket to test and improve performa
[10:56] <william> yes.
[10:56] <william> thanks.
[10:56] <pauloliviersage> doesn t have a trac number, it s the feature i had asked about: remote login to expect process (not implemented to use files right now), allowing for ssh tunneling through as many hops
[10:56] <william> this is definitely the right solution, so we have to do it, despite any pain it causes.
[10:56] <william> do you have a trac account?
[10:57] <pauloliviersage> i have one
[10:57] <pauloliviersage> pdehaye
[10:57] <william> please create a trac ticket.
[10:57] <pauloliviersage> ok
[10:57] <william> with the twisted project they have a rule that *anything* you work on has a trac ticket.
[10:57] <william> we don't, but it's perhaps a very good idea.
[10:58] <dmharvey> #190: ok
[10:59] <william> #190 -- did you right the code already?
[10:59] <william> that was fast.
[10:59] <dmharvey> #190: no, I'm just scoping out related issues still
[10:59] <ncalexan> The last few patches I submitted, I created a trac -- I'm hoping that they'll live longer than my attention span that way.
[10:59] <william> great idea.
[11:00] <mabshoff> Yeah, a lot of the patches Didier did for the Nexenta port were lost and later recreated by William and me.
[11:00] <william> (and by didier...)
[11:01] <william> ok, i'm closing #248 -- it works fine now.
[11:01] <mabshoff> Well, true - he must have forgotten about them by the porting sprint.
[11:02] <pauloliviersage> #439 (should i add to milestone 2.8.2 so it figures in this sprint?)
[11:02] <pauloliviersage> (i have added but am not sure)
[11:02] <william> sure.
[11:03] <william> though you make the game harder (since I hoped we would deal with everything in the list :-)
[11:03] <william> but if you can do it, then so much the better.
[11:03] <dmharvey> #190: hmmmmm....  M = Matrix(3, 3, range(9)); M[1.5, 1.5]. This succeeds but for a different reason. I suppose I'll try to fix this too.
[11:04] <pauloliviersage> (it s a bonus round)
[11:04] <william> #190 -- yep, it must involve the implicit coercion to Py_ssize_t in the tuple extract in matrix0.pyx
[11:04] <william> #254 -- dmharvey -- you reported this.
[11:04] <william> #254 -- it now works fine :-)  i think david roe fixed it.  it's p-adic precision loss in poly eval.
[11:04] <william> I'm closing it.
[11:05] <dmharvey> #254: ok thanks
[11:05] <william> though one thing -- maybe it is still weird.  
[11:05] <william> Look:
[11:05] <william> h = u + (1 + O(5^8))*u^2 + (1 + O(5^4))*u^3
[11:05] <william> sage: h(u)
[11:05] <william> (1 + O(5^4))*u^3 + (1 + O(5^8))*u^2 + (1 + O(5^20))*u
[11:05] <william> what about that coefficient of u?
[11:06] <william> never mind -- it's padic capped, so 
[11:07] <william> sage: h = u*(1+O(5^30)) + (1 + O(5^8))*u^2 + (1 + O(5^4))*u^3
[11:07] <william> is 
[11:07] <william>   
[11:07] <william> (1 + O(5^4))*u^3 + (1 + O(5^8))*u^2 + (1 + O(5^20))*u
[11:07] <william> #254: i'm closing it.
[11:08] <william> #268 -- another dmharvey bug -- is also now fixed :-)
[11:09] <mabshoff> Is that 5 down?
[11:09] <william> yep.
[11:09] <william> 6 down.
[11:09] <william> ohh.  #274 looks really hard.
[11:09] <dmharvey> not all bugs are created equal though
[11:09] <william> it's a memory leak.
[11:10] <mabshoff> Yes, the quick ones will be gone first.
[11:10] <william> i looked at this one with somebody from Austria 2 hours ago...
[11:10] <william> #274: i'm going to work on this now; mabshoff and his valgrind might end up being helpful.  we'll see.
[11:12] <mabshoff> valgrinding python is rather tricky.
[11:12] <william> yep.
[11:12] <mabshoff> One needs to deallocate --py-malloc when python is build.
[11:12] <mabshoff> And even then because python doesn't properly free many things upon exit it is very hard to interpret.
[11:13] <mabshoff> deallocate -> deactivate
[11:13] <william> i'm tracking status of people working here:
[11:13] <william> http://sage.math.washington.edu/bug/status.html
[11:14] <dmharvey> #190: So I've fixed M[1.5], but M.row(1.5) still works, because the prototype of row() is def row(self, Py_ssize_t i, from_list=False).
[11:14] <william> actually, a wiki would be better.
[11:14] <mabshoff> Ohh, a corner case in spkg-install: Call it with relative path from within the package.
[11:14] <mabshoff> [mabshoff@m940 src]$ ../spkg-install > /dev/null
[11:14] <mabshoff> ../spkg-install: line 6: cd: src: No such file or directory
[11:14] <mabshoff> [mabshoff@m940 src]$ cd ..
[11:14] <mabshoff> [mabshoff@m940 cython-20070728]$ ./spkg-install > /dev/null
[11:14] <mabshoff> [mabshoff@m940 cython-20070728]$
[11:14] <william> it's not supposed to work.
[11:14] <william> spkg-install must be called from the same directory in all cases.
[11:14] <dmharvey> #190: william you know about matrices.... will it break things to change that prototype to pass i as a python object?
[11:14] <mabshoff> ok
[11:15] <ncalexan> brb
[11:15] <-- ncalexan has left this server (Remote closed the connection).
[11:16] <william> status is now here.
[11:16] <william> http://www.sagemath.org:9001/bug1/status
[11:17] <william> #190: i don't understand the question.
[11:17] <mabshoff> I am looking into that cython bug right now, #438
[11:18] --> robertwb has joined this channel (n=robert@c-67-171-19-168.hsd1.wa.comcast.net).
[11:18] <william> hi robertwb!  where you at?
[11:18] <robertwb> hi, just sitting at home
[11:18] <william> see http://www.sagemath.org:9001/bug1
[11:18] <william> you're probably most interested in #438 and #190.
[11:19] <dmharvey> hi robertwb
[11:19] <robertwb> hey there
[11:20] <robert457965> hi robert
[11:20] <robertwb> 457965 = miller?
[11:21] <robert457965> yup
[11:22] <william> I'm posting an irc log here -- robertwb might want to skim it: http://www.sagemath.org:9001/bug1/irc
[11:22] <mabshoff> Re #274: I am building a valgrindable python right now. So if william has a testcase which leaks a lot of memory let me know.
[11:22] <robertwb> ok, I'm off to attack #190
[11:22] <william> ok.
[11:22] <william> talk to dmharvey first -- and see our big discussion.
[11:23] <robertwb> yeah, I'm reading the discussion
[11:23] <william> notice that http://www.sagemath.org:9001/bug1/status lists dmharvey as working on it.
[11:23] <robertwb> oh
[11:23] <william> you two should be able to devestate it.
[11:23] <dmharvey> robertwb: also vaguely relevant to this is trac #440 that I just added
[11:23] <robertwb> I didn't see that page
[11:24] <william> it would be good to post some benchmark code and timings to #440. and a link from #190 to #440.
[11:24] <robertwb> so, is there a quick way to pull the current bug-fixing version of sage?
[11:24] <william> yes.
[11:24] <william> do hg_sage.pull()
[11:24] <robert457965> i am finishing a binary too
[11:25] <william> there's a sage-2.8.1, in which essentially every package has changed, so upgrading is pointless.
[11:25] <william> but we have binaries for everything but your laptop :-)
[11:26] --> mhansen has joined this channel (n=mike@216.230.34.44).
[11:26] <dmharvey> robertwb: if M is a matrix, one problem is that M.row(1.5) succeeds, because the prototype for row() uses Py_ssize_t for the index.
[11:26] <robertwb> yeah...
[11:26] <dmharvey> robertwb: and I'm wondering whether it would work for that prototype to be changed
[11:27] <mabshoff> william: I got clisp_cvs to build on neron by adding the missing "--without-dynamic-ffi" to makemake
[11:27] <mabshoff> make check still dies with an exception,
[11:27] <william> mabshoff -- which gcc?
[11:27] <mabshoff> 3.4.6
[11:27] <william> cool.
[11:27] <mabshoff> maxima starts building, but dies with a floating point exception at some point.
[11:28] <robertwb> dmharvey: perhaps there should be a fast macro that creates ints but dissallows rounding.
[11:29] <mabshoff> Didier had the same problem on Nexenta: clisp + gcc 4.x is broken on Sunish systems
[11:29] <mabshoff> But we should add the missing  "--without-dynamic-ffi" to the spkg-install of clisp.
[11:30] <william> definitel.  (and poor lisp...)
[11:30] <mabshoff> That cause the really odd   "#define uint64_to_I(val)  uint64_to_I(val) "
[11:30] <dmharvey> robertwb: well there's some tradeoff here between speed and generality
[11:30] <robertwb> dmharvey: yeah
[11:30] <dmharvey> robertwb: even if you made such a macro, you still have to allow any python object to passed in, right?
[11:30] <mabshoff> I haven't heard back from the clisp folks yet.
[11:31] <robertwb> dmharvey: yes, but that is already the case (you're talking a def method, right?)
[11:32] <dmharvey> robertwb: yes it's a def method. But currently the prototype is def row(self, Py_ssize_t i, from_list=False), so already it gets rounded before we even get to see it
[11:33] <william> #190 -- by the way it was Chuck's Russian student Andrei Novoseltsov who reported #190...
[11:33] <robertwb> dmharvey: I propose that we change cython so that  Py_ssize_t calls __index__ rather than __int__
[11:33] <william> robertwb -- very good idea.
[11:33] <william> do that.
[11:33] <william> Since Py_ssize_t is supposed to be "the data type for doing indexing".
[11:33] <robertwb> ok, that'll solve this issue all over the place
[11:34] <dmharvey> #190: yes I think that sounds good
[11:34] <william> #190: yeah bug squashing day
[11:34] <robertwb> btw, I added (and fixed) the special method patch from Nick and it works great now
[11:34] <robertwb> so I've got other cython changes to put upstream
[11:35] <mabshoff> william - valgrind --trace-children=yes --tool=memcheck ./sage doesn't work with 2.8.1
[11:35] <william> oh.
[11:35] <mabshoff> It dies with
[11:35] <mabshoff> /tmp/Work2/sage-2.8.1/sage-2.8.1/local/bin/sage-ipython: line 6:
[11:35] <mabshoff> SAGE IPython startup script.
[11:35] <mabshoff> : command not found
[11:35] <mabshoff> Should I rebuild IPython against the new python compiled with --without-pymalloc?
[11:36] <william> See "sage -gdb".
[11:36] <william> maybe have to run valgrind on the binary like that.
[11:36] <william> Basically modify SAGE_ROOT/local/bin/sage-gdb to make a sage-valgrind.
[11:36] <mabshoff> Okay, that might be worth a try.
[11:39] <mabshoff> So while I am at it should I add a sage-valgrind?
[11:40] <mabshoff> That would be called when you start sage with a new -valgrind option?
[11:40] <william> yep.
[11:40] <mabshoff> In that case we should also introduce a test for SAGE_DEBUG or something alike that conditionally builds sage's python with --without-pymalloc.
[11:41] <william> yep.
[11:41] <william> great ideas.
[11:41] <robert457965> hooray for sage-valgrind!
[11:41] <william> make a trac ticket for it.   
[11:41] <mabshoff> Okay, give me a while.
[11:41] <mabshoff> okay.
[11:41] <william> many many people would appreciate having an easy to way to create their own valgrindable sage.
[11:41] <william> what a great tool for bug fixing.
[11:42] <mabshoff> Well, it is still pretty hard to deciver, especially when you have leaks because of deferred deallocation.
[11:42] <robert457965> better than ORDINARY bread
[11:42] <-- was_ has left this server ("leaving").
[11:42] <dmharvey> #190: sage: M = Matrix(3, 3, range(9)); M[6/3] still works though, since Rational has an __index__ method. This fails in magma, which is apparently stricter with index types. What do people think of that?
[11:43] <william> i like our behavior better.
[11:43] <william> magma is way too annoying that way.
[11:43] <william> there are now only 995838 files left in robert's tmp directory :-)
[11:46] <mabshoff> What category for the sage-valgrind option?
[11:46] <william> packages.
[11:46] <robert457965> bad news about polynomial factoring in numpy
[11:46] <mabshoff> ok.
[11:47] <robert457965> sage: x = polygen(RDF)
[11:47] <robert457965> sage: f = (x-1)^3
[11:47] <robert457965> sage: f.factor()
[11:47] <robert457965> (1.0*x - 1.00000859959) * (1.0*x^2 - 1.99999140041*x + 0.999991400484)
[11:47] <william> frickin' numbers.
[11:48] <mabshoff> Do you want to factor univariate or multivariate polynomials?
[11:48] <robert457965> univariate
[11:48] <william> univariate double precision polys.
[11:48] <mabshoff> Ok, so the NTL is out.
[11:49] <mhansen> Has anyone done #342?  It looks pretty straightforward to fix?
[11:49] <william> mhansen: #342 -- go for it!
[11:50] <william> nobody has looked it yet.
[11:50] <dmharvey> #190: I have attached a partial fix, so now M[1.5] goes via PyNumber_index.
[11:50] <william> i added you here: http://www.sagemath.org:9001/bug1/status
[11:50] <dmharvey> #190: robertwb's proposal will fix a lot of other issues in #190
[11:51] <dmharvey> #190: i'm planning to look at #440 now, I want to find out if I can speed up the Integer.__index__() method much
[11:51] <robertwb> ok
[11:51] <dmharvey> #190: since that actually affects a *lot* of things
[11:51] <william> I'll apply your code and post so others get it with hg_sage.pull()
[11:51] <william> great.
[11:51] <robertwb> 190 isn't as straightforward as I had hoped, 'cause it might have to mess with PyArg_ParseTupleAndKeywords
[11:52] <william> #190 -- if you can do what you suggest, though, it will be very very nice.
[11:52] <robertwb> yes, I'm still looking into it
[11:54] <william> ok, i've pushed out dmharvey's patch.  hg_sage.pull() to get it if you wnat.
[11:59] <mabshoff> Hehe:
[11:59] <mabshoff> [mabshoff@m940 sage-2.8.1]$ ./sage --valgrind
[11:59] <mabshoff> ----------------------------------------------------------------------
[11:59] <mabshoff> | SAGE Version 2.8.1, Release Date: 2007-08-18                       |
[11:59] <mabshoff> | Type notebook() for the GUI, and license() for information.        |
[11:59] <mabshoff> ----------------------------------------------------------------------
[11:59] <mabshoff> /tmp/Work2/sage-2.8.1/sage-2.8.1/local/bin/sage-gdb-pythonstartup
[11:59] <mabshoff> ==964== Memcheck, a memory error detector.
[11:59] <mabshoff> ==964== Copyright (C) 2002-2006, and GNU GPL'd, by Julian Seward et al.
[11:59] <mabshoff> ==964== Using LibVEX rev 1658, a library for dynamic binary translation.
[12:00] <mabshoff> ==964== Copyright (C) 2004-2006, and GNU GPL'd, by OpenWorks LLP.
[12:00] <mabshoff> ==964== Using valgrind-3.2.1, a dynamic binary instrumentation framework.
[12:00] <mabshoff> ==964== Copyright (C) 2000-2006, and GNU GPL'd, by Julian Seward et al.
[12:00] <mabshoff> ==964== For more details, rerun with: -v
[12:00] <mabshoff> ==964==
[12:00] <mabshoff> Python 2.5.1 (r251:54863, Aug 18 2007, 20:37:45)
[12:00] <mabshoff> [GCC 4.1.1 20070105 (Red Hat 4.1.1-52)] on linux2
[12:00] <mabshoff> Type "help", "copyright", "credits" or "license" for more information.
[12:00] <mabshoff> --964-- DWARF2 CFI reader: unhandled CFI instruction 0:10
[12:00] <mabshoff> --964-- DWARF2 CFI reader: unhandled CFI instruction 0:10
[12:00] <mabshoff> ==964== Source and destination overlap in strcpy(0x7FEFEE210, 0x7FEFEE210)
[12:00] <mabshoff> ==964==    at 0x4A06E47: strcpy (mc_replace_strmem.c:106)
[12:00] <mabshoff> ==964==    by 0x1C4ACEAF: feCleanUpPath(char*) (in /tmp/Work2/sage-2.8.1/sage-2.8.1/local/lib/libsingular.so)
[12:01] <mabshoff> ==964==    by 0x1C4AD8CB: feInitResource(feResourceConfig_s*, int) (in /tmp/Work2/sage-2.8.1/sage-2.8.1/local/lib/libsingular.so)
[12:01] <mabshoff> ==964==    by 0x1C4AE021: feInitResources(char*) (in /tmp/Work2/sage-2.8.1/sage-2.8.1/local/lib/libsingular.so)
[12:01] <mabshoff> ==964==    by 0x1C421768: siInit(char*) (in /tmp/Work2/sage-2.8.1/sage-2.8.1/local/lib/libsingular.so)
[12:01] <mabshoff> ==964==    by 0x1C122AAF: initmulti_polynomial_libsingular (multi_polynomial_libsingular.cpp:1103)
[12:01] <mabshoff> ==964==    by 0x49F3F2: _PyImport_LoadDynamicModule (importdl.c:53)
[12:01] <mabshoff> ==964==    by 0x49D2CE: import_submodule (import.c:2394)
[12:01] <mabshoff> ==964==    by 0x49D7A1: load_next (import.c:2214)
[12:01] <mabshoff> ==964==    by 0x49D9C3: import_module_level (import.c:1995)
[12:01] <mabshoff> ==964==    by 0x49DE34: PyImport_ImportModuleLevel (import.c:2066)
[12:01] <mabshoff> ==964==    by 0x47D268: builtin___import__ (bltinmodule.c:47)
[12:01] <mabshoff> Didn't you chase a bug in libSingular?
[12:01] <mabshoff> Anybody still alive?
[12:01] <william> i am
[12:01] <william> i think we're all just working on bugs :-)
[12:02] <mabshoff> okay.
[12:02] <mabshoff> But the -valgrind option works,
[12:02] <william> frickin awesome!!!!
[12:02] <mabshoff> and doesn't crash valgrind.
[12:02] <mabshoff> And " ==964== Source and destination overlap in strcpy(0x7FEFEE210, 0x7FEFEE210)"
[12:03] <mabshoff> might be a problem that Martin and I saw with libSingular on Opteron's in 64 bit mode.
[12:03] <william> cool.
[12:04] <robert457965> #430 -- fixed
[12:04] <william> how?
[12:04] <robert457965> at least, now factoring is implemented
[12:04] <robert457965> but the roots function for RDF needs to be improved
[12:04] <william> ok.
[12:04] <william> post a patch.
[12:07] <mabshoff> mmmh, just starting and quitting sage gives me the following:
[12:07] <mabshoff> =1024== LEAK SUMMARY:
[12:07] <mabshoff> ==1024==    definitely lost: 2,500 bytes in 1 blocks.
[12:07] <mabshoff> ==1024==      possibly lost: 276,902 bytes in 769 blocks.
[12:07] <mabshoff> ==1024==    still reachable: 130,181,755 bytes in 159,788 blocks.
[12:07] <mabshoff> ==1024==         suppressed: 0 bytes in 0 blocks.
[12:07] <mabshoff> ==1024== Use --leak-check=full to see details of leaked memory.
[12:07] <mabshoff> That's 130MB in limbo.
[12:07] <robert457965> #430 -- http://sage.math.washington.edu/home/rlmill/RDF_factor.patch
[12:10] <robert457965> funny for 53 bits of precision returning answers true up to about 5 bits
[12:11] <dmharvey> does anyone know the official definition of the range of the python int type? Is it the same as a C int or long?
[12:11] <dmharvey> it's just a C long right?
[12:12] <william> better look it up.
[12:12] <dmharvey> yeah I tried and couldn't find it
[12:12] <dmharvey> the best I can do is note that the C api seems to use "long" everywhere
[12:13] <william> robert457965 -- try directly using numpy's roots and try to track down where the precision loss is.
[12:13] <-- robertwb has left this server (Read error: 104 (Connection reset by peer)).
[12:13] <william> i pushed out robert457965's changes.
[12:14] <robert457965> closing ticket #430, creating a new one
[12:14] <william> good.
[12:14] <william> add it to the roadmap for today :-)
[12:14] <robert457965> #442
[12:15] <mabshoff> william - I set PYTHONSTARTUP=$SAGE_ROOT/local/bin/sage-valgrind-pythonstartup - now I don't get a sage prompt any more, but ">>>"
[12:16] <mabshoff> With sage-gdb-pythonstartup it works,
[12:16] <mabshoff> where should I look?
[12:16] --> robertwb has joined this channel (n=robert@c-67-171-19-168.hsd1.wa.comcast.net).
[12:16] <william> ?
[12:16] <william> >>> is Python's prompt.
[12:16] <william> the SAGE: prompt comes from using ipython.
[12:16] <mabshoff> Ok.
[12:16] <mabshoff> I copied sage-gdb and renamed it sage-valgrind.
[12:16] <mabshoff> Added a -valgrind option in sage-sage.
[12:17] <mabshoff> When PYTHONSTARTUP is set to *gdb* (as with the old sage-gdb script) everthing works as expected.
[12:17] --> ncalexan has joined this channel (n=user@d207-216-25-207.bchsia.telus.net).
[12:17] <mabshoff> But if I set it to *-valgrind* I loose the sage prompt and get the python one.
[12:18] <william> oh - you have to create correctly the file sage-valgrind-pythonstartup?
[12:18] <mabshoff> No, I just figured that out, too.
[12:18] <mabshoff> Should I just reused the *gdb* one?
[12:19] <william> i guess so.
[12:19] <mabshoff> ok.
[12:20] <ncalexan> 265: would it be enough to do return float(str(self.numer()).replace(' ', ''))
[12:20] <mabshoff> I will put a comment about that in sage-valgrind
[12:20] <robert457965> #211 is related to this root finding stuff, i've added that to the milestone too
[12:20] <ncalexan> In maxima.py:__float__?
[12:20] <william> ncalexan: please elaborate?
[12:21] <william> ahh. i missed your earlier remark.
[12:21] <robert457965> ncalexan -- you're on ticket #211
[12:21] <william> #265, i think.
[12:22] <william> n#265 -- it just works already.
[12:22] <william> weird.
[12:22] <william> for me at least.
[12:22] <ncalexan> 265: I will try it here.
[12:23] <william> yeah, for #265, it works for me already.
[12:23] <robert457965> #265 -- works here too
[12:24] <william> ok, closed.
[12:24] <ncalexan> Works here, Mac OS X 10.4, Intel Core2.
[12:24] <ncalexan> The maxima output is "better", but we still need a doctest for that behaviour.
[12:25] <william> i'm adding some right now.
[12:25] <ncalexan> Great!
[12:25] <william> hg_sage.pull() to get it.
[12:25] <mabshoff> Ok, for the valgrind option:
[12:25] <mabshoff> http://fsmath.mathematik.uni-dortmund.de/~mabshoff/patches/sage-valgrind
[12:26] <mabshoff> (the script itself)
[12:26] <mabshoff> http://fsmath.mathematik.uni-dortmund.de/~mabshoff/patches/sage-2.8.1-add_sage_-valgrind_option.patch
[12:26] <mabshoff> The patch for sage-sage.
[12:26] <william> ok.
[12:26] <ncalexan> william: I sent you a patch for sage-sage, -version etc, did it arrive?
[12:26] <mabshoff> lightly tested, still need to work on adding the --without-pymalloc option to the python spkg-install
[12:27] <william> ncalexan -- hold on.
[12:30] <william> mabshoff.
[12:30] <mabshoff> Yes
[12:30] <william> I applied your patch to hg_scripts and pushed it out.
[12:30] <ncalexan> Great!
[12:31] <mabshoff> Okay.
[12:31] <william> i made some changes and had to apply it manually.
[12:31] <mabshoff> really?
[12:31] <william> see http://www.sagemath.org/hg/scripts-main
[12:31] <mabshoff> I thought I used the current packages.
[12:31] <william> I moved the valgrind help message to the advanced section of the help, is all.
[12:32] <mabshoff> ok
[12:32] <william> ncalexan -- where is your patch.
[12:32] --> dmharvey_ has joined this channel (n=david@c-24-61-47-91.hsd1.ma.comcast.net).
[12:32] <ncalexan> My email must be broken, something is weird here.
[12:32] <mabshoff> I just created ticket #443: libSingular: Source and destination overlap in strcpy and assigned it to malb :-)
[12:33] <william> :-)
[12:33] <william> i hope he shows up later...
[12:33] <mabshoff> That should teach him not to show up in a bug fix session.
[12:33] <william> ncalexan: can you just post a link here or post something to trac?
[12:34] <mabshoff> The last time I didn't show up for a CoCoA meeting I got truly horrible tasks assigned.
[12:35] <william> nick -- got it.
[12:37] <ncalexan> william: yes, try http://www.sagemath.org:9002/sage_trac/ticket/433
[12:38] <william> nick -- got the patch, applied it, slightly changed it, and pushed it out.
[12:38] <william> do hg_scripts.pull()
[12:39] <william> I *can't* believe sage didn't have "sage -v" or "sage -root" until now.  Stupid.
[12:39] <william> thanks!
[12:40] <ncalexan> n/p.
[12:40] <robertwb> ok, update on the Py_ssize_t indexing stuff
[12:40] <robert457965> william - all numpy does to compute roots is compute eigenvalues of the companion matrix!
[12:41] <william> robert457965 -- yep.
[12:41] <robert457965> it makes a bad choice of casting at some point
[12:41] <robertwb> if you do "cdef Py_ssize_t k = o" it will call o.__index__
[12:41] <william> wow!
[12:41] <robert457965> actually, if you look at ticket 442, this is where
[12:42] <robertwb> but if Py_ssize_t is in the method signature, it calls __int__ deep in the python library due to PyArg_ParseTupleAndKeywords
[12:42] <robertwb> any thoughts?
[12:42] <william> it's an acceptable compromise for now.
[12:42] <william> but you should write up a trac entry about this and/or something for the cython page.
[12:43] <robertwb> ok
[12:43] <mhansen> william: I just sent a bundle fixing #342.
[12:44] <robertwb> it should be fairly easy to throw an error when parsing the tuple, but messing with the keywords it a bit worse
[12:45] <william> ok, i'm looking at #342 now.
[12:45] <dmharvey_> robertwb: I'm confused... I didn't think you could use type signatures like Py_size_t for keyword arguments
[12:46] <dmharvey_> robertwb: sorry, no you're right, one can do that
[12:47] <dmharvey_> robertwb: no, I'm still confused. Can you give me an example.
[12:48] <robertwb> dmharvey_: ok, for the row example
[12:48] <-- dmharvey has left this server (Read error: 110 (Connection timed out)).
[12:48] <robertwb> dmharvey_: def row(self, Py_ssize_t k)
[12:48] <william> mhansen: #342 -- great work.
[12:48] <robertwb> dmharvey_: suppose I call M.row(3.5)
[12:48] <william> i'm changing s_imag == None to "s_imag is None", which is slightly faster.
[12:48] <robertwb> dmharvey_: that would be an error, but M.row(k=3.5) would not...
[12:49] <dmharvey_> oh
[12:49] <robertwb> would this be a good thing?
[12:49] <mhansen> william: #342 -- sounds good.
[12:49] <william> mhansen #342 -- there's something screwey with base.
[12:49] <dmharvey_> no of course not; the behaviour at the user's end should be identical
[12:49] <william> you harcoded something for debugging and never put it in the inputs correctly.
[12:51] <william> mhansen -- only base 10 is supported, I think.
[12:51] <mhansen> william: That's what I thought since I didn't see base referenced anywhere in the ComplexField code.
[12:51] <william> yep.
[12:51] <mhansen> It could easily be added though.
[12:51] <william> hold on.
[12:51] <william> how?
[12:52] <robertwb> dmharvey_: of course, this would only be when int(x) != index(x)
[12:52] <william> mhansen -- ok, via mpfr.
[12:52] <dmharvey_> robertwb: well, this can happen, but it's a pretty borderline case
[12:53] <mhansen> william: Is that something that should be added?
[12:53] <william> definitely, if you want.
[12:53] <william> by the way I just made some minor changes.  Do hg_sage.pull() to get them.
[12:53] <william> Also, it would be good to add some doctests that illustrate what pad and min_prec do.
[12:53] <william> There aren't any now.
[12:53] <william> Could you do that and post another patch?
[12:54] <william> You can close #342 as fixed though :-).
[12:54] <dmharvey_> robertwb: so can the keyword thing be fixed? Like, is it a Cython issue or a Python issue? I don't totally understand the control flow when th keyword argument is passed like that.
[12:55] <mhansen> william: Sure thing.
[12:55] <robertwb> dmharvey_: Cython calls PyArg_ParseTupleAndKeywords... I actually think the keyword thing might have a hope of being fixed after all (looking into it now)
[12:55] <william> I'm going to work on #275 now -- i need something easy, since #274 is *really* nasty.
[12:56] <mabshoff> Can I invoke the analog of sage -testall from a running sage session.
[12:56] <mabshoff> The problem is that -testall and -valgrind don't mix.
[12:56] <william> sage -testall does a lot of stuff.  At the end of the day for each file it creaes
[12:56] <william> ...
[12:57] <william> see "sage -t -gdb filename.py" for what will probably get you what you want.
[12:57] <mabshoff> Okay. I will have a look.
[12:57] <william> i.e., sage -t filename.py creates .doctest_filename.py, and then does "python .doctest_filename.py".
[12:57] <william> YOu can run valgrind on that python.
[12:57] <mabshoff> i looked into sage-testall.
[12:58] <mabshoff> And I switched  "sage -t "$@" *" to "sage "$@" -t *"
[12:58] <mabshoff> But it doesn't work is $@=="-valgrind" :(
[12:59] <william> look in sage-doctest!
[13:00] <mabshoff> Okay.
[13:00] <william> (not meant as a shout if it sounded that way, btw)
[13:00] <dmharvey_> ok, I've got a reasonable solution for #440, I'll post the patch as soon as the doctests finish. Meanwhile has anyone got suggestions of what to look at next, or should I just pick something.....?
[13:01] <mabshoff> Well, I can always leave if I feel bullied :)
[13:01] <william> there is a massive memory leak in polynomial creation over the pari finite field.
[13:01] <william> #274.
[13:01] <mabshoff> I can see if I get some data on that.
[13:01] <dmharvey_> ok i'll have a look
[13:02] <william> I just posted another good example to http://www.sagemath.org:9002/sage_trac/ticket/274
[13:02] <william> I shamefully suspect
[13:02] <william> maybe something really dumb in gen.pyx.
[13:02] <william> I really really really hope to resolve #274 today, since this is a hugely embarassing bug, whatever it is.
[13:04] <mabshoff> Okay, valgrind is running with that example.
[13:04] <mabshoff> It will probably take a while.
[13:04] <william> excellent.
[13:05] <william> you can change the 10000 to 1000
[13:05] <william> it leaks 20-30mb with 10000 on my machine. :-(
[13:05] <mabshoff> Then I will just run start & quit under valgrind and diff the two logs.
[13:05] <mabshoff> Maybe something interesting will stand out.
[13:05] <mabshoff> I am running it on a webserver, so let's hope I don't OOM anything.
[13:09] <-- ncalexan has left this server (Read error: 110 (Connection timed out)).
[13:17] <dmharvey_> #440: posted patch for this, and some profiling data.
[13:17] <william> ok. i'll look in a minute.
[13:19] <robert457965> #442 -- precision is an issue for the eigen functions too
[13:19] <robert457965> sage: g = Matrix(RDF, [[0, -9],[1,6]]); g
[13:19] <william> looks like we have to try gsl then :-(
[13:19] <robert457965> [ 0.0 -9.0]
[13:19] <robert457965> [ 1.0  6.0]
[13:19] <robert457965> sage: g.eigen_left()
[13:19] <robert457965> ([3.00000003183, 2.99999996817]...
[13:19] <robert457965> where 0.0 == zero.zero
[13:20] <william> maybe the gsl real root finder is significantly better.
[13:21] <william> to use that, we'd add it maybe as a method for for ector over rdf (an underscored method)
[13:22] <william> ok, trac #275 is fixed (just a matter of doing a little better exception handling)
[13:23] <mabshoff> re #274:
[13:23] <mabshoff> A "plain" sage session:
[13:23] <mabshoff> ==2609== LEAK SUMMARY:
[13:23] <mabshoff> ==2609==    definitely lost: 2,500 bytes in 1 blocks.
[13:23] <mabshoff> ==2609==      possibly lost: 276,902 bytes in 769 blocks.
[13:23] <mabshoff> ==2609==    still reachable: 130,182,544 bytes in 159,833 blocks.
[13:23] <mabshoff> ==2609==         suppressed: 0 bytes in 0 blocks.
[13:23] <mabshoff> With William's example script:
[13:23] <mabshoff> ==2660== LEAK SUMMARY:
[13:23] <william> dmharvey -- what's trac-440.hg' a patch against?  i get unknown parent.
[13:23] <mabshoff> ==2660==    definitely lost: 2,767 bytes in 16 blocks.
[13:23] <mabshoff> ==2660==      possibly lost: 337,014 bytes in 893 blocks.
[13:23] <mabshoff> ==2660==    still reachable: 156,394,179 bytes in 203,126 blocks.
[13:23] <mabshoff> ==2660==         suppressed: 0 bytes in 0 blocks.
[13:23] <william> cna you send a text version?
[13:24] <mabshoff> The logs are roughly 5.5MB and 5.7MB respectively.
[13:24] <william> dmharvey_ -- #440 -- i can't apply your patch.
[13:24] <dmharvey_> oh
[13:25] <william> wait -- it's because I got it out of track.
[13:25] <william> maybe.
[13:25] <william> binary patches and track don't mix well.
[13:25] <dmharvey_> it's probably on top of the previous patch, sorry
[13:25] <william> that possible too.
[13:25] <dmharvey_> sorry I'll stick to text patches
[13:26] <dmharvey_> (I was concerned that my log message wasn't coming through on the text patch, but I might be wrong about that)
[13:26] <william> if you do hg_sage.send('...') its cumulative.
[13:26] <william> or you could email it to me.
[13:26] <william> that can happen with text patches.
[13:26] <dmharvey_> ok hang on
[13:26] <william> Do hg_sage.send('...') and email the bundle to me.
[13:26] <dmharvey_> ummm I've already switched branches and am in the middle of debugging something else, i'll send it by text
[13:27] <william> sure.
[13:28] <mabshoff> There are some intersting issues with pari for exmape:
[13:28] <mabshoff> For example we do not allocate 0.5 mb when instanciating libpari:
[13:29] <mabshoff> ==2609== 524,288 bytes in 1 blocks are still reachable in loss record 6,975 of 6,989
[13:29] <mabshoff> ==2609==    at 0x4A05809: malloc (vg_replace_malloc.c:149)
[13:29] <mabshoff> ==2609==    by 0xF990B2A: gpmalloc (in /tmp/Work2/sage-2.8.1/sage-2.8.1/local/lib/libpari-gmp.so.2)
[13:29] <mabshoff> ==2609==    by 0xF991BCE: pari_init_opts (in /tmp/Work2/sage-2.8.1/sage-2.8.1/local/lib/libpari-gmp.so.2)
[13:29] <mabshoff> ==2609==    by 0xFF07371: __pyx_f_3gen_12PariInstance___init__ (gen.c:20988)
[13:29] <mabshoff> ==2609==    by 0x459FB1: type_call (typeobject.c:436)
[13:29] <mabshoff> ==2609==    by 0x4156B2: PyObject_Call (abstract.c:1860)
[13:29] <mabshoff> ==2609==    by 0x47D801: PyEval_CallObjectWithKeywords (ceval.c:3433)
[13:29] <mabshoff> ==2609==    by 0xFF096E8: initgen (gen.c:27669)
[13:29] <mabshoff> ==2609==    by 0x49F3F2: _PyImport_LoadDynamicModule (importdl.c:53)
[13:29] <mabshoff> ==2609==    by 0x49D2CE: import_submodule (import.c:2394)
[13:29] <mabshoff> ==2609==    by 0x49D7A1: load_next (import.c:2214)
[13:29] <mabshoff> ==2609==    by 0x49D9FE: import_module_level (import.c:2002)
[13:30] <mabshoff> Mhh, we actually do that one *twice*
[13:30] <dmharvey_> ok, the text patch is at /home/dmharvey/patches/trac-440.patch; the log message should be approximately "add new mpz_get_pyintlong() function which returns either python int (fast!) or python long if it doesn't fit; change some Integer methods to use this new function"
[13:31] <william> how are you making patches by the way?
[13:31] <william> hg_sage.export(...) makes them and they contain the comments, etc. 
[13:32] <robert457965> #442 -- i'm closing this ticket, since it is part of #211.
[13:32] <robert457965> The example on GSL's page is much more accurate than numpy's output.
[13:33] <william> ok.
[13:33] <william> #440 -- david I'm applying your patch now.
[13:33] <dmharvey_> usually I make them from the command line, using "hg bundle" or "hg export" or sometimes just "hg diff" to a file
[13:34] <dmharvey_> I don't usually use hg_sage.export() since I'm not usually in a sage session
[13:34] <william> hg_sage.export is the same as "hg export".  
[13:34] <william> it is better than "hg diff", since it includes the comments.
[13:34] <dmharvey_> ok
[13:34] <mabshoff> Ok, here is an allocation for 100MB for the stack of a pari instance:
[13:34] <mabshoff> ==2660== 100,000,000 bytes in 1 blocks are still reachable in loss record 7,200 of 7,200
[13:34] <mabshoff> ==2660==    at 0x4A05809: malloc (vg_replace_malloc.c:149)
[13:34] <mabshoff> ==2660==    by 0xFEE00BA: __pyx_f_3gen_init_stack (gen.c:25497)
[13:34] <mabshoff> ==2660==    by 0xFF0744D: __pyx_f_3gen_12PariInstance___init__ (gen.c:21006)
[13:34] <mabshoff> ==2660==    by 0x459FB1: type_call (typeobject.c:436)
[13:34] <mabshoff> ==2660==    by 0x4156B2: PyObject_Call (abstract.c:1860)
[13:35] <mabshoff> ==2660==    by 0x47D801: PyEval_CallObjectWithKeywords (ceval.c:3433)
[13:35] <william> #440 is closed -- and i've applied and pushed your patch out david.
[13:35] <mabshoff> ==2660==    by 0xFF096E8: initgen (gen.c:27669)
[13:35] <mabshoff> ==2660==    by 0x49F3F2: _PyImport_LoadDynamicModule (importdl.c:53)
[13:35] <mabshoff> ==2660==    by 0x49D2CE: import_submodule (import.c:2394)
[13:35] <mabshoff> ==2660==    by 0x49D7A1: load_next (import.c:2214)
[13:35] <mabshoff> ==2660==    by 0x49D9FE: import_module_level (import.c:2002)
[13:35] <mabshoff> ==2660==    by 0x49DE34: PyImport_ImportModuleLevel (import.c:2066)
[13:35] <mabshoff> Does __pyx_f_3gen_init_stack have a matching deallocation?
[13:35] <william> mabshoff -- yes, on initialization we allocate 100MB for the stack.
[13:35] <mabshoff> Could we dealloc that upon exiting sage?
[13:35] <william> It doesn't.
[13:36] <william> I'll put in code to do that now.
[13:36] <william> It goes in sage/sage/libs/pari/gen.pyx, probably right below the first __init__ in that file.
[13:36] <mabshoff> This is just like valgrinding LinBox: In the beginning the was so much noise I couldn't find the bugs I was hunting.
[13:36] --> agc has joined this channel (n=agc@0-90-4b-99-db-6a.dynamic.ucsd.edu).
[13:36] <william> hi agc!
[13:36] <william> where are you at?
[13:36] <mabshoff> So this might be a somewhat longer process, but in the end it should pay off.
[13:36] <robert457965> i'm working on #206 now
[13:37] <agc> hi, im at the ucsd library
[13:37] <william> there's an irc log for today here: http://www.sagemath.org:9001/bug1/irc
[13:37] <william> how was the surfing this morning :-)
[13:37] <william> i almost went to the beach 
[13:37] <agc> actually i seen most of it because dorian logged on earlier ...
[13:38] <william>   ok, good.
[13:38] <william> you might like this bug: http://www.sagemath.org:9002/sage_trac/ticket/206
[13:38] <william> it's in your code, I think.
[13:38] <mabshoff> Ooh, the log is life, pretty cool.
[13:38] <william> David harvey reported it.
[13:39] <william> I just updated the log by hand.
[13:39] <mabshoff> Okay, would have been cool, though.
[13:39] <william> indeed.
[13:39] <mabshoff> Re the leak with the 10.000 repeats:
[13:39] <mabshoff> ==2660== 23,450,392 bytes in 20,008 blocks are still reachable in loss record 7,199 of 7,200
[13:39] <mabshoff> ==2660==    at 0x4A05809: malloc (vg_replace_malloc.c:149)
[13:39] <mabshoff> ==2660==    by 0xFF04187: __pyx_f_3gen__new_gen (gen.c:25711)
[13:39] <mabshoff> ==2660==    by 0xFF043FD: __pyx_f_3gen_12PariInstance_new_gen (gen.c:21826)
[13:40] <mabshoff> ==2660==    by 0xFEFD4D2: __pyx_f_3gen_3gen__mul_c_impl (gen.c:1527)
[13:40] <mabshoff> ==2660==    by 0xE1DEFAD: __pyx_f_7element_11RingElement__mul_c (element.c:8801)
[13:40] <mabshoff> ==2660==    by 0xE1CF814: __pyx_f_7element_11RingElement___mul__ (element.c:8383)
[13:40] <mabshoff> ==2660==    by 0x41597C: binary_op1 (abstract.c:398)
[13:40] <mabshoff> ==2660==    by 0x419107: PyNumber_Multiply (abstract.c:669)
[13:40] <mabshoff> ==2660==    by 0x481113: PyEval_EvalFrameEx (ceval.c:1072)
[13:40] <mabshoff> ==2660==    by 0x48627F: PyEval_EvalCodeEx (ceval.c:2831)
[13:40] <mabshoff> ==2660==    by 0x4CFAA7: function_call (funcobject.c:517)
[13:40] <mabshoff> ==2660==    by 0x4156B2: PyObject_Call (abstract.c:1860)
[13:40] <mabshoff> looks interesting.
[13:41] <william> yep.
[13:41] <mabshoff> Valgrind rocks. Don't leave home without it :)
[13:42] <dmharvey_> #274: just noting that if A = K(1), then you can get the leak by just repeating R(A), not necessary to do R([1]), so it's probably not in the field coercion code itself, it really has something to do with the polynomials
[13:42] <robert457965> #206 - closed. patch at http://sage.math.washington.edu/home/rlmill/xmin.patch
[13:42] <william> yep.
[13:43] --> dmharvey has joined this channel (n=david@c-24-61-47-91.hsd1.ma.comcast.net).
[13:46] <william> agc -- never mind about 206 -- it just got fixed.
[13:47] <agc> oh, i was messing with it ... what exactly changed?
[13:47] <william> it's the patch tahar robert just posted 5 minutes ago above.
[13:48] <william> HOWEVER -- robert457965 didn't post any doctests that illustrate the bugfix.
[13:48] <william> do hg_sage.pull() to get all the fixes so far, including Robert's.
[13:49] <robert457965> my original thinking was that the plot will show either way, but now i realize you can still get xmin etc.
[13:50] <agc> my 2.8.1 build just finish any second now ... ill pull then
[13:51] <agc> where 'second' <= oo
[13:54] [CTCP] Received Version request from freenode-connect.
[13:54] [Notice] -NickServ- This nickname is owned by someone else
[13:54] [Notice] -NickServ- If this is your nickname, type /msg NickServ IDENTIFY <password>
[13:54] --> You have joined the channel #sage-devel (n=was@206.135.48.98).
[13:54] [Error] sage-dev: No such channel.
[13:54] <william> robertwb -- with your cython patch is trac #190 now fixed.
[13:54] <robert457965> yeah, those are all my fault
[13:54] *** Channel modes: secret, no messages from outside
[13:54] *** This channel was created on 08/17/2007 01:03:33 PM.
[13:54] <robertwb> yep
[13:55] <william> excellent.  i'll close it.
[13:56] <william> status report time!
[13:56] <william> everybody write a sentence about what they're doing right now.  i'll paste it into the wiki.
[13:56] <-- d has left this server (Read error: 110 (Connection timed out)).
[13:56] <william> william -- scanning the bug list looking for something to do before I face #274 again.
[13:56] <mabshoff> Looking at #201
[13:56] --> d has joined this channel (n=dorian@0-19-7e-b-85-6c.dynamic.ucsd.edu).
[13:56] <robert457965> agc - GraphicPrimitives don't have xmin xmax ymin ymax?
[13:56] <mhansen> william: I'm looking at 337, but it seems to be fixed already.
[13:57] <william> william -- ok, i'll look at #201 with mabshoff.
[13:57] <robert457965> still working on 206
[13:58] <william> mhansen -- I'll close that one.
[13:58] <mabshoff> I hope that valgrind will turn something up on valgrind.
[13:58] <mabshoff> I also found another alloc/dealloc problem relevant to #274
[13:59] <dmharvey> i'm currently trying to understand the code flow for #274
[13:59] <agc> yeah ... the xmax, ymin, ... only are for the axes
[13:59] <mabshoff> I could upload the logs to sage.math/mabshoff if you want to have a look curself.
[13:59] <william> sure.
[13:59] <-- dmharvey_ has left this server (Read error: 110 (Connection timed out)).
[13:59] <robert457965> agc - now i see the subtlety
[14:00] <robertwb> fixing the Py_ssize_t issue for keywords in cython
[14:00] <robert457965> append doesn't add a graphics object to another, it adds a primitive to the graphics object's list
[14:00] * pauloliviersage still working on #439
[14:00] <mabshoff> ==2660== 1,760,704 bytes in 20,008 blocks are still reachable in loss record 7,196 of 7,200
[14:00] <mabshoff> ==2660==    at 0x4A05809: malloc (vg_replace_malloc.c:149)
[14:00] <mabshoff> ==2660==    by 0x4B1489: _PyObject_GC_Malloc (gcmodule.c:1321)
[14:01] <mabshoff> ==2660==    by 0x455D09: PyType_GenericAlloc (typeobject.c:454)
[14:01] <mabshoff> ==2660==    by 0xE1BF810: __pyx_tp_new_7element_Element (element.c:17242)
[14:01] <mabshoff> ==2660==    by 0xE1BF940: __pyx_tp_new_7element_ModuleElement (element.c:17417)
[14:01] <mabshoff> ==2660==    by 0xE1BF9C0: __pyx_tp_new_7element_RingElement (element.c:17570)
[14:01] <mabshoff> ==2660==    by 0xFEDAC50: __pyx_tp_new_3gen_gen (gen.c:26726)
[14:01] <mabshoff> ==2660==    by 0xFF041E9: __pyx_f_3gen__new_gen (gen.c:25823)
[14:01] <mabshoff> ==2660==    by 0xFF043FD: __pyx_f_3gen_12PariInstance_new_gen (gen.c:21826)
[14:01] <mabshoff> ==2660==    by 0xFEFD4D2: __pyx_f_3gen_3gen__mul_c_impl (gen.c:1527)
[14:01] <mabshoff> ==2660==    by 0xE1DEFAD: __pyx_f_7element_11RingElement__mul_c (element.c:8801)
[14:01] <mabshoff> ==2660==    by 0xE1CF814: __pyx_f_7element_11RingElement___mul__ (element.c:8383)
[14:01] <mabshoff> is the other interesting one.
[14:02] <robert457965> william - can you roll back changeset 5784?
[14:03] <mhansen> william: 316 works for me as well.
[14:03] <mabshoff> http://sage.math.washington.edu/home/mabshoff/sage.2609 is the valgrind log of sage just starting and quitting
[14:03] <mabshoff> (5.5MB!)
[14:04] <mabshoff> http://sage.math.washington.edu/home/mabshoff/sage.2660 is the valgrind log with the last example from #274 (5.6MB!)
[14:05] <william> robert457965 -- rollback complete.
[14:05] <robert457965> sorry bout that
[14:07] <agc> robert457965, so is #206 actually a bug? what do you think
[14:07] <robert457965> agc - there's definitely something to do
[14:07] <robert457965> i see three ways to go
[14:07] <mabshoff> william - how do I enter the curve fom #201 directly into mwrank?
[14:07] <robert457965> the original intent was for the user never to see primitives, right?
[14:08] <robert457965> so theoretically every primitive should have a Graphics object for a wrapper, and those keep track of the xmin xmax ymin ymax sutff
[14:08] <dmharvey> #274: aah. If I create a poly by a = K(1) or a = K.gen() and then repeatedly R([a], check=False), I don't get any leaks
[14:08] <mabshoff> :)
[14:09] <agc> yeah ... that sound right
[14:09] <william> mabshoff: echo "[0,0,0,3,-15675]" | mwrank
[14:09] <robert457965> the actual bug is the fact that you can create two primitives by hand, append them to a graphics object, plot, and see nothing
[14:09] <mabshoff> ok
[14:09] <william> dmharvey -- very very interesting!
[14:09] <mabshoff> I am clueless about algebraic geometry.
[14:10] <william> i spent a year doing almost nothing but exercises in algebraic geometry... (at Berkeley)
[14:10] <robert457965> option 1 - be adamant about using factories, and do nothing ( i don't think this is a good idea )
[14:10] <william> but i still often feel clueless about it.
[14:10] <robert457965> option 2 - give every primitive an xmax etc function to be called by append
[14:10] <mabshoff> Found a bug in mwrank:
[14:10] <mhansen> william: #316 works for me.
[14:10] <mabshoff> Mismatched free() / delete / delete []
[14:11] <robert457965> option 3 - in append, somehow produce the graphics object instead of the primitive, then simply add them
[14:11] <robert457965> what do you think?
[14:11] <william> mhansen -- cool I'll try it.  i'm glad it's fixed!
[14:11] <william> mabshoff -- awesome.  report it to john cremona (and put it in trac -- he uses our trac now and has an account)
[14:12] <william> mhansen -- yep that can be closed.  I'll add a doctest though.
[14:13] <agc> ok ... im looking at the source ... trying to figure out whats best
[14:13] <william> wait -- actually that is a doctest already.  so #316 is done.
[14:13] <robert457965> i'm in favor of option 2
[14:13] <mabshoff> I can probably make a patch and try to fix the problem.
[14:14] <william> even better.
[14:14] <mabshoff> It is pretty primitive - I have seen plenty of those before.
[14:16] <-- d has left this server (Read error: 104 (Connection reset by peer)).
[14:16] --> d has joined this channel (n=dorian@0-19-7e-b-85-6c.dynamic.ucsd.edu).
[14:20] <mhansen> william: 291 looks like it has been fixed
[14:22] <william> mhansen -- it's not really fixed.
[14:23] <william> The thing that caused that problem was generic.
[14:23] <william> polys over QQ use libsingular now, so have custom printing, which doesn't have that problem.
[14:23] <william> The GENERIC code still has the problem -- I give an example in the trac now.
[14:23] <william> That said, the output isn't wrong, just not as pretty, so I changed it from bug to enhancement request.
[14:23] <william> ok?
[14:24] <william> hi.  Please everybody look at http://www.sagemath.org:9002/sage_trac/roadmap
[14:24] <william> I went through and linked every trac issue to this milestone.
[14:24] <william> The top green bar gives our "current score".
[14:24] <mhansen> william: sounds good
[14:24] <william> You can also click on the little numbers below it to see the open and closed issues.
[14:25] <william> e.g., this is what's left:
[14:25] <william> http://www.sagemath.org:9002/sage_trac/query?status=new&status=assigned&status=reopened&milestone=sage-2.8.2
[14:25] --> yi has joined this channel (n=yi@pool-71-112-16-218.sttlwa.dsl-w.verizon.net).
[14:25] <robert457965> yi - wassup!?
[14:25] <yi> hey
[14:25] <william> hey yi!
[14:26] <yi> afternoon guys
[14:26] <mabshoff> hello
[14:26] <yi> robert457965: want to work on that dsage thing you were telling me about?
[14:26] <william> yi -- there is an irc log here http://www.sagemath.org:9001/bug1/irc
[14:26] <robert457965> definitely
[14:26] <robert457965> i was hoping you would be on today
[14:27] <yi> robert457965: what's the trac ticket again?
[14:27] <robert457965> 431
[14:27] <robert457965> there's not much info there yet
[14:28] <robert457965> agc - i think the best thing to do is implement an xmin(), xmax(), etc. function for each primitive, so that Graphic.append() can call that function no matter what
[14:28] <robert457965> i'm going to start working on this dsage bug
[14:28] <robert457965> yi- so when it was hanging before, i had the server and client on sage.math, and the workers on Tom's computer
[14:29] <dmharvey> #274: If I remove the call to __normalize() in Polynomial_generic_dense.__init__(), then the memory leak goes away.
[14:29] <dmharvey> #274: must be getting very close now.
[14:29] <yi> robert457965: ok cool, can we get the same set up?
[14:29] <william> ok, i'm getting back to #274 then.  that is getting exciting.
[14:30] <dmharvey> :-)
[14:30] <william> hg_sage.pull() gets you up to date with us, I think.
[14:30] <robert457965> everything is still up to date
[14:30] <dmharvey> is Py_ssize_t a signed type?
[14:30] <robert457965> that is, i left things where they were on each computer when it stopped
[14:30] <william> yes.
[14:31] <dmharvey> well that doesn't help does it!!! :-)
[14:31] <william> ?
[14:31] <william> oh shit.
[14:31] <william> (excuse language)
[14:31] <yi> it's ok, it's IRC :)
[14:31] <mabshoff> damn you
[14:32] <yi> robert457965: i msg'ed you, we can talk there, less noise
[14:32] <mabshoff> Yes, people seem to be capable of spelling words correctly and nobody speaks l33t
[14:32] <yi> robert457965: if you're using irssi just do /query yi and it should open a new window
[14:33] <william> dmharvey: confirmed that the memory leak goes away -- so  its in __normalize.
[14:33] <mhansen> william: 393 is simply due to the rational 1/2 not being preparsed
[14:34] <william> you're right -- that's just lack of understanding the unfortunate subtleties of sage vs python.
[14:34] <william> could you make a remark and close the bug.
[14:35] <mhansen> Will do.
[14:35] <william> (*and* email jon hanke.)
[14:36] <robert457965> yi - i'm waiting there
[14:37] <yi> i messaged you, are you getting the messages?
[14:38] <robert457965> i'm getting everything
[14:38] <robert457965> here, other room, gmail chat
[14:38] <robert457965> pick a venue
[14:39] <william> ??
[14:39] <dmharvey> #274: I think it's in is_zero()
[14:39] <william> #274: that's what I think too
[14:41] <agc> robert457965, i starting to think that all we want append to to what __add__ does? thoughts
[14:41] <robert457965> the problem with that is that a graphics primitive doesn't have __xmin
[14:42] <robert457965> that's ultimately what we want, but we need the primitive to be able to report its xmin etc
[14:42] <william> #274 -- dmharvey:
[14:42] <william> n = pari('x')
[14:42] <william> s = get_memory_usage()
[14:42] <william> for i in range(10^5):
[14:42] <william>     _ = n.is_zero()
[14:42] <william> print get_memory_usage() - s
[14:42] <william> 4.55859375
[14:42] <dmharvey> :-)
[14:42] <william> but with n = pari(1) that doesn't happen.
[14:43] <agc> i guess that is the thing, you never 'show' or 'save' a primitive, so the __xmin, etc shouldn't come into to play?
[14:43] <dmharvey> well the implementation of is_zero for the finite field element seems to be "return not x"
[14:43] <agc> i could be off my rocker though
[14:43] <dmharvey> which is calling __nonzero__()
[14:43] <william> 
[14:43] <dmharvey> and that seems to leak too
[14:43] <william> let's focus on pari -- that's the core of the problem.
[14:43] <william> there's an stoi in there that looks dangerous.
[14:44] <william> line 897 of sage/libs/pari/gen.pyx
[14:44] <mabshoff> Re mwrank with [0,0,0,3,-15675]:
[14:44] <mabshoff> found points of rank 2
[14:44] <mabshoff>   and regulator 16.9955132982626
[14:44] <mabshoff> Processing points found during 2-descent...done:
[14:44] <mabshoff>   now regulator = 16.9955132982626
[14:44] <mabshoff> Saturating (bound = 100)...RR: division by zero
[14:44] <william> yep bool(n) leaks memory for n in pari.
[14:45] <william> mabshoff -- did you see that cremona attached two files that are supposed to fix the error in that example?
[14:45] <william> it's near the bottom.
[14:45] <mabshoff> So I get little further, but there are issues qsieve::search()
[14:45] <mabshoff> Nope, not yet.
[14:45] <mabshoff> I will have a look.
[14:45] <william> ut oh.
[14:45] <william> let me forward you an email from him.
[14:45] <dmharvey> #274: what is stoi()?
[14:46] <william> time for mabshoff to laugh at us (=me).
[14:46] <mhansen> dmharvey: usually string to integer
[14:46] <william> mabshoff -- i just emailed cremona's email to you -- it has a fix I think for that mwrank bug, maybe.
[14:46] <william> yep.
[14:46] <mabshoff> Ok, there is a new options.h and a realroot.cc
[14:47] <mabshoff> I will check, there was a problem in vec.cc
[14:47] <dmharvey> #274: well this expression "bool(self.g != stoi(0))" makes absolutely no sense to me
[14:47] <william> yep.
[14:47] <dmharvey> it makes a negative amount of sense
[14:47] <dmharvey> an imaginary amount
[14:47] <mabshoff> Ok, but the code still needs the fixes for the leaks in vec.cc.
[14:47] <william> i can't imagine what idiot could have written that (me)
[14:47] <dmharvey> :-)
[14:47] --> pdenapo has joined this channel (n=pdenapo@201.255.43.149).
[14:48] <dmharvey> well, I guess that's where the bug is, but I don't know how to fix it, since I don't know much about PARI programming
[14:48] <william> self.g is a PARI Gen object.
[14:49] <william> stoi(0) is god only knows.
[14:49] <dmharvey> and C doesn't have any operator overloading, so I don't see how comparing self.g to anything makes sense
[14:49] <william> we should probably look in the pari source code or something.
[14:49] <william> or the library reference manual.
[14:49] <dmharvey> I actually better get going, but if you like I can note down these findings on the trac page?
[14:49] <william> or just have bool compare to 0.
[14:49] <william> which makes sense, right?
[14:50] <william> pari has gcmp
[14:50] <dmharvey> yeah it has to be a function call somehow
[14:50] <dmharvey> this should also be made very fast
[14:50] <dmharvey> if possible
[14:51] <william> the function names are in decl.pxi
[14:52] <william> gcmp0 looks good
[14:53] <agc> robert457965, actually maybe append shouldn't exist, what is the benefit why the __add__ method does everthing you would want when combining graphics ... the primitives are lower level and probably should be private
[14:53] <dmharvey> william: I bet you were trying to compare the string representation of the PARI object to "0", and it must have been very very late at night
[14:54] <dmharvey> #274: I've noted down progress on the #274 trac page
[14:54] <dmharvey> but I really should call it a day
[14:54] <william> weirdness.  using gcmp0 still leaks.
[14:54] <william> ok -- thanks for all your help dmharvey.  cu
[14:54] <agc> yi and robert457965 are you guys off talking about twisted somewhere??? i want in ;)
[14:54] <dmharvey> ok bye
[14:54] <-- dmharvey has left this channel.
[14:55] <-- d has left this server (Read error: 104 (Connection reset by peer)).
[14:55] --> d has joined this channel (n=dorian@0-19-7e-b-85-6c.dynamic.ucsd.edu).
[14:56] <yi> agc: hey man
[14:56] <agc> yi: yo
[14:56] <robert457965> agc - you'll have to rewrite each of the Factory functions
[14:57] <yi> agc: we're not doing anything twisted related right now, just dsage debugging
[14:57] <mabshoff> Ok, mwrank no longer crashes with the example from #201
[14:57] <agc> ok, im a twisted nerd ... its the bestest
[14:58] <mabshoff> That is with the fixes in trac, plus a patch by me that fixes some delete vs. delete[] issues.
[14:58] <mabshoff> There is still work to be done:
[14:58] <mabshoff> ==7030== LEAK SUMMARY:
[14:58] <mabshoff> ==7030==    definitely lost: 4,536 bytes in 162 blocks.
[14:58] <mabshoff> ==7030==      possibly lost: 192 bytes in 3 blocks.
[14:58] <mabshoff> ==7030==    still reachable: 119,257 bytes in 195 blocks.
[14:58] <mabshoff> ==7030==         suppressed: 0 bytes in 0 blocks.
[14:58] <mabshoff> ==7030== Use --leak-check=full to see details of leaked memory.
[15:01] <william> hi -- #274 -- regarding my stupid stoi thing in __bool__; it wasn't
[15:01] <william> the problem, since Python doesn't even have a __bool__ -- that code
[15:01] <william> never got run.
[15:01] <william> Python has __nonzero__ instead.
[15:01] <mabshoff> :(
[15:01] <mhansen> william: I sent a bundle for #392.
[15:05] <william> mhansen -- got it.
[15:08] <mabshoff> william - I am making an updated mwrank.spkg so that we can close 201.
[15:08] <william> nice. thanks!!
[15:09] <william> mhansen -- looking at your patch
[15:09] <mhansen> william: the only thing I was iffy about was the ndigits thing.
[15:10] <agc> i just realized the root of the problem, each Graphics type changes the axes in different ways ... so to keep plots looking nice we ajust the axes on a case by case basis
[15:14] <william> mhansen - what if the object has a round method that could take ndigits?
[15:14] <mhansen> william: I didn't see any objects with methods like that.
[15:14] <william> no but your new code won't even call it.
[15:15] <william> by the way, if a is a real_mpfr element then a.round says it rounds "to the nearest real".
[15:15] <robert457965> agc - what should be done as a solution?
[15:15] <robert457965> i'm wondering why david h was appending graphic primitives in the first place
[15:15] <william> mhansen -- then there are four examples that have nothing to do with the round method!
[15:17] <agc> the __add__ method does everything one would want ... maybe lets just remove the append method ...
[15:18] <william> mhansen -- ok, overall i'm ok with the new round.  
[15:18] <william> i'm going to fix the docs in the round mpfr method though.
[15:18] <mhansen> Sounds good.
[15:19] <william> actually, could you fix the example in real_mpfry.py?
[15:20] <william> in each, give an actual rounding example calling round.
[15:20] <robert457965> agc - since it only does one thing anyway...
[15:20] <william> mhansen -- do hg_sage.pull() first.
[15:20] <mabshoff> I build a new mwrank.spkg - see http://sage.math.washington.edu/home/mabshoff/mwrank-20070818.spkg
[15:20] <mabshoff> This fixes #201 for me.
[15:20] <mhansen> william: sure
[15:20] <william> thanks!  I want to integrate some more patches and get back to that memory leak.
[15:21] <william> mabshoff -- i'm trying it now.
[15:21] <mabshoff> I did put in John's fixes plus the deleted patch I wrote.
[15:21] <mabshoff> I put my patch in trac, too, and I will write an Email to John.
[15:21] <william> make sure you send him the deleted patch you wrote.  he'll greatly appreciate it.
[15:21] <william> thanks.
[15:22] <mabshoff> The following is the changelog:
[15:22] <mabshoff> *20070818:
[15:22] <mabshoff> * added corrected options.h and realroots.cc by (John Cremona)
[15:22] <mabshoff> * corrected delete operators in vec.cc (by Michael Abshoff)
[15:23] <william> mhansen -- i made that documentation thing you're doing now http://www.sagemath.org:9002/sage_trac/ticket/447
[15:23] <mabshoff> There might be some timestamp problem as usual, I should really set the correct time on that box.
[15:24] <william> from pari-dev just now for a new cvs release: "
[15:24] <william> The memory model was preserved so we essentially get the same set of
[15:24] <william> bugs as with GP 2.3.
[15:24] <william> "
[15:26] <william> yep, #201 is closed!
[15:26] <mabshoff> boojjay
[15:27] <mabshoff> 16 closed, 22 tickets to go.
[15:27] <mabshoff> Mmmh. What should I do next.
[15:27] <mabshoff> ?
[15:28] <william> do the other 22 :-)
[15:28] --> alfredo has joined this channel (n=alfredo@ool-43578299.dyn.optonline.net).
[15:29] <-- alfredo has left this server (Client Quit).
[15:30] <mabshoff> Maybe, I will have a look which one is to my linking and expertise.
[15:31] <william> exactly.
[15:31] <mabshoff> Next time you talk why Sage is better than the closed competition post some part of the log demonstrating collaboration from people all over the place.
[15:32] <william> :-)
[15:32] <william> it's really neat.
[15:32] <william> by the way, agc -- alex -- do you have dinner plans?
[15:32] <mabshoff> Yeah, this is even more fun than just with 2 or 3 people.
[15:33] <agc> no
[15:33] <agc> any ideas?
[15:33] <william> want to meet for dinner in 3 or 4 hours?
[15:33] <william> say 7pm -- wired cafe?
[15:34] <agc> sure, where is the wired cafe?
[15:34] <william> renaissance shopping center.
[15:34] <william> near walgreen's, a japanese rest, etc., 
[15:34] <agc> is that by UTC?
[15:35] <william> yes.
[15:35] <william> down the hill.
[15:35] <william> http://outside.in/places/wired-cafe-le-bistro-san-diego
[15:36] <agc> ok, yeah
[15:39] <pdenapo> exiexit
[15:39] <-- pdenapo has left this server ("Leaving").
[15:39] <agc> so william, robert457965 can we just remove the append method, or make it do exactly what __add__ does for ticket#206?
[15:39] <william> I like making it do exactly what __add__ does.
[15:40] <robert457965> second option doesn't work, since each primitive has it's own way of doing stuff
[15:40] <robert457965> rather, in order to do that, each primitive needs an xmin() function
[15:40] <william> mmaybe each primitive should have an xmin function?
[15:40] <william> with some sort of default.
[15:41] <william> (in the base class).
[15:41] <robert457965> -1, 1, -1, 1?
[15:41] <william> basically for the primitives defined by a collection of points (which is a lot of them), this
[15:41] <william> is easy.
[15:41] <william> for others, e.g., a circle, maybe you have to do a little math.
[15:41] <robert457965> networkx primitives have _xmin
[15:41] <robert457965> arrow primitives have them too for some reason
[15:41] <william> but a default of -1 might be ok in the base class.
[15:41] <william> for text xmin could be hard..
[15:44] <robert457965> how does the graphics object for a text primitive get xmin and xmax?
[15:46] <agc> it take the (x, y) position of the text and then gets added some padding
[15:48] <-- d has left this server (Read error: 104 (Connection reset by peer)).
[16:04] <mhansen> william: sent a bundle for #447
[16:05] <william> thanks.  I'll try it momentaril.
[16:05] <mabshoff> I just looked at #160
[16:06] <william> i'm hard at work on #303.
[16:06] <william> I know how to fix it now...
[16:06] <william> (i mean #304)
[16:06] <mabshoff> 303 or 160?
[16:06] <mabshoff> sage: n = 15
[16:06] <mabshoff> > sage: time  P = partitions_set(range(n),3)
[16:06] <william> 160 -- that looks venerable.
[16:06] <mabshoff> Well, the problem is that the result seems to be huge.
[16:06] <mabshoff> gap uses ~800 mb,
[16:06] <william> yep.
[16:07] <mabshoff> sage killed itself around 4.5GB because Swap ran out.
[16:07] <william> we should add a protocol to the gap interface so we can get the value
[16:07] <william> of a variable back out via a file.
[16:07] <william> that would be a fix.
[16:07] <william> so, e.g., if a = gap('2^10000'), then one should have the option to do:
[16:07] <william> b = a.str_via_file()
[16:08] <william> it would then do gap.eval('commadn to write a.name() to file')
[16:08] <mhansen> I have new set partitions code that doesn't use GAP.
[16:08] <william> read the file
[16:08] <william> mhansen -- but of course mhansen's new package would kick the but of that ...
[16:08] <william> :-)
[16:08] <mabshoff> The box I ran the code on has been swapping back in for a while now.
[16:08] <william> maybe you shoudl submit that code all as a bugfix for #160.
[16:09] <william> :-)
[16:10] <mabshoff> But there might be a leak in there somewhere:
[16:10] <mabshoff> Virtual memory is 4191m  while residential is 878m
[16:11] <mabshoff> That is in the Sage part of the computation.
[16:12] <william> very interesting.
[16:16] <william> mhansen -- nice docs for round!
[16:17] <robert457965> is anyone else having problems looking at the active tickets?
[16:17] <william> wait -- mhansen -- why do you define R?
[16:17] <mabshoff> Hehe, the box came back with a loadd of 30 :)
[16:17] <mabshoff> I won't to that on production systems again .
[16:18] <william> mhansend -- i deleted a spurious "        cdef RealField R = self.parent()"
[16:19] <mhansen> Oops -- sorry about that.  That was from when I was thinking about it using the parent's rounding mode.
[16:21] <-- yi has left this server (Read error: 110 (Connection timed out)).
[16:21] <william> ok, i've applied your patch, modified it some and pushed it out.  and updated trac.
[16:22] <william> robertwb -- are you around?
[16:22] <robertwb> yeah
[16:22] <william> If so, could you just decide this cython-related issue is not worth our trouble?
[16:22] <william> http://www.sagemath.org:9002/sage_trac/ticket/227
[16:23] <william> i want to mark it off the list, but you're the cython man.
[16:23] <william> what do you think?
[16:24] <william> mabshoff -- are you still looking at #160?
[16:25] <william> if so, if you can figure out how to write a variable to a file in gap, I could probably write some
[16:25] <william> code to do what I suggested above.
[16:25] <robertwb> I think using NULL rather than 0 in the code shouldn't be too hard
[16:25] <william> should we do it though?
[16:25] <robertwb> but it certainly isn't a "major" bug
[16:25] <robertwb> I think so
[16:25] <william> i'll change it to an enhancement.
[16:25] <robertwb> ok
[16:25] <mabshoff> I am just surprised that sage eats a mutliple of the memory gap uses.
[16:26] <mabshoff> Probably because of string vs. binary representation of the result.
[16:26] <william> the comm between sage and gap is via a pseudo-tty.  so there's lots of text, buffers, etc.
[16:26] <mabshoff> It is still telling that there is a big difference between vir and res memory.
[16:27] <mabshoff> I will ran 2.8.1 on another box with 24 GB and with smaller input n=5 for starters and see what happens.
[16:27] <william> i added #160 to the list for today :-)
[16:27] <mabshoff> Oh no, more pressure.
[16:27] <mabshoff> I just went though the open tickets and looked at everything with segfault.
[16:28] <mabshoff> #402 might also be interestig.
[16:28] <mabshoff> +n
[16:28] <mhansen> Regarding the set partitions code, it depends on a bunch of other combinatorics code.  All the new combinatorics stuff uses a new interface based on "combinatorial classes".  It's based on MuPAD-combinat's notion of combinatorial classes.  It makes it easy to do things like define algebras whose basis elements are indexed by elements of a combinatorial class.
[16:29] <william> #402 works fine now. 
[16:29] <william> we used to include dvipng in SAGe, I think, and maybe it was broken.
[16:29] <william> (for me at least)
[16:29] <william> mhansen -- cool; when do you plan to make this part of SAGE?
[16:30] <mabshoff> Yep, dvipng is the systems, so that might have been a fluke with an outdated/broken local copy.
[16:30] <mabshoff> Should be close it then?
[16:30] <william> yep.
[16:30] <mabshoff> #402 that is.
[16:30] <mabshoff> will do
[16:30] <william> but let me attach it today's 
[16:31] <mabshoff> Ok, you can do it all then.
[16:31] <mabshoff> a good bug triage cuts down on the number of bugs to fix :)
[16:31] <william> first notebook bug crossed off.
[16:32] <william> there sure are a lot listed there!
[16:32] <william> #293 looks scare.
[16:32] <mhansen> Probably in the next major release.  The last major bit to do is asymptotically fast generation of derangements.  It has a ton of the stuff that Sara Billey mention in her talk.  For example, it includes a symmetric functions package which passes all of MAGMA's tests and more. It also has Schubert polynomials.
[16:32] <mabshoff> Does Axiom depend on gcl or does it also work woth clisp?
[16:32] <william> axiom works with clisp.
[16:32] <william> it is easy to install.
[16:32] <mabshoff> Because:
[16:32] <mabshoff> Ticket #420 (new defect)
[16:32] <mabshoff> Opened 1 week ago
[16:32] <mabshoff> Last modified 6 days ago
[16:32] <mabshoff> SAGE's optional axiom package doesn't build on os x
[16:33] <william> close that.
[16:33] <mabshoff> Ok
[16:33] <william> I fixed that myself on the plane ride to San Diego!
[16:33] <mabshoff> ok
[16:33] <william> ok, i'm closing it.
[16:33] <mabshoff> have fun.
[16:34] <william> just out of curiosity can you reproduce #423?
[16:34] <william> i just did :-)
[16:34] <mabshoff> I think that clisp alone is enough of a pain in the ass.
[16:34] <william> requiring gcl... gees.
[16:34] <mabshoff> Especially compated to gcl.
[16:35] <william> axiom on gcl is faster.
[16:35] <mabshoff> Ok.
[16:35] <william> but i have the impression it's all rather slow compared to good c code.
[16:35] <william> just type in SAGE:
[16:35] <william> help()
[16:35] <william> modules
[16:35] <mabshoff> waiting on output.
[16:36] <mabshoff> Some idiot on that box swapped out most of the current processes :)
[16:36] <william> you.
[16:36] <mabshoff> it goes boom.
[16:36] <mabshoff> yes.
[16:36] <william> --> 150 la = linear_algebra
[16:37] <william> ajc and robert -- how's the graphics going?
[16:37] <mabshoff> /tmp/Work2/sage-2.8.1/sage-2.8.1/local/lib/python2.5/site-packages/matplotlib/numerix/__init__.py in <module>()
[16:37] <mabshoff>     147 __import__('random_array', g, l)
[16:37] <mabshoff>     148 __import__('mlab', g, l)
[16:37] <mabshoff>     149
[16:37] <mabshoff> --> 150 la = linear_algebra
[16:37] <mabshoff>     151 ra = random_array
[16:37] <mabshoff> ok
[16:37] <mabshoff> Isn't that in matplotlib?
[16:37] <william> yep.  but "comment it out" and other things break in other places.
[16:37] <william> I think the right thing to do this time is patch python itself so it's module lister
[16:37] <william> is more robust.
[16:38] <william> if you go up the tree to the first thing that is in python2.5 itself, in pkgutil.py it
[16:38] <william> doesn't catch enough exceptions.
[16:38] <mabshoff> ok
[16:41] <william> yep.
[16:41] <william> if you edit sage-2.8.1/local/lib/python2.5/pkgutil.py
[16:42] <william> and comment out lines 117 and 118 ("else: raise") does help() and modules work for you????
[16:42] <mabshoff> second
[16:42] <william> this bug has been reported on the list about 5 or 6 times now.
[16:42] <robert457965> william - I'm working on dsage with yi at the moment
[16:42] <william> cool.  
[16:43] <robert457965> agc - still around?
[16:43] <william> wow, that help() system is really really nice.
[16:43] <agc> yeah
[16:43] <william> i've never used it since it is always broken.
[16:43] <robert457965> how's graphics?
[16:43] <william> we need to "port" help() to the notebook...
[16:44] <mabshoff> Yeah, with those two lines commented out it works for me.
[16:44] <william> thanks.
[16:44] <william> i'm going to patch python*.spkg and close that bug.
[16:44] <mabshoff> one more down.
[16:45] <mabshoff> have you looked at #172 - that is rather old and might be fixed by now.
[16:46] <agc> im not sure about the append method ... it has to do with the axes (i.e. good-looking-ness) and i think it needs to be handle on a case by case basis like __add__ does.
[16:47] <robert457965> i agree
[16:47] <robert457965> if each primitive has an xmin() function, then append can work just like __add__
[16:47] <robert457965> something like self.__xmin = min(self.__xmin, primitive.xmin())
[16:48] <robert457965> right now, every time the append method gets called, it's by a factory, which then sets the xmin xmax itself, right?
[16:50] <agc> no, its just a method of Graphics ... it kinda just doesn't make sense to have it ...
[16:51] <mabshoff> #352 is no longer a problem,
[16:51] <mabshoff> I just tested it and it works, so I closed it.
[16:52] <agc> i say just remove it.
[16:52] <william> i just assigned it to sage-2.8.2, so we "get credit".
[16:52] <william> agc -- fine with me.
[16:52] <mabshoff> Hehe
[16:54] <agc> if you are making plots, then you a least want them to look semi-pretty, and appending a bunch of graphic primitives together will not produce anything visually decent.
[16:54] <robert457965> go for it
[17:06] [CTCP] Received Version request from freenode-connect.
[17:06] [Notice] -NickServ- This nickname is owned by someone else
[17:06] [Notice] -NickServ- If this is your nickname, type /msg NickServ IDENTIFY <password>
[17:06] --> You have joined the channel #sage-devel (n=was@206.135.48.98).
[17:07] *** Channel modes: secret, no messages from outside
[17:07] *** This channel was created on 08/17/2007 01:03:33 PM.
[17:07] --> mabshoff_ has joined this channel (n=mabshoff@p5090F241.dip.t-dialin.net).
[17:07] <robert457965> right, but not the primitive underneath it
[17:07] <robert457965> c is a Graphics object, not a primitive
[17:07] <agc> that is, when you do show(c), it look pretty good, but you can always fine tune the axes in the show command
[17:08] <robert457965> you're missing my point
[17:08] <robert457965> people want to use primitives outside of plot.py
[17:08] <robert457965> the reason 206 is a ticket is exactly that
[17:08] <agc> my point is that at the end of the day, the only reason you can about min and max values is so the plot looks decent
[17:09] <robert457965> right
[17:09] <robert457965> if i make a primitive and a graphics object, and append the primitive to the graphics object, it looks like crap
[17:09] <robert457965> all we need to fix that is for the primitive to know its own size
[17:13] <agc> they do, behind the scenes the primitives know their size because of the __call__ method requires parameters for each Graphic type
[17:14] <robert457965> you mean because the Factories create a Graphics object that is only a Primitive and xmin, xmax etc, right>?
[17:15] <robert457965> so why aren't the latter simply part of the primitive?
[17:15] <mabshoff_> william - are you at dinner or still around?
[17:15] <william> i'm around for at least another 1.5 hours.
[17:15] <william> i'm working on the modular forms bug.
[17:15] <william> i know what to do but have to write some code.
[17:15] <william> how's it going?
[17:15] <mhansen> Regarding 160, there are 2375101 set partitions so they'll take a fair amount of time / memory to generate.
[17:16] <mabshoff_> I am looking at #160
[17:16] <mabshoff_> sage: n=5
[17:16] <mabshoff_> sage: time P=partitions_set(range(n),2)
[17:16] <agc> "behind the scenes" (so to speak) we have: class CircleFactory(GraphicPrimitiveFactory_circle)
[17:16] <mabshoff_> End Of File (EOF) in read_nonblocking(). Exception style platform.
[17:16] <mabshoff_> <pexpect.spawn instance at 0x243d7518>
[17:16] <mabshoff_> version: 2.0 ($Revision: 1.151 $)
[17:16] <mabshoff_> command: /tmp/Work2/sage-2.8.1/sage-2.8.1/local/bin/gap
[17:16] <mabshoff_> args: ['/tmp/Work2/sage-2.8.1/sage-2.8.1/local/bin/gap', '-b', '-p', '-T', '-o', '9999G', '/tmp/Work2/sage-2.8.1/sage-2.8.1/data//extcode/gap/sage.g']
[17:16] <agc> and then we have the "public function": circle = CircleFactory()
[17:16] <mabshoff_> patterns:
[17:16] <mabshoff_>     gap>
[17:16] <mabshoff_> buffer (last 100 chars):
[17:16] <mabshoff_> before (last 100 chars): @p1.gap: cannot extend the workspace any more
[17:16] <mabshoff_> So even for very small  partition_sets things go haywire.
[17:17] <mabshoff_> It all ends with
[17:17] <mabshoff_> /tmp/Work2/sage-2.8.1/sage-2.8.1/local/lib/python2.5/site-packages/sage/interfaces/gap.py in _start(self)
[17:17] <mabshoff_>     246                 self._session_number = n
[17:17] <mabshoff_>     247                 return
[17:17] <mabshoff_> --> 248             raise RuntimeError, msg
[17:17] <mabshoff_>     249
[17:17] <mabshoff_>     250         if self.__use_workspace_cache and self.__make_workspace:
[17:17] <mabshoff_> <type 'exceptions.RuntimeError'>: Unable to start gap
[17:17] <robert457965> agc - i get how it works, i just don't understand why we need like six classes to do three things
[17:18] <robert457965> if you make an arrow, there's two separate classes just for the function that returns the Graphics object
[17:19] <agc> you are right there! we definitely could minimize the code, it we be more readable for sure :)
[17:19] <robert457965> hmm
[17:19] <robert457965> i mean, ultimately, how should it be set up?
[17:21] <robert457965> each primitive has a function that tells matplotlib how to draw the primitive, right?
[17:23] <agc> notice how every GraphicPrimitiveFactor_* only has a call method ... with end up using a method the eventually inherits from it ... it is pretty akward but it the beginning, we the code was first written we were going for maximum generality
[17:24] <agc> god it make a lot of typing mistakes ... sorry
[17:24] <agc> geez, i meant I not it ... ahhh!!!!
[17:25] <-- mabshoff has left this server (Read error: 110 (Connection timed out)).
[17:26] <robert457965> so maybe plot.py just needs a major makeover?
[17:27] <robert457965> anyway, all i'm saying about that particular ticket is this-
[17:27] <robert457965> a primitive contains instructions on how to draw itself on a figure
[17:27] *** mabshoff_ is now known as mabshoff.
[17:28] <agc> a makeover would be nice ... but its not that bad ;)
[17:28] <robert457965> doesn't it also make sense for it to know what the bounds of that are?
[17:30] <robert457965> it's an impressive piece of work, for sure
[17:34] <william> i remember when agc and i came up with the design.
[17:34] <mhansen> william: I have some changes to make sure that things such as unions, intersections, etc. of Set_object_enumerated return hashable objects.  Do you want it now?
[17:34] <william> i always knew a conversation like we're having now would happen.
[17:35] <robert457965> we've had this conversation before, too
[17:35] <william> no.  but you can make a trac ticket that explains the issues, and then I might want it now.
[17:36] <agc> the 'public' functions inherently know their bounds by how they are used (e.g. circle((2, 2), 1) ), and bounds are really just for the end result hard-copy plot.  It you want several different Graphics in one hard-copy, then add all the seperate graphic together and the code will do its best to make it look nice.  I can't think of much more to say.
[17:36] <robert457965> all a primitive is, is a patch of a bigger plot. that patch has a range, and a set of instructions on how to draw it.
[17:37] <robert457965> the way things are written, every time you see a primitive it is inside a bigger Graphics object
[17:37] <robert457965> it *makes more sense* to factor that information down to the primitive
[17:37] <robert457965> that way, there is less complication, less confusion, less bugs to trac
[17:38] <robert457965> anyway, i'm signing off for the day
[17:38] <robert457965> RDF poly's now factor, but badly
[17:38] <mabshoff> cu
[17:38] <robert457965> i'll look into finding roots via GSL soon
[17:38] <agc> my 'Mathematica' does work in that direction ... I kind of just followed how Mathematica does its plotting
[17:38] <robert457965> yi knows of the bug i've found in dsage, and we'll work on it more, but it won't get fixed today :-(
[17:39] <william> is it a trac ticket?
[17:39] <william> if not, why not?
[17:39] <william> yi convinced me that anything we work on should be a track ticket.
[17:39] <robert457965> #431
[17:39] <mabshoff> I agree, that way it is just very easy to keep track of things.
[17:40] <robert457965> anyway, see you all at sage days X
[17:40] <william> and progress is easier.
[17:40] <-- robert457965 has left this channel.
[17:40] <william> easier to measure.
[17:40] <agc> see you robert457965
[17:40] <william> cu
[17:40] <mabshoff> re #160:  time  P = partitions_set(range(13),3) already consumes more than 4GB on the side of sage.
[17:40] <mabshoff> GAP doesn't leak memory (only 1kb)
[17:41] <mabshoff> But it seems that the parser on the sage side just goes insane with memory consumption.
[17:43] <mabshoff> wiliam, #433 can be closed, too. The patch has been applied by you.
[17:43] <-- pauloliviersage has left this server ("CGI:IRC (Ping timeout)").
[17:44] <william> done.
[17:44] <william> we're at 50% now :-)
[17:45] <mabshoff> Mmmh, roughly 7 hours in,
[17:45] <mabshoff> not too shabby.
[17:45] <robertwb> btw, I finished fixing cython
[17:45] <robertwb> (the __index__ thing)
[17:45] <agc> william, here is the patch for #206
[17:45] <agc> http://sage.math.washington.edu/home/agc/remove_append_from_Graphics_class.hg
[17:46] <william> got it.
[17:53] <william> mabshoff -- is it just python evaling something big, or is it the pexpect interface?
[17:53] <william> again, making a file-based transfer back easy to use might be fine if the problem is pexect
[17:53] <mabshoff> I can't tell.
[17:53] <william> instead of eval.
[17:53] <mabshoff> Gap returns one very long list of lists.
[17:53] <william> if use figure out how to write the output from gap to a file, you could load it into python and eval it.
[17:53] <william> eval(open('foo').read())  in python.
[17:53] <mabshoff> Okay.
[17:54] <mabshoff> For some cython experts out there: #172 might be low hanging fruit.
[17:54] <william> it's hard i think.
[17:55] <mabshoff> And for people who know RR and corecsion: #429 might be interesting.
[17:55] <mabshoff> I did cython the example, but I am not sure how it looked before.
[17:55] <william> #172 -- but everything i think is really hard with cython, robertwb just does.
[17:56] <william> #429 is *definitely* easy to fix.  i'm sure of that.
[17:56] --> pauloliviersage has joined this channel (i=8143024e@gateway/web/cgi-irc/ircatwork.com/x-bdd571a346a18dc4).
[17:56] <william> RR matrices are generic whereas GF(127) isn't, so the problem probably has nothing to do with RR
[17:56] <mabshoff> Ok, we just cannot convert "none" at the moment?
[17:56] <william> i added #429 to the list for today.
[17:57] <william> (on trac)
[17:58] <mabshoff> Gap to file:
[17:58] <mabshoff> The  simplest,  but  less flexible is to use 'LogTo("filename");'
[17:58] <mabshoff> and it will just copy the output from the screen to the file.
[17:58] <mabshoff> In this case you may use the command 'SizeScreen([256,]);' to
[17:58] <mabshoff> reach the maximum possible length of the line, but no more than 256
[17:58] <mabshoff> symbols.
[17:58] <william> i just finally fixed #304, which was really a very bad bug.
[17:58] <william> that's useless.
[17:58] <mabshoff> We only want to write the list?
[17:58] <william> we don't want the output to *ever* go to the screen.
[17:58] <william> We want straight to the file.
[17:58] <william> Maybe there is a command like "Write".
[17:58] <william> Yes, we only want to write the list.
[17:59] <william> We change the partitions thhing so it saves the answer in a gap temp variable,
[17:59] <william> we then write that variable to a file.
[17:59] <william> then from python we read the file.
[17:59] <william> then we clear the temp variable.
[17:59] <mabshoff> you may enter the next command from this example in the
[17:59] <mabshoff> form
[17:59] <mabshoff> output := OutputTextFile( "filename", true );;
[17:59] <mabshoff> and it will create the file "filename" just in your current directory.
[18:00] <mabshoff> Or is that the same conundrum re output
[18:00] <mabshoff> ?
[18:00] <william> PrintTo
[18:01] <william> Type "gap.WriteLine?" in SAGE and look at what is there.
[18:01] <william> I think PrintTo looks useful.
[18:01] <mabshoff> Yeah, there is a tutorial for PrintTo
[18:02] <william> agc -- i applied your patch.  it works :-)
[18:02] <mabshoff> PrintTo( <filename>, <obj>);
[18:02] <mabshoff> Seems kind of obvious.
[18:04] <mabshoff> So the code for partition_set is "just":
[18:04] <mabshoff>     if k==None:
[18:04] <mabshoff>         ans=gap.eval("PartitionsSet(%s)")
[18:04] <mabshoff>     else:
[18:04] <mabshoff>         ans=gap.eval("PartitionsSet(%s,%s)"%(S,k))
[18:04] <mabshoff>     return eval(ans)
[18:05] <william> yes.
[18:05] <william> note that the right place to put the PrintTo code is
[18:05] <william> in sage/interfaces/gap.py
[18:05] <william> since there will be lots of times it is needed in sage.
[18:05] <mabshoff> So instead of eval(ans) we write PrintTo(tempfile,"PartitionsSet(%s)");
[18:06] <william> my fix for #304 automatically fixed #303 :-)
[18:06] <william> yep.
[18:06] <william> but make it something like
[18:06] <mabshoff> and we eval(open(tempfile).read())
[18:06] <william> yeah.
[18:06] <william> precisely, we should do:
[18:06] <william>    a = gap('PartitionsSet(%s)')
[18:07] <william> so now we have a gap temp variable named a.name().
[18:07] <mabshoff> ok
[18:07] <william> Then do something like say  a.str(use_file = True)
[18:07] <william> ans = a.str(use_file=True)
[18:08] <william> When a goes out of scope, the corr. gap data structure should be automatically garbage collected.
[18:08] <mabshoff> hmm, I will have a look.
[18:08] <william> So all you have to do is change the two gap.eval lines slightly (just delete the .eval part)
[18:08] <william> and modify the str method in gap.py (or just add a method of your choosing)
[18:09] <william> Then *that* method will have to get a temp file, and do 
[18:09] <william> gap.eval('PrintTo(tmpfilename, obj)')
[18:09] <william> read the temp file.
[18:09] <william> delete the temp file.
[18:09] <william> ok?
[18:09] <mabshoff> Sounds reasonable.
[18:09] <mabshoff> I will give it a try, it is time for me to play with the Sage code itself.
[18:09] <mabshoff> Learning by doind.
[18:10] <mabshoff> -d+g
[18:10] --> ncalexan has joined this channel (n=user@d207-216-25-207.bchsia.telus.net).
[18:10] <william> actually, if you can do what I wrote above, it will be very useful, because you'll have to understand how
[18:11] <william> sage interface work.
[18:11] <william> (under the hood).
[18:11] <mabshoff> ok
[18:11] <william> then you can think of a way to do it all better :-)
[18:11] <mabshoff> :)
[18:14] <william> wow, i fixed #429 in 1 minute. :-)
[18:14] <mabshoff> cudos.
[18:14] <william> it's just that low lieing fruit with sparse matrices you mentioned.
[18:14] <mabshoff> I remember.
[18:15] <mabshoff> If one is familiar with the code that kind of fix ought to be trivial. I am just not there yet.
[18:15] <ncalexan> Could someone check 340?  It's fine for me, fine in the notebook, etc, so I'm going to close it unless someone can make it break again.
[18:17] *** ncalexan is now known as ncalexan-dinner.
[18:17] <mabshoff> ode_solver? should just show you the help or what exactly is the issue?
[18:17] <mabshoff> It works for me then.
[18:17] <ncalexan-dinner> It wasn't showing the help.  It does now, I'm going to close it.
[18:17] <mabshoff> ok
[18:18] <william> it works fine for me.  close it.
[18:18] <ncalexan-dinner> 340: closed.
[18:18] <william> i think josh actually submited a patch to fix that a long time ago which i applied.
[18:18] <william> wow, we're doing well.
[18:19] <ncalexan-dinner> Oh, great.  Anyway, I'll try to contribute a bit later, dinner with the parents.  I wish I could have been a part of this *super cool idea*.
[18:20] <william> probably i'll be off to dinner for a while in about 45 minutes, depending on what agc thinks.
[18:20] <william> but i'll be back in a couple hours.
[18:20] <mabshoff> ok
[18:20] <william> indeed this bug squash idea of malb's was *excellent*.
[18:20] <william> SAGE has really improved substantially today.
[18:20] <mabshoff> I will probably be around for 3 or 4 more hours.
[18:20] <william> ok.
[18:20] <william> i'm working on ticket #292.
[18:21] <mabshoff> But I will take a break for half an hours, too.
[18:21] <william> the bug has nothing to do with all the complicated coerce looking stuff.
[18:21] <agc> alright, it met you at wired cafe william
[18:21] <mabshoff> Any chance for a #274 revisit?
[18:21] <william> it's just the list method on polynomial quotient elements gives an infinite list.
[18:21] <william> i really want #274 to be revisited too.
[18:21] <william> agc -- how hungry are you?
[18:21] <mabshoff> ok
[18:21] <william> i'm ok working for another hour...
[18:21] *** mabshoff is now known as mabshoff|on_a_br.
[18:21] <william> it's still light out for a while.
[18:22] *** mabshoff|on_a_br is now known as mabshoff|resting.
[18:22] <william> agc?
[18:22] <agc> sure
[18:22] <william> ok.
[18:22] <william> cool.
[18:23] <agc> see you there in ~30 minutes
[18:23] <william> actually i ws just saying *not* 30 minutes but longer.  what do you think?
[18:23] <william> i.e., not meet until 7:30.
[18:24] <agc> thats fine too, im not busy
[18:24] <william> cool.
[18:24] <william> what are you working on now?
[18:24] <william> i'm trying to remember why list(f) works when f is a polynomial...
[18:24] <agc> actually just looking at the new stuff that has been putting in sage
[18:24] <william> ah __iter__
[18:24] <william> cool.
[18:24] <william> i can't keep up with it all.
[18:25] <william> agc -- check out cvxopt; it's pretty cool
[18:25] <william> it's your kind of thing, probably.
[18:27] <william> ok, trac #292 is fixed.  :-)
[18:28] <william> I'm looking at #293 now -- that Python/C api memory leak thing.
[18:28] <william> robertwb -- actually i bet you could easily fix #293 if you're around.
[18:28] <william> thoughts?
[18:28] <robertwb> hmm... I'll take a look
[18:28] <william> thanks!
[18:29] <robertwb> (I actually just added a comment to that)
[18:29] <william> oh, let's just delete the macro.
[18:30] <william> i wrote it a long time ago when I was trying to do fast list indexing before you did it right.
[18:30] <william> i'll take care of this then.
[18:30] <william> wow, we use it 11 times.
[18:31] <william> deleting it isn't a good idea.
[18:31] <william> does it really leak memory?
[18:31] <robertwb> I'm not sure...
[18:32] <william> if it did, then calling hash on any generic dense matrix would make that matrix never garbage collect.
[18:32] <william> since it's used in hash.
[18:32] <william> that could explain some linear algebra memory leaks :-)
[18:32] <robertwb> that would be bad...
[18:32] <robertwb> it's defined in stdsage?
[18:33] <william> do search_src('FAST_SEQ_UNSAFE') and you'll see where it is defined.
[18:34] <robertwb> it's defined in sage_c_lib (not searched by search_src)
[18:35] <william> indeed!
[18:35] <william> david harvey is totally right about that memory leak!
[18:35] <william> Try the following two distinct blocks of code, where m = get_memory_usage
[18:35] <william> print m()
[18:35] <william> n = random_matrix(RR, 200) 
[18:35] <william> n.set_immutable()
[18:35] <william> hash(n)
[18:35] <william> del n
[18:35] <william> m()
[18:35] <william>   -- and --
[18:35] <william> print m()
[18:35] <william> n = random_matrix(RR, 200) 
[18:35] <william> n.set_immutable()
[18:35] <william> del n
[18:35] <william> m()
[18:36] <william> The first leaks about 3MB every time.  The second doesn't leak at all.
[18:36] <robertwb> ouch
[18:36] <robertwb> yes, it's a new reference (though it may or may not be a new object)
[18:36] <-- ncalexan-dinner has left this server (Read error: 110 (Connection timed out)).
[18:37] <robertwb> not seeing an easy way to fix it either
[18:38] <agc> william, the library im in is closing, see you around 7:30
[18:38] <william> agc -- see you at 7:30 at wired cafe for dinner.
[18:38] <robertwb> you loose the reference returned from PySequence_Fast by passing it into PySequence_Fast_ITEMS, so you can never decref it
[18:38] <-- agc has left this server ("Leaving").
[18:39] <robertwb> I'll go ahead and remove the macro and fix the 11 or so spots it's used
[18:40] <william> thanks.
[18:40] <william> I wish I had never created that macro.
[18:40] <robertwb> (I guess we named it right, "unsafe" :) )
[18:40] <william> :-)
[18:41] <william> robertwb -- 
[18:41] <robertwb> yeah?
[18:41] <william> why don't we leave the macro but decref it's input each time.
[18:41] <william> e.g., in _hash, we just put decref(v) after we're done using w.
[18:41] <william> ????
[18:42] <william> that should be easy. 
[18:42] <robertwb> that won't work if it has to create a list/tuple
[18:42] <william> Then we add that to the docs for FAST_SEQ_UNSAFE
[18:42] <william> I don't understand.
[18:42] <robertwb> the problem is PySequence_Fast(v) may return v, or may construct a tuple out of v and return that.
[18:42] <william> How about if we change the input to the macro to be a PyObject*
[18:43] <william> ?
[18:43] <robertwb> wouldn't help
[18:43] <william> why not?
[18:44] <william> oh, PySequence_Fast can actually make a new sequence?
[18:44] <robertwb> FAST_SEQ_UNSAFE(v) may create a _new_ object which you never get a handle to
[18:44] <robertwb> yes
[18:44] <william> OK.  you're right.
[18:44] <william> I've assigned #293 to you :-)
[18:44] <robertwb> ok
[18:56] <william> hi!
[18:56] <william> can anybody replicate bug #349?
[18:56] <william> it works fine for me now?
[18:56] <william> Just do "s = Sage()", then "s.[tab]"
[18:59] <mhansen> Works for me.
[18:59] <william> ok.  i've closed that one.
[19:01] <william> #321 is easy.
[19:01] <william> done.
[19:07] <william> ok, i'm going to dinner with agc right now.
[19:07] <william> are you'all around for a quick wrap up?
[19:07] <william> is anybody around?
[19:08] <william> anyway -- i updated http://www.sagemath.org:9002/sage_trac/milestone/sage-2.8.2 a lot
[19:08] --> dmharvey has joined this channel (n=david@c-24-61-47-91.hsd1.ma.comcast.net).
[19:08] <william> I think we fixed all but FOUR serious issues.
[19:09] <william> anyway -- i updated http://www.sagemath.org:9002/sage_trac/milestone/sage-2.8.2 a lot
[19:09] <william> thus we were extremely productive; more than i expected
[19:09] <dmharvey> you guys finished already?
[19:09] <william> essentially everything (except two spkg's) is available by doing hg_sage.pull()
[19:09] <william> I'm about to go to dinner and I'm trying to do a wrap-up, though I don't know if anybody is listening...
[19:10] <william> I'll probably be back in 2 hours, maybe.
[19:10] <william> anyway, the main bugs remaining are:
[19:10] <dmharvey> did 274 get fixed?
[19:10] <william> (1) #293, which robertwb is fixing.
[19:10] <william> (2) #274, which dmharvey is about to fix :-)  
[19:10] <robertwb> I'm off to dinner too
[19:10] <dmharvey> :-)
[19:10] <william> (3) #160, which mabshoff is working on.
[19:11] <william> and (4) #446, which I'll fix later tonight (some weird notebook thing).
[19:11] <william> everything else listed of consequence got dealt with, I think.
[19:11] <william> very nice.
[19:11] <william> so from my point of view i'd like to declare the bug squashing a success.
[19:11] <william> cu :-)
[19:11] <dmharvey> ok
[19:12] <william> I'll paste the whole transcript to the wiki as usual.

= Results =

Sage Bug 1 took place from 10 am PST August 18th until 2 am August 19th.

==Participants==

In order of apperance, handle in brackets

William Stein (william, _was)
Robert Miller (robert457965)
D. Harvey (dmharvey)
Michael Abshoff (mabshoff)
Nick Alexander (ncalexan)
Paul-Oliver Dehaye (paulolivier_sage)
Robert Bradshaw (robertwb)
Mike Hansen (mhansen)
Alex Clemesha (agc)
Yi Qiang (yi)

== Bugs worked on ==

There we various observers present, but those have been omitted here. They can be found in the IRC log. Bugs squashed: (see also http://www.sagemath.org:9002/sage_trac/milestone/sage-2.8.2). Please complain if there are mistakes, especially regarding credit for fixes:

#160: partitions -- sage dies (fixed by w stein, m hansen has code that doesn't use GAP and should be much faster.)
#190 (and #440): fractional matrix indices are allowed ? (fixed by d harvey)
#201: mwrank crashing (fixed via patches by j cremona, small memleak fixed by m abshoff)
#206: Graphic.append() does not update xmin_ xmax etc. (fixed by r miller and agc)
#226: sagex enum issue and solution (closed by m. abshoff - already fixed)
#240: in notebook when refresh browser or first get page cell update list isn't sent out with running cells
#248: elliptic curve constructor in funny case -- coercion issues (closed by w. stein - already fixed)
#254: p-adic precision drop in evaluating a polynomial (closed by w. stein - already fixed, probably fixed by d roe)
#265: Coercion of maxima float with positive exponent to python float (closed by w. stein - already fixed)
#268: IntegerMod sqrt() doesn't work for non-prime moduli (closed by w. stein - already fixed)
#274: memory leak --- Polynomial arithmetic over finite field (fixed by w stein, d harvey)
#275: Maxtrix groups over RR don't get pushed off to GAP properly (fixed by w stein)
#292: Problems with stacked polynomial rings and vector (fixed by w stein)
#293: nasty memory leak in FAST_SEQ_UNSAFE macro (fixed by r bradshaw)
#303: modular forms bug (fixed by w stein)
#304: another modular forms bug (fixed by w stein)
#312: LaTex notation in documentation does not show up in notebook doc browser
#316: bug in modular symbols projection (probably really in linear algebra) (closed by m hansen - already fixed)
#319: can't divide matrix over QQ by a rational (closed by d harvey - already fixed, doctest added by w stein)
#321: execute button broken in some worksheets (closed by w stein - the execute button no longer exists after the notebook rewrite)
#337: broken (?) discriminant of quaternion algebra (closed by m hansen - already fixed)
#340: error in sageinspect: ode_solver? (already fixed, closed by n alexander)
#342: ComplexNumber constructor seg faults (m hansen)
#349: Tab completion on Sage() object does not work (already fixed, closed by w stein)
#350: bug in rational_points on hyperelliptic curve (closed by d harvey - already fixed)
#352: error in matrix creation options (already fixed, closed by m abshoff)
#371: implement sage -t -gdb foo.py (patch by w stein)
#374: Bug in factorization of polynomial over number field (fixed by w stein, initial patch by j mohler)
#392: round() ignores the innate precision of a real number (fixed by m hansen)
#393: Very strange behavior of QQ -> RealField() conversion (resolved by m hansen, report was invalid)
#402: %slide directive produces segfault in dvipng (already fixed, closed by m abshoff. dvipng is a system binary and not part of Sage)
#420: SAGE's optional axiom package doesn't build on os x (closed by w. stein - axiom works fine on clisp)
#423: command line help() --> modules fails for *some* people (fixed by w stein)
#429: cannot create empty sparse matrix over reals (fixed by w stein)
#430: RDF poly's don't factor (w. stein: The factoring now works, but it depends on root finding, which currently sucks. A new ticket will be made for the root problem.)
#433: Add -version, -root, and -branch for printing version, SAGE_ROOT, and branch information. ()
#440: Integer.index() currently goes via a python long (fixed by d harvey)
#441: add sage-valgrind command line option analog to sage-gdb (patch by m. abshoff)
#442: RDF roots() function gives imprecise results (duplicate)
#446: in latest version of the notebook interactive documenation doesn't "interact" at all. (fixed by w stein)
#447: documentation for mpfr round in SAGE sucks (fixed my m hansen with help from w stein)
#456: TypeError: unable to coerce to a ComplexNumber (fixed my h. hansen)
#457: gp interface: TypeError: an integer is required (fixed by w stein)
#458: plot.py: NameError: name 'p1' is not defined (fixed by r miller)
#459: TypeError: unsupported operand parent(s) for '*': 'Polynomial Ring in u_ v over Integer Ring' ()
#460: AttributeError: 'Graphics' object has no attribute 'append' (fixed by r miller)
== To Do ==

add Details to bugs, give proper credit for each bug resolved
a summary of what was good, what was bad and maybe suggestions on how things could be improved.
(potentially new) sage development guide lines: see http://www.divmod.org/trac/wiki/UltimateQualityDevelopmentSystem - this maybe should go into a more general section of the wiki
