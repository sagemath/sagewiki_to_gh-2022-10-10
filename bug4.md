= SAGE Bug Squash Day 4 =

The event will take place on '''SATURDAY, October 20''' and officially start at 10 am pacific standard time. It will "officially" go nonstop for 10 hours (until 8pm) and some people will usually meet the day after and finish up some of the leftovers.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.


 * [[bug4/status| STATUS]]

 * [[bug4/irc| IRC log]]

 * [[bug4/Results| Results]]

 * The base version of SAGE we'll start with is here: sage-2.8.7.2, which you can get to by just doing "sage -upgrade".
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

 1. William Stein -- applying patches; organization
 2. Mike Hansen
 3. Michael Abshoff (memory leaks, Solaris port, whatever else looks interesting ;) )
 4. David Harvey -- probably won't make it due to work overload :-(
 5. John Voight -- Number field stuff
 6. Robert Bradshaw
 7. Craig Citro (after about 1PM Pacific)
 8. Jason Grout -- graphs or an interface to QEPCad.
 9. Carl Witty
 10. Joel Mohler -- small matrix and/or multi-variate poly rings
 11. Robert Miller -- nice bug

[[attachment:bugs.jpg|{{attachment:bugs.jpg}}]] [[attachment:compact.jpg|{{attachment:compact.jpg}}]]

(from http://www.flickr.com/photos/electrasteph/689860347/ and http://www.ecosherpa.com/images/ )

= IRC log =

05:41 < jason_> Does anyone know the base revision for the bug day today?
05:43 < wstein> Install sage-2.8.7. Then pull hg_sage, hg_doc, and hg_scripts.
05:44 < jason_> using hg_sage.pull() (in sage) or hg pull inside the sage/devel/sage directory?
05:45 < wstein> they are identical
05:45 < wstein> sage: hg_sage.pull(); hg_sage.merge(); hg_sage.ci()
05:45 < wstein> sage: hg_doc.pull(); hg_doc.merge(); hg_doc.ci()
05:45 < wstein> sage: hg_scripts.pull(); hg_scripts.merge(); hg_scpripts.ci()
05:45 < jason_> okay, it's working.  Thanks.
05:48 < jason_> I presume that when it says all I have to do is update, I don't need to run merge or commit, but hg_docs.update() is all I have to do?
05:48 < jason_> Is that correct?
05:49 < wstein> yes.
05:49 < wstein> merge won't hurt.
05:49 < jason_> great, thanks.  I'll go build this and hopefully be back later.  Thanks!
05:50 < wstein> cu
05:50 -!- jason_ [n=jason@12-208-92-185.client.mchsi.com] has quit [Remote closed the connection]
06:00 < burcin> if I create two polynomial rings over the same field, what stops me from adding/multiplying polynomials from these different rings?
06:00 < burcin> i.e., at the moment, I can do this with my BooleanPolynomialRing, but not with other polynomial rings in sage
06:00 < burcin> and I don't know how to fix mine
06:02 < burcin> my rings already implement __hash__ and "R is P" returns false
06:18 < wstein> You must implement a natural _coerce_impl method in the ring, which
06:18 < wstein> specifies how/which rings can map automatically to your BooleanPolynomialRing.
06:18 < wstein> (and conversely)
06:20 < burcin> I have a _coerce_c_impl method, which martin added..
06:21 < burcin> should that raise an exception if the coercion is not possible?
06:26 < burcin> ok, I see that for the sage PolynomialRings I've been playing with, has_coerce_map_form returns false
06:26 < burcin> and for mine it returns true, I need to check why now..
06:53 < fabio_> Hello all
06:53 < fabio_> is there a way to access the irc-logs?
06:59 -!- fabio_ [i=fabio@chello080109021149.3.14.univie.teleweb.at] has quit [Read error: 104 (Connection reset by peer)]
07:00 -!- fabio_ [i=fabio@chello080109021149.3.14.univie.teleweb.at] has joined #sage-devel
07:06 -!- fabio_ [i=fabio@chello080109021149.3.14.univie.teleweb.at] has quit ["Verlassend"]
07:29 -!- cwitty [n=cwitty@sense-sea-MegaSub-1-205.oz.net] has joined #sage-devel
08:05 < burcin> if I implement a subclass of MPolynomialRing_generic
08:06 < burcin> and define __call__ to "return self._coerce_c(other)"
08:06 < burcin> why doesn't my subclass use the _coerce_c_impl coded in MPolynomialRing_generic?
08:06 < cwitty> Let me look.
08:06 < burcin> or even better.. why do I get a segfault?
08:08 < cwitty> What are you coercing from?
08:08 < burcin> I'm just doing R(0), where R is my ring
08:09 < burcin> actually, why doesn't MPolynomialRing_generic, or a CommutativeRing, or something even higher in the class hierarchy have __call__ already defined?
08:09 < cwitty> No idea.
08:09 < burcin> I thought this was common notation in sage
08:11 < cwitty> Does R.base_ring()(0) work?
08:13 < cwitty> Do you have gdb installed on your machine?  If so, you can run "sage -gdb" and get a backtrace from the segfault.
08:13 < burcin> base_ring returns GF(2), so it works
08:14 < burcin> honestly, I can't make sense of the backtrace
08:14 < burcin> now, this is interesting..
08:15 < burcin> apparently, the MPolynomialRing_generic._coerce_c_impl gets called in an infinite loop
08:15 < burcin> so scratch my first question, that function was getting called, and it was the one causing the segfault
08:18 < burcin> is it normal that MP.._generic._coerce_c_impl ends up calling "self(x)"?
08:19 < cwitty> Well, I see that in the code.  But I'm not understanding it, now that you mention it.
08:20 < cwitty> (I'm really not that familiar with the coercion model...mostly I copy-and-paste, and I've been fortunate enough to have that work.)
08:20 < burcin> I think no code path uses this function, it doesn't make sense..
08:21 < burcin> I'm trying to get familiar with the coercion model now, it hasn't been a very good day :)
08:24 < cwitty> Robert Bradshaw is signed up for Bug Day 4 (starting in a couple of hours), so he (and lots of other people) should be available for questions then.
08:26 < cwitty> It looks like polydict and libsingular mpolynomials have __call__ methods that have knowledge of all (or many) kinds of polynomials hardcoded.  Pretty annoying if you want to add a new kind of polynomial.
08:27 < burcin> yes, I've seen those
08:27 < burcin> it seems like the design went wrong somewhere
08:28 < cwitty> yep.
08:30 < burcin> ok, I'll try to make sense of this code
08:31 < burcin> and be online when the bug day starts
08:31 < burcin> though I can't stay up all night for the bug day this time
08:36 < cwitty> Univariate polynomials aren't much better.  There's a lot less code involved per case (because they don't have to worry about variable names, I guess); but there's still a lot of cases in Polynomial_integer_dense_ntl.__init__
08:39 < burcin> let me see
08:41 < burcin> I didn't know you could do that with univariate polynomials, I mean initialize them when you're creating them
08:41 < burcin> looking at the multivariate code I thought the sage way of doing that was to coerce into the parent object, and get the desired element
08:44 < cwitty> It all seemed a lot more straightforward when I was just copy-and-pasting and not actually thinking about it :)
08:54 < burcin> ok, univariate polynomials also do the coercion in __call__
08:54 < burcin> at least PolynomialRing_general defines it that way
08:56 < cwitty> But if you look at the last few lines of __call__, it mostly just forwards to the __init__ method of the individual class.
08:58 < burcin> yes, you're right..
09:02 < burcin> I can't wrap my head around this at the moment
09:02 < burcin> there should be a simple way of making the coercion model handle this, without these classes having to know about their _peers_ :)
09:03 < burcin> I'll think of that on the way back home
09:03 < burcin> and try to get online again a couple of hours later
09:03 < cwitty> See you around.
09:03 < burcin> see you
09:03 -!- burcin [i=berocal@leopard.risc.uni-linz.ac.at] has quit ["Leaving"]
09:13 -!- mhansen [n=mikehans@76.201.155.199] has joined #sage-devel
09:13 < cwitty> Good morning, mhansen.
09:13 < mhansen> Hello
09:13 < mabshoff|asleep> Hi mhansen
09:13 -!- mabshoff|asleep is now known as mabshoff
09:16 < mhansen> How did things play out the rest of the night.  I fell asleep around a bit after William left.
09:16 < mabshoff> well, no release yet.
09:17 < mabshoff> But William closed #923, so the basis for today is 2.8.7 + hg_[doc|sage|script].pull()
09:17 < cwitty> There's a 2.8.7.1; did you know about that?
09:17 < cwitty> (Which I think is the same thing as what mabshoff just said, packaged in a tarball.)
09:17 < mabshoff> Nope, is it in sage.math/tmp or where?
09:18 < cwitty> http://wiki.sagemath.org/bug4
09:18 < cwitty> points to 
09:18 < mabshoff> I guess http://sage.math.washington.edu/tmp/sage-2.8.7.1.tar
09:18 < cwitty> http://sage.math.washington.edu/tmp/
09:19 < cwitty> BTW, sorry for dropping out in the middle of conversations last night; we had a storm, and the power went out in my apartment.
09:21 < mabshoff> mmh, I guess you mean mhansen with that.
09:22 < cwitty> Actually, I guess I probably mean craigcitro.
09:22 < mabshoff> Yeah, that is the way it looks from the logs.
09:41 < wstein> cwitty -- wow you guys lost power.
09:41 < wstein> ouch.
09:41 < mabshoff> wb wstein
09:41 < wstein> It was pretty windy up here but I didn't have power issues.
09:42 < mabshoff> have a look at #941, dmharvey pointed us in the right direction
09:42 < cwitty> The wind here had mostly died down when the power went out.
09:47 -!- was [n=was@c66-235-37-221.sea2.cablespeed.com] has joined #sage-devel
09:48 -!- was is now known as william
09:48 < cwitty> william: ignoring "sage: " at the beginning of typed-in commands was a REALLY good idea.  Thanks.
09:48 -!- william is now known as wstein2
09:49 < wstein2> Magma has an IgnorePrompts mode.
09:49 < wstein2> But it's off by default.
09:49 < wstein2> I just made it on everywhere in Sage by default.
09:49 < wstein2> It is incredibly convenient.
09:49 < mabshoff> Does it also ignore '....'?
09:50 < wstein> yes.
09:50 < wstein> sort of.
09:50 < mabshoff> Well, then one can just paste any session without reformatting or editing.
09:51 < cwitty> ipython's auto-indent screwed it up for me when I just tried it.
09:52 < cwitty> Actually, it doesn't seem to work at all.
09:53 < wstein2> maybe it doesn't work with ...
09:53 < wstein2> That could be fixed though.
09:57 -!- jvoight [n=jvoight@65-183-130-83-dhcp.burlingtontelecom.net] has joined #sage-devel
09:58 < mabshoff> hi jvoight
09:58 < jvoight> Hi everyone!  How's it going?
09:58 < jvoight> Hey Craig: got your patches, thanks!  Haven't had a chance to try them out yet.
09:59 < wstein2> hi
10:03 < mabshoff> "sage -t  devel/sage-main/sage/calculus/calculus.py" seems to hang for me with 2.8.7+updates
10:03 -!- adam__ [n=giniu@80.48.71.46] has joined #sage-devel
10:04 < wstein2> on what systems?
10:04 < wstein2> for me it finishes in 23.6 seconds.
10:04 < mabshoff> sage.math
10:05 -!- adam__ [n=giniu@80.48.71.46] has quit [Client Quit]
10:05 < mabshoff> I have a clisp process with 9 seconds of CPU time sitting idle
10:05 -!- robert__ [n=robert@c-71-197-245-35.hsd1.or.comcast.net] has joined #sage-devel
10:05 < wstein2> it works fine with my clean build on sage.math in /home/was/www/tmp/
10:06 < mabshoff> That might be it, I am building 2.8.7.1, but I tried 2.8.7+updates while I waited 
10:06 < mabshoff> for that.
10:06 < cwitty> It fails for me too.  My CPU load monitor went down to zero, and the test is just sitting there.
10:07 < wstein2> I'm going to rebuild the sage-2.8.7.1.tar tarball right now.
10:07 < cwitty> And Control-C doesn't work.
10:07 < wstein2> I've tested that test on 4 machines without a failure.  Weird.
10:07 < mabshoff> yep, that is also the case for me.
10:07 < wstein2> Which test is hanging?
10:07 < wstein2> sage --verbose...
10:07 < cwitty> Trying:
10:07 < cwitty>     f = expand((Integer(2)*u*v**Integer(2)-v**Integer(2)-Integer(4)*u**Integer(3))**Integer(2) * (-u)**Integer(3) * (x-sin(x))**Integer(3))###line 2080:_sage_    >>> f = expand((2*u*v^2-v^2-4*u^3)^2 * (-u)^3 * (x-sin(x))^3)
10:07 < cwitty> Expecting nothing
10:08 < wstein2> cwitty -- which machine are you using?
10:08 < cwitty> my laptop.  32-bit x86 Debian testing.
10:08 < wstein2> I can't test on 32-bit linux right now, since bsd seems to have gone down.
10:08 < wstein2> I'm only able to test on powerpc osx, intel osx, and 64-bit linux.
10:08 < wstein2> (Also, meccah is gone.)
10:09 < mabshoff> down or gone?
10:09 < wstein2> gone.
10:09 < wstein2> it physically broke a few weeks ago.
10:09 < wstein2> evidently.
10:09 < wstein2> Anyway, Sage Bug Day 4 starts now.
10:09 < cwitty> You could set up a 32-bit chroot on sage.math.
10:10 < mabshoff> ok, if I want to log into abel or neron: which box do I use as "proxy"?
10:10 < wstein2> I have lots of good 32-bit environments -- it's just that the machine that runs them seems to have gone offline last night (it's my office workstation).
10:10 < wstein2> mabshoff -- modular.fas.harvard.edu
10:10 < mabshoff> I don't think I have an account, not important right now.
10:11 < mabshoff> oh, maybe I do, never mind.
10:11 < robert__> is there any way to do memory testing for sage on os x?
10:11 < wstein2> Is robert__ = robert miller?
10:11 < robert__> yes
10:11 < mabshoff> OSX's libs has checks for double frees and a couple other issues,
10:12 < wstein2> mabshoff spent hours trying to do memory testing related to graphi_isom.pyx last night...
10:12 < wstein2> So he can probably fill you in.
10:12 < mabshoff> valgrind will come with Leopard, but I don't know what release.
10:12 < robert__> i'm upgrading in linux, so i can wait for that...
10:12 < mabshoff> I commented all my findings to the ticket.
10:12 < wstein2> anyway, it's sage bug square day 4, and we'll focus on every *bug* from sage-2.8.8 on in the trac server.
10:12 < mabshoff> :)
10:12 < jvoight> I thought we were going to squash bugs, not square them!
10:12 < wstein2> mabshoff / cwitty -- you could try "hg_sage.pull()" again
10:13 < wstein2> :-)
10:13 < mabshoff> So it is your fault?
10:13 < wstein2> since on all my machines "sage -t calculus.py" works.
10:14 < robert__> mabshoff - not only is it certain graphs, but often only under certain circumstances - for example, the digraph that crashes all this works fine if you just do it alone first
10:15 < mabshoff> mk, we had some long discussion about the way you allocate arrays last night.
10:15 < wstein2> I can now replciate the calculus.py problem on one machine.
10:15 < mabshoff> Good
10:18 < robert__> i wonder what could have happened though, that doctest was working at the end of the summer...
10:18 < mabshoff> If there are memory issue it might work on one box but crash on another.
10:18 < wstein2> Are you sure the doctest ever worked?
10:18 < wstein2> It was sage.:'d.
10:18 < mabshoff> i.e there we coercion issues that only crashed on FC 7 32 bit.
10:19 < wstein2> Which means to me that maybe you thought it should work once in isolation, but never automatically tested.
10:19 < mabshoff> robert__: Can you create a mini code snippet with the graph that crashes as well as 
10:19 < mabshoff> all the code to do the computation
10:20 < mabshoff> That way I can just paste it into a session and see if anything pops up.
10:20 < robert__> the problem is this
10:20 < robert__> if i run all the graphs, then it crashes
10:20 < robert__> but if i just do the last one, it doesn't crash
10:20 < mabshoff> Sure, but valgrind might tells us something nonetheless.
10:21 < mabshoff> I increased array sizes and then it would run for longer and crash somewhere else.
10:21 < jvoight> Craig: I just applied your patch and it had a negligible affect on my calculations.  
10:21 < jvoight> So we should probably talk some more.
10:21 -!- malb [n=malb@host86-141-245-221.range86-141.btcentralplus.com] has joined #sage-devel
10:21 < jvoight> (27.7 s vs. 27.4 s--so you did gain 0.3 s.  :))
10:21 < mabshoff> So the non-crashing example might still reveal information and give us pointers.
10:21 < cwitty> wstein2: I've attached a patch to #913.
10:21 < mabshoff> Hi malb
10:21 < malb> hi everybody
10:22 < cwitty> Hi.
10:22 < robert__> try this
10:22 < robert__> sage: d = DiGraph({0: {0: None, 2: None}, 1: {0: None, 1: None, 2: None}, 2: {0: None, 1: None, 2: None}})
10:22 < robert__> sage: d.canonical_label()
10:22 < mabshoff> Thanks.
10:22 -!- cwitty changed the topic of #sage-devel to: SAGE Bug Days 4 in progress
10:23 < malb> has 2.8.8. been released?
10:23 < malb> what's the version I am supposed to work with for this squash?
10:23 < mabshoff> Nope, but 2.8.7.1
10:24 < wstein2> get 2.8.7 and pull in hg_sage, hg_scripts, and hg_doc
10:24 < mabshoff> It is in sage.math/mtp
10:24 < malb> no upgrade?
10:24 < mabshoff> Ehh sage.math/tmp. but you should pull
10:24 < wstein2> no upgrade.
10:24 < malb> okay
10:24 < wstein2> I might be able to release it though as an upgrade right now, since it passes doctests.
10:24 < wstein2> at least, maybe in 5-10 minutes.
10:24 < malb> okay, good
10:25 < cwitty> wstein2: for #837, "RealNumber should have abs method", I plan to add an abs method on RingElement that just forwards to the built-in __abs__ method.  So rings where __abs__ makes no sense will not implement it, and .abs() will still fail (but tab-completion will say it's there).
10:25 < cwitty> Does that sound good?
10:25 < malb> I'll make a new spkg for Singular which fixes some bugs
10:25 < wstein2> yes.
10:25 < wstein2> thanks malb
10:25 < mabshoff> malb: Did you see the email from Hannes with the memmove fixes?
10:25 < mabshoff> (for Singular)
10:25 < malb> yes, it is in singular 3-0-3-2
10:25 < mabshoff> Cool, just making sure.
10:26 < malb> the second release just for us
10:26 < mabshoff> It is amazing that they release just for us.
10:26 < mabshoff> Exactly ;) 
10:26 < malb> it is
10:26 < roed___> hello
10:26 < mabshoff> Well, I assume that many people find problems, but few report them back properly 
10:26 < mabshoff> and follow up like we do.
10:26 < mabshoff> Hi roed___
10:26 -!- giniu [n=chatzill@80.48.71.46] has joined #sage-devel
10:27 < mabshoff> William rediscivered your #919
10:27 < roed___> I saw. He sent me an e-mail
10:27 < robert__> mabshoff - any useful information from valgrind?
10:27 < mabshoff> And I also found that you do not clean up the caches memory, which became #942
10:27 < mabshoff> Not yet, had to build the optional valgrind spkg.
10:27 < roed___> I thought I did
10:27 < roed___> Let me look
10:28 < mabshoff> Well, it was without the patch for #919
10:28 < wstein2> Try hg_sage.pull() and hg_scripts.pull(), then retest calculus.py
10:29 < mabshoff> Will do after I finish valgrinding robert's issue.
10:29 < roed___> Yeah, my code looks like I clean up the memory
10:29 < mabshoff> Cool
10:29 < mabshoff> In Williams test case it was about 2.1GB, so one tends to notice that.
10:30 < mabshoff> But I can retest once #919 is merged.
10:30 < wstein2> Hi -- I'm going to make an official 2.8.7.1 release in a few minutes, so everybody can just "sage -upgrade" to it.
10:30 -!- fabio_ [n=fabio@chello062178170083.13.14.vie.surfer.at] has joined #sage-devel
10:31 < wstein2> This will be the same as "hg_sage, hg_doc, hg_scripts" pulls, along with installing the elliptic_curves standard package, which wasn't installed before.
10:31 < mabshoff> robert___: the simple example is clean.
10:31 < robert__> clean?
10:31 < roed___> ah.  Yeah, I think there was a bug and I wasn't using weakrefs
10:31 < robert__> valgrind finds nothing?
10:31 < roed___> Now I am
10:31 < mabshoff> But in case it crashed I saw issues with pariinstances accessing uninitialized memory.
10:32 < mabshoff> The are no access violations when valgrinding the simple example, so yes.
10:32 < robert__> that doesn't make any sense
10:32 < mabshoff> Well, it might not be your fault, but a side effect of something else.
10:33 < mabshoff> I am rerunning the whole doctest, that way I can look at the callchain for the pari_instamce
10:33 < mabshoff> failures.
10:33 < robert__> pariinstance?
10:33 < mabshoff> The only interesting question is: Where do we end up using pari_instance in that code?
10:34 < robert__> it doesn't make sense that we are at all
10:34 < robert__> it's all local datastructures and stuff
10:34 < mabshoff> Did you see the remark about k growing beyond n?
10:34 < robert__> yeah
10:34 < mabshoff> Or n+1
10:35 < robert__> that was pretty typical for the problems i was having before
10:35 < mabshoff> That is what causes the crash itself.
10:35 < robert__> but the variance on what causes that is crazy
10:36 < mhansen> calculus.py passes for me with the updates.
10:36 < mabshoff> Well, it may be that some values are not properly reinitialized when calling it 
10:36 < mabshoff> i.e. search whatever multiple times.
10:37 < wstein2> #919 -- I'm looking at this now.
10:37 < robert__> but shouldn't valgrind pick up something like that?
10:37 < mabshoff> No, not in that case.
10:37 < robert__> if it's not initialized then valgrind would catch something reading from it
10:37 < mabshoff> The first issue I see is some problem in the coercion code:
10:37 < robert__> oh, because it was initialized before...
10:37 < mabshoff> Something like that.
10:39 < mabshoff> The problem with the coercion code is attached to the ticket, but it might 
10:39 < mabshoff> be also k being greater than n+1.
10:40 < robert__> mabshoff - here's some insight
10:41 < robert__> we have to keep track of "indicator values" in that code. that lets you tell what parts of the search tree you've seen before
10:41 < robert__> i think I'm using sage int's for those, that might be where coercion comes in...
10:41 < mabshoff> Well, I saw something else related.
10:41 < mabshoff> ==31660== Use of uninitialised value of size 8
10:41 < mabshoff> ==31660==    at 0x42E340: PyInt_FromLong (intobject.c:88)
10:41 < mabshoff> ==31660==    by 0x17DDDFCD: __pyx_f_py_10graph_isom_search_tree (graph_isom.c:7607)
10:42 < mabshoff> which is
10:42 < mabshoff>           /* "/tmp/Work-mabshoff/sage-2.8.7/devel/sage-main/sage/graphs/graph_isom.pyx":1323
10:42 < mabshoff>  *                 print [_zeta.levels[iii] for iii in range(n)]
10:42 < mabshoff>  *                 print '_rho'
10:42 < mabshoff>  *                 print [_rho.entries[iii] for iii in range(n)]             # <<<<<<<<<<<<<<
10:42 < mabshoff>  *                 print [_rho.levels[iii] for iii in range(n)]
10:44 < robert__> i don't think that's too surprising
10:44 < mabshoff> Why?
10:45 < mabshoff> wstein2: After pulling calculus.py works fine.
10:45 < wstein2> I actually turned off that one doctest that was causing the trouble and made a trac ticket about it.
10:45 < robert__> that line is only for debugging, so whenever it gets run its printing the whole array for _rho, and i may only have used the first part
10:45 < wstein2> It could be quite hard to fix.
10:45 < wstein2> But it won't be forgotten.
10:45 < mabshoff> ok
10:45 < jvoight> Will, when you have a sec, I'd like to ask you about Cython/DSage.
10:47 < robert__> alright, i have to go for a little bit
10:47 < robert__> hopefully when i get back i can start valgrinding this
10:47 < wstein2> jvoight -- I have a second.
10:47 < mabshoff> Okay, I will keep an eye on this.
10:47 < wstein2> sage-2.8.7.2 should now be released.
10:47 < wstein2> So you should be able to "sage -upgrade".
10:48 < jvoight> OK, I'm trying the sage-2.8.7.2 upgrade.
10:48 < jvoight> I'm tantalizingly close to getting my DSage situation set up.
10:48 -!- cwitty [n=cwitty@sense-sea-MegaSub-1-205.oz.net] has quit [Remote closed the connection]
10:49 < jvoight> One annoying thing right now is that if I want to run Cython code inside DSage, I have to use your trick of adding cython(""" at the top.  But if I do this, I can't have any long nice comments and examples inside my code!?
10:49 -!- cwitty [n=cwitty@sense-sea-MegaSub-1-205.oz.net] has joined #sage-devel
10:49 < wstein2> use cython('''...)
10:49 -!- malb [n=malb@host86-141-245-221.range86-141.btcentralplus.com] has quit [Read error: 104 (Connection reset by peer)]
10:49 < wstein2> I.e., single triple quotes is the same as double triple quotes.
10:50 < jvoight> The other question I had was just: if I load foo.spyx and make a change and load foo.spyx again, for every directory d 2+2in 
10:50 -!- malb [n=malb@host86-141-245-221.range86-141.btcentralplus.com] has joined #sage-devel
10:51 < jvoight> Uh, sorry about that...  I mean, I get an error 'ln ... directory d already exists'.  Not a huge issue, but if I have many directories, it's kinda annoying.
10:51 < wstein2> hmm.
10:51 < wstein2> that looks like a bug.
10:51 < wstein2> Is it something that you get without using dsage at all?
10:52 < jvoight> Yes, that has nothing to do with DSage.
10:52 < jvoight> Sorry, I'd give you a more explicit example but it's upgrading at the moment.
10:52 < jvoight> Should I just trac it?
10:52 < wstein2> So basically load foo.spyx followed by load foo.spyx doesn't work?
10:52 < wstein2> That sounds like a perfect bug day bug.
10:53 < wstein2> Definitely trac it, and mark it sage-2.8.8, so we can definitely look at it today and resolve it.
10:53 < jvoight> It works OK, it just gives an 'ln ...' message.  
10:53 < jvoight> OK.
10:54 < jvoight> Will, on sage.math, if I type "sage" at the $ prompt, it gives me an error.  Is it up to something ATM?
10:54 < malb> wow if it works out as planned than upgrading Singular this time is a trivial almost pleasant job
10:55 < jvoight> <ERROR: name 'sage_prompt' is not defined>
10:55 < malb> I only had to *remove* workarounds
10:55 < mabshoff> :)
10:55 < wstein2> jvoight -- that's because I'm in the middle of upgrading the system-wide sage on sage.math
10:56 < wstein2> it won't work for 5 more minutes.
10:56 < jvoight> OK, I figured as much.
10:56 < jvoight> No worries.
10:59 < wstein2> I've closed trac #941 -- David Roe's patch fixes it.
11:00 < mabshoff> Cool.
11:00 < roed___> yay
11:00 < wstein2> Unfortunately pushing out your patch means people will have to wait 10 minutes to build again :-)
11:00 < roed___> lol
11:00 < wstein2> David did you test all after applying your patch?
11:00 < roed___> Yeah, I was messing with gmp
11:00 < roed___> gmp.pxi that is
11:01 < roed___> I ran testall, but I don't remember if I looked at the results...
11:01 < roed___> Let me see if I can find that terminal
11:01 < wstein2> thanks.
11:01 < wstein2> the rings/padics directory passes all tests.
11:02 < wstein2> By the way, new in sage-2.8.7.2 is that doctesting graphics or anything calling .show(...) doesn't leave .png temp files around.
11:02 < roed___> yeah, I ran testall
11:02 < roed___> sweet
11:04 < wstein2> ok, good.
11:05 < wstein2> so are p-adic extensions now closer?
11:06 < roed___> ::sigh::  Closer, yes
11:07 < wstein2> closer in the p-adic topology?
11:07 < roed___> lol
11:07 < roed___> yup.  The difference has larger valuation
11:08 < roed___> I've been stuck on linking bugs and C++ issues for most of this week
11:08 < roed___> That's done.
11:09 < roed___> Now I need to write the PowComputer_ext classes, and conversion functions between working mod p^n and p^m
11:09 < wstein2> your patch breaks integer_mod.pyx in the rings directory; at least against sage-2.8.7.2
11:09 < wstein2> that's weird; now it doesn't.
11:09 < roed___> strange
11:09 < wstein2> never mind -- that had to do with the gap workspace, not your patch.
11:09 < roed___> ok
11:09 < wstein2> your patch looks good
11:09 < wstein2> closed.
11:09 < roed___> :-)
11:10 < wstein2> I'm looking at the build failure report I just sent to sage-devel.
11:10 < wstein2> singular fails to build on paul zimmerman's computer.
11:10 < mabshoff> Paul's?
11:11 < wstein2> yep.
11:11 < wstein2> he's using gcc-4.0.2 on redhat.
11:11 < mabshoff> ok
11:11 < wstein2> I wonder if that is the problem.
11:12 < wstein2> malb -- you might want to look at the paul zimmerman build failure to see if it means anything to you.
11:12 < wstein2> It's failing in Singular: 
11:12 < mabshoff> That is looking like a potential mismatch for libstc++.so
11:12 < wstein2> ../kernel/libkernel.a(tgb.o)(.text+0xa0cf): In function `add_to_basis_ideal_quotient(spolyrec*, slimgb_alg*, int*)':
11:12 < wstein2> tgb.cc: undefined reference to `__gnu_cxx::__mt_alloc<unsigned long, __gnu_cxx::__common_pool_policy<__gnu_cxx::__pool, true> >::deallocate(unsigned long*, u
11:14 < cwitty> My first guess would be that his C++ headers don't match his libstdc++.
11:14 < cwitty> (That's probably what mabshoff meant?)
11:14 < mabshoff> yep, in so many words.
11:15 < malb> the error doesn't tell me much
11:16 < mabshoff> I think cwitty is right, that is all internal allocator stuff in libstdc++.so and in the 
11:16 < mabshoff> past it was always a mismatch of headers and lib.
11:16 < mabshoff> Remember the same issue on neron with ntl?
11:17 < wstein2> the system-wide sage on sage.math is now upgraded.
11:18 < wstein2> I just pushed out david Roe's changes to the official repo.
11:18 < mabshoff> ok
11:18 < wstein2> These take a few minutes to build, since he touches gmp.pxi.
11:18 < malb> actually, this seems boost related
11:18 < malb> i.e. Zimmerman's problem
11:19 < mabshoff> boost? Does Singulat use boost?
11:19 < mabshoff> It does.
11:19 < mabshoff> He uses FC4, so that is a little on the old side.
11:20 < wstein2> yeah gcc-4.0.2.. very old.
11:20 < mabshoff> Well 4.0.2 is allright, but does Singular ship its own copy of boost or does it uses 
11:20 < mabshoff> the system one?
11:21 < malb> no they check for boost/dynamic_bitset.hpp in Singular/configure 
11:21 < wstein2> So maybe we need to modify our singular build to never use boost?
11:21 < mabshoff> Yep, I saw that. But if it were to fail do they fall back or just fail?
11:22 < wstein2> Why do they use boost?
11:22 < malb> "//Poly wraps around PolyImpl with reference counting using boost"
11:22 < mabshoff> slimgb uses it for boost::dynamic_bitset
11:22 < malb> you don't need boost though
11:25 < malb> so the header test in configure passes but the matching library is not found
11:27 < malb> I'd recommend to (a) tell Paul about that and (b) make a feature request to the Singular group to provide --without-boost
11:27 < mabshoff> 3-0-3-3 is coming :)
11:27 < malb> wstein2 is bsd down?
11:27 < wstein2> I'm emailing Paul right now.
11:27 < wstein2> Yes, bsd is down.
11:27 < wstein2> It's annoying.
11:27 < wstein2> I might make a trip to my office later to fix it.
11:27 < wstein2> Hey, is anybody who has a key to my office on campus?  (who is here.)
11:28 < malb> okay, I have to submit the singular spkg without OSX build test then
11:28 < wstein2> I can test it on my laptop after you submit it.
11:28 < malb> but I am confident it compiles
11:28 < mabshoff> Is bsd an Intel OSX box?
11:28 < malb> yeah
11:28 < mabshoff> ok
11:28 < malb> a huge loud one
11:28 < wstein2> it's not that loud.
11:28 < wstein2> it's huge though.
11:28 < wstein2> loud = opteron sun servers.
11:29 < mabshoff> two Quad cores?
11:29 < malb> okay
11:29 < wstein2> I wish.
11:29 < wstein2> It's two dual core xeons.
11:29 < wstein2> It was from before the quad cores came out.
11:29 < mabshoff> Well, still pretty cool.
11:29 < wstein2> yep.
11:29 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
11:29 < malb> I had to walk back from the apple store when william bought it because it hardly fit into William's car
11:29 < wstein2> hi robertwb.
11:29 < wstein2> :-)
11:29 < wstein2> lol
11:29 < mabshoff> Well, I guess he is setting priorities ;)
11:29 < robertwb> hi
11:29 < malb> who could blame him
11:29 < mabshoff> hi robertwb
11:30 < mabshoff> :')
11:30 < malb> http://sage.math.washington.edu/home/malb/pkgs/singular-3-0-3-2-20071020.spkg
11:31 < cwitty> I like the Sage wiki diffs.  It points out that you can change "UPgRADe" to "geT" by removing/inserting the capitalized diffs.
11:31 < mabshoff> lol
11:32 < wstein2> malb -- I'm building your singular package on an intel mac now.
11:32 < malb> cool
11:32 < wstein2> i'll build it on ppc mac too.
11:33 < mabshoff> Damn roed__ - touching gmp.pxi is a bad idea.
11:33 < malb> The relevant tickets are #872 and #870
11:33 < wstein2> yep.
11:33 < wstein2> the pain.
11:34 < roed___> Sorry
11:34 < wstein2> you got to do what you got to do.
11:34 < roed___> There was a bug in it
11:35 < mabshoff> Well, it wasn't intentional I hope.
11:35 < mabshoff> I am now verifying that #942 is fixed.
11:36 < wstein2> good point -- I shouldn't have closed the ticket so quickly
11:36 < mabshoff> No, that was #941, #942 is about the cache not being freed.
11:37 < mhansen> robertwb: Since you're probably more familiar with the coercion code, could you help me out with something?
11:37 < robertwb> sure
11:38 < mhansen> There's some issues with coercion and the expect interfaces.  For example,
11:38 < mabshoff> roed___: #919 also fixed #942, so I am closing it.
11:38 < roed___> good
11:38 < mhansen> sage: lie('2')*3
11:38 < mhansen> <type 'exceptions.TypeError'>: unsupported operand parent(s) for '*': 'LiE Interpreter' and 'Integer Ring'
11:39 < mhansen> sage: lie(2)*lie(3)
11:39 < mhansen> 6
11:39 < wstein> lie needs an _coerce_impl method.
11:39 < robertwb> is there a coercion Integer -> lie
11:39 < robertwb> yes
11:39 < wstein> otherwise nothing will ever happen automatically.
11:40 < cwitty> wstein: I plan to fix #310 by patching the mercurial spkg to not automatically look at /etc/mercurial/... (it would still look at $SAGE_ROOT/local/etc/mercurial).  Should I upgrade to mercurial 0.9.5 at the same time?  (We're using 0.9.4.)
11:41 < wstein> cwitty -- yes, pleas upgrade mercurial.
11:41 < wstein> singular builds fine on intel osx
11:42 < malb> good
11:42 < mabshoff> re #310: should be check for SAGE_MERCURIALRC so that one can use their own copy 
11:42 < mabshoff> if they want to?
11:42 < mabshoff> Or better SAGE_HGRC.
11:42 < wstein> it also builds fine on ppc osx.
11:43 < malb> excellent
11:44 < cwitty> mabshoff: ~/.hgrc and $SAGE_ROOT/local/etc/mercurial both work.  You think we need a way to read config files from another place besides those two?
11:45 < wstein> I don't think we do.
11:45 < mabshoff> No, but if we have some config env variable one can decide which one to use.
11:45 < wstein> that sounds too complicated.
11:45 < mabshoff> I prefer to have just on ~/.hgrc, but I don't have non-standard extensions installed.
11:46 < mabshoff> Is Craig going to be around later?
11:46 < cwitty> Anybody who cares can just make $SAGE_ROOT/local/etc/mercurial a symlink to somewhere else.
11:46 < mabshoff> True.
11:50 < wstein2> hi: regarding #872.
11:50 < wstein2> the new spkg definitely fixes the bug reported there with factoring.
11:51 < wstein2> But I tried factoring in a 2-variable ring and it quickly runs out of steam.  E.g., this fails:
11:51 < wstein2> > ring r=(0,a),(x,y),dp;
11:51 < wstein2> > minpoly = a^2+1;
11:51 < wstein2> > factorize(x^12 + y^12);
11:52 < cwitty> mabshoff: from bug4 on the wiki: "Craig Citro (after about 1PM Pacific)" (So he should show up in about 2 hours.)
11:53 < malb> wstein2: we shoudl report that upstream (?) also cwitty had a look at the code
11:53 < mabshoff> cwitty. thanks.
11:53 < cwitty> wstein2: I'm not surprised.  It uses the Euclidean gcd algorithm on multivariate polynomials, which is notoriously bad.
11:53 < wstein2> malb -- I think we definitely should report it upstream if you can replicate it. 
11:53 < wstein2> Let me try the same in Magma, to see if it is instant.
11:53 < wstein2> That will make the singular people want to fix the problem even more, presumably.
11:54 < mabshoff> :)
11:55 < wstein2> Magma does the problem in 0.050 seconds.
11:55 < malb> okay, it hangs here as well
11:55 < wstein2> Singular takes forever!
11:55 < wstein2> Definitely a bug.
11:55 < malb> yeah
11:55 < cwitty> The original problem was getting the multivariate bad behavior on a univariate polynomial because the field generator counted as an extra variable.  I mostly fixed that, so on univariate problems the GCD isn't so bad; but my patch would still leave multivariate factorization in a bad way.
11:55 < wstein2> yep.
11:56 < wstein2> I've posted magma code that is super fast for the same problem to the ticket, and re-opened it.
11:56 < wstein2> could somebody volunteer to report this to singular?
11:56 < malb> If cwitty doesn't want to I can certainly do it
11:57 < mabshoff> Shouldn't we open another ticket for the problem.
11:57 < malb> actually, I agree
11:57 < mabshoff> It is related, but the original problem was still fixed.
11:58 < wstein> ok, mabshoff can you open another ticket and paste at least my code there?
11:58 < wstein> then I'll close #872
11:58 < mabshoff> Will do.
11:58 < cwitty> malb, I'd rather not.
11:58 < malb> okay, I'll do it
11:59 < mabshoff> I can also update the topic that the Singular forum.
12:01 < malb> btw. it does eventually terminate in Singular
12:01 < mabshoff> Done, #948, assigned to malb. You might want to massage the ticket description.
12:01 < malb> it might not be a bug report but a feature request
12:02 < mabshoff> It is a performance issue, so it coud be either way. In Sage it would be a defect ;)
12:03 < cwitty> Yes.  I didn't see anywhere that the code would give a wrong answer, or loop forever; it's just very slow.
12:05 -!- burcin [n=burcin@heim-034-54.raab-heim.uni-linz.ac.at] has joined #sage-devel
12:06 < wstein2> robertwb: what is the situation with 444?
12:06 < robertwb> Just waiting to be added
12:06 < wstein2> what about the "needs to be tested" remark?  has anybody done any testing?
12:06 < robertwb> other than me, I don't know
12:07 < wstein2> so adding, means apply the hg bundle and including that one spkg in sage?
12:07 < robertwb> oh, I think you were going to make it an optional package for a bit
12:07 < robertwb> yes
12:07 < wstein2> ah.
12:07 < wstein2> I'm moving it to sage-2.9. 
12:07 < wstein2> it's not a bugday sort of thing.
12:08 < robertwb> fair enough
12:08 < mabshoff> Should we already open 2.8.9?
12:08 < mabshoff> 2.9 is way too crowded.
12:08 < wstein2> mabshoff -- yes.
12:08 < wstein2> yep.
12:08 < mabshoff> I will do so.
12:08 < wstein2> I'm going to look at #561 now.
12:09 < wstein2> that's an easy patch to read.
12:10 < malb> I'm going to look at #943 now, that seems quite easy
12:11 < wstein2> yep.
12:11 < wstein2> thanks.
12:11 < wstein2> it's not a bug though :-)
12:11 < mabshoff> I would be great if you could merge #561, #619 and #907
12:11 < mabshoff> They are all extremly simple memleak fixes, all tested together by me.
12:12 < malb> who is "you"?
12:12 < wstein2> jI just did 516.
12:12 < wstein2> I'm doing 619 now.
12:12 < malb> okay, that's not me
12:12 < wstein2> I am "you".
12:12 < mabshoff> Ok, you->stein2 in this case. I was confused for a minute.
12:13 -!- burcin [n=burcin@heim-034-54.raab-heim.uni-linz.ac.at] has quit ["Leaving"]
12:14 < mabshoff> #705 is also an updated/new spkg, so I am moving it to 2.8.9
12:14 -!- fabio_ [n=fabio@chello062178170083.13.14.vie.surfer.at] has quit [Read error: 110 (Connection timed out)]
12:15 < wstein2> mabshoff -- and maybe you could move more bugs to 2.8.8... :-)
12:15 < mabshoff> Well, all the ones with patches were moved to 2.8.8.
12:19 < wstein> ok, 907 and 619 and 561 are done.
12:19 < mabshoff> Cool,
12:19 < mabshoff> How about #935?
12:21 < wstein> #935 -- reject.
12:21 < robertwb> has anyone done #922?
12:21 < mabshoff> Why?
12:21 < wstein> Those files *should* be in sage.
12:21 < mabshoff> So why aren't they in the repo?
12:21 < wstein> probably they didn't get included because of a mistake in MANIFEST.in.
12:21 < mabshoff> ok
12:22 < mabshoff> So mark #935 as invalid?
12:22 < wstein> at least the one that doctests cvxopt, scipy, definitely should be remade.
12:22 < mabshoff> That is another ticket.
12:22 < wstein> It's not invalid, it's just that the fix isn't exactly right.
12:22 < mabshoff> Well, then we should change the description.
12:23 < mabshoff> #709 adds doctests for cvxopt.
12:24 < mabshoff> And #700 as wellas #636 are related/dups.
12:24 < jvoight> O
12:24 < jvoight> I'll take 922.
12:24 < robertwb> I'm doing 922 now
12:24 < jvoight> Oh, OK, it's yours then.
12:25 < mhansen> I'm working on #936.
12:26 < wstein> I totally don't get #935.
12:26 < wstein> all the files you are removing are in the sage distro, as far as I can tell.
12:26 < mabshoff> Well, could it be that hg status without sourcing sage-env on sage.math picks up 
12:26 < mabshoff> the wrong hg?
12:26 < wstein> possible...
12:26 < mabshoff> Let me check.
12:27 < wstein> hg status on a clean sage install on sage.math gives nothing funny.
12:27 < mabshoff> it does for me, even with the hg in $SAGE_LOCAL/bin
12:28 < wstein> A clean install is /home/was/www/tmp/sage-2.8.7.1
12:28 < wstein> and there hg status outputs nothing.
12:28 < wstein> So...
12:28 < mabshoff> mabshoff@sage:/tmp/Work-mabshoff/sage-2.8.7/devel/sage$ which hg
12:28 < mabshoff> /tmp/Work-mabshoff/sage-2.8.7/local/bin/hg
12:28 < mabshoff> mabshoff@sage:/tmp/Work-mabshoff/sage-2.8.7/devel/sage$ hg status
12:28 < mabshoff> ! sage/dsage/README.html
12:28 < mabshoff> ! sage/numerical/test.py
12:28 < mabshoff> ! setupnb.py
12:28 < mabshoff> ! spkg-delauto
12:29 < wstein> maybe you applied some funny patches that deleted those files?
12:29 < mabshoff> Nope, that was 2.8.7 + hg_sage.pull()
12:30 < mabshoff> But I have seen that for many versions in the past.
12:30 < mabshoff> mabshoff@sage:/tmp/Work-mabshoff/sage-2.8.7/devel/sage$ ls -al sage/dsage/README.html
12:30 < mabshoff> ls: sage/dsage/README.html: No such file or directory
12:30 < wstein> but I did 2.8.7 + pull in many places and don't see that.
12:30 < mabshoff> So the file README.html doesn't even exist.
12:30 < wstein> in every repo I have, it does exist.
12:30 < mabshoff> Well, I will investigate it later, it might be hgrc related.
12:31 < wstein> It's clearly included in the MANIFEST.txt
12:31 < wstein> I hope we can get to the bottom of it.
12:31 < mabshoff> Well, I will have a look later today.
12:32 < mabshoff> Ok, I did just build 2.8.7.1 and it passes testall, but hg status says the same thing.
12:33 < mabshoff> hg verify says everything is ok.
12:34 < wstein> If you just look in sage-2.8.7.1.spkg, you'll see that README.html is there.
12:34 < wstein> You are somehow deleting it -- I have no clue how.
12:34 < mabshoff> Could testall delete that?
12:35 < wstein> It shouldn't.
12:35 < mabshoff> :)
12:35 < wstein> That would be very weird.
12:37 < mabshoff> What is the difference between Manifest.in and Manifest.txt?
12:38 < mabshoff> because spkg-delauto isn't in my manifest.in
12:39 < mabshoff> And I cannot find any manifest.txt or MANIFEST.txt.
12:40 < wstein> there is no MANIFEST.txt.
12:41 < mabshoff> okay, so you meant MANIFEST.in earlier.
12:41 < wstein> yes.
12:41 < mabshoff> I will recompile 2.8.7.2 from scratch and have a look before I run doctests.
12:46 < robertwb> I'm looking at #926
12:46 < robert__>  mabshoff -- any news on #939?
12:47 < mabshoff> Well, I think that somehow there are some values left initializes with non-standard 
12:48 < mabshoff> values after a couple runs.
12:48 < mabshoff> There are some cdef 'd variables that are not initialized to 0 or something else, but 
12:48 < robert__> i solved a problem just like this before -- it was a fencepost error
12:48 < mabshoff> I do not know the algorithm, I got the paper yesterday.
12:48 < mabshoff> fencepost?
12:49 < robert__> looping from 0 to n instead of 0 to n-1, or things like that
12:49 < mabshoff> Ok,
12:49 < mabshoff> I find it very odd that k grows and grows, and in a lot of places k is assigned 
12:49 < mabshoff> min or max of some value.
12:49 < robert__> what it was doing before was reading where it wasn't supposed to, and that was telling it to go look in random memory, and segfault
12:49 < robert__> k keeps track of your depth in the search tree
12:50 < robert__> when you discover an automorphism, you can eliminate all the way up to where the two branches merge, and explore new areas from there
12:50 < mabshoff> Yep, but some of the arrays have only n+1 elements, and the segfaults happens when 
12:50 < mabshoff> k>n+1
12:50 < robert__> k *should* be bounded by n
12:51 < mabshoff> Well, it clearly isn't
12:51 < robert__> do you have any examples where a single graph does it?
12:51 < mabshoff> Nope, just the whole doctest.
12:51 < robert__> ok
12:51 < mabshoff> Have you tried rerunning the same graph for a couple iterations.
12:51 < robert__> that wouldn't do it
12:51 < robert__> however, i think i know what to do
12:52 < robert__> i almost feel like i fixed this problem with this doctest before, and it never got merged in...
12:52 < robert__> i'll be back when i have something
12:52 < mabshoff> Good, there is little I can do without spending a whole lot of time on theory as well 
12:52 < mabshoff> as reading the code for a couple hours ;)
12:54 < robert__> it's frustrating even if you wrote the code, trust me....
12:54 < mabshoff> I understand the feeling.
12:54 < mabshoff> Sometimes a fresh pair of eyes just asks the right dumb questions ;)
12:55 -!- was [n=was@c66-235-37-221.sea2.cablespeed.com] has joined #sage-devel
12:57 < mhansen> wstein / was: I put the current status for #936 up: http://trac.sagemath.org/sage_trac/ticket/936
12:57 < wstein> thanks.
12:57 < wstein> I'll start applying that very soon.
12:57 < wstein> I'm looking at #700...
12:58 < cwitty> wstein: I did a "sage -upgrade" from 2.8.6, and it did not install elliptic_curves-0.1 .  (It downloaded, but did not install.)
12:58 < cwitty> This is sage.math.washington.edu:/home/cwitty/sage, in case you want to look at the current status.
12:59 < mhansen> robertwb: What is the status of #624?  (Also, the issue with lie turned out to be because the defaults for _an_element_impl were causing some errors.
13:00 < robertwb> I think it has been merged in already
13:00 < mhansen> Okay, that's what we thought.
13:02 -!- wstein2 [n=was@c66-235-37-221.sea2.cablespeed.com] has quit [Read error: 110 (Connection timed out)]
13:04 < wstein> cwitty -- try upgrading again.
13:05 < wstein> I forgot to post the install file to the server.
13:05 < cwitty> Yes, that fixed it.
13:06 < cwitty> I wonder how hard it would be to remove the "__foo__" goes to "foo" (underlined) rule from TRAC.
13:07 < mhansen> wstein: I cannot reproduce #881 -- the HTML between notebook cells
13:07 < wstein> mhansen -- neither can i.
13:07 < wstein> could you close #881.
13:08 < cwitty> So, what's an adequate test for a new mercurial spkg?  I have one at sage.math:/home/cwitty/mercurial-0.9.5.spkg .
13:08 < mhansen> Closed.
13:09 < wstein> cwitty -- i can't think of anything except just trying it out.
13:09 < wstein> it's almost all pure python, too, so building probably isn't hard.
13:10 < wstein> I'll try yours.
13:10 < mabshoff> You should add a spkg-test because there is a make check target in there.
13:10 < cwitty> I did install it into my sage, and tried a few commands, that worked.
13:10 < mabshoff> The mercurial testsuite is quite extensive,
13:10 < craigcitro> hi all
13:10 < wstein> hi craig
13:11 < craigcitro> jvoight, you around?
13:11 < mabshoff> so it is worth running it, even though I have never gotten it to pass without 
13:11 < mabshoff> at least one failure.
13:11 < mabshoff> Hi craig
13:11 < craigcitro> hey mike
13:11 < craigcitro> i saw you mentioned my name earlier -- what was up?
13:12 < mabshoff> craigcitro: are you aware of #894?
13:12 < mabshoff> Given ifti's experience with loads of 8 bytes leaks I want to fix those soon.
13:12 < craigcitro> no, haven't looked at it yet, looking right now
13:12 < mabshoff> ok
13:13 < craigcitro> it's not worth fixing any of the GF2 ones -- malb is going to end up rewriting that code soon
13:14 < mabshoff> Some of the leaks in #894 are in Givaro itself, but I need to look into those.
13:14 < mabshoff> Yep, there already is a GF2 patch by malb.
13:14 < wstein> I just fixed #700, finally...
13:14 < robert__> ok, i just upgraded, and sage won't start...
13:14 < mabshoff> Cool.
13:14 < wstein> "sage -br"
13:14 < robert__> thanks
13:15 < craigcitro> wow ... really? crazy.
13:15 < robert__> Error building c_lib?
13:15 < mabshoff> Well, I don't think malb's GF2 patch applied cleanly, 
13:15 < robert__> i686-apple-darwin8-g++-4.0.1: src/convert.os: No such file or directory
13:16 < mabshoff> so we should see how the current situation is.
13:18 < jvoight> Hi Craig, yep, I'm here.
13:18 < jvoight> How's it going?
13:18 < craigcitro> not bad, you?
13:18 -!- robertwb_ [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
13:19 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has quit [Read error: 104 (Connection reset by peer)]
13:19 < jvoight> Alrighty, thanks.  :)
13:22 < cwitty> robertwb_: I just posted a Cython wishlist item at https://bugs.launchpad.net/cython/+bug/155076 , and I wondered what you think of the idea ("Cython should cache the result of imports").  Also, I couldn't figure out how to actually mark it as wishlist instead of bug.
13:22 < robert__> can anyone tell me how to get my sage wotking again?
13:22 < craigcitro> so let's get that code of yours running faster. where's the code you're running, jvoight? is it on sage.math so i can try it out?
13:22 < robert__> or working?
13:23 < robert__> i'm getting i686-apple-darwin8-g++-4.0.1: src/convert.os: No such file or directory
13:23 < robert__> i686-apple-darwin8-g++-4.0.1: src/interrupt.os: No such file or directory
13:23 < robert__> i686-apple-darwin8-g++-4.0.1: src/mpn_pylong.os: No such file or directory
13:23 < robert__> i686-apple-darwin8-g++-4.0.1: src/mpz_pylong.os: No such file or directory
13:23 < robert__> i686-apple-darwin8-g++-4.0.1: src/stdsage.os: No such file or directory
13:23 < robert__> i686-apple-darwin8-g++-4.0.1: src/gmp_globals.os: No such file or directory
13:23 < robert__> i686-apple-darwin8-g++-4.0.1: src/ZZ_pylong.os: No such file or directory
13:23 < robert__> i686-apple-darwin8-g++-4.0.1: src/ntl_wrap.os: No such file or directory
13:23 < robert__> scons: *** [libcsage.dylib] Error 1
13:23 < robert__> ERROR: There was an error building c_lib.
13:23 < was> Are you making a clean sage-main repo?
13:23 < mabshoff> Which gcc version is that exactly?
13:24 < mabshoff> I thing craigcitro can tell you how to invalidated the SCons cache and make it all rebuild.
13:24 < was> it's the standard gcc in xcode.
13:24 < robertwb_> cwitty: could you elaborate more--doesn't cython use the __import__ command, which is fast once a module is already implemented?
13:24 < craigcitro> rm -f .sconsign.dblite in c_lib
13:24 < jvoight> Hi Craig, it sure is.  It's in /home/jvoight/totallyreal.  Go there, run sage, type "load tr.sage" and then "prun enumerate_fields(5,15^5)"
13:24 < robert__> i'm upgrading an existing version
13:24 < was> the problem is that he doesn't even have most of the c_lib code for some reason.
13:24 < was> Do "hg merge" and maybe "hg update" in devel/sage
13:25 < jvoight> Right now, you'll see on the second line that totallyreal.py is eating 6 seconds--and as far as I can tell, this is the cost of coercion.
13:25 < cwitty> robertwb_: It's not very fast.  Let me run some benchmarks and add them to the ticket.
13:25 < robert__> nothing to merge, updating now
13:25 < robert__> no files updates
13:25 < was> Are you missing this directory?
13:25 < robertwb_> cwitty: ok
13:26 < jvoight> The relevant line is 149 in /home/jvoight/totallyreal/totallyreal.py.
13:26 < wstein> c_lib/src/
13:26 < wstein> SAGE_ROOT/devel/sage/c_lib/src?
13:26 -!- robertwb_ [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has quit []
13:26 < robert__> i have src directory
13:27 < robert__> contents:
13:27 < robert__> ZZ_pylong.cpp   gmp_globals.c   mpn_pylong.c    ntl_wrap.cpp
13:27 < robert__> convert.c       interrupt.c     mpz_pylong.c    stdsage.c
13:27 < was> Is this is a clean sage-main or what?
13:27 < robert__> no it's a version i've been using for a while
13:28 < was> Can you build a clean sage-main, then pull in your changes from that version you've been using for a while?
13:28 < was> Then you'll see that you're breaking things, maybe.
13:28 < robert__> sorry, i misunderstood
13:28 < was> another thing to try:
13:28 < robert__> it's not a branch i've been changing, it's just a sage_root that's been around for a while
13:29 < was> cd sage/c_lib
13:29 < was> sage -scons
13:29 < was> What happens?
13:29 < robert__> craigcitro -- tried removing the sconsign.dblite, still won't build
13:29 < robert__> same thing happens
13:30 < craigcitro> what version are you upgrading from?
13:30 < was> Try what I suggested above.
13:30 < robert__> i upgraded earlier today, no problems
13:30 < was> I'm looking at #512.
13:30 < was> The gap-4.4.10 package that David Joyner put at his website is 25MB!!
13:30 < robert__> cd sage/c_lib     sage -scons     gives the exact same error
13:31 < was> Whereas gap-4.4.9 is 5.6MB.
13:31 < was> Sneaky.
13:31 < mhansen> We had issues with guava and the new gap package.
13:32 < was> did you help with gap-4.4.10.spkg?
13:32 < was> have you tested it at all?
13:32 < malb> Sorry I was distracted earlier, what is the problem with my GF2 patch?
13:32 < craigcitro> >robert__: did you remove all the .os files?
13:32 < mhansen> I tested it awhile back, and if I recall correctly, it had issues with not loading the guava package.
13:33 < was> oh, that's because you have to explicitly reset the gap workspace, right?
13:33 < craigcitro> >robert__: it might be telling you that it's failing to find a file that it needs to compile convert.os, etc
13:33 < robert__> i just removed them, should i try building again?
13:33 < mhansen> was: I believe so.
13:33 < craigcitro> yeah sage -scons again
13:34 < robert__> i removed the .os files from c_lib, and there are no .os files in src
13:34 < robert__> same thing happens
13:34 < craigcitro> is this on sage.math?
13:34 < robert__> no on os x
13:35 < was> you should delete sage-main then do sage -f sage-2.8.7.2
13:35 < was> That will just rebuild it from scratch.
13:35 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
13:35 < was> Probably somewhere along the line there was some weird merge error.
13:35 < craigcitro> yeah, i think i agree with william here
13:35 < craigcitro> or at least move sage-main
13:36 < robert__> same error!!
13:36 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has quit [Client Quit]
13:37 < craigcitro> on a new sage-main !?
13:37 < robert__> i deleted sage-main, forced the install, and instantly got the same error
13:37 < robert__> but i can run another branch fine
13:38 < craigcitro> what version did this install start at?
13:38 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
13:38 < robert__> 2.8.4.1
13:39 < craigcitro> at some point we changed the way the c_lib stuff works, but i can't see why that would influence a new install
13:39 < craigcitro> i.e. moved files around, made new symlinks, etc
13:39 < craigcitro> but the errors you're getting seem unrelated to that
13:40 < wstein> Actually his errors look exactly like thye involve a symlink issue.
13:40 < robert__> should i delete some file in spkg before i sage -f sage-2.8.7.2?
13:40 < craigcitro> but the SConstruct file doesn't see anything involving any of the symlinks we've made, i believe
13:40 < was> that's a good point.
13:41 < craigcitro> at this point it's running spkg-install, though, which does
13:41 -!- fabio_ [n=fabio@chello062178170083.13.14.vie.surfer.at] has joined #sage-devel
13:41 < robert__> every time i build the other, working branch, i get 
13:41 < robert__> Installing c_lib
13:41 < robert__> Install file: "ZZ_pylong.h" as "/Users/robert/sage/local/include/ZZ_pylong.h"
13:41 < robert__> Install file: "ccobject.h" as "/Users/robert/sage/local/include/ccobject.h"
13:41 < robert__> Install file: "gmp_globals.h" as "/Users/robert/sage/local/include/gmp_globals.h"
13:41 < robert__> Install file: "interrupt.h" as "/Users/robert/sage/local/include/interrupt.h"
13:41 < robert__> Install file: "mpn_pylong.h" as "/Users/robert/sage/local/include/mpn_pylong.h"
13:41 < robert__> Install file: "mpz_pylong.h" as "/Users/robert/sage/local/include/mpz_pylong.h"
13:41 < robert__> Install file: "ntl_wrap.h" as "/Users/robert/sage/local/include/ntl_wrap.h"
13:41 < robert__> Install file: "stdsage.h" as "/Users/robert/sage/local/include/stdsage.h"
13:41 < craigcitro> yeah, that's the old system
13:42 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has quit [Client Quit]
13:42 < mhansen> Hello fabio_
13:42 < craigcitro> we no longer manually move files over, now we have symlinks
13:42 < craigcitro> it's possible that the symlinks got killed somehow (??)
13:42 < craigcitro> do ls -l $SAGE_ROOT/local/include/csage
13:42 < craigcitro> that should be a symlink to $SAGE_ROOT/devel/sage/c_lib/include
13:43 < craigcitro> oh hey, here's an idea
13:43 < craigcitro> cd $SAGE_ROOT/devel
13:43 < craigcitro> rm -f sage
13:43 < craigcitro> ln -s sage-main sage
13:43 < craigcitro> then try again
13:43 < robert__> local/include/csage -> ../../devel/sage/c_lib/include
13:43 < craigcitro> ok, so that's a good sign
13:43 < craigcitro> what about local/lib/libcsage.dylib
13:43 < craigcitro> that should be a symlink to devel/sage/c_lib/libcsage.dylib
13:44 < craigcitro> it's possible that i wasn't thinking about switching *between* the two ways of organizing the c_lib tree when the code in spkg-install was written
13:44 < robert__> your ln trick didn't work...
13:45 < was> craigcitro -- I had to spend many many hours after your patch to get your patch to actually work.
13:45 < malb> was: #943 has some patches
13:45 < craigcitro> was -- what didn't work?
13:45 < was> many many things.
13:45 < robert__> local/lib/libcsage.dylib -> ../../devel/sage/c_lib/libcsage.dylib
13:45 < was> There were a lot of situations involving upgrading, installing from scratch, etc., that you hadn't tested.
13:45 < was> I thought I resolved all of them.
13:45 < mabshoff> Sombody linked "e" to execute emacs on sage.math - and I have a pretty good idea who did it.
13:46 < was> :-)
13:47 < craigcitro> did code end up anywhere new other than spkg-install or setup.py ?
13:47 < fabio_> I'm really sorry that I can't join in today...
13:47 < mabshoff> Hey fabio_
13:48 < fabio_> (family issues)
13:48 < was> Yes, there is some code in local/bin/ that is relevant to the c_lib stuff.
13:48 < robert__> here's some fun news: a fresh version of sage-2.8.7.2 has the exact same problem
13:48 < robert__> one sec
13:48 < fabio_> I hope I'll be able to be online (and to do more work) next week
13:49 < fabio_> ...
13:49 < fabio_> so
13:49 < fabio_> bye
13:49 < was> robert__ -- that's very odd, given, e.g., that I have an install of 2.8.7.2 on OS X that works fine.
13:49 < mabshoff> cu
13:49 < was> And there has been no recent change to the c_lib stuff either.
13:49 < robert__> yeah, hang on...
13:49 < was> I.e., there are tons of installs of 2.8.7 that work fine on intel os x.
13:49 < robert__> i think it's )(&^**&^ing disk space issues
13:49 < was> Now that is starting to make sense.
13:50 < craigcitro> hahahahah
13:50 < was> craigcitro -- I can't believe you didn't make your patch automatically create new hard disks.  Gees.
13:50 < was> You missed an important use case :-)
13:50 < robert__> i was upgrading in linux at the same time, and it ate up all my disc space
13:50 < craigcitro> yeah, that was pretty sloppy of me
13:50 < craigcitro> phew
13:50 < craigcitro> i feel much better about that, then.
13:50 < robert__> sorry to create panic
13:51 -!- Netsplit zelazny.freenode.net <-> irc.freenode.net quits: malb
13:51 < craigcitro> i wanted to have it create new disks, but the guys i know in robotics were behind on getting me their code, so i waited.
13:52 < craigcitro> sorry jvoight, was doing three things at once -- looking at your code now. ;)
13:52 < jvoight> No worries, Craig.  Take your time.  :)
13:55 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
13:56 < mabshoff> valgrind --tool=omega ls
13:56 -!- Netsplit over, joins: malb
13:56 < mabshoff> ==19014==
13:56 < mabshoff> ==19014== Omega Leak Summary
13:56 < mabshoff> ==19014== ==================
13:56 < mabshoff> ==19014== No leaks to report.
13:56 < mabshoff> ==19014==
13:56 < mhansen> Yay ls!
13:56 < mabshoff> So there is a new experimental valgrind spkg with omega support  at
13:57 < cwitty> robertwb: I added benchmarks.  (Summary: import takes 2 microseconds, which is significant in some Cython uses.)
13:57 < mabshoff> http://sage.math.washington.edu/home/mabshoff/valgrind-3.3.0svn-r7025+omega.spkg
13:57 < mabshoff> ls used to leak like a sieve.
14:00 < roed___> Does anyone know why EXTERN long ZZ_remove(struct ZZ& x, const struct ZZ& a, const struct ZZ& p); in ntl_wrap.h would have a problem with the &'s?
14:00 < cwitty> That's C++ code; is something trying to use it from C?
14:01 < roed___> Just figured out that it was calling gcc not g++
14:01 < mabshoff> :)
14:01 < roed___> Shouldn't ntl_wrap.h and ntl_wrap.cpp be using c++?
14:01 < roed___> ah
14:01 -!- Netsplit zelazny.freenode.net <-> irc.freenode.net quits: malb
14:01 < roed___> I see
14:01 < craigcitro> yeah, scons should be taking care of that
14:01 < robertwb> cwitty: this shouldn't be to hard of a fix, though merging cython with the latest pyrex will probably put this on hold
14:02 < roed___> This is in compiling vector_integer_dense.c
14:02 < roed___> So I should just wrap that EXTERN in a #ifdef __cplusplus?
14:02 < cwitty> That's fine.  (I'd much rather have the pyrex merge than the import fix.)
14:03 -!- malb [n=malb@dobbertin.math.uni-bremen.de] has joined #sage-devel
14:05 -!- malb [n=malb@dobbertin.math.uni-bremen.de] has quit [Client Quit]
14:05 -!- malb [n=malb@dobbertin.math.uni-bremen.de] has joined #sage-devel
14:07 < cwitty> robertwb, mabshoff: I'm planning to work on #551 (missing dictionary deallocation in Cython-generated code), unless one of you wants to take it.
14:07 < mabshoff> Please go ahead. I am willing to test, though.
14:08 < malb> I am working on #688 now
14:08 < robertwb> I think this has a good chance of being fixed with the atexit function, when I implement that (as soon as the Pyrex merge is done)
14:08 < mabshoff> Are you actively working on the pyrex merge or is that soon, too?
14:09 < robertwb> I was doing that while I was waiting for sage -upgrade to complete
14:09 < robertwb> most of the bugs seem to have a patches, so that might be a good thing for me to start working on now
14:09 < mabshoff> So does it have a detailed changelog this time or is it all one big patch?
14:10 < robertwb> one big patch, but we convinced him to use mercurial, so from now on we have a change log
14:10 < jvoight> Hey Craig, I have to hit the gym before they close today.  I'll be back in an hour or so.  
14:10 < mabshoff> Well, that is certainly in improvement.
14:10 < craigcitro> >jvoight: cool, i should have some more info for you by then. just playing with the code now. ;)
14:11 < was> robertwb played the main role in convincing greg to use Mercurial.
14:11 < jvoight> Cool, thanks!  As you can see, the ideal situation I'd like to have is a single pari vec that I could pass to the function T.incr() and which gets updated with a C int (*).  I'll let you play and talk to you in a bit.
14:11 < was> There was a lot of flaming in pyrex-dev about mercurial versus svn, etc. 
14:12 < craigcitro> >cwitty: did you end up trying the late_import thing elsewhere? i actually starting running into trouble last night after your power went out ;)
14:12 < mabshoff> What was used before? cvs?
14:12 < robertwb> he used to make daily backups onto a zip drive, manually, and that was all...
14:12 < cwitty> robertwb: yes, I think that's the right fix; I was going to attempt to do it myself instead of waiting for you.  Do you think it's not worth my trying?
14:12 < was> nothing was used before.
14:13 < was> malb -- I'm applying 943 right now.
14:13 < mabshoff> Well, that is very odd, but mercurial is clearly superior to svn.
14:13 < cwitty> craigcitro: no, I didn't.  I did this instead: https://bugs.launchpad.net/cython/+bug/155076
14:13 < robertwb> I think I'll have an easier time than you--I already have an idea of how exactly to do it. 
14:13 < was> malb -- in the long run it would be better to use ntl even for non-square matrices.
14:13 < was> Just pad with zeros.
14:13 < robertwb> I'm only waiting 'cause I'd rather not have more changes to merge with his
14:13 < cwitty> OK, I'll find something else to do then.
14:14 < robertwb> (though Steffan did an initial merge, so that saved me a lot of work I think. We'll see if it's good enough to build a working SAGE :))
14:14 < craigcitro> >cwitty: that would make my life even easier, probably. ;)
14:15 < robertwb> ok, I'm going to start working on Cython now
14:15 < mabshoff> was: could you stick the new valgrind.spkg into the official repo, but leave the 
14:16 < mabshoff> last optional valgrind.spkg in there, because omega only works on x86 & x86-64.
14:16 < was> They have to have different names.
14:16 < mabshoff> They do.
14:16 < was> There can be at most one version of a package.
14:16 < robertwb> btw, I missed it, what's new with omega?
14:17 < was> and the directory name (of the spkg) has to match the filename, so don't just do a move.
14:17 < mabshoff> omega tells you where you leak memory, memcheck tels you where you allocate it.
14:17 < mabshoff> I thought I renamed that.
14:17 < mabshoff> Let me check.
14:17 < robertwb> oh, yeah, I remember you talking about that (didn't remember its name though) Can't even fathom how that would work...
14:18 < mabshoff> The problem in Sage has been many times that an object is allocated and then 
14:18 < mabshoff> some bits of it like matrix entries get reinitialized.
14:18 < malb> was: NTL's HNF requires a full rank 
14:18 < was> ut oh.
14:18 < mabshoff> But memcheck then claim that the original alloc was leaked, which is true, but doesn't 
14:19 < mabshoff> help spotting the place where the leak occurs.
14:19 < robertwb> oh, so it could see where the last reference to the object was overriden, or something like that. 
14:19 < was> i see
14:19 -!- fabio_ [n=fabio@chello062178170083.13.14.vie.surfer.at] has quit ["Konversation terminated!"]
14:19 < malb> was: maybe we could check the rank first, in an integer setting this is cheap, isn't it?
14:19 < mabshoff> #619 was exactly that situation.
14:19 < was> it's a lot cheaper than computing the echelon form.
14:20 < was> The impact of your patch now is that on non-full-rank square matrices, sage is a lot slower.
14:20 < mabshoff> It took me 6 weeks to finally find and eliminate it.
14:21 < malb> okay, i'll implement the rank check then (?)
14:21 < was> malb -- when you doctest matrix_integer_dense.pyx after applying your patch it does this:
14:21 < was> HNF: bad input 
14:21 < was> several times.
14:21 < was> I .e., it writes to stdout. :-(
14:21 < malb> I know I also wrote this in the comment
14:21 < was> very annoying.
14:21 < malb> ack
14:21 < mabshoff> Can't we patch that out of NTL?
14:21 < was> but that will go away when you implement the rank check, right?
14:22 < malb> it should, yes
14:22 < was> actually, i just implemented the rank check.
14:22 < was> it's so easy.
14:22 < was> just a few lines when setting the default algorithm.
14:22 < was> I hope.
14:24 < was> ok, that works.
14:25 < malb> whoops, me too
14:25 < malb> okay, actually change the nr!=nc check to: nr < nc
14:25 < malb> that's what the documentation says
14:25 < was> ah, for ntl?
14:26 < malb> yes
14:26 < malb> it handles non-square matrices
14:26 < was> nr <= nc
14:26 < was> nr <= nc and self.rank() == nr
14:26 < was> is the condition to use ntl.
14:26 < malb> "The input matrix A is an n x m matrix of rank m (so n >= m)"
14:27 < cwitty> Wouldn't that be nr >= nc?
14:27 < malb> yes, I was formulating the failure condition :-)
14:28 < cwitty> Oh, right.
14:28 < malb> is that an english word: "formulating"?
14:28 < was> yes.
14:28 < cwitty> I think so.  So does the spell-checker in my IRC client.
14:29 -!- malb_ [n=malb@host86-141-245-221.range86-141.btcentralplus.com] has joined #sage-devel
14:29 -!- malb [n=malb@dobbertin.math.uni-bremen.de] has quit ["leaving"]
14:36 < robert__> craigcitro -- i'm still having trouble with c_lib
14:37 < craigcitro> what's it saying?
14:37 < robert__> src/ntl_wrap.cpp: At global scope:
14:37 < robert__> src/ntl_wrap.cpp:975: error: expected constructor, destructor, or type conversion before '*' token
14:37 < robert__> src/ntl_wrap.cpp:986: error: expected constructor, destructor, or type conversion before '*' token
14:37 < robert__> src/ntl_wrap.cpp:1145: error: expected constructor, destructor, or type conversion before '*' token
14:37 < robert__> src/ntl_wrap.cpp:1150: error: expected constructor, destructor, or type conversion before '*' token
14:37 < robert__> src/ntl_wrap.cpp:1155: error: variable or field 'ZZ_pEContext_restore' declared void
14:37 < robert__> src/ntl_wrap.cpp:1155: error: 'ZZ_pEContext' was not declared in this scope
14:37 < robert__> src/ntl_wrap.cpp:1155: error: 'ctx' was not declared in this scope
14:37 < robert__> src/ntl_wrap.cpp:1156: error: expected ',' or ';' before '{' token
14:37 < robert__> scons: *** [src/ntl_wrap.os] Error 1
14:37 < robert__> ERROR: There was an error building c_lib.
14:38 < cwitty> What is line 975 in your ntl_wrap.cpp?
14:39 < craigcitro> yeah, mine is a blank line
14:39 < craigcitro> and my 986 doesn't have a *
14:40 < craigcitro> did you look at that file earlier and possibly introduce a stray character?
14:40 < craigcitro> that happens to me much more often that i'd like to admit
14:40 < robert__> can't find the file, and i've never looked at it before
14:40 < robert__> i see ntl_wrap.h, but that's it
14:40 < cwitty> devel/sage/c_lib/src/ntl_wrap.cpp
14:41 < robert__> line 975 follows two blank lines, and is
14:41 < robert__> PyObject* GF2X_to_bin(const struct GF2X* x) 
14:42 < robert__> i mean i couldn't have modified this file, since i just deleted sage-main and upgraded
14:42 -!- tclemans [n=Miranda@c-67-183-64-183.hsd1.wa.comcast.net] has joined #sage-devel
14:43 < cwitty> In my ntl_wrap.cc, GF2X_to_bin is on line 912.
14:43 < wstein> mabshoff -- where is this new valgrind spkg?
14:44 < SageLogger> in my home on sage.math
14:44 < cwitty> robert__: Try changing to the directory c_lib/src; and then type:
14:44 < cwitty> sage -hg status ntl_wrap.cpp
14:45 < cwitty> sage -hg log ntl_wrap.cpp
14:45 < wstein> mabshoff -- this won't work: valgrind-3.3.0svn-r7025+omega.spkg
14:45 < wstein> You have to name it something like valgrind_omega-version.spkg
14:45 < SageLogger> ok , will do so kater
14:45 < robert__> sha:~/sage/devel/sage/c_lib/src robert$ ../../../../sage -hg status ntl_wrap.cpp 
14:45 < robert__> sha:~/sage/devel/sage/c_lib/src robert$ ../../../../sage -hg log ntl_wrap.cpp 
14:45 < robert__> changeset:   7015:84cdad8c0e05
14:45 < robert__> user:        David Roe <roed@math.harvard.edu>
14:45 < robert__> date:        Thu Oct 18 10:34:58 2007 -0400
14:45 < robert__> summary:     Working on p-adic extensions.
14:45 < wstein> The syntax is [package_name]-version.spkg; and package names are unique
14:45 < robert__> changeset:   7014:529bf8960e00
14:45 < robert__> parent:      6950:fd99175ab57d
14:46 < robert__> user:        David Roe <roed@math.harvard.edu>
14:46 < robert__> date:        Tue Oct 16 18:07:43 2007 -0400
14:46 < SageLogger> I am a little afk for the next hour or so.
14:46 < robert__> summary:     Working on padic extensions
14:46 < robert__> changeset:   6905:a5edfa2e9707
14:46 < robert__> user:        David Roe <roed@math.harvard.edu>
14:46 < robert__> date:        Fri Oct 12 21:04:03 2007 -0400
14:46 < robert__> summary:     Adding ZZ_pE and ZZ_pEX.
14:46 < robert__> changeset:   6873:be11511130c1
14:46 < robert__> user:        Craig Citro <craigcitro@gmail.com>
14:46 < robert__> date:        Sat Oct 06 12:10:13 2007 -0700
14:46 < robert__> summary:     More NTL-related changes with the merge to 2.8.6.
14:46 < robert__> changeset:   6597:74630f85536f
14:46 < SageLogger> Ã¥â
14:46 < robert__> user:        Craig Citro <craigcitro@gmail.com>
14:46 < robert__> date:        Tue Oct 02 15:19:13 2007 -0700
14:46 < SageLogger> oops
14:46 < robert__> summary:     This is a large change to the way we use scons to build c_lib.
14:46 < malb_> was: I've fixed #688
14:46 < was> i'll take a look.
14:47 < was> #688 -- looks good.
14:47 < cwitty> OK; you've got an extra patch (changeset 7014, David Roe, "Working on padic extensions") that I don't have.
14:48 < cwitty> was: why does robert__ have more patches than I do, after I just did "sage -upgrade"?
14:48 < robert__> because i did hg_sage.pull()
14:53 < cwitty> Well, maybe try to revert to before the hg_sage.pull() state then?  I don't know...
14:54 < cwitty> Does "sage -f sage-2.8.7.2" do that, without doing a full rebuild of everything else?
14:54 < craigcitro> no, it'll just force a reinstall of the 2.8.7.2 spkg
14:54 < craigcitro> you have to manually ask it to pull new changes from the server to get the code robert__ is looking at
14:54 < craigcitro> hg_sage.pull() in sage
14:55 < cwitty> Well, my question was whether he needs to be looking at the new code.
14:55 < craigcitro> or hg pull http://www.sagemath.org/hg/sage-main/ from the command line (in your $SAGE_ROOT/devel/sage-branch-to-pull-into)
14:56 < craigcitro> oh ... yeah, that would probably restore his code to the previous state
14:56 < craigcitro> not just probably.
14:56 < robert__> anyway, you might want to do a pull and see what's going on...
14:56 < robert__> i don't need that stuff, but...
14:57 < cwitty> was / wstein : do you expect the current code in the public repository to work?
14:57 < was> yes.
14:57 < was> it should fully work right now.
14:58 < malb_> was I fixed #771
14:58 < cwitty> OK; in a couple of minutes I'll try doing a pull to see if it breaks for me.
14:58 < was> malb -- thanks 
14:59 < craigcitro> robert__ -- does it work when you reinstall the 2.8.7.2 spkg?
14:59 < robert__> i'm seeing right now
14:59 < was> robert__ -- you were doing a clean install; you ran out of disk space,
14:59 < was> then you tried to fix things, and that's the current situation?
15:00 < robert__> i deleted sage-main and upgraded again
15:00 < craigcitro> uh, what's the command to load a file in gp? ;)
15:00 < craigcitro> i've forgotten again. maybe i need to use gp more often than every 4 months.
15:00 < was> \r
15:00 < was> gp.read?
15:00 < robert__> not from a clean install
15:00 < craigcitro> thanks
15:01 < craigcitro> ahh ... that's a very good way to remember ;)
15:01 < was> robert__ -- why don't you just make sure you have 2GB disk space free. download the sage-2.8.7.2 tarball, and build it while
15:01 < was> you do something else?
15:02 < was> e.g., you could fix the graph_database doctest issues on an older sage install, or something.
15:14 < cwitty> Sometimes when gcc is building Cython-generated code I see things like this:
15:14 < cwitty> sage/rings/polynomial/real_roots.c: In function ‘__pyx_f_10real_roots_37interval_bernstein_polynomial_integer__set_bitsize’:
15:14 < cwitty> sage/rings/polynomial/real_roots.c:30631: note: ‘__pyx_r’ was declared here
15:14 < cwitty> Does anybody know what this is about?
15:15 < cwitty> It's perfectly true that __pyx_r was declared on line 30631, but I don't know why gcc thinks I care.
15:16 < cwitty> (And line 30631 is not in the ..._set_bitsize function from the previous line.)
15:17 < robert__> everything works without pulling
15:18 < robert__> someone with a less suspect install should at least check this out
15:18 < cwitty> was, robert__: starting from 2.8.7.2, doing hg_sage.pull(), hg_sage.merge(), then sage -b: no compile errors.
15:20 < robert__> weird
15:22 < robert__> when i did sage -f sage-2.8.7.2, then pulled, i had the problems, but its looking like upgrade instead will work
15:23 < robert__> i'm installing a clean copy anyway, that's just weird
15:23 < craigcitro> jvoight -- say hi when you're back.
15:27 < was> #947 -- i'm working in this.
15:28 < was> carl -- your patch looks good.
15:28 -!- giniu [n=chatzill@80.48.71.46] has left #sage-devel []
15:28 < cwitty> Thanks.  I'm really proud of that letter 'f'.
15:29 < was> :-)
15:30 < was> #949 -- also looks good.
15:31 < was> #936 -- here I go.
15:34 < cwitty> was: for #259 ("axiom bug", where the axiom interface doesn't work on the first attempt): I tried on sage.math and on my laptop, and it worked both places.  Should I resolve "worksforme"?
15:35 < was> yes.
15:41 < cwitty> Done.
15:41 < was> ok
15:42 < jvoight> Hey, I'm back.
15:42 < craigcitro> hey john
15:42 < jvoight> Hey, so what's the good word.
15:42 < craigcitro> well, so i'm still playing with a few things in the code
15:43 < craigcitro> first question: what's the comparable magma time we're trying to beat?
15:43 < jvoight> Oh, we've long since left Magma in the dust!
15:43 < craigcitro> see, some of this is overhead, but not so much is in the list conversions (which is why the code I sent you last night doesn't make too much of a difference)
15:43 < craigcitro> excellent! that's good to hear
15:43 < jvoight> It's taken about two months, but it's not even a contest any more.  (Factor 20, last time I checked.)
15:43 < craigcitro> hah outstanding
15:43 < was> :-)
15:44 < craigcitro> ok, so i'm trying something to see if i can save us a bit more time on overhead
15:44 < jvoight> The main advantages were stupid careful optimizations in real root finding (Newton's method), and some low-level pari functions that I use.
15:44 < jvoight> Yes, it's very frustrating after all this work to still have about 20% of the time being spent on overhead--and not even interesting overhead, just coercion of C int (*) to pari vec!
15:45 < craigcitro> where do you see that overhead popping up?
15:45 < jvoight> Did you do the prun enumerate_totallyreal...
15:45 < jvoight> ?
15:45 < craigcitro> because it looks like enumerate_totallyreal_fields actually does a fair amount of work
15:45 < craigcitro> yeah, i'm looking at it
15:45 < jvoight> I can't make it come up any clearer other than under totallyreal.py.  
15:45 < jvoight> What I checked was that if I comment everything else out except the line where I coerce, then it still runs about as slow.
15:46 < craigcitro> ohh
15:46 < craigcitro> that's interesting.
15:46 < jvoight> The relevant line being 149, nf = pari(str(f_out)).Polrev()
15:46 < craigcitro> just that line takes about as long?
15:46 < craigcitro> interesting.
15:46 < jvoight> Ideally, I'd like f_out to already be a pari vec, but right now the fastest thing seems to feed it a string.
15:46 < jvoight> Yep, maybe we should try it out just to make sure.
15:47 < craigcitro> yeah, give that a run, i'll start modifying the code to make that much faster, see what happens
15:47 < malb_> was I've fixed #282
15:51 -!- was_ [n=was@c66-235-37-221.sea2.cablespeed.com] has joined #sage-devel
15:51 < jvoight> OK, here's what I found.  Check out /home/jvoight/totallyreal/totallyreal-stripped.py.
15:51 < jvoight> It seems to spend 2.295 s (prun enumerate_totallyreal_fields(5,15^5).
15:52 < jvoight> This compares to 6.020 s with the rest of the code.
15:52 < jvoight> So there must be something else that's costing overhead?
15:52 < jvoight> So you may be off the hook!
15:52 < craigcitro> grin
15:52 < jvoight> Maybe some of your previous patches have sped this up enough.  :)
15:52 < craigcitro> well, i still might be able to beat 2.3 s
15:53 < jvoight> Looks like it's coercing 99835 int sequences of length 6.  (With very small ints.)
15:53 < craigcitro> there are other places below where you're also doing int * <---> pari conversions
15:53 < craigcitro> the ng = pari(...)
15:54 < jvoight> That's true, but those should be called comparitively rarely.
15:54 < craigcitro> k
15:55 < craigcitro> try throwing in the other pari call, the nf.nfbasis_d(1)
15:55 < craigcitro> and time that
15:55 -!- tclemans [n=Miranda@c-67-183-64-183.hsd1.wa.comcast.net] has quit [Read error: 110 (Connection timed out)]
15:55 < craigcitro> could it just be that there's enough pari work going on to take up some time?
15:56 < craigcitro> or, rather,
15:56 < craigcitro> if nf.polisirreducible():
15:56 < craigcitro> nf.nfbasis_d(1)
15:56 < craigcitro> just to get those involved
15:57 < jvoight> OK, for example, it's only calling the inner loop (ng = ...) 1925 times (number of polredabs calls)
15:58 < jvoight> Including the lines up through nfbasis_d(1), we recover almost all of the overhead.  So it's something in between.
15:59 < jvoight> (Now up to 5.66 s out of 6.028 s.)
15:59 < jvoight> So let's see...
15:59 < craigcitro> so nfbasis_d ... is this something in gen.pyx or decl.pxi?
15:59 < jvoight> gen.pyx
16:00 < craigcitro> can you just directly call the corresponding function in decl.pxi, or do you need the code in gen.pyx to massage your arguments?
16:00 < jvoight> Something I added.  But the calls there seem to be quite quick: at least according to prun, 4.9 s in 30644 calls.  The overhead is still being measured in totallyreal.py, right?
16:00 < craigcitro> because if the code in gen.pyx is just calling pari, you might as well do it directly
16:01 -!- tclemans [n=Miranda@c-67-183-64-183.hsd1.wa.comcast.net] has joined #sage-devel
16:01 < jvoight> I suppose so.  Is there much to be gained there?  
16:01 < craigcitro> is it a def or cdef function in gen.pyx?
16:02 < craigcitro> because if it's def'd, you're paying the overhead of a python function call every time you call it
16:02 < jvoight> Dunno.
16:02 < craigcitro> robertwb, you around?
16:02 < robertwb> yeah
16:02 < robertwb> I'm here
16:02 < craigcitro> isn't there a cython syntax like for 0 <= i < n:
16:02 < jvoight> Well, I wrote nfdisc_d, but I probably don't know what I'm doing.
16:02 < craigcitro> or something like that?
16:02 < robertwb> yeah
16:02 -!- was [n=was@c66-235-37-221.sea2.cablespeed.com] has quit [Read error: 110 (Connection timed out)]
16:02 < robertwb> for i from 0 <= i < n:
16:02 < craigcitro> from
16:02 < craigcitro> thanks
16:02 < robertwb> it's way faster
16:03 < craigcitro> cool
16:03 < craigcitro> i remember you saying that
16:03 < craigcitro> i'd just forgotten the syntax ;)
16:03 < craigcitro> >jvoight: it could be just the nature of things
16:03 < robertwb> (assuming, of course, that i is a cdef type)
16:03 < jvoight> nfbasis_d is def'd.
16:04 < jvoight> As apparently are nearly all of the routines in gen.pyx.
16:04 < craigcitro> yeah
16:04 < craigcitro> robertwb, while you're here
16:04 < robertwb> uh huh
16:04 < craigcitro> if there's a function in the pari library
16:04 < craigcitro> and we're in cython, if we just call it directly, will it save us a bunch of time over going through a def in gen.pyx?
16:04 < craigcitro> i think the answer is "yes"
16:04 < craigcitro> but you know better ;)
16:05 < robertwb> yes
16:05 < jvoight> I was wondering about that, too.  How do you get the pari_instance inside cython without declaring a new one?
16:05 < robertwb> but there might be a lot of stuff (e.g. error handling) that gen.pyx takes care of for you
16:05 < craigcitro> sure
16:05 < robertwb> we should make these def functions into rdef functions
16:05 < robertwb> then you can call them as cdef function, which has miniscule overhead compared to def
16:06 < craigcitro> nods
16:06 < craigcitro> that would be really nice
16:06 < craigcitro> i've apparently forgotten -- you can use rdef on something you would otherwise def, then override the definition with a cdef?
16:06 < craigcitro> because that sounds hot
16:07 < craigcitro> maybe i need to watch your sd5 talk again. ;)
16:07 < robertwb> you can override it with cdef or def
16:07 < robertwb> and call it as a cdef or def
16:07 < craigcitro> so if i have a function foo
16:08 < craigcitro> that's rdef'd
16:08 < craigcitro> and i override it with a cdef
16:08 < robertwb> yeah
16:08 < craigcitro> then i call it from python, will it only see the original def'd function?
16:09 < robertwb> python only ever sees the def function, but all the def function does is coerce the args and call the cdef function. 
16:09 < robertwb> I should probably change this, so if a function is declared rdef, you can't override it with a cdef, 'cause in this case
16:09 < jvoight> You're going to laugh, but the line  if d/B > 40000 or d/da <= B:
16:09 < robertwb> class A: rdef foo(self)
16:10 < jvoight> is already taking as much as a half second!
16:10 < robertwb> cdef class A: rdef foo(self)
16:10 < craigcitro> HAH is it doing a type conversion in that line?
16:10 < robertwb> cdef class B: cdef(foo)
16:10 < jvoight> I'll incorporate that into my int_has_small_square_divisor function and see if that helps.
16:10 < jvoight> No coercion, it's just SAGE integers.
16:10 < robertwb> class C: def foo(self)
16:10 < craigcitro> 40000 isn't
16:10 < craigcitro> unless you do Integer(40000)
16:10 < jvoight> What is 40000?
16:10 < jvoight> Python Integer?
16:10 < robertwb> then calling a cdef on an object declared as B which is actually C won't call the def function. 
16:10 < craigcitro> i think so
16:11 < robertwb> what are d, B, and da?
16:11 < craigcitro> do you want exact answers or just quotients?
16:11 < craigcitro> because d//B will be faster
16:11 < cwitty> And doing d/B > 40000 actually computes d/B as an exact Rational, then coerces 40000 into Rational to do the comparison.
16:11 < jvoight> I just need d//B.
16:12 < craigcitro> and if it's actually going to be evenly divisible
16:12 < craigcitro> d.divide_knowing_divisible_by(B) is the fastest
16:12 < craigcitro> but only produces meaningful answers if it's divisible
16:12 < cwitty> Or d > B * 40000.  No division at all.
16:12 < robertwb> actually, d  >B*40000 will be even faster
16:12 < jvoight> I thought about doing that...
16:12 < cwitty> But do precompute a variable ZZ_40000 = ZZ(40000) to avoid doing that coercion every time through the loop.
16:13 < robertwb> you want to make 40000 into an integer (or whatever B is) first
16:13 < robertwb> that's exactly what I meant
16:13 < craigcitro> yeah, definitely factor that out of th eloop
16:13 < jvoight> It's cool, B and 40000 are constant, so I'll just multiply them once and for all.  :)
16:13 < craigcitro> hahahah
16:13 < craigcitro> that's a good plan.
16:14 < robertwb> BWT, who wrote complex_double.pyx?
16:15 < craigcitro> it's william for a large part, i think
16:15 < craigcitro> i looked this up in trac at some point
16:15 < craigcitro> why?
16:15 < jvoight> Beautiful, that brought us down from 5.56 to 4.45.  I'm only going to be happy if we get it down to about 2 seconds, which is approximately the amount of time spent doing actual mathematical computations.
16:15 < craigcitro> awesome
16:15 < robertwb> I'm confused by the statement about PREC for pari. It claims doubles are 64 bits of precision. 
16:15 < craigcitro> i think we're still paying for some function call overhead -- do you want to switch to directly calling the various pari functions, see what happens? 
16:15 < craigcitro> i'm playing with the int * conversion
16:16 < robertwb> try making the pari functions rdef 'cause that's what we'll want to do in the long run
16:16 < robertwb> and it'll handle all the signal catching, etc. 
16:16 < craigcitro> that's true
16:16 < craigcitro> well, wait
16:16 < jvoight> So you're saying that much of the overhead could be found in the function call overhead?  That's certainly possible since I'm calling these functions 100000 times.
16:16 < craigcitro> exactly
16:16 < jvoight> OK, let's give it a go, then.
16:17 < cwitty> A double has 64 bits: 1 sign, 53 mantissa, and 11 exponent.  (These add up to 65 because one of the mantissa bits is "fake"; it's always 1, so it's not actually represented.)
16:17 < craigcitro> >robertwb: if i have a def function, and i turn it into an rdef, then call it from cython, you're saying it'll just use C calling conventions?
16:17 < robertwb> that's what I though. 
16:18 < robertwb> craigcitro: yep, you have to cimport gens.pyx though and declare it to be of the right type (so it knows it can use the C calling convention)
16:18 < craigcitro> that's so hot
16:19 < robertwb> btw, can you think of a better name to use than rdef? 
16:19 < roed___> Are there any disadvantages to making functions rdefed?
16:19 < robertwb> not really, though then you have to be careful that it's actually calling the cdef rather than def version (i.e. it won't fail on compile if you forgot to declare a type, just be slower)
16:20 < roed___> sure
16:20 < cwitty> And (if I remember your talk correctly) it's a few cycles slower to support being overridden in Python, right?
16:20 < robertwb> yeah
16:21 < robertwb> less overhead then the actual c function call though
16:21 < jvoight> Hey Craig: When I call the line nf = pari(str(f_out)).Polrev(), it takes the "overhead" from 4.47 s to 6.42 s.
16:21 < jvoight> So I still think about 2 s are being wasted there.
16:21 < craigcitro> cool
16:21 < craigcitro> let me keep chipping at that; code is actually running in the background as we speak
16:21 < jvoight> (And it's not in the .Polrev() step, since that takes 0.3 s and is counted elsewhere.)
16:21 < craigcitro> (tr.sage is big enough that my computer a minute to compile all its pieces)
16:21 < craigcitro> yeah, it's definitely the object creation
16:22 < craigcitro> >robertwb: it doesn't make a huge amount of sense, but i like polydef
16:22 < jvoight> Is there a way to go directly from C int (*) to pari t_VEC?
16:22 < craigcitro> >robertwb: because it's like you're doing multiple defs at once you can override
16:22 < craigcitro> >jvoight: yep
16:22 < robertwb> yeah
16:22 < jvoight> OK, BRB, I need to go take a shower!
16:22 < craigcitro> grin enjoy
16:22 < robertwb> makes me think of polynomials or something though
16:23 < cwitty> "cpdef" (Cython plus Python def)?  "pcdef"?
16:23 < robertwb> I like cpdef
16:23 < craigcitro> yeah, i was thinking more like "polymorphism"
16:23 < craigcitro> multidef 
16:24 < craigcitro> cpdef is pretty good, actually
16:24 < craigcitro> because it looks like something more than a cdef
16:24 < roed___> I like cpdef
16:24 < robertwb> I think we don't really want to expose to the user that we're making multiple functions, that's more of an implementation detail. 
16:24 < craigcitro> nod
16:24 < robertwb> It's a function that behaves (in the best way) like def and cdef
16:25 < cwitty> A few years ago, I was working on a program dealing with polygons, polyhedra, and polynomials.  I kept abbreviating everything "poly".  Finally I went through and removed "poly" from the code base, leaving me with types Gon, Hedron, and Nomial.
16:25 < robertwb> haha
16:25 < craigcitro> hah excellent
16:26 < robertwb> ok, next version of Cython it will be cpdef. 
16:26 < roed___> Is rdef used in the sage codebase yet?
16:26 < cwitty> No.
16:26 < robertwb> I don't think rdef is used anywhere (though I want to convert all the coercion code)
16:26 < robertwb> rdef -> cpdef is an easy change though
16:27 < cwitty> sage: search_src('rdef')
16:28 < craigcitro> >jvoight: so i just realized something: f_out is actually a *python* list
16:30 < jvoight> OK, now that I don't stink quite so much maybe I can concentrate.
16:30 < roed___> Is there a good way in cython to have a list of python objects indexed by C longs?
16:31 < roed___> I'd like to just use an array
16:31 < roed___> But...
16:31 < jvoight> Craig: Yes, unfortunately, f_out comes from T.incr().  It starts out as a C int (*), and then needs to get fed into Pari somehow.
16:31 < robertwb> if L is a python list
16:31 < jvoight> I would be very happy to disintermediate the Python list.
16:31 < robertwb> I added an optimization so that L[i] access is done with a macro
16:32 < jvoight> I'd even be willing to have the output of T.incr() be a string, to be fed directly to Pari if that helps.
16:32 < robertwb> (assuming i is a cdef int/long/Py_ssize_t)
16:32 < roed___> sure
16:32 < roed___> So I can just use a python list
16:32 < jvoight> I couldn't figure out how to feed it into Pari directly from the Cython code.  (I seemed to need to create a Pari instance, ...)
16:32 < craigcitro> ohhh
16:32 < craigcitro> ok
16:32 < robertwb> yep, for access it should be essentially as fast as a PyObject**
16:33 < craigcitro> T.incr() takes a python list the first time, then produces an int *
16:33 < jvoight> Um, T.incr() doesn't need any input at all.  f_out is just there to accept the output.
16:33 < craigcitro> ohhh
16:33 < tclemans> does sage not work with gcc 3.3.5?
16:33 < craigcitro> but you initialize it first
16:34 < jvoight> It was much faster to have one f_out rather than creating a zillion along the way.
16:34 < jvoight> Yes, it has to get initialized somewhere.
16:35 < craigcitro> wait, but totallyreal.py is a python file, so f_out has to be a python object, right?
16:36 < jvoight> Yeah, that's right.  I guess I can rewrite totallyreal to be Cython?
16:36 < craigcitro> yeah, i think that would be the right first step
16:36 < jvoight> Then everything would be Cython, except maybe one header function.
16:36 < craigcitro> yep
16:37 < jvoight> Can I then pass a C int *?  And even if I did, I'd still have to coerce it into Pari, no?
16:37 < craigcitro> well, i wrote something that will take an int * and give back a t_VEC
16:37 < craigcitro> i just can't yet apply the function ;)
16:37 < jvoight> Well, why not just put that in tr_data.sage, which is Cython?
16:38 < jvoight> I was trying to avoid creating a zillion t_VECs--can your function accept an existing t_VEC and write to it?
16:38 < jvoight> Does that make sense?
16:38 < craigcitro> sure, i could make it do that
16:38 < craigcitro> but the problem is that f_out is a python object if it's living in a python file
16:38 < craigcitro> oh, you're saying work with the t_VIC
16:38 < craigcitro> t_VEC
16:38 -!- malb_ [n=malb@host86-141-245-221.range86-141.btcentralplus.com] has quit ["Konversation terminated!"]
16:38 < jvoight> Well, then we'd be good.  Declare f_out to be a pari t_VEC.
16:39 < craigcitro> yep
16:39 < jvoight> nod
16:39 < cwitty> robertwb: I have another Cython wishlist item.  The consensus seems to be that there's still value in cdef functions, if only to ensure that Cython code won't accidentally make a slow call.
16:39 < cwitty> But cdef functions can't be doctested.
16:39 < robertwb> yes
16:39 < craigcitro> you need to make sure we're not going to pick up lots of overhead writing to it in T.incr -- i don't know how good the __setitem__ and __getitem__ are
16:39 < craigcitro> so, sadly, i'm going to have to leave in less than 15 minutes
16:39 < robertwb> not sure about that one
16:39 < cwitty> I think that every cdef function should have a def wrapper automatically generated: foo gets test__foo.
16:39 < craigcitro> jvoight, is it okay if we get this working tomorrow?
16:40 < robertwb> It would greatly polute the dictinonary
16:40 < robertwb> maybe that would be worth it, I don't knwo
16:41 < cwitty> Does that have any downsides other than tab-completion?  I was thinking we could hack IPython and whatever the notebook uses to just skip test__ methods for tab-completion.
16:41 < robertwb> I'd make them double-underscore methods at least
16:41 < robertwb> also, they can be very unsafe
16:42 < craigcitro> so jvoight, i've almost got your code all in cython
16:42 < robertwb> and lots of the time it's hard to test them anyway, because the input and output aren't even python objects
16:42 < craigcitro> but what's Dtr? is that something that works once you initialize DSage?
16:43 < cwitty> Well, I'm thinking about real_roots.pyx.  As far as I recall, all its cdef functions/methods take only Python objects.
16:44 < cwitty> I think I could make it at least 10% faster by changing everything to cdef; but I really hate to do it, because it means I have to write dozens of stupid wrappers or else lose the doctests.
16:44 < robertwb> that's where cpdef comes in
16:45 < was_> :-)
16:45 < craigcitro> hah i feel like we're watching an infomercial, except it's all legit
16:45 < was_> hot
16:45 < cwitty> I guess... I actually do like the "can't accidentally call it slowly" feature of cdef, though.
16:45 < craigcitro> "CPDEF! It slices! it dices! it's fast! you can doctest it! get rid of arthritis pain!"
16:45 < robertwb> :)
16:45 < jvoight> Craig: Sure, we can pick this up tomorrow.  I found the __setitem__ to be *incredibly* slow.
16:46 < craigcitro> k
16:46 < craigcitro> i suspected that was the case
16:46 < jvoight> So much so that I gave up and went back to using str.
16:46 < craigcitro> i think we can do this, though
16:46 < craigcitro> well, i think i can kill most of that 2s overhead, but i'm not 100% sure.
16:46 < cwitty> But yeah, if people don't like my test-wrapper idea, cpdef is good enough.
16:46 < jvoight> If we could, then I'd be very happy.
16:46 < craigcitro> i'll say at least 1/3 of it, maybe 1/2.
16:46 < robertwb> I think cdef has its place too
16:46 < jvoight> At least we know what needs to happen now.
16:46 < craigcitro> maybe more -- they are short strings, though.
16:46 < craigcitro> nods
16:47 < craigcitro> if you want to move everything into cython, i'd be happy to come drop my code in once that's done ;)
16:47 < robertwb> You can also write a single wrapper for several cdef functions
16:47 < cwitty> What do you mean?
16:48 < jvoight> OK, I'll convert totallyreal.py to Cython.
16:48 < robertwb> I usually think of cdef functions as fast utility functions that you don't really want or need to expose to the user
16:48 -!- malb [n=malb@host86-141-245-221.range86-141.btcentralplus.com] has joined #sage-devel
16:48 < robertwb> you could write a single "def test_cdef_functions()" that would test several of them. 
16:49 < cwitty> The whole of real_roots.pyx is fast functions that I don't want to expose to the user.  It only has one external entry point.
16:49 < craigcitro> ooh, i think i just crashed cython
16:50 < craigcitro> Building sage/libs/pari/gen.c because it depends on sage/libs/pari/gen.pyx.
16:50 < craigcitro> cython --embed-positions --incref-local-binop -I/sage/devel/sage-convert -o sage/libs/pari/gen.c sage/libs/pari/gen.pyx
16:50 < craigcitro> Traceback (most recent call last):
16:50 < craigcitro>   File "/sage/local/bin/cython", line 8, in <module>
16:50 < craigcitro>     main(command_line = 1)
16:50 < craigcitro>   File "/sage/local/lib/python2.5/site-packages/Cython/Compiler/Main.py", line 305, in main
16:50 < craigcitro> that says cython actually died, right?
16:50 < craigcitro> (that was just the start)
16:50 < jvoight> Hey Carl: I was invited to MIT by Kiran to speak about my real root-number field enumeration problem.  Is there anything you'd like to add comparing SAGE's real root functions to Magma's, etc.?
16:51 < robertwb> cwitty: well, maybe try making them cpdef and see if that works. I'm not convinced that creating a python function for every cdef function just for testing is a good idea. 
16:51 < cwitty> I know nothing about Magma (or any other non-free computer algebra system, really).  I'm just writing the chunks of code I need for my project.
16:52 < cwitty> robertwb: OK.
16:52 < robertwb> craigcitro: yes, it died :(. Where's the actual error?
16:52 < jvoight> You mean you haven't compared your real root finding stuff to Magma's?  (Or any others?)
16:53 < wstein> Does Magma have real root isolation?
16:53 < cwitty> Oh, I didn't read your message closely enough.
16:53 < jvoight> Yes, but it
16:53 < jvoight> 's part of a black box.
16:53 < cwitty> Yes, I've done benchmarks.
16:53 < jvoight> It's really hard to know exactly what it's giving you--but I snooped in the code and have something of an idea.
16:54 < cwitty> But not against Magma...I didn't know it had real root isolation.
16:54 < craigcitro> robertwb: i'm emailing it to you
16:54 < robertwb> ok
16:54 < robertwb> what?
16:54 < craigcitro> the full error log, and the code that caused it
16:54 < robertwb> Yeah, I'll look into that
16:54 < jvoight> Apparently, they've had several people come in and rewrite the real root code.  
16:55 < craigcitro> i was doing a cimport in a function where i probably shouldn't
16:55 < craigcitro> but switching it to an import didn't seem to help me
16:55 < craigcitro> what do you do when you need to import in the middle of a function?
16:55 < craigcitro> or even at the top?
16:55 < jvoight> Just to be clear: by real root isolation you mean to give explicit (rational) intervals where the roots of a polynomial lie?
16:56 < robertwb> oh, yeah, you can only cimport from the module level
16:56 < jvoight> I needed that, too--but I had bounds where the root had to lie, so I used a careful Newton iteration.
16:56 < robertwb> that should be an error, not a crash
16:56 < craigcitro> nods
16:56 < craigcitro> i figured it was wrong
16:56 < cwitty> For carefully selected (by me) examples, my code is asymptotically faster than anything else I've found (this includes mathematica, maple, the standalone "RS" package, and the CF implementation from SYNAPS.
16:57 < jvoight> Wow, cool!
16:57 < cwitty> Yes.  Given a polynomial with exact (integer, rational, or algebraic real) coefficients, find disjoint intervals with rational endpoints, where each interval contains exactly one root.
16:57 < craigcitro> >robertwb: so how would i do that at all? i can't seem to import into this function
16:57 < jvoight> If it comes up during the talk, I'll give you a plug.
16:58 < robertwb> craigcitro: why do you need to do it in the function?
16:58 < craigcitro> it's in gen.pyx ; importing Integer into that creates some bad circular import trouble
16:58 < craigcitro> so i wanted to do the "late_import" that has been done elsewhere, but that caused me *different* troubles
16:58 < craigcitro> so i was trying this just to get any code working
16:59 < robertwb> what file is this a part of?
16:59 < craigcitro> sage/libs/pari/gen.pyx
16:59 < robertwb> BTW, cimports can't be late, 'cause they're really all done at compile time. You can do a normal import though. 
17:00 < craigcitro> yeah, that makes sense
17:00 < craigcitro> but even a normal import is giving me a compiler error
17:00 < jvoight> Craig, it's starting to get annoying to have to Cythonize totallyreal.py.  If we do the cpdef stuff, and use your code inside my Cython code, won't that be enough?
17:00 < craigcitro> try tossing "from sage.rings.integer import Integer" in the __call__ method for PariInstance, and use it somewhere in that code
17:00 < robertwb> huh, that's odd
17:00 < craigcitro> yeah, i don't understand the trouble it's giving me
17:01 < craigcitro> >jvoight: i think it might be okay if you break the DSage stuff off into a different file (i actually have that running in cython on my machine right now.)
17:01 < robertwb> My cython is in a major state of flux right now, so I can't really test it out
17:01 < craigcitro> hehehe s'okay
17:01 < jvoight> Yeah, OK, OK, I'll do that.
17:02 < craigcitro> >jvoight: if totallyreal.py is in python, though, f_out is going to remain a python object
17:02 < jvoight> Isn't that OK?  If f_out is a pari.gen?
17:02 < craigcitro> oh, that might work
17:02 < jvoight> I mean, initialize f_out = pari([0]*n + [1]), and then just feed it into the corresponding function.
17:02 < craigcitro> right, yeah
17:02 < cwitty> jvoight: My favorite example is x^k * (x^2 - 9999)^2 - 1.
17:02 < craigcitro> the poin is that T.incr needs to work with Pari objects in a fast way
17:03 < craigcitro> which is my ballgame
17:03 < craigcitro> yeah, that should probably work fine
17:03 < craigcitro> i'll try playing with that tonight
17:03 < jvoight> Yep.  Then you're in Cython world and you're good.
17:03 < craigcitro> that'll also save some headache. ;)
17:03 < jvoight> Carl, is that 9999 or 0.9999?
17:03 < cwitty> At k=235, I'm about 3 orders of magnitude faster than Mathematica.  I'd guess that at k=1000, I'm at least 12 orders of magnitude faster; but I can't possibly test that theory.
17:03 < cwitty> 9999
17:03 < jvoight> Yes, thanks.  I actually like Python, and I hate to think that I'd have to write everything from now on in Cython...
17:04 < craigcitro> grin
17:04 < jvoight> Wow, cool!
17:04 < craigcitro> >cwitty: so using the "late_import" stuff in gen.pyx is giving me a weird error when sage loads
17:04 -!- robert___ [n=robert@c-71-197-245-35.hsd1.or.comcast.net] has joined #sage-devel
17:04 < craigcitro> Exception exceptions.AttributeError: "'module' object has no attribute 'pari'" in 'gen.late_import' ignored
17:04 < craigcitro> this is getting raised and not caught, i think
17:05 < craigcitro> because i get a crazy traceback about it trying to add something to that error message
17:05 < craigcitro> have you seen anything like this before?
17:05 < craigcitro> ack, actually, i have to run
17:05 < robertwb> I think you've just got some circular import issue
17:06 < cwitty> No.  I've never tried late_import, myself.
17:06 -!- robert__ [n=robert@c-71-197-245-35.hsd1.or.comcast.net] has quit [Connection timed out]
17:06 < robertwb> late imports won't unfortunatlly magically fix everything
17:06 < craigcitro> ohh, i think i know where
17:06 < craigcitro> yeah
17:06 < craigcitro> well, it's because of where i'm doing the late_import(), i think
17:06 < robertwb> (and they make things a lot slower)
17:06 < craigcitro> oh, wait
17:06 < craigcitro> no, it's not what i thought
17:07 < jvoight> Thanks for your help, Craig.  Just so I understand where we are: To get the overhead down, we're going to (1) improve the int (*) to &t_VEC inside tr_data.sage, and (2) fix the function overhead by using cpdef.  Is that correct?
17:07 < craigcitro> so here's my question, robertwb: if i need to check if something is of type Integer in gen.pyx->PariInstance->__call__, is there any way to do it?
17:07 < robertwb> well, when I get cython to the point that I can build Sage again, I'll look into this more
17:07 < craigcitro> >jvoight: that sounds right to me
17:07 < robertwb> probably integer.pyx is importing gen.pyx somewhere
17:08 < craigcitro> >robertwb: grin ... thanks. the problem is that for me to fix the bug for trac ticket 875, i can do it, but it makes sage -> pari integer conversion twice as slow
17:08 < robert___> #939 -- right now i have a SIGBUS occuring on a line which is "if verbosity > 0:", and i have the previous line printing verbosity, and it's 10
17:08 < jvoight> Alrighty, I'm going to head out, too.  Cheers everyone!
17:08 < craigcitro> bye jvoight
17:08 < robertwb> ok, try "import sage.rings.integer as integer"
17:09 < robertwb> then do a typetest for integer.Integer
17:09 -!- jvoight [n=jvoight@65-183-130-83-dhcp.burlingtontelecom.net] has quit []
17:10 < cwitty> robertwb: when you say that late_import is a lot slower... slower than what?
17:10 < robertwb> when you import at the top, it does it once
17:10 < robertwb> (i.e. the import is done at module load time)
17:10 < craigcitro> gcc -fno-strict-aliasing -Wno-long-double -no-cpp-precomp -mno-fused-madd -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -I/sage/local//include -I/sage/local//include/csage -I/sage/devel//sage/sage/ext -I/sage/local/include/python2.5 -c sage/libs/pari/gen.c -o build/temp.macosx-10.3-ppc-2.5/sage/libs/pari/gen.o -w
17:10 < craigcitro> sage/libs/pari/gen.c: In function 'initgen':
17:10 < craigcitro> sage/libs/pari/gen.c:29095: error: '__pyx_v_3gen_Integer' undeclared (first use in this function)
17:10 < robertwb> in a function, it actually executes the import statement every time the function is run (though results are cached)
17:10 < craigcitro> sage/libs/pari/gen.c:29095: error: (Each undeclared identifier is reported only once
17:10 < craigcitro> sage/libs/pari/gen.c:29095: error: for each function it appears in.)
17:10 < craigcitro> error: command 'gcc' failed with exit status 1
17:10 < craigcitro> sage: There was an error installing modified sage library code.
17:11 < cwitty> Right.  But late_import is an alternative to importing in the middle of a function, which (unless somebody implements my Cython wishlist item) takes 2 microseconds each.  late_import has to be faster than that.  (Basically, late_import() is doing the import caching I wanted by hand.)
17:11 < craigcitro> robertwb: did you see the late_import function in finite_field_givaro.pyx, for instance?
17:11 < robert___> what's the difference between a seg fault and a bus error?
17:12 < robertwb> ok, I think I see what you mean by late_import. 
17:12 < craigcitro> yeah
17:12 < cwitty> It's different kinds of address errors.
17:12 < craigcitro> it was also failing me, though
17:12 < cwitty> One example: accessing memory that isn't allocated to your process: segfault.
17:12 < craigcitro> i get an error just like the one above in most cases
17:12 < craigcitro> the other way (with late_import in place) i get something that may be a circular import
17:12 < craigcitro> if so, i can probably track that one down and fix it.
17:12 < cwitty> On most processors (but not x86), trying to load a 4-byte value from an odd address: bus error.
17:13 < robertwb> you'll probably have better luck hunting down the late import circular reference issue
17:13 < craigcitro> nods, seems easier
17:13 < robert___> i have print statements going, and it seems like the line where the bus error happens isn't the problem...
17:13 < craigcitro> ok, so i'm going to run for now -- see everyone later
17:14 < robertwb> 'later
17:14 < robert___> bye cc
17:14 < cwitty> bye
17:14 < cwitty> robert__, can you run your code with "sage -gdb"?
17:15 < robert___> aha, gdb is catching it earlier
17:15 < robert___> thanks
17:19 < roed___> I'm getting a gcc error, sage/rings/padics/padic_generic_element.c:579: error: field 'temp_z' has incomplete type.
17:19 < roed___> temp_z is a ZZ_c
17:20 < roed___> This seems to be a problem due to the fact that I'm trying to use a ZZ_c in a C file, not a C++ file
17:20 < roed___> But I don't know where to go about fixing it
17:22 < roed___> temp_z is a field of PowComputer_class
17:22 < roed___> which I'm cimporting in padic_generic_element
17:24 < cwitty> I'm guessing that if you really need to cimport PowComputer_class, then you'll have to change padic_generic_element to C++.
17:26 < roed___> That seems to cause other problems.  I think I'll just move temp_z to somewhere that I don't need to import
17:26 < roed___> thanks
17:32 < cwitty> was_ / wstein: for #953 (axiom/sage interface is broken), I get much better results than yours on sage.math.
17:32 < was_> I wonder why it is so bad for me.
17:32 < was_> My test is on my laptop (64-bit ubuntu linux).
17:32 < was_> macaulay2 won't even build on my laptop. bummer.
17:32 < cwitty> There are several failing doctests, but they're things like this:
17:33 < cwitty> File "axiom.py", line 458:
17:33 < cwitty>     sage: v = axiom('[i*x^i for i in 0..5]'); v          # optional
17:33 < cwitty> Expected:
17:33 < cwitty>            2   3   4   5
17:33 < cwitty>     [0,x,2x ,3x ,4x ,5x ]
17:33 < cwitty> Got:
17:33 < cwitty>     [0,x,2*x*x,3*x**3,4*x**4,5*x**5]
17:33 < cwitty> (And the results on my laptop are exactly the same as on sage.math.)
17:33 < cwitty> Let me post my complete doctest log into the ticket.
17:33 < wstein> thanks.
17:34 < wstein> Maybe I just need to rebuild axiom on my laptop.
17:35 < mhansen> I tried installing the spkg on my home machine last night with no success.
17:36 < cwitty> I just installed the spkg on sage.math and on my home laptop a couple of hours ago, with no problems.
17:36 < cwitty> I've posted my logs.
17:36 < mhansen> Hmm... I'll try again now.
17:37 < cwitty> I'll work on #951, if nobody else is.
17:37 < was_> ok.
17:44 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has quit []
17:50 < mabshoff> tclemans: still around?
17:50 < tclemans> yes
17:51 < mabshoff> you need gcc 3.4.x or higher to build Sage now, because flint uses C99.
17:51 < tclemans> oh i see
17:51 < tclemans> i use a shell for now to use linux
17:51 < mabshoff> gcc 3.3 didn't support C99.
17:52 < wstein> there should be a test when sage starts taht gcc is at least 3.4, I guess.
17:53 < mabshoff> Well, once meccah died I don't think you have any more boxen with a gcc < 3.4?
17:53 < mabshoff> But you are right, I could do that, together with dropping out of the build process
17:53 < mabshoff> if cygwin is detected.
17:53 < tclemans> yeah i was wondering all day why i was getting start-up errors
18:00 < cwitty> wstein: when's the last time you doctested sage/rings/polynomial/polynomial_singular_interface.py?
18:01 < cwitty> I get errors in the branch after I did the hg_sage.pull(), but not in my 2.8.7.2 branch.
18:01 < cwitty> sage -t  polynomial_singular_interface.py                   **********************************************************************
18:01 < cwitty> File "polynomial_singular_interface.py", line 98:
18:01 < cwitty>     sage: r._singular_()
18:01 < cwitty> Expected:
18:01 < cwitty>     //   characteristic : 0
18:01 < cwitty>     //   number of vars : 1
18:01 < cwitty>     //        block   1 : ordering lp
18:01 < cwitty>     //                  : names    x
18:01 < cwitty>     //        block   2 : ordering C
18:01 < cwitty> Got:
18:01 < cwitty>     <BLANKLINE>
18:01 < cwitty> **********************************************************************
18:02 < was_> that's coming from a bugfix from malb.
18:02 < was_> I'll check it out.
18:03 < was_> the doctest works for me.
18:03 < was_> hmm.
18:03 < was_> Maybe upgrading singular is necessary.
18:03 < was_> (Which I've done buy you haven't.)
18:03 < cwitty> Where's the new singular spkg?
18:04 < was_> no, actually I haven't.
18:04 < was_> I just posted it 1 second ago.
18:04 < was_> But I don't have it installed on my laptop, actualy.
18:05 < was_> Try the doctest by hand and see what's up.
18:07 < mabshoff> hey was_: Is "valgrind_3.3.0svn_omega-r7025" a legal spkg name?
18:08 < robert___> mabshoff -- i know what is wrong for #939
18:08 < cwitty> was_: Running the doctest by hand (along with the other doctests in the same docstring) works.
18:08 < mabshoff> ok, tell me.
18:09 < robert___> one of the arrays is one too short
18:09 < wstein> yes, it's a valid package name, I think.
18:09 < robert___> in the sorting function, i use a counting sort, but the maximum possible count falls just outside the array
18:09 < mabshoff> Oops
18:10 < robert___> this only happens when the graph has loops and a lot of edges, but...
18:10 < robert___> i can fix it
18:10 < was_> nice.
18:10 < mabshoff> That would be awesome, but how come individual tests work while the doctest crashes?
18:10 < cwitty> was_: I turned on logging in interface/singular.py, and I can see the correct answer being printed in the logfile, but it looks like there are synchronization problems.
18:11 < mabshoff> The new spkg is at http://sage.math.washington.edu/home/mabshoff/valgrind_3.3.0svn_omega-r7025.spkg
18:11 < cwitty> I get double prompts at the beginning of some of the lines.
18:11 < robert___> if the spot in memory it is looking at has a small index, then nothing goes wrong, but if it is large, then it is going way away in memory, more likely to get noticed by the kernel
18:11 < mabshoff> cwitty: I have seen something similar on Solaris before.
18:12 < mhansen> cwitty: I was getting some weird things like that earlier today when playing with the lie interface.  I
18:12 < mabshoff> Does it have to do with "L", because I never understood why that was set to 100.
18:13 < wstein> mabshoff - your valgrind is posted.
18:14 < mhansen> wstein: Could you post my R / rpy packages as well for people to test building?
18:14 < mabshoff> wstein: thanks.
18:15 < mabshoff> While you are at it: there is an experimental flint.spkg that probably should go away.
18:16 < mabshoff> And you also should delete valgrind-3.3.0svn-r6814 from experimental.
18:16 < robert___> mabshoff -- L is an arbitrary number of things to remember to optimize stuff
18:17 < mabshoff> Ok, so it is "only" performance critical.
18:18 < mhansen> I just tested axiom.py and all the failures are pretty much just formatting ones.  I'll fix those and post a patch if no one else is working on it.
18:19 < cwitty> So it sounds like you got the same set of errors I did, instead of William's errors?
18:19 < robert___> it could be a parameter i suppose
18:19 < mhansen> Your errors.
18:19 < cwitty> (I'm not working on axiom.py)
18:19 < was_> no, my errors are very serious.
18:19 < mabshoff> robert___: I would suggest rewriting the memory management down the road anyway, so I wouldn't worry about it too much now.
18:20 < mabshoff> robert___: You could use a whole lot of Sage infrastructure, right now your code doesn't really use anything from Sage like matrices or vectors.
18:20 < cwitty> was_: I just attached a patch for #951.
18:20 < mhansen> was_: I just build a new clisp and axiom4sage under 64-bit linux, and only get "tame" errors.
18:21 < robert___> i had it using sage strucutres before, and wrote this stuff to speed it up
18:21 < mabshoff> robert___: But that segfault is priority one for now in my opinion.
18:21 < mabshoff> Well, I mean like you can use vector
18:21 < mabshoff> from Sage or Matrix classes.
18:21 < robert___> how would that help this?
18:21 < mabshoff> the degfault? not at all.
18:22 < robert___> no i mean the algorithm in general
18:22 < mabshoff> Readability and you get better tested and debugged components.
18:22 < cwitty> Readability is very important.
18:22 < mabshoff> The memory management you do right now is very difficult to understand.
18:23 < robert___> i know, but i don't think using vectors is the answer
18:23 < mabshoff> When I first read the allocation code it took me a long time to understand.
18:23 < robert___> i allocate all the memory together for speed
18:23 < mabshoff> Your code might also leak memory, certainly leaks when you have allocation failures. 
18:23 < mabshoff> Which do not matter much anyway once you are out of memory it is over anyway.
18:23 < robert___> i have clauses to catch that
18:24 < was_> after rebuilding axiom i still have all the same erros.
18:24 < mabshoff> Yep, but you do not release allocation <n if allocation n fails.
18:24 < mabshoff> As I said above, this is largely an academic question now.
18:25 < robert___> which allocation are you talking about?
18:25 < robert___> there should only be three
18:26 < mabshoff> Wait one sec, my connection to sage.math just froze.
18:26 < mabshoff> refine_by_square_matrix doesn't leak in case of failure, but you could just use 
18:27 < mabshoff> a dense integer Matrix from Sage. It might not be defined at the moment, but 
18:27 < mabshoff> I believe that writing such a class would make your code more radable.
18:28 < cwitty> There is a Matrix_integer_dense class.
18:28 < mabshoff> Ok, I got confused with the modp case from the modular code then.
18:28 < robert___> the reason i'm using c arrays instead is just for speed
18:29 < robert___> am i mistaken about the speed difference?
18:29 < mabshoff> Matrix_integer_dense does the same.
18:29 < mabshoff> And if not it will soon.
18:29 < mabshoff> You can also use memcpy or memmove for the following:
18:29 < mabshoff>         for i from 0 <= i < n:
18:29 < mabshoff>             for j from 0 <= j < n:
18:29 < mabshoff>                 G[i][j] = G_matrix[i][j]
18:30 < robert___> eventually, i want to be able to handle graphs on ~ 2^16 vertices
18:30 < robert___> the matrix is one of the datastructures that needs changing, but what else were you thinking of?
18:30 < mabshoff> ok, your code just uses lots of pointer arithmetic and I got a bad feeling about that.
18:31 < robert___> it's rare that someone actually looks at this code, so i'm curious
18:31 < mabshoff> I am just throwing out ideas, and I have been very wrong in the past :)
18:31 < robert___> originally, this part was written out in terms of individual variables, and i was thinking about optimization
18:32 < mabshoff> ok
18:32 < robert___> something about the memory being all in one block
18:32 < robert___> there could definitely be some commentary there though
18:32 < mabshoff> Well, in the large case it doesn't make a difference if you allocate 3 chunks or 1 chunk three times 
18:32 < mabshoff> the size. 
18:32 < cwitty> I don't think there's any real efficiency gain from having all the memory in one block.
18:33 < mabshoff>  degree_square_matrix is also clean allocation wise.
18:33 < mabshoff> It is actually less likely to succeed one very large allocation compared to three small ones, 
18:33 < mabshoff> especially on 32 bit.
18:33 < mabshoff> On 64 bit it doesn't matter.
18:33 < robert___> then maybe "down the road" == now
18:33 < mabshoff> It is a corner case, but as I said readability is very important.
18:34 < robert___> since i have to change allocation sizes anyway, might as well
18:34 < mabshoff> Sure, the problem is that right now you understand your code, but anybody else 
18:34 < mabshoff> would have to spend a tremendous amount of time to even figure out which array 
18:35 < mabshoff> stores what and so one.
18:35 < was_> just to add to this -- one of the main goals of that particular implementation was that it be much more readable than Brendan Mckay's nauty.
18:35 < robert___> which i can't read to compare...
18:36 < mabshoff> Yep, I think the algorithm itself is one of the more complicated ones around.
18:36 < robert___> but Stephen Hartke told me it was impossible to read, and he was using mine to make sense of it
18:36 < mabshoff> I now remember actually discussing this algorithm years ago as an example for something 
18:36 < robert___> backtrack?
18:36 < robert___> ;)
18:36 < mabshoff> that would never be actually required in an oral exam on graph theory.
18:37 < mabshoff> Well, I don't even know what it is called, but the large on with 18 different states.
18:37 < mabshoff> The paper doesn't name it.
18:38 < mabshoff> Antother style question: why do you prefix nu with "_", i.e. _nu?
18:38 < robert___> the original variables were python variables, and the underscores helped me get into pyrex
18:38 < mabshoff> Ok.
18:39 < mabshoff> I was also confused about k: In the paper you start with k=1.
18:39 < mabshoff> Your k equals zero, but is it incremented at the start of the algorithm?
18:40 < robert___> McKay's paper had very few 0's
18:40 < robert___> even though he's a computer scientist
18:40 < mabshoff> :)
18:41 < mabshoff> Because initially I thought that that might be the problem.
18:43 < robert___> in my code, k is the number of moves you are down from the root of the tree
18:43 < mabshoff> ok
18:49 < robert___> would it work to try: allocating all the memory in one block, and free everything in the except: block?
18:50 < mabshoff> What do you mean exactly?
18:50 < robert___> well, let's say i have ten variables i need to allocate memory for
18:50 < robert___> oh wait, allocation failures don't raise exceptions
18:51 < robert___> i'm just wondering what the typical thing to do is if you need to allocate 20 variables
18:51 < mabshoff> In an array or twenty individual ones?
18:51 < robert___> besides if not B, free A, if not C, free A and B, if not D, ....
18:51 < mabshoff> I looked over the code agin and for now it seemed that even on allocation failure 
18:52 < mabshoff> not memory is lost, except for potentially initialized mpz's.
18:52 < mabshoff> But don't worry about that for now.
18:55 < mhansen> was_: I just built clisp and axiom4sage on sage.math and only get the formatting errors.
18:55 < was_> hmmm.
18:56 < cwitty> was_, mhansen, what OS/architecture variants do we have?  I've seen it work on sage.math (64-bit x86 linux) and my laptop (32-bit x86 linux).
18:56 < was_> I'm using 64-bit x86 linux.
18:56 < was_> on my laptop.
18:56 < cwitty> Oh well.
18:56 < mhansen> I'm using 64-bit linux on my laptop and sage.math
18:57 < cwitty> was_, would it work to just copy sage.math:/home/cwitty/sage onto your laptop, and see if it works?
18:58 < was_> that would take a long time.
18:58 < was_> since I'm at home.
18:58 < mhansen> was_: Have you rebuilt clisp too?
18:58 < was_> no, I didn't rebuild clisp.
18:59 < was_> interestingly this works for me: http://trac.sagemath.org/sage_trac/ticket/264 
19:00 < was_> does it work for other people -- maybe I can close #264?
19:00 < mhansen> It works for me.
19:00 < was_> hey -- my axiom suddenly works like yours.
19:01 < was_> Sorry, I don't know why it changed.
19:01 < was_> Anyway, we're on the same page now.
19:01 < was_> Has anybody made a patch that deals with the formating issues for the doctests.
19:01 < cwitty> Works for me.
19:01 < was_> cool. closed.
19:01 < mhansen> I have one partially started.
19:02 < was_> I'm looking at #276 now
19:02 < was_> mhansen -- go for it.
19:02 < was_> cwitty -- #276 is yours.
19:03 < was_> can we somehow start maxima with a -E flag?
19:03 < was_> how would that work?
19:03 < cwitty> Yes, I remember it.
19:03 < was_> can you replicate it now.
19:03 < was_> I just tried and wasn't able to.
19:04 < was_> perhaps maxima fixed this in a new release sense when you posted the bug report.
19:04 < was_> I tried to replicate it by touching a file got by pasting in your tilde n.
19:04 < was_> I have a tilde n named empty file, but maxima and the maxima interface start/stop fine with no message.s
19:05 < roed___> If I want to make a module level cdefed function available from other files, how do I do it?
19:05 < roed___> cdef extern?
19:05 < was_> I don't know.
19:06 < was_> I asked that on the cython/pyrex list and there were some answers.
19:06 < was_> I've never successfully done it.
19:06 < cwitty> was_, I can't reproduce it in my default environment, because I upgraded Debian and now my LANG environment variable is set to en_US.UTF-8
19:06 < was_> I always just end up creating an object and using a cdef'd method.
19:06 < roed___> This is my object creating function
19:06 < cwitty> But if I unset the LANG environment variable, and then try "sage -maxima", it fails just like in the bug report.
19:11 < cwitty> roed___, if your object creating function is a method of another object, you've created a Factory!  It's a Design Pattern!
19:11 < roed___> I see
19:11 < roed___> :-)
19:15 -!- was [n=was@c66-235-37-221.sea2.cablespeed.com] has joined #sage-devel
19:17 < wstein> :-)
19:17 < wstein> re: LANG -- with the patch I just posted unset LANG and sage -maxima will still work. Nice.
19:18 < mhansen> wstein: patch is up for #953
19:18 < wstein> ok, I'll take a look.
19:18 < cwitty> Where did you post the patch?
19:18 < mhansen> http://trac.sagemath.org/sage_trac/ticket/953
19:18 < wstein> #http://trac.sagemath.org/sage_trac/ticket/276
19:19 < cwitty> Huh.  I refreshed #276 a couple of times after you said "the patch I just posted", and it wasn't there yet.
19:19 < wstein> i was optimizisitng.
19:19 < cwitty> Maybe my browser cached the page, instead of going and looking again.
19:19 < wstein> optimistic.
19:20 < cwitty> Oh, OK.
19:20 < wstein> try again.
19:20 < mabshoff> I can see the patch.
19:20 < cwitty> Yes, it's there.
19:20 < was> the axiom patch works perfectly mhansen.!
19:21 < mhansen> Good.  I'm off to a show -- I'll be back afterwards.
19:21 -!- mhansen is now known as mhansen_afk
19:22 < was> cu thanks
19:22 < cwitty> was: I'm curious.  Why are you sometimes "was" and sometimes "wstein", only a minute apart?
19:22 < was> I'm wstein in linux and was in osx.
19:22 < was> I'm using osx with x login to vmware running linux.
19:22 < was> I greatly prefer linux, but running linux on mac hardware is too painful.
19:23 < was> Also, I need os x for testing purposes.
19:23 < was> so that's why.
19:23 -!- was_ [n=was@c66-235-37-221.sea2.cablespeed.com] has quit [Read error: 110 (Connection timed out)]
19:23 < cwitty> Everybody is pretty sure that #624 has already been applied.  Is it time to close it?
19:24 < was> let me check.
19:25 < was> closed.
19:26 < was> the timings are very impressive.
19:30 -!- malb_ [n=malb@host86-143-83-79.range86-143.btcentralplus.com] has joined #sage-devel
19:31 < was> What about #222?
19:32 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
19:32 < was> cwitty -- why do we consider #222 a bug?
19:32 < was> It's just changing something about the print representation; it's not mutating any mathematical properties of the field.
19:33 < cwitty> Because parents are immutable, and immutable objects shouldn't change whether they are equal to each other.
19:33 < was> ahh.
19:33 < was> so maybe the solution is to not take scinot into account in defining equality?
19:33 < was> Either that or eliminate the function for changing sci not.
19:34 < was> I say change the equality function.
19:34 < cwitty> Right.
19:34 < was> ok, done.
19:36 -!- jason_ [n=jason@12-208-92-185.client.mchsi.com] has joined #sage-devel
19:40 < robert___> was - #939 is fixed
19:40 < was> great work!
19:40 < was> I'm working on #250 now
19:40 < was> But I'll pause to test out #939.
19:40 < robert___> i also changed the milestone to 2.8.8
19:41 < mabshoff> Nice, I will test in a minute, too, once 2.8.7.2 has finished compiling.
19:41 < was> there's a bunch of +1's.
19:41 < robert___> hehe
19:41 < robert___> yeah the fix was to add one
19:42 < was> in a surprising number of places!
19:42 < robert___> (that's because of my weird memory allocating - anything after the relevant block got moved too)
19:43 < was> interestingly the answers printed by the doctest that was crashing --- are different than you claim!
19:43 < was> you claim 1, 2;  2, 10;  3, 127 in the doctest
19:43 < was> but sage outputs 1,2; 2,10; 3,104.
19:44 < was> Which is right?
19:44 < robert___> most likely the more recent ones
19:44 < was> :-)
19:44 < was> You are so confidence inspiring.
19:44 < mabshoff> Shouldn't we verify that with that external program?
19:44 < was> robert -- how hard would that be?
19:44 < robert___> the first ones were based on the broken code, which just happened to be working since the accidentally accessed memory was usually small
19:44 < was> it might be quite hard to verify, no?
19:44 < mabshoff> nauty or whatever it is called.
19:45 < robert___> these are looped digraphs on 3 nodes, so there are 2^9 different ones
19:45 < robert___> not too many
19:46 < mabshoff> One small remark: If you allocate each array individually we would have caught 
19:46 < was> I posted a patch that turns the doctesting back on.
19:46 -!- malb [n=malb@host86-141-245-221.range86-141.btcentralplus.com] has quit [Read error: 110 (Connection timed out)]
19:46 < robert___> there's no sloane sequence for those kinds of objects...
19:46 < mabshoff> the error sooner, because we would have oveerun the right array.
19:46 < robert___> wait
19:48 < robert___> sequence A055973 plus sequence A055974  gives 104 for 3
19:48 < robert___> so 104 is correct
19:48 < robert___> !!
19:49 < robert___> mabshoff - you are so right
19:52 < mabshoff> Well, I just thougth that it is another argument for a memory management rewrite.
19:52 < mabshoff> I don't criticise you, it it just that I dislike games with pointers like that because 
19:53 < mabshoff> I have seen it go wrong too many times :)
19:53 < roed___> mabshoff: is __dealloc__ called up the inheritance chain, or only the lowest one?
19:54 < mabshoff> I don't know, clueless about pythoon details.
19:54 < roed___> k
19:55 < mabshoff> robert___: Is a boolen matrix a matrix with 0 or 1 only for you?
19:55 < malb_> it should be called all the way up
19:55 < mabshoff> Because in that case I have another potential optimization for you.
19:55 < malb_> (everything else wouldn't make any sense)
19:55 < roed___> That's what I though
19:55 < roed___> t
19:55 < robert___> well, the matrix is something that is going to be replaced anyway
19:56 < mabshoff> ok.
19:56 < robert___> but are you suggesting a GF(2) matrix?
19:56 < malb_> btw. I've been working on fpLLL 2.0: and now we are competitive with MAGMA for LLL
19:56 < mabshoff> Yep.
19:56 < roed___> awesome!
19:56 < mabshoff> Because it might also be more a space issue.
19:56 < mabshoff> malb_: nice.
19:56 < robert___> yeah, esp since i'm using integers right now
19:57 < robert___> and densely at that
19:57 < mabshoff> That is exactly the point.
19:57 -!- ctothej [n=offero@ool-44c05172.dyn.optonline.net] has quit ["Segmentation Fault Core Dumped"]
19:57 < mabshoff> All you care about are the number of 1's? 
19:57 < was> malb_ -- excellent!
19:57 < robert___> yup
19:57 < robert___> jup
19:57 < mabshoff> So if you do sparse you could just sum up the number of nonzeroes for all columns 
19:58 < mabshoff> That ought to be much faster and a lot less memory wise.
19:58 < robert___> well, it's the number of ones in certain places, but it would certainly help with space
19:58 < mabshoff> ok
19:58 < mabshoff> We could callgrind your code to see where there are potential improvements.
19:58 < mabshoff> possible.
19:59 < robert___> callgrind?
20:00 < mabshoff> callgrind is a valgrind tool that does cycle exact anlysis of your code.
20:00 < robert___> oh wow
20:00 < mabshoff> It is very cool and gives you better results than python profilers, but it is harder to use
20:00 < mabshoff> but much more powerful.
20:00 < robert___> is there a sage gizmo yet?
20:01 < mabshoff> yep. sage -callgrind start sage in callgrind mode.
20:01 < robert___> nice, nice, very nice
20:01 < mabshoff> But cwitty has pointed out a trick so you only profile the code you want, not the whole 
20:01 < mabshoff> session.
20:01 < robert___> ?
20:01 < mabshoff> Right now everything on sage would be profiled.
20:02 < robert___> what's the trick?
20:02 < mabshoff> That is very slow and also makes you filter out certain bits.
20:02 < cwitty> callgrind gives better results if most of your code is Cython; if most of your code is Python, callgrind is virtually useless and the built-in profilers work quite well.
20:02 < mabshoff> Well, the relevant bits here are (mostly?) cython
20:02 < mabshoff> And you need a visualization tool called kcachegrind, which is only available on Linux, UNIX, not OSX
20:03 < mabshoff> (you need KDE), so OSX might be possible via Fink.
20:03 < robert___> i'm using parallels
20:03 < mabshoff> ok,
20:03 < mabshoff> Once my rebuild finished I am testing your fix, but then I wanted to see if omega tells me 
20:03 < mabshoff> anything about #621.
20:04 < robert___> i'll be afk for a little while
20:04 < mabshoff> ok, I might go to sleep at some point, but right now I am good.
20:05 < cwitty> If kcachegrind doesn't work for everybody, it's still possible to get useful information out of callgrind_annotate.  (Granted, it's several times harder, but it's still much better than nothing.)
20:05 < mabshoff> Well, kcachegrind will be ported to pure Qt, so that restriction will be gone soonish.
20:06 < roed___> So kcachegrind will be available on OS X?
20:06 < mabshoff> valgrind will be for 10.5, so kcachegrind seems to be the next step.
20:06 < mabshoff> Somebody did mentioned on valgrind-devel that he was working on the port.
20:06 < mabshoff> But even if he doesn't do it I might try.
20:06 < cwitty> mabshoff, I take it you gave up on chronicle for now?
20:07 < mabshoff> I prefer for him to do the work .)
20:07 < mabshoff> Not really, but I wanted to play with omega first.
20:07 < cwitty> Have you tried omega on interesting examples yet?
20:07 < mabshoff> I don't like that chronicle is next to valgrind (build system wise)
20:07 < mabshoff> #621 is the plan, but I have no clue how it will handle a big piece of code like Sage.
20:08 < mabshoff> There are other tickets in the 800s that also could benefit from omega.
20:08 < mabshoff> In sparse vector arithmetic over Q there is a leak somewhere, at least 
20:08 < mabshoff> somewhere in the lifting code for modular forms.
20:09 < mabshoff> I can't find the leak, but memcheck points to the allocatio, not to the leak.
20:09 < mabshoff> cwitty: I wantet to paste your chronicle build instructions into the valgrind wiki page.
20:09 < mabshoff> Is that ok with you?
20:09 < was> mabshoff -- fyi -- the doctest failures in modular symbols as a result of applying patches -- were -- FIXES.
20:09 < was> I.e., the doctests were wrong.
20:09 < was> I just figured this out by double-checking with my magma program.
20:10 < mabshoff> the cusp stuff?
20:10 < cwitty> mabshoff, sure.
20:10 < was> yep..
20:10 < was> so craigcitro actually fixed a bug.
20:10 < mabshoff> Ok, I am an idiot savant ;)
20:10 < cwitty> And I need to send at least the feclearexception() patch to the chronicle author.
20:13 < was> Have any of you ever heard of the journal "Experimental Mathematics":  www.expmath.org
20:13 < mabshoff> Nope
20:14 < cwitty> Looks cool.
20:14 < mabshoff> Very interesting.
20:14 < was> I  might get an opportunity to be very involved in the journal and/or get sage very involved in it...
20:14 < mabshoff> That sounds like a great opportunity.
20:18 < mabshoff> Ok, updated the valgrind wiki page.
20:19 < mabshoff> hehe, the valgrind page is starting to look better and better.
20:19 < mabshoff> Lots of info you cannot get anywhere else if you are running 3.3.0 trunk, especially with python,.
20:20 < mabshoff> robert___: In case you read logs - check out http://wiki.sagemath.org/ValgrindingSage for
20:21 < mabshoff> detailed info on how to callgrind selected code snippets only.
20:21 < mabshoff> was: Is the graph theory fix already in hg?
20:21 < mabshoff> Well, the public one?
20:21 < was> I haven't pushed it out.
20:22 < was> I can if you want.
20:22 < was> I will.
20:22 < mabshoff> ok
20:22 < was> I'm going to code freeze 2.8.8 in a few minutes, and get the release ready.
20:22 < mabshoff> ok
20:22 < mabshoff> Seems like a good idea.
20:22 < mabshoff> Plenty of tickets were closed.
20:23 < was> better do it now before it gets too hard (like last time, when it was really hard to make the release).
20:23 < mabshoff> I am entertaining myself with #621 until you push the next update.
20:24 < mabshoff> I guess there will be surprises as always.
20:24 < cwitty> So, do you want to know about a very bad (because very subtle) bug in the Singular interface, and probably most if not all of the others?
20:24 < mabshoff> Sure.
20:24 < cwitty> I've spent the last several hours tracking down that problem I reported with a failing doctest in polynomial_singular_interface.py.
20:24 < cwitty> I think I understand it now.
20:25 < was> robert____ -- can you referee http://trac.sagemath.org/sage_trac/ticket/904
20:25 < mabshoff> Please go ahead, Singular's pexpect doesn't work at all on Solaris!
20:25 < cwitty> In Singular.eval(), it sends something to the stdin of the singular subprocess, then waits for the output.
20:25 < was> pushed out
20:26 < cwitty> While it's sitting there waiting, if you're very very unlucky, a garbage collection can happen.
20:26 < mabshoff> was: mk
20:26 < mabshoff> Is it a tarball, too?
20:26 < cwitty> If a wrapper for a Singular value gets declared garbage, then it sends a "kill" command to Singular, do unset the corresponding Singular variable.
20:27 < cwitty> This "kill" command, and its response, happen while the main Singular.eval() is still sitting there waiting.
20:27 < mabshoff> Ooops
20:27 < mabshoff> evil
20:27 < cwitty> So the main eval sees the response to the "kill" (which is null), and you lose the real response.
20:28 < cwitty> I've got a reproducible test case right now, but if I do almost anything, the problem goes away.  (Because the garbage collection moves out of the danger window.)
20:29 < mabshoff> But why would the garbage collector kill "Singular.eval"?
20:29 < cwitty> But I put a global variable in singular.py, set it True just before the call to Expect.eval() in Singular.eval(), and set it to False afterward.
20:29 < cwitty> It's not killing Singular.eval; it's killing some random wrapper for a singular value.
20:30 < mabshoff> ok
20:30 < mabshoff> That makes sense, as does you work-around.
20:30 < cwitty> foo._singular_() from some previous singular interaction.
20:30 < cwitty> I don't have a workaround yet; I'm just explaining why I'm confident I found the problem.
20:30 < mabshoff> mk
20:30 < malb_> I'm out for tonight, I'll finish the fpLLL wrapper tomorrow
20:31 < cwitty> So I check this global variable in Singular.clear() and print a message if it's set.  And it is set, exactly when the doctest fails.
20:31 < cwitty> I'm going to open a ticket now.
20:32 < was> ok, 2.8.8 feature freeze.
20:33 < was> I've now fully updated the repos.
20:33 < was> I'll post a tarball in about 10 minutes.
20:33 < mabshoff> I looked into determining the gcc version number and there is no easy and or 
20:33 < was> It will be rc1.
20:33 < mabshoff> elegant solution. So I would suggest just compiling some C99 code and if the compiler 
20:33 < was> mabshoff -- good idea.
20:34 < mabshoff> fails just say "not C99 conform", "if you are using gcc < 3.4 please upgrade"
20:34 < mabshoff> I will open a ticket.
20:34 < cwitty> mabshoff, I can think of a couple of ways to check the gcc version number.
20:34 < robert___> mabshoff -- thanks for the link
20:34 < cwitty> 1) run "gcc -v" and parse the last line
20:34 < robert___> was -- looking at 904
20:34 < mabshoff> Well, that can say wildly different things
20:35 < mabshoff> We tried for CoCoALib and while it works most of the time it isn't 100%
20:35 < mabshoff> And it potentially locks us into gcc, even though no other compiler is supported for now.
20:36 < mabshoff> robert___: np, that is why we write documentation.
20:36 < mabshoff> Feel free to ask any question you have, we should add that to the documentation-
20:50 < was> mabshoff -- do you have an irc log?
20:51 < was> I suspect so based on your SageLogger.  
20:51 < was> Since I don't really have one for today.
20:51 < mabshoff> Yep, the one you posted was oddly formatted.
20:51 < was> I have the first and half part of the day only.  Could you post something here: http://wiki.sagemath.org/bug4/irc
20:51 < mabshoff> look into sage.math/home/mabshoff/irclogs/...
20:52 < was> Yeah, colloquy for mac upgraded itself when I started, and one of their amazing new features is crappy cut and paste formating that one can't turn off :-(
20:52 < mabshoff> it is chowned, so it isn't web-readable.
20:52 < mabshoff> lol
20:52 < was> could you post it to http://wiki.sagemath.org/bug4/irc
20:52 < mabshoff> Sure
