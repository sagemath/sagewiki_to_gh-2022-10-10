= SAGE Bug Squash Day 6 =

The event will take place on '''SATURDAY, December 1, 2007''' and officially start at 9 am pacific standard time.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''2.8.14'''.
 * [[bug6/status|STATUS]]
 * [[bug6/irc|IRC log]]
 * [[/Results]]
 * Write to wstein@gmail.com for an account on the bug tracker.
 * We'll all be on #sage-devel at irc.freenode.net.
{{{
From Linux you can chat via a text console by installing "irssi", running it, and typing
  /SERVER add irc.freenode.net
  /SERVER irc.freenode.net
  /join #sage-devel
}}}

If you are using Konversation (the KDE IRC client), you can set up an auto-replace rule that lets you type #1322 (for trac #1322) and what everyone sees is http://trac.sagemath.org/sage_trac/ticket/1322 (which lets people click on the link and see the bug you are talking about).

To configure this, go to Settings -> Configure Konversation -> Behavior -> Auto Replace and create a rule with Find as "#([0-9]+)" and Replace with as "http://trac.sagemath.org/sage_trac/ticket/%1" (both without the quotes).  You can select whether this rule is applied to incoming posts, your outgoing posts, or both.

= Participants (with area they would like to work on) =
 1. Michael Abshoff (Solaris port, build issues in general)
 1. William Stein
 1. David Harvey --- yeah I'll probably be there, just tackling random bugs
 1. Mike Hansen
 1. Craig Citro (after 1PM)
 1. Josh Kantor -ATLAS issues.
 1. Robert Bradshaw --- I might be around a bit. 
= A mugshot of a Sage bug =

{{attachment:bug.jpg}}

= IRC =
{{{
06:32 < cwitty> mabshoff_, are you here?
06:36 < mabshoff_> Yep
06:36 < mabshoff_> I have had some trouble with your qqbar patch.
06:36 < mabshoff_> Either a mismerge or bits are missing.
06:36 < mabshoff_> http://sage.math.washington.edu/home/mabshoff/test-2.8.15.alpha0.log
06:37 < mabshoff_> Caution, 14MB
06:37 < mabshoff_> There is also a alpha0 tarball in that directory. I am writing release notes right now.
06:38 -!- jason_____ [n=jason@12-210-255-80.client.mchsi.com] has joined #sage-devel
06:40 < mabshoff_> cwitty: I am currently working on Solaris.
06:41 < mabshoff_> Somebody hardcoded int_fast64_t to be an int!
06:41 -!- jason_____ [n=jason@12-210-255-80.client.mchsi.com] has quit [Remote closed the connection]
06:46 < cwitty> If "ctypedef int int_fast64_t" fails, I think that would probably be considered a Cython bug.  Cython isn't supposed to look at typedefs.
06:46 < mabshoff_> it doesn't fail to compile, but at startup it complains that the 64 bit int is the wrong size
06:46 < cwitty> The above just tells Cython "int_fast64_t is some type that has the same operations as int"; but Cython isn't supposed to believe that the two types have the same values.
06:47 < mabshoff_> when I set int_fast64_t to long long somewhere else.
06:47 < mabshoff_> That typedef is in *our* code
06:47 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has joined #sage-devel
06:47 < dmharvey> g'day
06:47 < mabshoff_> I am not sure that that is the whole story.
06:47 < cwitty> Yes, I know.  But it doesn't get into the C code.
06:47 < mabshoff_> hi David
06:48 < mabshoff_> Well, I am trying with long long.
06:48 < cwitty> Yes.
06:48 < mabshoff_> Otherwise it is probably a cython bug.
06:48 < mabshoff_> as you wrote
06:48 < dmharvey> any bugs for me?
06:48 < mabshoff_> Nothing in trac for you? :)
06:49 < dmharvey> hehe #1293, "sage is too big", I know how to fix that.......
06:49 < mabshoff_> rm -rf ?
06:49 < dmharvey> ok I'll just start picking off some easy ones
06:49 < mabshoff_> Have fun.
06:50 < mabshoff_> cwitty: any idea yet why QQbar is a problem with alpha0
06:50 < mabshoff_> You can just untar, copy over the new mpfi.spkg and sage-2.8.15-alpha0.spkg and build.
06:50 < cwitty> It looks to me like you didn't do "sage -b" after merging qqbar-full.hg .
06:50 < mabshoff_> Well, I merged more patches and build then.
06:50 < cwitty> Consider this excerpt from test-2.8.15.alpha0.log:
06:51 < cwitty>       File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha0/local/lib/python2.5/site-packages/sage/rings/algebraic_real.py", line 1105, in __init__
06:51 < mabshoff_> I even did a ./sage -ba
06:51 < cwitty> But algebraic_real.py should have been deleted by qqbar-full.hg .
06:51 < mabshoff_> I assume it was somehow mismerged, but qqbar.py exist and if I attach it manually I can 
06:51 < mabshoff_> instantiate elements.
06:51 < cwitty> So alpha0 does have the patch?
06:51 < mabshoff_> Ok, that is why I assume mismerge right now.
06:52 < mabshoff_> It is in the log.
06:52 -!- malb [n=malb@host86-141-247-119.range86-141.btcentralplus.com] has quit [Remote closed the connection]
06:52 < mabshoff_> And unbundle did not complain.
06:52 < mabshoff_> It was actually the first think to go in ;)
06:53 < dmharvey> #280 is already fixed, but not marked as such.
06:54 < mabshoff_> What also makes me wonder is that bugs that mike hansen fixed are still there.
06:54 < dmharvey> Do I have the power to remove it?
06:54 < mabshoff_> You should be able to close it as fixed, but attach a working example session as the comment.
06:54 < dmharvey> ok will do
06:57 -!- ondrej [n=ondra@89.130.6.136] has quit [Remote closed the connection]
06:57 < mabshoff_> cwitty: Ok, I am taking the 2.8.13 binary, upgrading it to 2.8.14, applying qqbar-full.hg + the new mpfi.spkg and see if the problem still exists then.
06:58 < mabshoff_> I really, really dislike bundles - I have been screwed by them too many times by now.
06:59 < cwitty> mhansen, are you here?
06:59 < cwitty> mabshoff_, I'm confused:
07:00 -!- mabshoff_ is now known as mabshoff
07:00 < cwitty> test-2.8.15.alpha0.log includes at least two -testall runs, and qqbar.py succeeds in the last one.
07:00 < cwitty> Where is the problem?
07:01 < mabshoff> I guess it is a mismerge in the somewhere that screwed with your bundle.
07:01 < cwitty> What makes you think something is wrong?
07:01 < mabshoff> And I did kill one of the testall runs early on.
07:02 < mabshoff>  algebraic_real.py still exists in my tree.
07:03 < mabshoff> And according to you it shouldn't be there any more.
07:03 < cwitty> When I look at test-2.8.15.alpha0.log, I don't see anywhere that it tries to doctest algebraic_real.py; are you sure it's there?
07:03 < mabshoff> Yep, I just checked.
07:04 < cwitty> Where is this tree?
07:04 < mabshoff> in /tmp/Work-mabshoff
07:04 < mabshoff> release-cycle-2.8.15/sage-2.8.15-try1
07:05 < cwitty> I don't see an algebraic_real.py in that tree.
07:05 < mabshoff> I did find it with "find"
07:06 < mabshoff> Let me look
07:07 < cwitty> There's a copy in your "build" tree, which is annoying; but I don't think that copy actually affects anything.
07:07 < mabshoff> ok, that might have been it.
07:07 < cwitty> (As long as you don't try to explicitly import the module, which nothing should.)
07:08 < mabshoff> You were right about the int_fast64_t issue, it seems to be a Cython bug.
07:08 < mabshoff> changing it to "long long" didn't make a difference.
07:09 < mabshoff> I wonder what the following means:
07:09 < mabshoff>     int_fast32_t INTEGER_MOD_INT32_LIMIT
07:09 < mabshoff>     int_fast64_t INTEGER_MOD_INT64_LIMIT
07:09 < mabshoff> cython macros?
07:09 < dmharvey> I'm taking over #1211 "NTL crash in polynomial remainder over ZZ" from malb, marked as critical, I know how to fix it
07:10 < mabshoff> Oh, I am sure he won't mind.
07:13 < cwitty> mabshoff, look at sage/rings/stdint.h
07:18 < mabshoff> ok
07:18 < mabshoff> I just remembered what went wrong: one file miscompiled, I didn't catch that and run testall.
07:18 < mabshoff> it failed all over the place. Then I fixed the issue but I looked at the initial testall run.
07:18 < mabshoff> Ergo: I am the idiot ;)
07:19 < mabshoff> looking
07:19 < cwitty> This is your bug, right? "typedef long int_fast64_t;"
07:19 < mabshoff> Which installation?
07:19 < mabshoff> On sun it is different.
07:19 < cwitty> In sage/rings/stdint.h .
07:19 < mabshoff> I am on neron, but let me check there, too.
07:20 < cwitty> That's a part of Sage; it's not going to be different on different platforms.
07:20 < mabshoff> ok, it might have been me :(
07:20 < cwitty> I checked; William wrote that line of code :)
07:20 < mabshoff> pfft.
07:21 < mabshoff> Hey, it is excellent to blame somebody else.
07:21 < mabshoff> It is correct in 64 bit mode, just not 32 bits.
07:22 < mabshoff> I am actually failry certain that I saw that code before it went in, so I didn't pay attention either.
07:24 < mabshoff> Ok, rebuilding all of sage-2.8.14.spkg on Solaris, just to be on the sage side.
07:26 < mabshoff> I am also rerunning testall after deleting the old test.log, but it looks like mhansen's patches had some side effects in the code.
07:26 < cwitty> Yes.
07:26 < cwitty> The last testall run had several failures caused by mhansen's patches (that I gave positive reviews to :( ).
07:26 < mabshoff> But calculus.py certainly passes doctests.
07:27 < mabshoff> See, now I can blame you :)
07:27 < mabshoff> We need parallel testall, so running it on sage.math only takes a couple minutes.
07:27 < mabshoff> That way I would apply 3, 4 patches and do a testall.
07:28 < mabshoff> Not like now where I have nearly 20 and then I can start guessing which one[s] caused the problem.
07:31 < cwitty> mhansen has patches to speed up testall:
07:31 < cwitty> <mhansen>	I just did the equivalent of -testall in 8minutes which is a bit better.
07:31 < mabshoff> :)
07:31 < mabshoff> gimme, gimme, gimme ;)
07:32 < mabshoff> But isn't that with nose, and there were still a couple problems?
07:32 < cwitty> Yes.  We need to get him to fix those problems (or at least post what he has so far).
07:33 < mabshoff> Sure, I certainly agree.
07:33 < cwitty> That was from early October...
07:33 < mabshoff> ok
07:34 < mabshoff> It looks like SymbolicConstant is somehow broken, that causes some recursion that is stopped after 1000 iterations.
07:37 < cwitty> Yes.  I'm hoping mhansen will show up soon to fix it :)
07:37 < mhansen> Good morning -- I just got what.
07:37 < mhansen> err, up
07:37 < mabshoff> At least he broke it, your QQbar patch seems to work.
07:37 < mhansen> What patch are we talking about.
07:37 < mhansen> ?
07:37 < mabshoff> So, are your ears burning?
07:38 < mabshoff> We aren't sure yet, but the series of three patches fixing expand, symbolic parent and the third one
07:38 < mabshoff> broke some doctests outside of calculus.py
07:38 < mabshoff> I am running clean doctests and can upload them shortly.
07:39 < mabshoff> There is also 2.8.15.alpha0 in sage.math/home/mabshoff
07:39 < mabshoff> One problem is this:
07:39 < mabshoff>         return self._ser() * SR(right)
07:39 < mabshoff>       File "element.pyx", line 1372, in sage.structure.element.RingElement.__mul__
07:39 < mabshoff>       File "coerce.pxi", line 124, in sage.structure.element._mul_c
07:39 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha0-try1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 3009, in _mul_
07:39 < mabshoff>         return SymbolicConstant( operator.mul(self._obj, right._obj) )
07:39 < mabshoff>       File "element.pyx", line 1374, in sage.structure.element.RingElement.__mul__
07:40 < mabshoff>       File "coerce.pyx", line 252, in sage.structure.coerce.CoercionModel_cache_maps.bin_op_c
07:40 < mabshoff>       File "element.pyx", line 1372, in sage.structure.element.RingElement.__mul__
07:40 < mabshoff>       File "coerce.pxi", line 124, in sage.structure.element._mul_c
07:40 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha0-try1/local/lib/python2.5/site-packages/sage/functions/constants.py", line 350, in _mul_
07:40 < mabshoff>         return self._ser() * SR(right)
07:40 < mabshoff>         return self._coerce_impl(x)
07:40 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha0-try1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 401, in _coerce_impl
07:40 < mabshoff>         return SymbolicConstant(x)
07:40 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha0-try1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 2842, in __init__
07:40 < mabshoff>         Symbolic_object.__init__(self, x)
07:40 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha0-try1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 2736, in __init__
07:40 < mabshoff>         SymbolicExpression.__init__(self)
07:40 < mabshoff>     RuntimeError: maximum recursion depth exceeded
07:40 < mabshoff> That is in plot.py, doctest 4
07:41 < mhansen> Okay
07:42 < mabshoff> The whole log is at http://sage.math.washington.edu/home/mabshoff/test-2.8.15.alpha0.log
07:42 < mabshoff> but that is from a number of runs.
07:44 < mabshoff> #645 also seems to cause trouble here and there.
07:44 < mabshoff> But you should check in the alpha0 tarball that all your patches have been applied correctly.
07:44 < mabshoff> I still think that at some point some mismerges happened. So blame me.
07:45 < mhansen> I get that on my local one though.
07:45 < mabshoff> ok, good for me, bad for you ;)
07:45 < cwitty> #645 provokes a failure in piecewise.py:
07:45 < cwitty>     ValueError: the number of arguments must be less than or equal to 0
07:45 < mabshoff> I read that one and I thought: What?
07:49 < mhansen> Piecewise.py passes for me.
07:49 < mabshoff> ok, which patches did you apply?
07:50 < mhansen> Well, I'm still downloading 2.8.15.  This  branch has 847, 1345, 645, and 644 in that order.
07:51 < mhansen> (I guess also 1111 and 1280 before those too.)
07:51 < mabshoff> ok, maybe I am missing one of them. There was some dependencies.
07:51 < mabshoff> I didn't merge #644
07:52 < mabshoff> #1280 is also not merged yet.
07:52 < mhansen> I think that 644 will fix that.
07:53 < mhansen> I'm working on the plot.py one now.
07:53 < mabshoff> ok, you can reproduce that locally?
07:53 < mhansen> Yeah
07:53 < mabshoff> ok, you wrote that a couple minutes ago, sorry.
07:54 < dmharvey> when I change ntl_wrap.h in c_lib, why does sage -b not recognise the change? Do I need to do some scons thing manually?
07:55 < mabshoff> Probably, let me check.
07:57 < mabshoff> I guess you can touch the right pyx - but can't you also add a dependecy in setup.py?
07:57 < dmharvey> ah no it's okay, I forgot to declare the new function to cython
07:57 < mabshoff> :)
08:02 -!- kedlaya [n=kedlaya@WALKER-THREE-THIRTY-TWO.MIT.EDU] has joined #sage-devel
08:03 < mhansen> I figured out the plot.py issue.  It came from a combination of patches.  Is there a ticket for it?
08:03 < mabshoff> Not yet. Open one please.
08:03 < mabshoff> I assume you have a fix :)
08:04 < mhansen> Yeah, I think so.  I need to think it through first.
08:04 < mabshoff> np, I am applying #644 and #1280 to alpha1 right now.
08:06 < mabshoff> A comment about #644: "This patch should be applied after #644"
08:06 < mhansen> Oops, I meant 645.
08:06 < mabshoff> Well, I assume so now, too.
08:07 < mabshoff> We really can't afford it any more not to do any merges for 6 days like after 2.8.14.
08:07 < mabshoff> Too many tickets and patches pile up.
08:08 < dmharvey> grrr..... i change decl.pxi in libs/ntl and like everything has to rebuild....
08:09 < cwitty> mabshoff, we should think some about totally new procedures for sage releases.
08:10 < cwitty> Like (brainstorming): if people on a whitelist give a positive review to a patch in TRAC,
08:10 < cwitty> then a bot automagically applies it to a "testing" tree.
08:10 < mabshoff> :)
08:10 < mabshoff> That would be quite nice.
08:10 < cwitty> Then a tinderbox (automatically compile and test) setup notices that tree has changed,
08:10 < mabshoff> build bot ;)
08:10 < cwitty> and tests the new version on 5 platforms.
08:11 < dmharvey> I keep getting the following linker warning:
08:11 < dmharvey>  /usr/bin/ld: warning can't open dynamic library: libpari-gmp.dylib referenced from: /Users/david/sage-2.8.14/local//lib/libcsage.dylib (checking for undefined symbols may be affected) (No such file or directory, errno = 2)
08:11 < dmharvey> what's that all about?
08:11 < mabshoff> relocation problem.
08:12 < mabshoff> rebuild NTL, then the problem should go away.
08:12 < mabshoff> I have a fix, but it isn't in 2.8.15 yet.
08:12 < dmharvey> oh ok
08:12 < was__> hi
08:12 < dmharvey> this is from a clean sage.2.8.14
08:12 < mabshoff> NTL gets build with "stupid" linker options on OSX.
08:12 < mabshoff> Did you move it?
08:12 < dmharvey> no
08:12 < mabshoff> hi was__
08:12 < dmharvey> i cloned it though
08:12 < dmharvey> i mean I cloned my sage tree
08:12 < mabshoff> ok, that might be a problem.
08:13 < mabshoff> Nope, it isn't the problem.
08:13 < was__> regarding bug day -- I think we should start with 2.8.14, since 2.8.15 doesn't seem ready?
08:13 < was__> Or?
08:13 < mabshoff> John Hanke had the same thing.
08:13 < was__> I just woke up after getting a lot of sleep.
08:13 < mabshoff> alpha0 is out, alpha1 is being worked on.
08:13 < mabshoff> We could work on 2.8.14, but I could merge patches into alphaX
08:14 < was__> libpari-gmp.dylib -- ?? That looks to me more like a problem with pari not NTL.
08:14 < dmharvey> it's only a warning: it still builds and runs
08:14 < was__> mabshoff -- that would be very safe.
08:14 < mabshoff> It is NTL, for some reason it doens't pick libgmp.dylib.
08:14 < was__> Try forcing a rebuild of libcdsage.
08:14 < mabshoff> Never figured out why.
08:14 < mabshoff> Yep, I will be merging and build testing most of the night - at least the way it looks.
08:14 < was__> But why *libpari-gmp.dylib"  ????  PARI and GMP both have absolutely nothing to do with NTL.
08:15 < mabshoff> NTL needs gmp, I think.
08:15 < was__> dmharvey -- force a rebulding of libcsage.
08:15 < was__> Yes.  But PARI doesn't need NTL.
08:15 < dmharvey> i'll try later.... debugging something else right now
08:15 < was__> And libpari-gmp.dylib is the pari library, but linked against gmp.
08:16 < was__> OK.
08:16 < was__> Anyway, I'll be back by 9am and we can start bug day.  I'm going to go to a coffee shop...
08:17 < mabshoff> cu
08:17 < mabshoff> I think the problem is the OSX linker, it sees gmp symbols on libpari-gmp.dylib and links against those symbols.
08:22 -!- dmharvey_ [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has joined #sage-devel
08:22 < dmharvey_> hmmm so #1211 is not as easy as I had thought
08:23 < dmharvey_> the problem is quo_rem semantics
08:23 < dmharvey_> If x and y are elements of a ring R
08:23 < dmharvey_> and q, r = x.quo_rem(y)
08:23 < dmharvey_> are q and r required to be elements of R?
08:23 < dmharvey_> If so, then this is very difficult to pull off with the functionality provided by NTL
08:24 < dmharvey_> I can fix the bug to make the segfault go away, but it won't be able to handle divisions by non-monic polynomials
08:24 < mabshoff> mhansen: with #644 and #1280 piecewise.py passes 
08:25 < mabshoff> dmharvey: Can you raise an Error, too?
08:25 < mabshoff> Not segfaulting would certainly be a plus.
08:26 < dmharvey_> I guess avoiding the segfault is the number one priority, but I don't want to do this in a way that cripples existing functionality
08:26 < wjp> hm, magma actually complains if you take the quotient of PolynomialRing(Integers()) by 2*x-1
08:26 < mabshoff> Sure.
08:26 < wjp> Runtime error in quo< ... >: Polynomial must be monic
08:27 < cwitty> Pari's number field functions require that the defining polynomial is monic.
08:27 < dmharvey_> hmmmm
08:27 < cwitty> I can think of at least 3 possibilities for #1211:
08:27 < cwitty> 1) raise an error
08:27 < mabshoff> I am running out for some last minute shopping.
08:27 < cwitty> 2) return an element of QQ['x']
08:27 < mabshoff> back in 30 minutes or so
08:27 -!- mabshoff is now known as mabshoff|afk
08:27 < cwitty> 3) return the pseudoremainder
08:28 < dmharvey_> I think (1) is the only way to go.
08:28 < cwitty> And I have no particular opinion which should be the behavior of "%" :)
08:28 < cwitty> OK, sounds good to me.
08:28 < dmharvey_> (3) doesn't make sense, since quo_rem is defined for lots of types, and there's no reason it should be a pseudo-remainder in this case
08:28 < dmharvey_> I don't like (2) because the return type is unpredictable
08:29 < cwitty> True.  (Although there are precedents in Sage, like RR(x).sqrt() .)
08:31 < dmharvey_> the really weird thing is that the current implementation eventually uses NTL's DivRem function, but the NTL documentation explicitly says that this only works for monic divisors
08:35 -!- was__ [n=wstein@c66-235-34-166.sea2.cablespeed.com] has quit []
08:35 < dmharvey_> ok here's what I'm going to do. The underlying issue is the implementation of f.quo_rem(g). If g is monic (or -g is monic), then I just do the usual division/remainder. If g is not monic, I test divisibility. If it divides exactly, I return (quotient, 0). If it doesn't divide, I raise an error. Does that sound reasonable?
08:35 < cwitty> Yes.
08:38 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has quit [Read error: 110 (Connection timed out)]
08:39 < mhansen> mabshoff: A patch is up for #1350
08:39 < cwitty> When returning (quotient, 0), be sure to coerce the 0 into the polynomial ring.
08:40 < mabshoff|afk> ok, 
08:41 < dmharvey_> cwitty: ok thanks
08:42 < cwitty> mhansen, is there a reason your #1350 patch doesn't touch the __pow__ case?
08:44 -!- jason- [n=jason@12-210-255-80.client.mchsi.com] has joined #sage-devel
08:44 < mhansen> Because I didn't work on the __pow__ case for any of these patches.  I still need to think about it since there are a lot of things that you do "need" to keep symbolic when doing powers.
08:44 < cwitty> OK.
08:45 < mabshoff|afk> Is Robert going to be around later?
08:46 < mhansen> So, we probably still would get an error with 2^2^2...^2 (1000 times).
08:46 < mhansen> (in SR, that is)
08:53 -!- was_ [n=wstein@maa0f36d0.tmodns.net] has joined #sage-devel
08:54 < cwitty> Hi, was_.
08:54 < was_> hi.
08:54 < was_> I'm now at starbucks, with a great net connection -- fortunately I have noise canceling headphones so I don't have to listen to their christmas music.
09:02 < mhansen> Haha
09:04 < mhansen> was_:  Could you look at my patch for #645 and give your thoughts on it.  There was a lot of discussion on how things should be handled.
09:04 < cwitty> Do you mean #644?
09:05 < mhansen> Yeah, 644.
09:05 < was_> OK, bug day 6 is on!
09:05 < dmharvey_> ok I've fixed #1211... patch will be uploaded momentarily. I also fixed this amusing crash:
09:05 < dmharvey_> sage: R.<x> = PolynomialRing(ZZ); x^2 % 0
09:05 < was_> Please change your nick to the # you're working on.
09:06 < was_> And, congrats to everybody on trophees du libre.
09:07 -!- was_ is now known as was-1349
09:07 < was-1349> I intend to do #1349 -- which is to change the *default* notebook location to $HOME/.sage/notebook
09:07 < was-1349> Though I think it's crystal clear and sensible that the default is in the current directory, it seems like this confuses the heck out of most new users.
09:08 < was-1349> One can still specify a location -- it would just be that the default would be $HOME/.sage/notebook.
09:08 < was-1349> Thoughts?
09:08 < mhansen> I think that sounds like a good idea.  I always run it from one directory.
09:09 -!- mabshoff|afk is now known as mabshoff
09:09 < wjp> agreed; sounds like a much more sensible default to me
09:09 < was-1349> Could everybody say "hi" and where they are right now, and maybe something briefly about their Bug day goals today?
09:09 < mabshoff> Hi
09:10 < was-1349> I'm in Seattle in Starbucks and intend to fix a bunch of bugs I've noticed in the last week or two that are all kind of random and sucky.
09:10 < mabshoff> I plan to work on merging patches, Solaris build issues and misc stuff
09:10 < was-1349> E.g., residue_field being broken.
09:10 < mabshoff> So hopefully at the end of the night we will have something close to 2.8.15.final
09:10 < mhansen> Hello, I'm in Madison, WI and have been working on calculus stuff.
09:11 < burcin> Hi, I'm in Linz, Austria.. and I will be leaving soon :)
09:12 -!- mabshoff is now known as mabshoff-2
09:12 -!- mabshoff-2 is now known as mabshoff2
09:12 < cwitty> I'm in Renton, WA; my plan is to fix a few easy bugs and then switch over to working on new features.  (Sorry, guys. :)
09:12 -!- mabshoff2 is now known as mabshoff
09:12 -!- burcin [i=berocal@leopard.risc.uni-linz.ac.at] has quit ["Leaving"]
09:13 < jason-> I'm in Ames, iowa (where we are having an ice storm right now!).  Depending on how time works out, I'd like to work on a few bugs related to a new feature in #1322 (interactive widgets).
09:14 < was-1349> jason- -- no fair -- you introduce a few bugs so you can fix them :-)
09:14 < jason-> :)
09:14 < dmharvey_> boston MA, I'm fixing whatever random stuff I feel like (just uploaded patch for #1211)
09:14 < jason-> I'll probably need some help from the notebook gurus, though.
09:14 < dmharvey_> what we really need is an IRC plugin that links directly from strings like #1211 to the page on trac
09:14 < was-1349> dmharvey_ -- That would be awesome
09:16 < jason-> test: #1322
09:16 < mhansen> I can write an xchat plugin that does that ( and in Python even ;-] )
09:17 < was-1349> wow.
09:17 < jason-> I'm trying to configure Konversation to do it...it has regexp autoreplacing.
09:17 < dmharvey_> oh guys I'm sorry I didn't intend that comment to halt progress on sage development
09:17 < was-1349> :-)
09:19 -!- dmharvey_ is now known as dmharvey-1334
09:19 < mabshoff> mhansen: patch #1350 solved the issues in arith.py and plot.py, so now my alpha1 passes all doctests again ;)
09:19 < was-1349> nice!!
09:20 < mabshoff> I will be merging the LLL stuff Martin posted next.
09:20 < mhansen> Well, a combination of my patches caused those problems, so... ;)
09:20 < mabshoff> I had hoped for a PolyBoRi.spkg for compiler testing purposes only, but burcin is gone for now.
09:20 < cwitty> was-1349, I'm looking at #75.  Does the last comment (from you) have anything to do with the rest of the ticket?
09:21 < was-1349> nothing that I can discern :-)
09:22 < mabshoff> How will we be handling merges? Somebody posts, somebody else reviews and I apply against alphaN?
09:22 < was-1349> yes.
09:22 < was-1349> Actually, somebody posts; somebody reviews and finds the post is broken, somebody fixes, somebody reposts;, then you merge.
09:22 < mabshoff> ok, then let me know what is mergable, I might be doing something else and not pay attention to IRC.
09:23 < was-1349> via email?
09:23 < was-1349> or?
09:23 < mabshoff> I got 2.8.14 to build on solaris with int_fast64_t declared as a long long.
09:23 < was-1349> excellent.
09:23 < mabshoff> Nope, here is fine, I will set my nick to afk if I am gone for a while.
09:23 < mabshoff> doctesting Solaris now. Hopefully once malb fixes the issue with mv polynomials matrices it will be close to perfect again.
09:24 < cwitty> Somebody (perhaps was-1349) should review #1292; it fixes a "critical" bug.
09:24 -!- cwitty is now known as cwitty-75
09:25 < jason-> what does afk stand for?
09:25 < mabshoff> away from computer
09:25 < was-1349> no clue.
09:25 < cwitty-75> "away from keyboard"
09:25 < was-1349> away from komputer -- dang germans :-)
09:25 < mabshoff> damn Germans, indeed 
09:25 < was-1349> damn smart Germans.
09:26 < mabshoff> :)
09:26 < jason-> testing again: http://trac.sagemath.org/sage_trac/ticket/1322
09:26 < was-1349> nice.
09:26 < jason-> did it show the URL to you?
09:27 < mabshoff> Yep
09:27 < was-1349> yep
09:27 < jason-> I typed "# 1322" (without the space) and konversation replaced it with the URL.
09:27 < mabshoff> ok, can you post the replacement rule?
09:27 < mabshoff> Unless it gets mangled ;)
09:28 < was-1349> post the rule to the wiki page for bug day 6
09:28 < jason-> #([0-9]+) -> http://trac.sagemath.org/sage_trac/ticket/%1
09:28 < mabshoff> thanks
09:28 < jason-> Oh, and I just realized I can set it to replace on outgoing, incoming, or both.
09:28 < jason-> I guess I'll do both so ya'll can still use # 1322 (without the space) :)
09:29 < mabshoff> Ok, is anybody reviewing http://trac.sagemath.org/sage_trac/ticket/1292?
09:29 < jason-> wow, you're using konversation already?
09:29 < mabshoff> Sure, which other clients besides irssi should I use?
09:30 < jason-> good point.
09:30 < mabshoff> :)
09:31 < jason-> testing just the incoming rule: #1322
09:31 < jason-> hmmm, doesn't seem to work as well.  Oh well.
09:33 < mabshoff> It works for me outgoing and incoming.
09:34 < jason-> So you could click on the above "# 1322" and it brought you to the web page?
09:35 < mabshoff> Well, it is an url.
09:36 < mabshoff> Yep, and it works, except that it launches konqueror, while I prefer firefox, but that is a local config issue.
09:36 < cwitty-75> was-1349, for #75, you can already specify the name of the variable (but not the ring).  Is that good enough to close the ticket?
09:37 < was-1349> The entire point of the ticket was that specifying the name of the variable is not good enough.
09:37 < was-1349> Or at least, that became the point... after a while.
09:37 < was-1349> Maybe I'm wrong, actually #75 is pretty old.
09:38 < cwitty-75> And the example in the description is obsolete.  It says "f and g have different parents", but in current Sage, they have the same parent.
09:38 < was-1349> I think one must specify the ring ... 
09:38 < was-1349> But that could be another trac ticket.
09:38 < was-1349> The problem with that is that charpoly is just one case -- there are lots of situations like this (e.g., minpoly).
09:38 < was-1349> So I agree, this can be closed.
09:38 < was-1349> Something else can be opened if somebody feels it is really really necessary (I'm ok with the current behavior)
09:39 < was-1349> I've closed it.
09:44 < mhansen> was-1349: Could you look at #644?
09:45 -!- cwitty-75 is now known as cwitty-1154
09:46 < dmharvey-1334> #1334 is done
09:46 < dmharvey-1334> i'm taking a break
09:46 -!- dmharvey-1334 is now known as dmharvey-resting
09:46 < was-1349> ok, thanks.
09:47 < cwitty-1154> I will review #1334.
09:48 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1292 looks go to me, but it might be better if somebody else reviews it.
09:51 < mabshoff> cwitty: Do I need to apply both patches for http://trac.sagemath.org/sage_trac/ticket/1148?
09:52 < cwitty-1154> mabshoff, yes, both patches.
09:52 < mabshoff> ok, applying.
09:53 -!- giniu [n=chatzill@80.48.71.46] has joined #sage-devel
09:54 < mabshoff> cwitty: re http://trac.sagemath.org/sage_trac/ticket/1275 - What do you think about Robert's patch?
09:55 < cwitty-1154> I like about a third of it.  I posted a comment on the ticket.
09:56 < mabshoff> ok, maybe be should close http://trac.sagemath.org/sage_trac/ticket/1275 and open a new ticket for Robert's improvement.
09:56 < mabshoff> Because once you have more than 4 patches or bundles attached to a ticket it starts to gets confusing.
09:56 < was-1349> is #1275 in sage-2.8.15 now?
09:57 < mabshoff> I will merge it once testall finishes.
09:57 < mabshoff> Any objections?
09:57 < was-1349> no.
09:57 < mabshoff> Opps, it is.
09:57 < was-1349> no objections, that is.
09:57 < mabshoff> All, but Robert's patch.
09:57 < mabshoff> The new mpfi.spkg is also in.
09:58 -!- mhansen is now known as mhansen-962
10:01 < mhansen-962> I put a new patch up for #962 .
10:02 < cwitty-1154> mhansen-962, I'll look at it.
10:02 < was-1349> ok, I finished #1349.
10:03 < mabshoff> oops, doctest failure with sage/rings/polynomial/polynomial_element.pyx due to one of 
10:03 < mabshoff> mhansen's patches:
10:03 < mabshoff> sage: f(x=sqrt(2))
10:03 < mabshoff> leads to: IndexError: tuple index out of range
10:03 < cwitty-1154> mabshoff, I reviewed #1334 -- looks good.
10:04 < mabshoff> ok, I am now merging again ;)
10:04 < mhansen-962> mabshoff: I'll fix that.
10:04 -!- was-1349 is now known as was-1342
10:05 < was-1342> I'm going to try to deal with the serious bug I found in residue_field Thursday now -- #1342.
10:05 -!- kedlaya [n=kedlaya@WALKER-THREE-THIRTY-TWO.MIT.EDU] has left #sage-devel []
10:05 < mabshoff> ok
10:05 < was-1342> Actually, I better finish up #787 now.  That's lingered way way too long.
10:05 -!- was-1342 is now known as was-787
10:06 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has joined #sage-devel
10:22 -!- dmharvey-resting [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has quit [Read error: 110 (Connection timed out)]
10:26 -!- was_ [n=wstein@m2a0f36d0.tmodns.net] has joined #sage-devel
10:26 -!- was-787 [n=wstein@maa0f36d0.tmodns.net] has quit [Read error: 104 (Connection reset by peer)]
10:32 < jaap> Hi mabshoff, I'm here watching this interesting happening!
10:32 < jaap> Waiting for alpha1!
10:33 < mhansen-962> mabshoff:  I fixed that doctest in #1352.
10:33 < mabshoff> ok, we plan that in the future the release manager can push out the changes to some devel repo, so people 
10:33 < mabshoff> do not have to recompile from scratch each time.
10:33 < mabshoff> mhansen-962: Excellent, will merge momentarily.
10:33 < was_> That would be very good -- i've planned that for a while.
10:34 < was_> You just would have to set the SAGE_SERVER enviro variable and do "sage -upgrade' to get the latest devel version.
10:34 < cwitty-1154> That's #463, right?
10:35 -!- craigcitro [n=cc@pool-71-106-26-87.lsanca.dsl-w.verizon.net] has joined #sage-devel
10:35 < craigcitro> hey all
10:35 < craigcitro> what release are we working from?
10:35 < was_> 2.8.14
10:35 < craigcitro> k
10:35 < was_> set your nick to your ticket.
10:35 < craigcitro> grin ... that's a smart system ;)
10:36 < was_> cwitty suggested it.
10:36 -!- was_ is now known as was-787
10:36 < craigcitro> i actually suggested it during the last bug day
10:36 < was-787> oh, sneaky.
10:36 < craigcitro> grin
10:36 < was-787> one of those "c" nicks suggested it.
10:37 < mhansen-962> Oh, if anyone uses x-chat, I have a plugin that coverts things like #123 to the appropriate link.
10:37 < craigcitro> hahaha
10:37 < jaap> Yep
10:37 < mhansen-962> It has a really nice Python scripting interface.
10:37 < craigcitro> it makes me pretty proud to be grouped with carl ;)
10:39 -!- jec [n=jec@78-86-155-198.zone2.bethere.co.uk] has joined #sage-devel
10:39 < was-787> Hi John (jec)
10:39 < mabshoff> Anybody up to look at http://trac.sagemath.org/sage_trac/ticket/1352 ?
10:39 < mhansen-962> http://sage.math.washington.edu/home/mhansen/sage_trac.py -- it's a bit of a quick hack.
10:39 < jec> Hi William -- won't be staying long...
10:39 < mabshoff> Hi
10:40 < mhansen-962> By the way, can you upgrade binary releases without building anything from source?
10:41 < mabshoff> In theory yes, in practise I wouldn't want to try it,
10:41 < mabshoff> copying over the old install should mostly work.
10:41 < was-787> mhansen-962: absolutely not
10:41 < was-787> it is not in any way implemented.
10:42 < mabshoff> But it should work.
10:42 < mhansen-962> I think that'd be something good to have in the future.
10:42 < was-787> The plan for implementing that has been to have the binary release master somewhere be upgraded.
10:42 < was-787> Then you would rsync from that.
10:42 < mabshoff> Well, if we have debs we can just untar them into the root directory.
10:42 < mabshoff> $SAGE_ROOT that is.
10:42 < mabshoff> I would do something similar for windows, very much like the current cygwin installer.
10:43 -!- jason- is now known as jason-|afk
10:43 < mabshoff> hmm, http://trac.sagemath.org/sage_trac/ticket/1249 has some open questions from cwitty. jason- are you around? It is graph theory related.
10:44 < cwitty-1154> mhansen-962, in 962-2.patch, it seems like the "#Strip extra zeros from the left" part is now redundant (just from reading the source).  Is that right, or am I missing something?
10:45 -!- jec [n=jec@78-86-155-198.zone2.bethere.co.uk] has quit ["Konversation terminated!"]
10:45 < mhansen-962> Yep, that should go.  I'll update things.
10:48 < mhansen-962> The patch of #962 has been updated.
10:50 -!- craigcitro is now known as craigcitro-1129
10:53 < was-787> Finishing #787 is pretty complicated.
10:53 < mabshoff> How is it going?
10:53 < was-787> (I mean actually doing everything *right*.)
10:53 < was-787> Very good -- it's fun.  But I have to create new classes, etc.
10:54 < mabshoff> Okay, so the patch won't be very simple, but would produce false results extremely quickly ;)
10:54 < was-787> :-)
10:54 < mabshoff> I am about to run out of reviewed patches.
10:54 < was-787> Actually a big part of "doing things right" to me in this case means lots of comments explaining what is going on.
10:54 < mabshoff> ok
10:54 < was-787> E.g., this line in nils patch:
10:54 < was-787> M=sub.basis_matrix().transpose().restrict_domain(self).kernel().basis_matrix().transpose() 
10:54 < was-787> SUCKS.
10:55 < mabshoff> lol
10:55 < mhansen-962> Haha
10:55 < was-787> Instead I have paragraphs of comments about what that is doing.
10:55 < was-787> It's the sort of thing perl people might like...
10:55 < mabshoff> bada bing!
10:55 < was-787> But it's not for me.
10:55 < was-787> (sorry -- no flame war intended.)
10:55 < mabshoff> josh isn't around ;)
10:56 < cwitty-1154> mhansen-962, I don't understand the purpose of "#Ignore the extra zeros at the end" in your new version of str().
10:57 < cwitty-1154> (That is, why did you change from "n = len(t)"?)
10:57 < was-787> I'm off to http://www.espressovivace.com/retail.html -- I should be back in irc in about 30 minutes.
10:57 -!- was-787 [n=wstein@m2a0f36d0.tmodns.net] has quit []
10:59 < mhansen-962> cwitty-1154:  Let me figure out if I remember why I did that -- it's been awhile since I wrote it ;-]
10:59 < cwitty-1154> And without that change, I think that the "#Pad the end with zeros" chunk is also not needed.
11:00 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has quit []
11:00 -!- giniu [n=chatzill@80.48.71.46] has quit ["ChatZilla 0.9.79 [Firefox 2.0.0.10/2007120102]"]
11:02 < mhansen-962> The "ignore the extra zeros at the end" has to do with t which comes from mpfr's internal representation.   I did the "pad the end" part so that you'd keep about the same precision by doing RealNumber(repr(x)).
11:04 < cwitty-1154> Well, len(t) should either be mpfr's "how many digits do we need to represent this number", or our calculated "how many digits do we want to round this number to".
11:04 < cwitty-1154> In either case, I don't see why we want to change it.
11:07 < mhansen-962> Hmm...
11:09 < mhansen-962> Let me play around without it.
11:10 < mabshoff> mhansen-962: any opinion on http://trac.sagemath.org/sage_trac/ticket/1249, i.e. the comment at the end?
11:10 -!- jkantor [i=jkantor@sage.math.washington.edu] has joined #sage-devel
11:11 < cwitty-1154> The thing I really want to avoid is rounding the number (by specifying reqdigits), and then adding an incorrect "0" instead of whatever the correct digit would have been.
11:11 < mabshoff> hi jkantor
11:11 < jkantor> hey
11:11 < mabshoff> I am about to start merging all your ATLAS spkg in a special branch to test out.
11:12 < jkantor> ok
11:12 < mabshoff> Then if/when they work I will merge them back into my main alpha2 or something around there.
11:12 < jkantor> ok
11:12 < cwitty-1154> mabshoff, cool.  I noticed last night that linear algebra on my laptop is much slower than on sage.math, when usually my laptop is faster; hopefully ATLAS will help. :)
11:12 < mabshoff> The new fortran.spkg: did you add more then the fortran detection script?
11:13 < mabshoff> :)
11:13 < jkantor> no
11:13 < mabshoff> jkantor did most of the work, I just complain if something breaks ;)
11:13 < jkantor> just that script. I don't use it yet
11:13 < mabshoff> Ok, I will stick the new fortran into alpha1 so it is done.
11:13 < jkantor> But it will simplify all spkg-installs in other packages
11:13 < mhansen-962> cwitty-1154: Can you come up with a case where that happens?
11:13 < jkantor> and let me remove redundant code
11:14 < mabshoff> In which spkgs?
11:15 < jkantor> like the atlas and numpy and cvxopt, anything using fortran I need some test 
11:15 < jkantor> for gfortran or g95
11:15 < mabshoff> ok, let me know when you are ready.
11:15 < mabshoff> I am testing alpha1 right now (minus the new fortran, but that is a no-brainer)
11:16 < mabshoff> It that passes tests I will build from source to have a new, clean alpha2 basis.
11:16 < mabshoff> So that is about 1.5 hours from now.
11:16 < jkantor> I think its easier to just include the script and I will switch to using it when each package is updated
11:16 < mabshoff> Ok, that is fine with me.
11:17 < mhansen-962> cwitty-1154: Now, that I think about it, I'm okay with not padding at the end.
11:17 -!- was_ [n=wstein@dsl231-036-075.sea1.dsl.speakeasy.net] has joined #sage-devel
11:17 < mabshoff> I am wondering if I can figure out where to get complex.h on Solaris.
11:17 < mabshoff> That breaks cvxopt compilation on Solaris
11:17 < jkantor> complex.h?
11:17 < jkantor> ia that a c99 header
11:17 < mabshoff> But there is a binary distribution of cvxopt for Solaris, so it must be possible.
11:18 < mabshoff> Yep. I will check out Solaris 10 and steal from there ;)
11:18 < was_> Hi; I'm back.
11:18 < mabshoff> Fixing the "long" vs. "long long" issue seems to fix a lot of doctests on Solaris ;)
11:18 < mabshoff> Hi was_
11:19 < mabshoff> was_: I merged http://trac.sagemath.org/sage_trac/ticket/1352 - can you take a quick look?
11:19 < was_> I'm across the street from Seattle REI...
11:19 < mabshoff> The coffee shop you mentioned?
11:20 < was_> yep.
11:20 < mabshoff> ok
11:20 < jkantor> is it in the REI
11:20 < mhansen-962> I've been to Vivace :-)
11:20 < was_> no, it is directly across the street.  Good wifi; nice environment; not too crowded.
11:20 < jkantor> oh from the REI, vivace
11:20 < cwitty-1154> mhansen-962: yes, I have an example.
11:20 < was_> yep, that's it.
11:20 < cwitty-1154> sage: str(RealField(3000000)(1/3))[-10:]
11:20 < cwitty-1154> '3333333330'
11:21 < was_> lame
11:21 < was_> re: cwitty's thing
11:21 < cwitty-1154> ?
11:21 < was_> I don't like the 0 at the end.
11:22 < mhansen-962> Yep -- it shouldn't be there.
11:22 < mhansen-962> #962 is up without the padding at the end.
11:22 < was_> sage: magma.eval('RealField(903090)!(1/3)')[-10:]
11:22 < was_> '3333333333'
11:22 -!- was_ is now known as was-787
11:23 < was-787> #1352 looks good to me, I think.
11:23 < mabshoff> ok,I tend to trust mhansen. If it breaks stuff, he fixes it too ;)
11:23 < mhansen-962> Heh
11:23 < mabshoff> I am doctesting all, to do alpha1 now.
11:24 < mhansen-962> was_: Does the behavior of #644 seem okay to you?
11:24 < mhansen-962> mabshoff: I think #1249 is okay.
11:25 < cwitty-1154> mhansen-962: but now you need to change back to "n = len(t)", right?
11:25 < cwitty-1154> sage: 1.0000000000000000000000000000000000
11:25 < cwitty-1154> 1.
11:25 < mabshoff> mhansen-962: ok, will merge then.
11:32 < mabshoff> was-787: I got a patch for Solaris that makes the lazy rings no longer run in an inifinte loop
11:32 < mabshoff> Now if we fix crashes in coercion.pyx and element.pyx we should look much better :)
11:32 < mhansen-962> cwitty-1154: I think this makes things a bit more complicated.  Do you have any ideas for just redoing the whole thing?  I was pretty much just working within the framework of the existing functions.
11:34 < cwitty-1154> What's wrong with just taking the "#Ignore the extra zeros at the end" chunk back out and reverting to "n = len(t)"?
11:35 < mhansen-962> sage: 0.00000000000001
11:35 < mhansen-962> 0.0000000000000100000000000000
11:37 < cwitty-1154> mabshoff, looks like you didn't actually read my review for #1279?
11:37 < cwitty-1154> mhansen-962: OK, so you want to change the condition for switching to exponential notation?  That's fine with me.
11:38 < cwitty-1154> We can do that by changing this conditional:
11:38 < cwitty-1154> (-exponent > digits or exponent > 2*digits)
11:38 < cwitty-1154> For instance, we could use: not (-6 <= exponent <= 6)
11:38 < mhansen-962> I thought that repr(RealNumber(0.00000000000001)) should be 0.00000000000001.
11:39 < mabshoff> cwitty-1154: So I assume I should back out the patch itself.
11:39 < cwitty-1154> I don't think so.  It should have significant figures.
11:39 < cwitty-1154> mabshoff, I think so.  (The patch just adds an error message that's unlikely to be hit in actual usage, so it doesn't hurt much; but the case it forbids is technically valid.)
11:40 < cwitty-1154> mhansen-962, just like 1.000000000000 should print with zero's after the 1, so should 0.0000000001.
11:41 < mabshoff> ok, will back it the patch out then and make it clear on the ticket that only the spkg went in.
11:41 < mabshoff> Sorry for the snafu.
11:42 < mhansen-962> ciwtty-1154: Okay, well, I thought someone mentioned in a thread that that was not what we wanted.  I have no strong feelings on this subject since I never really use it ;-]
11:43 -!- jason-|afk is now known as jason-
11:43 -!- jason- is now known as jason--
11:44 < jkantor> mabshoff: regarding 1327, I have a new numpy that may fix the problem, of course I couldn't test it
11:45 < jkantor> note you have to insall the numpy package and then scipy 
11:46 < was-787> mabshoff -- did you see the linbox-use message just now.
11:47 < was-787> A guy can't build linbox, googles "a lot", and finally finds Clements linbox build/test directory on sage.math, gets files from there, and builds linbox...
11:47 < was-787> with success.
11:48 < mabshoff> Yep
11:48 < mabshoff> Funny, I just looked at the make files and it looks like they should work,
11:48 < mabshoff> but the maple headers probably aren't properly detected.
11:49 -!- roed_ [n=roed@pool-141-154-49-18.bos.east.verizon.net] has joined #sage-devel
11:49 < mabshoff> jkantor: ok, I am about done with alpha1
11:49 < roed_> hello
11:50 < mabshoff> hi roed_
11:50 < craigcitro-1129> was-787: i have a pari question for you. if it says: "factor: reducible modulus in factornf", that's trying to tell me that somewhere in the process of factoring, it ran into a polynomial as a modulus that wasn't irred, right?
11:50 < mabshoff> I fixed that annoying NTL bug you showed me in Bristol.
11:50 < craigcitro-1129> (it says that they use "trager's trick" which involves changing modulus and factoring over Q)
11:58 < mhansen-962> cwitty-1154: Another version of #962 is up ;-]
11:59 < mabshoff> alpha1 is up: http://sage.math.washington.edu/home/mabshoff/sage-2.8.15.alpha1.tar
11:59 -!- fabio_ [n=fabio@chello062178170083.13.14.vie.surfer.at] has joined #sage-devel
12:00 < was-787> ok, building now.
12:01 < mabshoff> ok, then I can skip building it on bsd?
12:01 < was-787> yes.
12:01 < mabshoff> I will try on fermat then.
12:02 < was-787> good.
12:02 < mabshoff> Josh said he fixed the cvxopt issue - it failed on my laptop when I tried, but that was an update.
12:02 < mabshoff> So I hope that a fresh build will pass all tests on 10.4 PPC.
12:02 < mabshoff> It has been a while since that worked :(
12:09 < was-787> ok, I have 5 "make check"'s going -- debian32, debian64 (minimal), ubuntu 32-bit; rhel 32-bit; osx 10.4 intel
12:09 < was-787> and osx 10.5 intel (so 6 builds.)
12:10 < mabshoff> Cool, a lot for an alpha1, but I guess we want to release in roughly two days?
12:10 < was-787> It took me 3 minutes to start, so we can just see what happens.  Screen makes stuff like this so easy.
12:10 < mabshoff> :)
12:10 < mabshoff> It looks like it will be another stable release - at least so far.
12:10 < mabshoff> I am curious how the ATLAS merge will go.
12:11 < cwitty-1154> mhansen-962: the patch looks good reading it; let me run some tests.
12:13 -!- rlm [n=rlm@c-71-197-245-35.hsd1.or.comcast.net] has joined #sage-devel
12:13 < jason--> hi robert
12:13 < mabshoff> Hi rlm
12:14 < rlm> hello
12:14 < jason--> rlm: I've been working on the interactive widget stuff.
12:14 < jason--> I have a (very) alpha patch up at http://trac.sagemath.org/sage_trac/ticket/1322
12:16 < rlm> ineresting
12:16 < was-787> rlm -- you may want to email emily about san diego to get her up to speed with what we've planned.
12:17 < mhansen-962> was-787: For the funding page, can I run the server on a high port on sage.math?
12:17 < was-787> mhansen-962: yes, definitely.
12:18 < was-787> I hope you can give a little django tutorial to me too sometime, say at sd7...
12:18 < mhansen-962> Yeah, I can do that.
12:20 < cwitty-1154> was-787: by the way, I ported sage3d to jython last night.
12:20 < was-787> cwitty -- FRICKIN' AWESOME.
12:20 < was-787> Post something somewhere.
12:20 < was-787> I just want to see what the code looks like.
12:20 < was-787> It doesn't have to run or anything.
12:21 < jason--> cwitty: wow, that sounds great!
12:21 < cwitty-1154> was-787: sage.math:/home/cwitty/ObjectViewer*.py
12:21 < cwitty-1154> This is just a straight port of ObjectViewer*.java, from the java3d spkg.
12:25 < was-787> This is *great*.
12:25 < was-787> This really extends the number of people who will be comfortable working on the java3d-based 3d graphics for sage.
12:25 < was-787> Very nice.
12:26 < jkantor> the sage alpha1 just errored out on flint
12:27 < mabshoff> Really? I didn't touch that spkg.
12:27 < mabshoff> Which platform/compiler/etc?
12:27 < mabshoff> We ought to update to 1.0 anyway ...
12:29 < was-787> cwitty-1154: how do you like Jython now that you've tried it out?
12:30 < cwitty-1154> Well, I would probably like it more for doing anything besides a Java applet.
12:30 < cwitty-1154> In a Java applet, most of the interesting (dynamic) features don't work, so it feels more like a crippled Java
12:30 < cwitty-1154> than like Python.
12:31 < jkantor> it was on sage.math
12:31 < mabshoff> jkantor: I see it too,
12:31 < mabshoff> the solution was to make it depend on python.
12:32 < cwitty-1154> But still, there are nice features of Jython.
12:32 < cwitty-1154> Python dictionaries are much nicer to use than Java HashMaps.
12:33 < cwitty-1154> And porting a small amount of Java code to Jython while simultaneously learning Jython, all late at night, is probably not the best way to form an opinion on the language. :)
12:34 < cwitty-1154> Also, it's pretty annoying to debug Jython-in-an-applet.
12:34 < cwitty-1154> The only debugging information I figured out how to get was stack traces.
12:35 < mabshoff> Do we already have a ticket to make FLINT dependent on Python?
12:37 < cwitty-1154> mhansen-962, was-787: I would like to make floating-point printing switch to scientific notation more often (say, whenever abs(exponent)>=6).
12:37 < was-787> ok
12:38 < cwitty-1154> And it seems like it makes sense to make this change along with #962.
12:38 < cwitty-1154> mhansen-962, would you be willing to add that in to your #962 patch, or is that more doctest-fixing than you signed on for?
12:40 < rlm> hmm
12:40 < rlm> was -787 -- i just fixed a small bug in graph_database.py that never would have shown up in the first place if the doctests hadn't been replaced with "..."s 
12:41 < cwitty-1154> mhansen-962, the current version of #962 looks good to me; although I hope we can get the scientific notation change in too.
12:41 < mabshoff> jkantor: do you want an updated deps for the FLINT issue?
12:41 < jkantor> yeah
12:42 < mabshoff> hmm, my addition didn't fix it, very odd.
12:43 < was-787> fyi -- all of my 6 builds have got past flint.
12:44 < mabshoff> I was about to ask. I don't understand why this is suddenly an issue.
12:44 -!- fabio_ [n=fabio@chello062178170083.13.14.vie.surfer.at] has quit ["Konversation terminated!"]
12:44 < mabshoff> There is a python 2.5.1 on sage.math
12:45 < mabshoff> Bill said that the problem no longer exists with 1.0, unless I mixed that up.
12:45 < rlm> was-787 -- was the only reason you replaced those doctests with "..." to make the source more readable?
12:46 < was-787> where?
12:46 < rlm> graph_database.py
12:46 < was-787> oh, in graph theory.
12:46 < jkantor> mabshoff, the cvxopt you have is not the updated one
12:46 < was-787> Yes, it makes it much more readable, and also wastes less space.
12:46 < mabshoff> in alpha1? 
12:47 < jkantor> yeah
12:47 < rlm> i just fixed a small bug that never would have shown up in the first place
12:47 < mabshoff> I know that, but p3 didn't work without ATLAS, so I rolled back to p2.
12:47 < jkantor> you should use p4
12:47 < mabshoff> I will update to p4 or whatever is current.
12:47 < mabshoff> :)
12:47 < rlm> doctests != waste of space!
12:47 < jkantor> sorry
12:47 < mabshoff> I figured not too many changes at once ;)
12:48 < jkantor> I know, but I know that p2 won't fix the ppc isse
12:48 < jkantor> issue
12:49 < mabshoff> ok, does p4 do it?
12:49 < jkantor> yes
12:49 < mabshoff> And work without ATLAS on OSX?
12:49 < jkantor> yes
12:49 < mabshoff> ok, I will drop it in before I build on fermat.
12:51 < jkantor> actually, can you also drop in the updated lapack so lapack build is not skipped  on OSX
12:51 < mabshoff> ok, but I figured I will wait for that for alpha2.
12:52 < jkantor> ok maybe make all those changes at once and just realize cvxopt will still be broken in alpha1
12:52 < mabshoff> :)
12:52 < mabshoff> That's why it is still called alphaN :)
12:52 < jkantor> i see
12:52 < jkantor> :)
12:53 < rlm> was-787 - I'd like to put some of those doctests back in - I just fixed a bug that those doctests would have discovered
12:53 < was-787> ok.
12:53 < was-787> just don't go overboard.
12:53 < rlm> was-787 maybe at the bottom of the file, so it's still readable?
12:54 < mabshoff> I think we removed them because they made the doctest to time out easily on slower boxen.
12:54 < was-787> Many of the doctests weren't even being doctested before I made those changes.
12:54 < was-787> No, he's talking about OUTPUT.
12:54 < mabshoff> ok, sorry.
12:56 < jkantor> actually never mind cvxopt-0.9.p4 should work without the new lapack, the new lapack only affects osx intel
12:56 < jkantor> building
12:58 < mabshoff> I am curious about what to do about FLINT failing because of python.
12:58 < jkantor> I changed standard/deps and it didn't do anything
12:58 < jkantor> its using the system pthon
12:58 < jkantor> python
12:58 < jkantor> if you start sages python and do import re it fails
12:59 < jkantor> sage.math's python
13:05 -!- jkantor is now known as jkantor_brb
13:05 -!- roed_ [n=roed@pool-141-154-49-18.bos.east.verizon.net] has quit [Read error: 104 (Connection reset by peer)]
13:06 -!- roed_ [n=roed@pool-141-154-49-18.bos.east.verizon.net] has joined #sage-devel
13:10 < was-787> it's snowing!
13:10 < craigcitro-1129> whoa! that's pretty awesome.
13:10 < mhansen-962> We just got about 5 inches here.
13:10 < was-787> wow.
13:11 < mhansen-962> But now it's sleeting.
13:12 < mhansen-962> cwitty-1154: I can add the scientific notation thing if others are fine with that.
13:12 < cwitty-1154> Well, was-787 said "ok"; I'm not sure who else to ask.
13:12 < mhansen-962> That's good enough for me :)
13:12 < cwitty-1154> Switching to scientific notation sooner makes us more like Mathematica and Maple.
13:16 < mhansen-962> New patch for #962 is up.
13:21 < cwitty-1154> mhansen-962, looks like you accidentally deleted an "o" from "nonzero" a couple of versions back.
13:22 < mhansen-962> Fixed.
13:27 < cwitty-1154> Oops... looks like I forgot what exponent meant.  How about changing abs(exponent) to abs(exponent-1)?  (Sorry...)
13:29 -!- jkantor_brb is now known as jkantor
13:29 < mhansen-962> Done.
13:29 < mhansen-962> I wonder how many doctests this will break ;-]
13:30 < was-787> 1000's
13:30 < cwitty-1154> Actually, I'm just doing doctesting in sage/rings/, and it doesn't look nearly so bad.
13:31 < was-787> every single one of my builds failed because of mpfi, I think.
13:31 < was-787> cd . && autoheader
13:31 < was-787> make[3]: *** [mpfi_config.h.in] Error 127
13:31 < was-787> make[3]: Leaving directory `/home/was/sage-2.8.15.alpha1/spkg/build/mpfi-1.3.4-cvs20071125.p1/src'
13:31 < was-787> There is some autoconf crapiness.
13:31 < mabshoff> That  is with cwitty's latest, i.e. the CVS version?
13:31 < was-787> actually, one build where autoheader is installed hasn't stopped yet.
13:32 < was-787> well it is broken and needs to have the autoconf stuff correctly pre-generated.
13:32 < mabshoff> I thought cwitty added "-c" to the flags.
13:34 < cwitty-1154> No; I just copied the files in by hand, instead of symlinking them.  (Which should have the same effect.)
13:34 < mabshoff> ok, I think last time I tried that it wasn't a good idea.
13:36 < jason--> quick notebook question: in the worksheet directory (e.g., admin/4), there are directories for cells, code, data, and snapshots.  I understand that the cells directory holds the input for the cells that are currently under evaluation.  What's the purpose for the code directory?
13:37 < was-787> the code directory "holds the input for the cells that are currently under evaluation."
13:37 < jkantor> mabshoff: did you figure what is up with flint
13:37 < was-787> cells/n/ holds the *output* for cell n.
13:38 < mabshoff> not yet.
13:38 < mabshoff> If I take the system's python and import re it works.
13:38 < jkantor> yea
13:38 < mabshoff> If I take Sage's python and import re it works.
13:38 < jason--> how come the cells/n/ directories are empty, but the code directory contains files even if I am not currently evaluating cells?
13:38 < jkantor> yeah
13:38 < mabshoff> But that was with a clean shell.
13:38 < mabshoff> I didn't try inside FLINT so to speak
13:39 < jason--> (i.e., it appears that the cells/n/ directories are cleared, but the input files in code/ are not cleared)
13:39 < cwitty-1154> was-787, can you post a build log somewhere?  (for the autoheader problem)
13:39 < was-787> jason-- : (1) code/... contains files since otherwise foo?? will break.
13:39 < mabshoff> jkantor: I have build from source plenty of time since we updated FLINT, but today is the first time I hit that problem.
13:39 < was-787> cells/n/ directories contain *output*
13:39 < jkantor> weird
13:40 < was-787> there will be nothing there are no images or other files created.
13:40 < mabshoff> Yep. So far I have no idea what goes wrong.
13:40 < mabshoff> But we can deactivate the tuning code in FLINT, it isn't used yetl
13:41 < jason--> ah, I didn't realize cells/n/ directories contained the output *except* for the text sent back to the notebook.  Thanks, that helps me a lot.
13:42 < jason--> ls
13:45 < mabshoff> jkantor: I am looking into http://trac.sagemath.org/sage_trac/ticket/1327
13:45 < was-787> jason -- the output text is *never* written to disk.
13:45 < was-787> It's ready magically via a pseudo-tty as it is written out.
13:46 < jason--> okay, that makes sense.
13:47 < cwitty-1154> was-787, did you see my request for a build log?
13:48 < jason--> Is there any way to pause Sage in middle of a computation and have it run another computation?  Sort of pre-emptively interrupt Sage and ask a question?
13:49 < was-787> it's /home/was/tmp/install.log
13:49 < jkantor> mabshoff: ok
13:49 < was-787> jason-- certainly not.
13:50 < was-787> how could one possibly even hope to implement something like that?
13:50 < was-787> you could use a separate sage session for that though.
13:50 < jason--> I don't know.  It would make things a lot easier, though.  I realize it's something of a dream, though.
13:50 < jason--> I want the variables and everything shared, though.
13:50 < was-787> oh.
13:50 < was-787> Then definitely not.
13:51 < was-787> maybe via forking it could be done for some sorts of programs.
13:51 < was-787> But not sage, since Sage is so complicated.
13:52 -!- was-787 [n=wstein@dsl231-036-075.sea1.dsl.speakeasy.net] has quit []
13:52 < rlm> does anyone know why eigenspaces sometimes returns an empty sequence associated to an eigenvalue?
13:53 < jason--> Well, I guess there are complicated systems that do allow interruption, but it would seem particularly hard in Sage since there are so many hter++
13:53 < jason--> heterogeneous component
13:54 < mhansen-962> The eigenvalue has a trivial eigenspace ;)
13:54 < cwitty-1154> mhansen-962, #962 looks good to me.  (And I said so on the ticket.)
13:54 < rlm> so it is not an eigenvalue?
13:54 < mhansen-962> I was just joking around.
13:54 < rlm> me too
13:54 < rlm> i guess that must be what it means though
13:54 < mhansen-962> Heh
13:54 < mhansen-962> Can you give an example?
13:55 < mabshoff> jkantor: The new scipy didn't fix the import issue.
13:55 < rlm> sage: M = random_matrix(CC, 4)
13:55 < rlm> sage: M.eigenspaces()
13:55 < mhansen-962> cwitty-1154: I'll apply it to alpha1 and figure out what doctests need fixing.
13:55 < rlm> i guess a random matrix isn't likely to have many eigenvalues, so...
13:55 < jkantor> you istalled numpy and then scipy
13:56 < mabshoff> numpy was installed, but do I need to update that, too?
13:57 < mabshoff> I guess that was your point.
13:57 < mabshoff> But where is the updated numpy?
13:57 < mhansen-962> Is there a Jordan canonical form method in Sage?
13:57 < jkantor> in the ticket for solaris
13:57 < jkantor> scipy
13:57 < mabshoff> I installed http://sage.math.washington.edu/home/jkantor/spkgs/numpy-20071020-1.0.3.1.p2.spkg
13:58 < jkantor> right, but then you need rebuild scipy
13:58 < rlm> apparently not
13:58 < mabshoff> :) - evetually I will figure that out.
13:58 < mabshoff> numpy & scipy are one ;)
13:58 -!- kedlaya [n=kedlaya@DWORK.MIT.EDU] has joined #sage-devel
13:58 < mhansen-962> Yeah, the eigenspaces seems to need a lot of work.
13:58 < craigcitro-1129> hey kiran
13:58 < mabshoff> It certainly picked gfortran this time, it took much longer to build.
13:58 < mabshoff> Hi
13:59 < kedlaya> hey. i'm just lurking; the Putnam is going on, and I'm working on my usual sols for it
13:59 < rlm> speaking of improving linear algebra, how about implementing the main result of linear algebra? ;)
13:59 < mabshoff> rlm: What would that be?
14:00 < jason--> rlm: I'm curious too.
14:00 < craigcitro-1129> whoa ... i didn't realize the putnam was today. how is it?
14:00 < mabshoff> Because I don't think we will agree on that.
14:00 < rlm> jordan canonical form
14:00 < mabshoff> We don't have jordan canonical forms?
14:00 < rlm> apparently not
14:00 < mhansen-962> :)
14:00 < mabshoff> I tend to agree that JNF would be "it"
14:00 < rlm> sage: search_src('Jordan')
14:00 < rlm> ----------------------------------------------------------------------
14:00 < rlm> | SAGE Version 2.8.14, Release Date: 2007-11-24                      |
14:00 < rlm> | Type notebook() for the GUI, and license() for information.        |
14:00 < rlm> ----------------------------------------------------------------------
14:00 < rlm> quadratic_forms/genera/genus.py:    # Construct the blocks for the Jordan decomposition [F,X;X,A_new]
14:00 < rlm> quadratic_forms/genera/genus.py:	     symbol -- the list of invariants for Jordan blocks A_t,...,A_t 
14:01 < rlm> quadratic_forms/genera/genus.py:        of the Jordan blocks A_1,...,A_t.
14:01 < rlm> making a ticket...
14:01 < rlm> nevermind
14:01 < mabshoff> :)
14:01 < rlm> #874
14:01 < rlm> very old ticket
14:02 < mabshoff> Jep, I am surprised nobody complained until now.
14:02 < jason--> well, good thing today is fix-the-tickets-day
14:02 < rlm> technically, a new feature isn't a bug, but...
14:02 < mabshoff> Oh, a volunteer ;)
14:02 < jason--> well, missing *the* result of linear algebra, I'd consider that a bug.
14:03 < rlm> i disagree, but there's no point arguing semantics
14:03 < mabshoff> I guess if one wanted to teach linear algebra with Sage the people would have to write their own implementation anyway.
14:03 < jason--> you've got a good point too.
14:04 < rlm> if someone were teaching linear algebra with sage right now, they could assign this ticket as homework.......
14:04 < rlm> wouldn't that be nice for us
14:04 < jason--> I'll be teaching next semester...
14:04 < rlm> I'm very happy about this- UW arts & sciences is hiring me as a "sage ta" next quarter
14:05 < jason--> If it's not done by next april, I may have a class competition
14:05 < mhansen-962> Does someone with a university internet connection want to get this for me: http://www.sciencedirect.com/science?_ob=ArticleURL&_udi=B6WM7-45M2XHC-M&_user=10&_coverDate=09%2F30%2F1997&_rdoc=1&_fmt=&_orig=search&_sort=d&view=c&_acct=C000050221&_version=1&_urlVersion=0&_userid=10&md5=751b55e81560d2929d5900ba589224e6
14:06 < jason--> grr, there goes my homework assignment ;)
14:06 < craigcitro-1129> i've got it for you mike -- emailing right now
14:07 < mhansen-962> It's annoying how all those site stop working on a regular connection.
14:07 < craigcitro-1129> yeah ... i've got things set to work over a proxy on my laptop, which is wildly helpful. sometimes ucla doesn't have the right subscriptions, though -- which is when it pays to have friends at harv & mit. ;)
14:08 < roed_> :-)
14:08 < rlm> ok, so which package sage includes is most likely to do rational and jordan form?
14:09 < jason--> gap?
14:11 < mabshoff> jkantor: It looks like scipy prefers Sun's F77 compiler on Solaris if it finds it:
14:11 < mabshoff> sage_fortran:f77: scipy/optimize/minpack2/dcsrch.f
14:11 < mabshoff> Which would explain why those F77 symbols are missing ;)
14:13 < jkantor> did it get to the end
14:13 < mabshoff> Not yet, still building.
14:13 < jkantor> ok
14:14 < mabshoff> Ok, it finished building and not complains about a missing cvxopt.so which isn't 
14:14 < mabshoff> there due to missing complex.h.
14:15 -!- jason-- is now known as jason--|afk
14:15 < jkantor> cvxopt complains
14:16 < mabshoff> Yep. But Solaris 10 has a complex.h, not sure if it will work.
14:16 < mabshoff> Giving it a shot anyway.
14:18 < mabshoff> Nope doesn't work as planned. We need a compiler provided _Imaginary_I
14:20 < jkantor> did the scipy not work either
14:20 < mabshoff> Scipy compiled and the import of scipy works, i.e. umfpack.
14:20 < mabshoff> But since there is no cvxopt.so the test still failed.
14:21 < jkantor> right
14:21 < jkantor> but the scipy tests work?
14:21 < mabshoff> I only ran the doctest, I can import scipy manually - one sec.
14:21 < mabshoff> import scipy works ;)
14:22 < jkantor> how about
14:22 < mabshoff> One more annoying Solaris bug squashed
14:22 < jkantor> from scipy import optimize
14:22 < mabshoff> works ;)
14:22 < jkantor> sweet
14:23 < mabshoff> I am merging the updated numpy.spkg now into alpha2.
14:23 < mabshoff> I have seen cvxopt binary builds for Solaris, so it must be possible,
14:23 < jkantor> its just complex.h, that its upset with
14:24 < mabshoff> I could try in Solaris 10, but I don't want to try that before updating FLINT and fixing fplll
14:24 -!- was_ [n=wstein@c66-235-34-166.sea2.cablespeed.com] has joined #sage-devel
14:24 < mabshoff> Well, it is the first issue that pops up, never got further.
14:24 < jkantor> ok
14:24 < mabshoff> Where is the latest scipy?
14:24 < mabshoff> I mean: which ticket?
14:25 < jkantor> no new scipy
14:25 < jkantor> it was just numpy 
14:25 < jkantor> that fixed scipy
14:25 < mabshoff> ok. Also the ATLAS issue?
14:25 < jkantor> that was only for numpy
14:26 < mabshoff> ok, but then we need to force a rebuild of scipy anyway.
14:26 < jkantor> for an upgrade yes
14:26 < mabshoff> Yes, but people will do that an fail.
14:27 < jkantor> right
14:28 < was_> ok, I'm back at home...
14:28 < mabshoff> :)
14:28 < mabshoff> Any news on http://trac.sagemath.org/sage_trac/ticket/787?
14:28 < was_> Yes, I'm still working on it.  That complicated line from Nils turned out to even be theoretically wrong.
14:28 < was_> I'm not creating a new algorithm
14:28 < was_> which is of course much simpler.
14:28 < was_> I hope.
14:28 < mabshoff> At least nor tonight ;)
14:28 < was_> pain in the butt.
14:29 < cwitty-1154> "not" -> "now"?
14:29 < was_> I mean "now"
14:29 < was_> Yes, now.
14:29 < mabshoff> That does make sense.
14:29 < mabshoff> It looks like one issue in libSingular is causing about 100 doctests on Solaris to fail.
14:29 < mabshoff> So if that is fixed we are getting very, very close
14:30 < mabshoff> I just committed the int64 build fix so that modp works properly.
14:32 < mabshoff> Who did package FLINT last time?
14:32 < mabshoff> I only ever updated. But I want to go up to 1.0 to fix a whole bunch of issues.
14:36 < cwitty-1154> OK, I've got a new MPFI spkg.
14:36 < cwitty-1154> sage.math:/home/cwitty/mpfi-1.3.4-cvs20071125.p2.spkg
14:36 < mabshoff> What did you do differently? "-c"
14:36 < cwitty-1154> It no longer runs autoheader during the build, on my laptop; so I think at least that problem is fixed.
14:36 < mabshoff> ok
14:37 < cwitty-1154> No.  I just did "touch src/mpfi_config.h.in".
14:37 < jkantor> mabshoff: for atlas you need lapack-20071123, atlas-3.8.p2, cvxopt-0.9.p4, and numpy-20071020-1.0.3.1.p2
14:37 < mabshoff> ok, I got cvxopt.p2, the numpy.p2.
14:37 < jkantor> cvxopt.p4?
14:38 < mabshoff> The p4 you mentioned above.
14:38 < jkantor> yeah
14:39 < mabshoff> So except for Lapack we are nearly ready to drop in ATLAS.
14:39 < jkantor> what about lapack isn't ready
14:39 < mabshoff> cwitty: the new mpfi.p2 is in.
14:40 < mabshoff> Oh, I just haven't tried Lapack yet.
14:40 < jkantor> it just removes the if [uname = 'Darwin'
14:40 < jkantor> ]
14:40 < was_> where is the new mpfi that you made?  I can test it.
14:40 < jkantor> so lapack is built on OSX
14:40 < cwitty-1154> sage.math:/home/cwitty/mpfi*.p2.spkg
14:40 < mabshoff> I just figured to do an incremental process instead of dumping it all in.
14:40 < jkantor> intel
14:40 < jkantor> makes sense
14:41 < mabshoff> Yep, I have been burned too many times.
14:41 < mabshoff> Something is fishy with libcsage on OSX:
14:41 < mabshoff> usr/bin/ld: warning can't open dynamic library: libpari-gmp.dylib referenced from: /Users/mabshoff/sage-2.8.15.alpha1/local//lib/libcsage.dylib (checking for undefined symbols may be affected) (No such file or directory, errno = 2)
14:41 < jkantor> on osx the atlas won't really be used yet
14:42 < mabshoff> Do we even build it or do we skip right over it?
14:42 < jkantor> we build it, but I could change that
14:42 < jkantor> or you could, its your call
14:42 < mabshoff> Ok, let's build it as long as we don't do the final release.
14:42 < mabshoff> That way we flush out build issues now and not when we release a final build which uses ATLAS.
14:43 < jkantor> ok
14:43 < mabshoff> Does anybody know which timezone Bill Hart is is at the moment? GMT?
14:43 < mabshoff> If so he gets up very early ;)
14:43 < was_> england.
14:43 < mabshoff> ok
14:44 < mabshoff> ok, back in 20
14:44 -!- mabshoff is now known as mabshoff|afk
14:44 < mabshoff|afk> I hope somebody will be bored and do patch review ...
14:44 < was_> the new mpfi package works.
14:45 < cwitty-1154> Cool, thanks for testing.
14:53 -!- kedlaya [n=kedlaya@DWORK.MIT.EDU] has quit ["Leaving."]
14:56 < rlm> #1353 should be effortless to review
14:59 < cwitty-1154> OK, I'll look at #1353.
14:59 < was_> `I'm enjoying not doing patch reviews -- this is my first bug day to just fix bugs :-)
15:00 < mabshoff|afk> :)
15:01 < mabshoff|afk> It would be excellent if somebody reviewed http://trac.sagemath.org/sage_trac/ticket/1211
15:01 < mabshoff|afk> After all: It is critical.
15:01 < cwitty-1154> I'll look at it next.
15:02 < mabshoff|afk> http://trac.sagemath.org/sage_trac/ticket/1292 looks like you got some feedback - reading the comments now.
15:03 < rlm> I'm looking at #1258
15:03 < mabshoff|afk> 1287, 1290 and 1239 also seem worthwhile.
15:05 < mabshoff|afk> Ok, I will work on my 1184 ticket for a while.
15:09 < cwitty-1154> mabshoff|afk, #1353 is good.
15:18 < rlm> #1258 is NOT ready
15:20 < rlm> should i move it to sage-2.9?
15:20 < mabshoff|afk> rlm: Leave it there for now, maybe it will get sorted out.
15:21 < mabshoff|afk> Once we close 2.8.15 all the open tickets will get moved to another milestone.
15:21 < mabshoff|afk> And since there are 80+ open a lot of them won't be closed.
15:22 < rlm> ok
15:22 < mabshoff|afk> We might want to create a "negative review milestone" in the future.
15:22 < rlm> that's a really good idea
15:23 < mabshoff|afk> It depends on how much reaction is going to come and if all those tickets improve ..
15:23 < rlm> well, at least it makes the current milestone less cluttered
15:23 < mabshoff|afk> If trac notifiction worked we would also probably get better feeback from people who don't follow rack every day.
15:23 < mabshoff|afk> I will list the tickets with bad reviews in the next alpha
15:24 < rlm> and then if someone wants to resubmit, they can move it back to the current milestone for review
15:24 < mabshoff|afk> Sure
15:24 < rlm> i can't wait for rwb's patch for hg comprehension
15:24 < mhansen-962> Did we figure out the mpfi compile error?
15:25 < cwitty-1154> mhansen-962: yes, I have an updated spkg in my home directory on sage.math.
15:25 < mhansen-962> Okay, thanks.
15:29 < craigcitro-1129> so i fixed 1129, but i think there's a bug in pari still
15:29 < craigcitro-1129> alex ghitza mentioned it in the trac ticket too; can someone who knows pari (i.e. was_ or wstein) glance at that and tell me i'm not missing something obvious?
15:30 < mabshoff|afk> http://trac.sagemath.org/sage_trac/ticket/1353 is merged
15:31 < craigcitro-1129> also, if someone wants to comment on 1129, please do
15:31 < craigcitro-1129> it should work just fine now
15:32 < cwitty-1154> mabshoff|afk, #1211 is good
15:33 -!- cwitty-1154 is now known as cwitty-1162
15:36 -!- craigcitro-1129 is now known as craigcitro-1231
15:38 < mabshoff|afk> ok, cwitty-1154: will merge 1211
15:38 -!- mabshoff|afk is now known as mabshoff
15:42 < rlm> cyu later everyone
15:42 < cwitty-1162> bye, rlm
15:42 < craigcitro-1231> lates robert
15:43 < mabshoff> cu
15:43 -!- rlm [n=rlm@c-71-197-245-35.hsd1.or.comcast.net] has left #sage-devel []
15:47 -!- zachi_ [n=zachi@user-24-236-98-236.knology.net] has quit ["Leaving"]
16:03 < cwitty-1162> I will review 1129 now.
16:03 < mabshoff> Excellent.
16:03 < cwitty-1162> I've posted a new patch for #1162, if anybody wants to review it.
16:04 < craigcitro-1231> cool ... thanks cwitty-1162 
16:05 < mabshoff> was_ - still around?
16:05 < was_> yes.
16:05 < mabshoff> Do you have a test log from bsd?
16:05 < was_> maybe almost done with #787.
16:06 < mabshoff> Justin reported some mwrank crashes - if you have a log I will take a look.
16:06 < mabshoff> Cool
16:06 < was_> ok, put it at /home/was/tmp/test.log
16:07 < mabshoff> ok, your log is fine. At least non of the errors are there.
16:08 < mabshoff> Maybe his RAM/hardware is wonky.
16:08 < was_> probably.
16:09 < mabshoff> Yep, we didn't touch mwrank in ages.
16:10 -!- jkantor is now known as jkantor_brb
16:10 < cwitty-1162> craigcitro-1231: nfinit() is potentially a very slow operation; if we can't figure out a way to avoid calling it, we should at least cache the result.
16:10 < craigcitro-1231> oh, that's a good point
16:11 < craigcitro-1231> yeah, doing F._pari_() caches that
16:11 < craigcitro-1231> but the problem is that we need to switch the variable here and tehre
16:11 < craigcitro-1231> there
16:11 < craigcitro-1231> lemme look at how to make that faster.
16:13 < craigcitro-1231> (though, to be fair, it's likely that the nfinit was getting done before anyway)
16:13 < craigcitro-1231> (since it was factoring it in the number field in pari)
16:13 < mabshoff> 1211 is merged
16:15 < cwitty-1162> I think factornf probably doesn't call nfinit().  (At least, by my understanding of the algorithm, there would be no reason to.)
16:19 < craigcitro-1231> you're right, that's quite possible
16:19 -!- jkantor_brb is now known as jkantor
16:19 < craigcitro-1231> did you try out the pari question i had at the bottom?
16:20 < craigcitro-1231> was_ or wstein: do you know an easy way to change the variable used in a pari nf?
16:20 < was_> no.
16:21 < cwitty-1162> Craig, when I try the example from your last comment, I get a different result:
16:21 < cwitty-1162> ? factor(f)
16:21 < cwitty-1162>   *** factor: bug in GP (Segmentation Fault), please report
16:21 < craigcitro-1231> interesting
16:21 < craigcitro-1231> are you running pari directly? or did you do sage -gp ?
16:21 < craigcitro-1231> because i just copy-pasted that from my sage -gp session
16:21 < cwitty-1162> That was "sage -gp".
16:21 < craigcitro-1231> hmm
16:21 < craigcitro-1231> that's pretty odd.
16:22 < cwitty-1162> Was that your whole session?  (Did you type anything before the "f=" line?)
16:23 < craigcitro-1231> no, that's the entire session. i just checked again, and got the same result.
16:23 < cwitty-1162> I'm on 32-bit x86 Linux (Debian testing).  How about you?
16:23 < craigcitro-1231> 32-bit PPC OSX.
16:23 < craigcitro-1231> well, it's definitely the case that *both* are bad.
16:23 < craigcitro-1231> right?
16:24 < cwitty-1162> With the Sage in /usr/local on sage.math, I get the same result as you.
16:24 < cwitty-1162> Yes, I think so.
16:25 < cwitty-1162> With the Debian gp binary in /usr/bin on my laptop, I get the segmentation fault again.
16:25 -!- roed_ [n=roed@pool-141-154-49-18.bos.east.verizon.net] has quit [Read error: 104 (Connection reset by peer)]
16:25 < cwitty-1162> Let me paste a session as a comment on the ticket.
16:25 -!- roed_ [n=roed@pool-141-154-49-18.bos.east.verizon.net] has joined #sage-devel
16:26 < craigcitro-1231> cool
16:27 < craigcitro-1231> this is weird ... if you make the degree any smaller, it starts working.
16:27 < craigcitro-1231> or, more to the point, it's very specific to that polynomial
16:31 < craigcitro-1231> in fact, i can't find another polynomial that fails!
16:32 < craigcitro-1231> (well, except a multiple of that one.)
16:35 < cwitty-1162> Multiplying by a scalar, or a polynomial?
16:35 < craigcitro-1231> scalar
16:35 < craigcitro-1231> i hadn't tried by a polynomial
16:36 < craigcitro-1231> but multiplying by a poly kills it, too
16:38 < craigcitro-1231> cwitty-1162: have you used number fields in pari much?
16:38 < craigcitro-1231> do you know if i can just manually edit the vector nfinit returns and still have a legal number field?
16:39 < cwitty-1162> I think that's very likely to work.
16:41 -!- rlm [n=rlm@c-71-197-245-35.hsd1.or.comcast.net] has joined #sage-devel
16:43 < was_> craig -- yes.
16:43 -!- was_ is now known as was-787
16:44 < craigcitro-1231> cool. a more basic pari question: is there an easy way to switch the variable name in a polynomial, or get the list of coefficients?
16:44 < craigcitro-1231> (i'm assuming the answer has to be yes to the last of those, i just don't know it.)
16:46 -!- rlm is now known as rlm-1137
16:46 < craigcitro-1231> nevermind, i can just do it in sage
16:47 < was-787> #787 -- done and posted!
16:47 < mabshoff> So, anybody want to review this ;)
16:47 < mabshoff> I guess craigcitro-1231 would be the perfect candidate
16:47 -!- mabshoff is now known as mabshoff-1184
16:48 < craigcitro-1231> for which? 787?
16:48 < mabshoff-1184> Yep.
16:48 < was-787> Look at this -- http://trac.sagemath.org/sage_trac/attachment/ticket/787/trac787.patch
16:48 < was-787> It implements V/W where V and W are vector space.
16:48 < craigcitro-1231> lemme get 1129 re-cleaned up first (i.e. fix this nfinit issue), and then i'm on it
16:49 -!- was-787 is now known as was-1342
16:49 < was-1342> I'm going to look into #1342 now.
16:50 < mabshoff-1184> The current alpha build:
16:50 < mabshoff-1184> Overall weighted coverage score:  34.5%
16:50 < mabshoff-1184> Total number of functions:  17697
16:50 < was-1342> we really really need a doc day.
16:50 < mabshoff-1184> 200 more functions, 0.1% better coverage.
16:50 < mabshoff-1184> Compared to 2.8.13 that is.
16:51 < mabshoff-1184> Yes, we do.
16:51 < mabshoff-1184> Hej, only another 140 releases at the current pace to get to 40%
16:52 < mabshoff-1184> ehh, 50%
16:55 < mabshoff-1184> Just got a bunch of numerical noise doctest failures on fermat in sage/rings/polynomial/complex_roots.py
16:55 < mabshoff-1184> and sage/rings/polynomial/polynomial_element.pyx
16:56 < mabshoff-1184> I guess I can fix those ;)
16:56 < cwitty-1162> What OS/processor is fermat?
16:56 < mabshoff-1184> It is an XServer, so my guess is G4 with OSX 10.4.11
16:57 < mabshoff-1184> It is only the last two digits in a couple of places.
16:57 < mabshoff-1184> 0.18123244446987518 vs. 0.18123244446987521 for example.
16:58 < rlm-1137> is there a global precision option in sage?
16:58 < mabshoff-1184> I have seen doctests that would fail due to numerical noise on Ultra Sparc 3, but not Ultra Sparc 4
16:58 < mabshoff-1184> Not that I know. bober wrote some FPU fiddeling code.
16:58 < mabshoff-1184> re Sparc: But also the other way around, i.e. different tests would fail.
16:58 < rlm-1137> it seems hard to implement
16:59 < cwitty-1162> You mean "do everything at higher precision"?
16:59 < rlm-1137> cwitty-1162 -- no, like my e-mail to you this morning
16:59 < mabshoff-1184> Well, it is compiler dependent, i.e. change to another compiler release and the results can change
16:59 < rlm-1137> i.e. i only want to see a few digits
16:59 < mabshoff-1184> due to optimization and so on.
17:00 < rlm-1137> then doctests could do the answer up to some precision that would be stable
17:00 < mabshoff-1184> Well, we add "..." for the unstable digits for now.
17:01 < rlm-1137> oh of course
17:01 < mabshoff-1184> If we were to use the mpfr anywhere in that are Paul would be very unhappy.
17:01 < mabshoff-1184> are->area
17:03 < cwitty-1162> rlm-1137, I just read your e-mail.
17:03 < cwitty-1162> It would be an easy thing to add, but there should be some discussion first.
17:04 < cwitty-1162> The fear is that when you add global settings like that, it makes it harder to reproduce bugs, etc.
17:04 < rlm-1137> even a local option would be nice
17:04 < rlm-1137> and i'm only requesting it for display
17:05 < cwitty-1162> Well, for a quick hack, you can always just change this:
17:06 < cwitty-1162> repr(CIF(self._value))
17:06 < cwitty-1162> change CIF to ComplexIntervalField(15), for instance.
17:06 < cwitty-1162> (Or ComplexField(15), if you don't want to see the intervals.)
17:06 < rlm-1137> oh ok
17:06 < rlm-1137> that's easy
17:07 < cwitty-1162> Actually, if you don't want to see intervals, you probably need something like:
17:07 < cwitty-1162> ComplexField(15)(self._value.center())
17:16 -!- was-1342 is now known as was-afk-eating
17:25 -!- cwitty-1162 is now known as cwitty
17:27 -!- cwitty is now known as cwitty-1357
17:33 < jkantor> mabshoff: regarding making shared libraries on OSX, I spent some more time trying to make the libf77blas
17:33 < mabshoff-1184> And?
17:33 < jkantor> but I'm stuck with the same linker erroros
17:34 < jkantor> Probably someone who actually understands whats going on on OSX should look at it
17:34 < mabshoff-1184> :)
17:34 < mabshoff-1184> I should be done with 1184 and 1355 in a couple minutes.
17:34 < mabshoff-1184> Once 787 is reviewed I will merge that and push out alpha2
17:34 < mabshoff-1184> Then the interesting stuff like ATLAS, Singular and PolyBori should happen in the next 24 hours.
17:35 < jkantor> ok
17:35 < mabshoff-1184> At least that is the plan, but "tomorrow ATLAS" has been the plan for 5 days now :(
17:35 < jkantor> :)
17:35 < craigcitro-1231> ok, i'm afk for two hours
17:35 < mabshoff-1184> At least we got a bunch of merges done and a resonable stable alpha2, I didn't believe it would happen after alpha0
17:39 < mabshoff-1184> ok, 1355 done.
17:39 < mabshoff-1184> Arrg, Craig is gone for two hours.
17:47 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
17:47 < roed_> hey Robert
17:47 < robertwb> hi
17:47 < roed_> Have you been working at all on the coercion project?
17:47 < mabshoff-1184> hi robertwb
17:47 < robertwb> I haven't done much since about a week ago, what about you?
17:48 < roed_> no, I've been working on padics
17:50 < cwitty-1357> robertwb, I just looked at your latest comment on #1275.  The answer is yes, you get an exact result of 5/4.
17:50 < robertwb> Good. Why isn't it able to resolve it the other way? 
17:51 < cwitty-1357> It just doesn't try to do the exact computation.
17:52 < cwitty-1357> (I could change sqrt() to notice rational arguments, and immediately create a quadratic number field; but I didn't write that code.)
17:52 < cwitty-1357> Of course, either way, if it decides it actually needs an exact result, it will get it.
17:53 < cwitty-1357> The practical difference is mostly in the printing.  (There's probably a speed difference too, but I honestly don't know which way is faster.)
17:54 < robertwb> It would be nice if the sqrt/pow noticed a rational argument, how hard would that be? 
17:54 < robertwb> I just thought on that patch having to import a special function just for that case seemed kind of odd...
17:54 < cwitty-1357> Not hard.
17:55 < robertwb> (And then the code could work for something like K = NumberField(x^2-5, 'a'). golden_ratio._algebraic_(K) )
17:56 < rlm-1137> robertwb -- 
17:56 < rlm-1137> i'm looking at a strange problem with visualize_structure
17:57 < robertwb> yeah?
17:58 < rlm-1137> can you imagine a situation where you use val = colorExact((v,v,v)) for a color, and it comes out magenta?
17:58 < robertwb> I don't know what the colorExact function is, but magenta is FFFF00
17:59 < rlm-1137> i'm looking at matrix2.pyx, around l.2890 or so
17:59 < rlm-1137> it looks like you modified this function to fit several matrix entries into a single pixel
18:00 < cwitty-1357> robertwb, when you're done with rlm... I didn't understand your last suggestion.
18:01 < robertwb> The modification I did was to get cython to compile (explicitly casting the double to an int), I didn't write that bit of code myself
18:01 < rlm-1137> oh ok
18:01 < rlm-1137> do you know anything about gd?
18:01 < robertwb> cwitty - I meant for sqrt or pow, it could create a number field x^n - a and return a generator
18:02 < robertwb> No, I don't know much about GD. Getting magenta could be a result of wrapping around or something though. 
18:02 < rlm-1137> that's my guess
18:04 < mhansen-962> I get a weird number field error after #962.
18:04 < robertwb> oh, not I understand your question. colorExact((v,v,v)) should always return a shade of grey I think. Have you tried printing out the values for v? 
18:04 < rlm-1137> yeah : 254
18:05 < rlm-1137> so wraparound seems likely, maybe, since they're high
18:05 < mhansen-962> File "number_field.py", line 3770:
18:05 < mhansen-962>     sage: f = K.embeddings(ComplexField(58)); f
18:05 < mhansen-962> Expected:
18:05 < mhansen-962>     [Relative number field morphism:
18:05 < mhansen-962>       From: Number Field in a with defining polynomial x^3 - 2 over its base field
18:05 < mhansen-962>       To:   Complex Field with 58 bits of precision
18:05 < mhansen-962>       Defn: a |--> -0.62996052494743676 - 1.0911236359717214*I
18:05 < mhansen-962>             b |--> -0.00000000000000019428902930940239 + 1.0000000000000000*I,
18:05 < mhansen-962>       ...
18:05 < mhansen-962>       To:   Complex Field with 58 bits of precision
18:05 < mhansen-962>       Defn: a |--> 1.2599210498948731
18:05 < mhansen-962>             b |--> -0.99999999999999999*I]
18:05 < mhansen-962> Got:
18:05 < mhansen-962>     [Relative number field morphism:
18:05 < mhansen-962>       From: Number Field in a with defining polynomial x^3 - 2 over its base field
18:05 < mhansen-962>       To:   Complex Field with 58 bits of precision
18:05 < mhansen-962>       Defn: a |--> -0.62996052494743676 - 1.0911236359717214*I
18:05 < mhansen-962>             b |--> -1.9428902930940239e-16 + 1.0000000000000000*I, Relative number field morphism:
18:05 < mhansen-962>       From: Number Field in a with defining polynomial x^3 - 2 over its base field
18:05 < mhansen-962>       To:   Complex Field with 58 bits of precision
18:05 < mhansen-962>       Defn: a |--> -0.62996052494743657 - 1.0911236359717214*I
18:05 < mhansen-962>             b |--> -1.0000000000000000*I, Relative number field morphism:
18:05 < mhansen-962>       From: Number Field in a with defining polynomial x^3 - 2 over its base field
18:05 < mhansen-962>       To:   Complex Field with 58 bits of precision
18:05 < mhansen-962>       Defn: a |--> -0.62996052494743657 + 1.0911236359717214*I
18:05 < mhansen-962>             b |--> 1.0000000000000000*I, Relative number field morphism:
18:05 < mhansen-962>       From: Number Field in a with defining polynomial x^3 - 2 over its base field
18:05 < mhansen-962>       To:   Complex Field with 58 bits of precision
18:05 < mhansen-962>       Defn: a |--> -0.62996052494743676 + 1.0911236359717214*I
18:06 < mhansen-962>             b |--> -1.9428902930940239e-16 - 1.0000000000000000*I, Relative number field morphism:
18:06 < mhansen-962>       From: Number Field in a with defining polynomial x^3 - 2 over its base field
18:06 < mhansen-962>       To:   Complex Field with 58 bits of precision
18:06 < mhansen-962>       Defn: a |--> 1.2599210498948731
18:06 < mhansen-962>             b |--> 0.99999999999999999*I, Relative number field morphism:
18:06 < mhansen-962>       From: Number Field in a with defining polynomial x^3 - 2 over its 
18:06 < robertwb> rlm -- what exactly is the error? The whole thing magenta?
18:07 < mhansen-962> Never midn, I missed the ... in there.
18:08 < mabshoff-1184> you mean the precison issue?
18:08 < mabshoff-1184> 0.0000000000xx->xxe-16?
18:09 < robertwb> looking at the docstring for colorExact((r,g,b))
18:09 < robertwb> return an exact color index match for (r,g,b) (returns -1 if unable to)
18:09 < robertwb> Is the returned value -1? 
18:10 < rlm-1137> where are you getting colorExact?
18:10 < robertwb> http://newcenturycomputers.net/projects/gd-ref.html
18:10 < rlm-1137> there it is!
18:10 < rlm-1137> thanks
18:11 < robertwb> thank google :)
18:11 < cwitty-1357> robertwb, I ported sage3d.jar to Jython last night.
18:11 < rlm-1137> i kept running into the C project
18:12 < robertwb> well...it is a c project. We just use a python wrapper
18:13 < rlm-1137> got it!
18:14 < mhansen-962> cwitty-1357: I added a patch for #962 fixing all the doctest failures.
18:14 < robertwb> we're creating a truecolor image, so colorExact((v,v,v)) should always succede
18:15 < mabshoff-1184> mhansen-962: 27kb, that wasn't too bad.
18:15 < mhansen-962> It was much easier than I thought.
18:16 < mabshoff-1184> Yep, that is also my impression.
18:17 -!- rlm-1137 is now known as rlm
18:17 < rlm> #1137 is ready for review
18:18 < cwitty-1357> mhansen-962, I don't understand why the numbers that start "0." got one digit shorter.
18:19 < robertwb> I'll look at #1137 now
18:20 < mabshoff-1184> robertwb: have you seen the new comment on http://trac.sagemath.org/sage_trac/ticket/1325.
18:20 < robertwb> yes, I was thinking about starting to work on that one
18:20 < mabshoff-1184> Well, thanks.
18:21 < mabshoff-1184> It would also suffice to tell me that it is all malb's fault.
18:21 < rlm> #1137 was his too:-)
18:21 < mabshoff-1184> There is at least another issue in libSingular that manifests itself on Solaris.
18:21 < mabshoff-1184> :)
18:21 < mabshoff-1184> He went home over the weekend.
18:22 < robertwb> OK, I cant get #1137 to work, but I think it's a gd issue. 
18:22 < mabshoff-1184> cwitty-1137: I discovered another relocaiton issue on OSX - see http://trac.sagemath.org/sage_trac/ticket/1358
18:22 < mabshoff-1184> It should be fairly easy to fix.
18:23 < robertwb> BTW, #1325 is on solaris only?
18:23 < mhansen-962> cwitty-1357: I'll look into that.
18:23 < mabshoff-1184> Yep, at least it crashes there.
18:24 < mabshoff-1184> I thought of compiling with "-O2" or even "-O0" to see if the problem goes away if nothing obvious happens.
18:24 < robertwb> works fine on my computer, and I don't have a solaris account to test it on. 
18:24 < mabshoff-1184> :) 
18:25 < cwitty-1357> mhansen-962, before your patch, those numbers somehow ended up being 56-bit precision.
18:25 < mabshoff-1184> I will valgrind it on PPC Linux to see if there is an endianess issue.
18:25 < mabshoff-1184> symmetrica also has issues on PPC linux and Sparc/Solaris
18:25 < mhansen-962> They should only be 53-bit, right?
18:25 < cwitty-1357> I'd think so.  That's the default.
18:25 < cwitty-1357> Before your patch:
18:25 < cwitty-1357> sage: asin(1+I*1.0).real()._obj.prec()
18:25 < cwitty-1357> 56
18:25 < cwitty-1357> sage: asin(1+I*1.0).imag()._obj.prec()
18:25 < cwitty-1357> 56
18:25 < cwitty-1357> After your patch:
18:25 < mabshoff-1184> robertwb: Do you see anything obvious that might be wrong?
18:26 < cwitty-1357> sage: asin(1+I*1.0).real()._obj.prec()
18:26 < cwitty-1357> 54
18:26 < cwitty-1357> sage: asin(1+I*1.0).imag()._obj.prec()
18:26 < cwitty-1357> 57
18:26 < mabshoff-1184> If it isn't coercion it could still be libSingular.
18:26 < robertwb> I suspect libSingular
18:26 < mabshoff-1184> And in that case malb is much more qualified.
18:26 < mabshoff-1184> :)
18:26 < mabshoff-1184> blame malb I guess.
18:26 < robertwb> he's not here :)
18:26 < rlm> mabshoff-1184: is #1179 as easy as it sounds?
18:27 < mabshoff-1184> I initially thought that there were issues in coercion, too, but I was suprised that it immdetiately pointed to libSingular.
18:27 < mabshoff-1184> The bt is nearly identical.
18:27 < mhansen-962> cwitty-1357: So, it looks like it's an issue with reading in a string?
18:27 < robertwb> I'm going to look at it a bit more, but very little coercion stuff is platform dependant
18:27 < mabshoff-1184> rlm: Not sure if we are going to do it, but it is trivial.
18:27 < cwitty-1357> mhansen, yes.  It's reading the output of maxima:
18:27 < cwitty-1357> sage: maxima(asin(1+I*1.0))
18:27 < cwitty-1357> 1.061275061905036*%i+.6662394324925153
18:27 < mabshoff-1184> On Solaris you really have the original "sh", it causes problems all over the map.
18:28 < mabshoff-1184> So William replaced sh with bash on neron, but on other systems people don't generally do that.
18:28 < mabshoff-1184> So: since we already require bash we might as well change all the scripts.
18:28 < mabshoff-1184> Klas from some university in Sweden reported the issue to me, so I figured it is worth fixing.
18:29 < mabshoff-1184> Please post a patch, I hope was can be convinced to apply it.
18:29 < rlm> ok
18:29 < cwitty-1357> And really, the current behavior is fine with me.  (I was worried when I thought it was all "0." numbers, but if it's only numbers that we read from maxima, then it doesn't affect me, at least :)
18:29 < mabshoff-1184> thanks.
18:29 < mabshoff-1184> didn't somebody just review a ticket?
18:30 < mhansen-962> cwitty-1357: I'm fine with how it is now too ;-]  If someone complains, then we can change it.
18:30 < robertwb> BTW, about sage: asin(1+I*1.0).real()._obj.prec() == 56
18:30 < robertwb> There it a ticket http://sagetrac.org/sage_trac/ticket/1286
18:31 < robertwb> (Not the same issue issue, but relevant)
18:33 < cwitty-1357> I agree with Paul's comment on #1286: we shouldn't be doing this automatic precision extension at all.  But I already fought and lost that battle, so oh well.
18:33 < mhansen-962> Actually, #1286 on alpah1  + #962
18:34 < mhansen-962> err, #1286 works is what I meant
18:34 < mabshoff-1184> Because of your fixes to the calculus code?
18:35 < mhansen-962> I'm not quite sure ;-]
18:35 < mabshoff-1184> Well, it works for me, too.
18:35 < mabshoff-1184> So, you can have the honors :)
18:35 < mabshoff-1184> Instead if creating odd issues we get them fixed.
18:36 < mhansen-962> Do you want me to close it?
18:36 < mabshoff-1184> It might be that William's sqrt(n) patch fixed that by avoiding maxime altogether.
18:36 < mabshoff-1184> Sure, go ahead.
18:36 < mabshoff-1184> We are really making progress today.
18:38 < mhansen-962> I can fix the documentation issues after I eat.  I'm having low-hanging fruit for dinner ;-)
18:39 < mabshoff-1184> hehe
18:39 < mabshoff-1184> I might have another 2, 3 hours in me.
18:39 < mabshoff-1184> Maybe 5 if I drink enough tea.
18:40 < mabshoff-1184> I wont to get very close to a release.
18:40 < mabshoff-1184> So if we wait for PolyBoRi and the new Singular the release will be a couple days out.
18:40 < mabshoff-1184> Otherwise we do one tomorrow :)
18:42 < cwitty-1357> OK, I reviewed #962: looks great!
18:42 < mhansen-962> Finally :)
18:43 < mabshoff-1184> w00t
18:45 < mabshoff-1184> So: merge it?
18:45 < mabshoff-1184> I didn't pay much attention during that part of the discussion.
18:46 -!- jason--|afk is now known as jason--
18:46 < jason--> cwitty-1357: did you see that your URLs are all ending in a colon?
18:47 < jason--> (you guys have been having lots of fun, it seems!)
18:47 < cwitty-1357> Yes.  Please merge 962-2.patch and 962-doctests.patch.
18:47 < mabshoff-1184> Yeah, it is like a party here ;)
18:47 < cwitty-1357> jason--, I'm not typing urls; I'm typing "# 962:".
18:47 < mabshoff-1184> cwitty-1357: Ok, I will be merging shortly.
18:47 < mhansen-962> cwitty-1357: I fixed the 32-bit issue.
18:47 < mabshoff-1184> anybody out there with a mac willing to test an updated ntl.spkg?
18:48 < mabshoff-1184> it fixes http://trac.sagemath.org/sage_trac/ticket/1184 :)
18:48 < jason--> hmmm, so its my konversation that is picking up the colon as part of the URL...my bad.
18:49 < jkantor> I can test if it builds, though I know nothing of ntl
18:49 < mabshoff-1184> Well, it only changes the Darwin makefile.
18:49 < jkantor> ok, so just looking for erros?
18:49 < mabshoff-1184> It twiddles with the linker options and fixes some issues with the link order in setup.py
18:49 < mabshoff-1184> pretty much.
18:49 < jkantor> where is the spkg
18:50 < mabshoff-1184> one sec.
18:50 < mabshoff-1184> The OSX linker otherwise picks libpari-gmp.dylib instead of libgmp.dylib
18:50 < mabshoff-1184> It automatically resolves symbols, which is just crazy.
18:51 < mabshoff-1184> http://sage.math.washington.edu/home/mabshoff/ntl-5.4.1.p7.spkg
18:51 < mabshoff-1184> is the updated NTL spkg
18:52 < jkantor> I just realized, on my osx machine, I didn't rebuild 2.6.15, will 2.6.13, suffice?
18:52 < mabshoff-1184> Should work. The issue is about moving installs.
18:52 < jkantor> ok
18:53 -!- was-afk-eating is now known as was-1342
18:53 < mabshoff-1184> But for sage -b to work you need to apply a patch which I will post shortly to http://trac.sagemath.org/sage_trac/ticket/1184
18:54 < rlm> mabshoff-1184: There is a patch for #1179 but I am not sure how to test it.
18:55 < mabshoff-1184> Well, if it passes testall it should be enough for now. 
18:55 < mabshoff-1184> It should be so trivial that reviewing it should catch any potential issue.
18:55 < mabshoff-1184> But if anything pops up it should be very obvious.
18:56 < mabshoff-1184> It might also be interesting if we should change "sage -sh" to "sage -bash"
18:57 < mabshoff-1184> Anybody know when was is going to be back?
18:57 < rlm> ok, i'll do a testall right now, while i'm eating dinner
18:57 < cwitty-1357> No! don't do that.
18:57 < was-1342> I am back.
18:57 < was-1342> I like sage -sh
18:57 < cwitty-1357> Half of the point of "sage -sh" is that it works even if your login shell is tcsh.
18:57 < mabshoff-1184> Well, it should still work.
18:58 < mabshoff-1184> On pretty much any decently modern system sh is a link to bash.
18:58 < cwitty-1357> "sage -sh" already gives you bash if your login shell is bash.
18:58 < cwitty-1357> Or tcsh if your login shell is tcsh, or zsh if your login shell is zsh.
18:58 < mabshoff-1184> Doe it use $SHELL?
18:59 < cwitty-1357> Yes.
18:59 < mabshoff-1184> Ok, I guess rlm's patch doesn't change that.
18:59 < cwitty-1357> Right.
18:59 -!- rlm is now known as rlm|afk|testing
18:59 < mabshoff-1184> But does the export of all the Sage env-stuff still work with all those different shells?
18:59 < cwitty-1357> Yes.
18:59 < mabshoff-1184> ok
19:00 < cwitty-1357> (Because sage-env is actually processed with /bin/sh (or with /bin/bash, after the patch).)
19:01 < mabshoff-1184> ok,
19:01 < mabshoff-1184> I will be merging 962-2.patch  and the doctest patch. That is what you guys want?
19:01 < cwitty-1357> Yes.
19:01 < mabshoff-1184> ok.
19:03 < jkantor> I applied the patch and am install the ntl package, do I need to do sage -b afterwards?
19:03 < mabshoff-1184> Yep
19:03 < jkantor> ok
19:03 < mabshoff-1184> I did test it on three platforms, but you never know :)
19:05 < mabshoff-1184> ok, 962 merged and closed.
19:06 < mabshoff-1184> Any news on the 787 review?
19:06 < mabshoff-1184> Or are we waiting for Craig to come back?
19:06 < was-1342> regarding 787, I just had to post one trivial 2-line patch to fix a doctest.
19:06 < mabshoff-1184> :)
19:07 < mabshoff-1184> Is there anything else in the review que?
19:07 < mabshoff-1184> I would like to do 1183, 787. Anything else?
19:08 < mabshoff-1184> was-1342: If malb is online later and we get Singular 3-0-4 we could do a release on monday 
19:08 < was-1342> I'm about to post #1342.
19:08 < was-1342> That's a major bug.
19:08 < was-1342> (in my opinion.)
19:08 < mabshoff-1184> with PolyBoRi.spkg as a compile test only.
19:08 < mabshoff-1184> And ATLAS goes in either way after alpha2.
19:09 < jkantor> Just a thought, since you buld on ppc linux so much, would it be possible to have binaries for that, even skipping every few releases
19:09 < mabshoff-1184> Sure, I don't see any problem with your patch.
19:09 < mabshoff-1184> sure, but it is usually a pain to upload.
19:09 < jkantor> I see
19:09 < mabshoff-1184> I only got excellent bandwidth at the office, and people tend to pester me if I show up there.
19:10 < jkantor> ah
19:10 < mabshoff-1184> But I am usually there once every two weeks, so I can push the latest current release then.
19:10 < mabshoff-1184> Does anybody care about those PPC Linux binaries?
19:10 < jkantor> me, 
19:10 < mabshoff-1184> ok
19:11 < mabshoff-1184> the PPC Linux build tends to expose bugs in the code.
19:11 < mabshoff-1184> So I should build every release ;)
19:12 < jkantor> I have an ibook g3 and I never build sage on it because its so slow, but upgrading from a relatively recent binary would be manageable.
19:13 < jkantor> regarding 1184: I installed patch, installed the package, and did sage -b. No errors, do you need a testall?
19:13 < mabshoff-1184> nah, I know it works ;)
19:13 < jkantor> cool
19:13 < mabshoff-1184> You could do a "sage -ba" followed by moving the install and rebuilding cremona ;)
19:14 < mabshoff-1184> That is what I did, but that takes a while ...
19:14 < jkantor> only, if you really want me too?
19:14 < mabshoff-1184> If you have time to waste.
19:14 < jkantor> well I have another laptop right next too the macbook
19:14 < mabshoff-1184> We will see if the reports about failed updates will stop on OSX 10.4
19:14 < jkantor> so I don't mind it being busy
19:15 < mabshoff-1184> Just rebuild cremona, if that works I will merge it.
19:15 < jkantor> after moving
19:15 < jkantor> how doing I rebuld cremona?
19:15 < mabshoff-1184> Either way.
19:15 < mabshoff-1184> ./sage -f spkg/standard/cremona-200711xx
19:15 < jkantor> oh, the package ok
19:16 < mabshoff-1184> Yep, then touch the cremona directory in libs and do a sage -b
19:16 < mabshoff-1184> That should test it well enought.
19:16 < mabshoff-1184> The really odd thing is that once I fixed NTL to be a proper dylib I needed to change the link order for all the libSingular stuff.
19:16 < mabshoff-1184> That's why the patch was needed for setup.py
19:17 < jkantor> i see
19:17 < mabshoff-1184> the really odd thing: This is a non issue on OSX 10.5, but there the linker has a different bug.
19:17 < jkantor> I don't understand linking on osx, they have these weird flat namespaces and two level namespaces
19:18 < mabshoff-1184> http://trac.sagemath.org/sage_trac/ticket/1358 - it is unbelievable.
19:18 < mabshoff-1184> Yep, to put it midly: It looks like it was designed by monkeys.
19:19 < jkantor> It seems that they made an initial crappy design, and then a hack that sort of fixed it, but has lots of shortcomings
19:19 < jkantor> its seems far lest robust than how linux works
19:19 < mabshoff-1184> Well, they changed the linker concept woth 10.0, 10.1, 10.2 and it is incompatible in many ways.
19:20 < mabshoff-1184> woth->with
19:20 < jkantor> yeah
19:21 < mabshoff-1184> I just don't understand: Take elf and Unix standard libraries - all the problems have been solved a decade ago,
19:21 < mabshoff-1184> but no: design your own NIH idiotic linker concept and then not fix the bugs in the linker.
19:22 < mabshoff-1184> lazy symbol lookup at runtime? What an excellent idea.
19:26 < jkantor> I rebuilt hte cremona package, no problems
19:27 < mabshoff-1184> Excellent.
19:27 < mabshoff-1184> was-1342: I cannot reproduce or find any problem with mwrank on bsd.  So it must be Justin's fault ;)
19:27 < was-1342> yep.
19:28 < mabshoff-1184> I also run all the mwrank test on the shell, no dice.
19:29 < mabshoff-1184> Ok, I am brewing some more tea, back in a fiffy or two.
19:29 < mabshoff-1184> Then hopefully the final three tickets to merge and alpha2 here we come.
19:38 < was-1342> #1342 -- done.
19:39 < mabshoff-1184> Is anybody reviewing this? Not that I think that there is the need to do so :)
19:40 < cwitty-1357> was-1342, in #1342, should "input idea" be "input ideal"?
19:40 < mabshoff-1184> Oh, I guess we do ;)
19:41 < cwitty-1357> I wasn't planning to run it, or look at the math, or anything... but at least I can find typos in the error messages!
19:41 < mabshoff-1184> :9
19:42 < mabshoff-1184> How about http://trac.sagemath.org/sage_trac/ticket/1160 - anybody willing to tackle that?
19:42 < was-1342> yep.
19:42 < mabshoff-1184> There is also that bug that Kate reported. 
19:42 < jason-->  /nick jason--|afk
19:44 < was-1342> ok, I posted another #1342 patch...
19:45 < mabshoff-1184> Kate's is 1324.
19:45 < mabshoff-1184> But I haven't looked at it.
19:46 < mabshoff-1184> Was there any consensus about http://trac.sagemath.org/sage_trac/ticket/1129?
19:47 < mabshoff-1184> An new Pyrex has been released.
19:49 -!- was-1342 is now known as was-1160
19:49 < roed_> William, I'm taking a look at trac1342
19:49 < cwitty-1357> Re: #1129: I pointed out that Craig's code should cache the results of nfinit(), and he agreed.
19:49 < cwitty-1357> I think he's working on a new version of the patch.
19:50 < mabshoff-1184> ok, I think he should be back soonish.
19:50 < roed_> was-1342 Are the two patches you've put up supposed to fix things?
19:50 < mabshoff-1184> lol
19:50 < roed_> oops, he moved on
19:50 < roed_> was-1160
19:50 < was-1160> yes.
19:50 < was-1160> roed -- my patches should 100% fix things, and increase doctest coverage.
19:51 < was-1160> I just want to make sure it looks ok to you.
19:53 < roed_> sure.  I'm reading through them now
19:54 < mabshoff-1184> roed_: let me know when you are done with 1342
19:54 < roed_> will do
19:54 < mabshoff-1184> If you want to also check out 787
19:56 < roed_> was-1160, has someone fixed residue fields so that they work without computing the maximal order?
19:56 < was-1160> NO -- #1342 is completely unrelated to that.
19:57 < roed_> ok
19:57 < was-1160> Actually, we haven't even fixed things so residues fields work even with a maximal order -- this issue isn't maximal vs non-maximal but whether [O_K : Z[a]] is divisible by p.
19:58 < rlm|afk|testing> regarding sh ---> bash, testall goes fine
19:58 -!- rlm|afk|testing is now known as rlm
19:58 < mabshoff-1184> rlm: ok
19:58 < roed_> yeah
19:58 < roed_> I know
19:58 < mabshoff-1184> was-1160 should give us input on that patch.
19:59 < was-1160> which patch?
19:59 < was-1160> I like the sh --> bash patch.
19:59 < was-1160> It seems very sensible.
19:59 < mabshoff-1184> ok
19:59 < roed_> mabshoff-1184 and was-1160: 1342 looks good to me.
19:59 < was-1160> ok, cool.  make a comment in trac.
19:59 < mabshoff-1184> ok, once my testalll finished I will apply
20:00 < mabshoff-1184> was-1160: could you then officially comment on http://trac.sagemath.org/sage_trac/ticket/1179, i.e. the sh patch?
20:00 < mabshoff-1184> It is also trivial to merge then.
20:01 < was-1160> I did officially comment on it.
20:01 < mabshoff-1184> ok, sorry.
20:02 < rlm> on #1179 there are some files in bin that i changed, but didn't show up in the patch
20:03 < was-1160> some files that go in bin are not in the hg repo.
20:03 < was-1160> But *anything* that starts with sage-* will be put in the sage_scripts*.spkg when one does sage -sdist.
20:03 < was-1160> But of course many scripts in local/bin/ might be installed by other programs during "make install".
20:04 < rlm> there were many files that didn't start with sage- that used #!/bin/sh
20:04 < was-1160> It's not a priori bad to use /bin/sh
20:04 < was-1160> It's only a problem if the file uses bash-isms.
20:04 < rlm> ok, so further problems will be case-by-case
20:04 < rlm> just wondering
20:05 < roed_> mabshoff-1184: did you want me to take a look at something?
20:05 < mabshoff-1184> 787 if you have time and know something about the area.
20:06 < mabshoff-1184> Ok, I got an extremely odd doctest failure:
20:06 < mabshoff-1184> sage -t  devel/sage-main/sage/rings/fraction_field_element.pyTraceback (most recent call last):
20:06 < mabshoff-1184>   File ".doctest_fraction_field_element.py", line 96, in <module>
20:06 < mabshoff-1184>     globs=globals())
20:07 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 1798, in testmod
20:07 < mabshoff-1184>     for test in finder.find(m, name, globs=globs, extraglobs=extraglobs):
20:07 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 823, in find
20:07 < mabshoff-1184>     self._find(tests, obj, name, module, source_lines, globs, {})
20:07 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 877, in _find
20:07 < mabshoff-1184>     globs, seen)
20:07 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 865, in _find
20:07 < mabshoff-1184>     test = self._get_test(obj, name, module, globs, source_lines)
20:07 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 949, in _get_test
20:07 < mabshoff-1184>     filename, lineno)
20:07 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 578, in get_doctest
20:07 < mabshoff-1184>     return DocTest(self.get_examples(string, name), globs,
20:08 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 592, in get_examples
20:08 < mabshoff-1184>     return [x for x in self.parse(string, name)
20:08 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 554, in parse
20:08 < mabshoff-1184>     self._parse_example(m, name, lineno)
20:08 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 624, in _parse_example
20:08 < mabshoff-1184>     lineno + len(source_lines))
20:08 < mabshoff-1184>   File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/doctest.py", line 710, in _check_prefix
20:08 < mabshoff-1184>     (lineno+i+1, name, line))
20:08 < mabshoff-1184> ValueError: line 29 of the docstring for __main__.example_2 has inconsistent leading whitespace: 'AUTHOR:'
20:08 < mabshoff-1184>          [1.6 s]
20:08 < mabshoff-1184> exit code: 256
20:08 < mabshoff-1184> That fraction_field_element.py is in sage.math/home/mabshoff
20:10 < rlm> mabshoff-1184: what is the valgrind tool for profiling?
20:11 < cwitty-1357> rlm, I've used callgrind.
20:11 < mabshoff-1184> valgrind is just an alias for memcheck.
20:12 < cwitty-1357> There are some notes here:
20:12 < cwitty-1357> http://wiki.sagemath.org/ValgrindingSage
20:12 < rlm> i think i'm going to take a look at graph_isom again
20:12 < rlm> thanks
20:13 < mabshoff-1184> Yep, if you have any questions ping us here.
20:13 < mabshoff-1184> We should add more info and especially write some debugging chapter for the manual.
20:14 < mabshoff-1184> ok, 1179 and 1184 are merged.
20:16 < was-1160> I'm making good progress on #1160, fortunately.
20:18 < roed_> mabshoff-1184: 787 looks sane, but I don't have time at the moment to work through it in detail
20:18 < roed_> I can probably get to it later tonight if that's early enough
20:18 < was-1160> Did you try applying the bundle?
20:18 < roed_> I don't have a fully upgraded version of sage
20:18 < was-1160> The best thing would be if you could just try it out at least.
20:18 < roed_> so I doubt it will work
20:18 < was-1160> You can apply the text patches to even a fairly old sage.
20:18 < mabshoff-1184> was-1160: which bundle
20:19 < roed_> Sure
20:19 < roed_> I'll apply the text patches and try it out
20:19 < was-1160> linear algebra "quotient" -- It is a patch against code that has barely changed in a year.
20:19 < was-1160> most of the patch is a new file, even.
20:20 < mabshoff-1184> I don't understand what is wrong with "sage -t  devel/sage-main/sage/rings/fraction_field_element.py"
20:20 -!- rlm is now known as rlm-1360
20:20 < mabshoff-1184> I diffed it against a working version on bsd. and it is the same except for line "3" and the doctest fix.
20:20 < was-1160> maybe ValueError: line 29 of the docstring for __main__.example_2 has inconsistent leading whitespace: 'AUTHOR:'
20:21 < mabshoff-1184> Yep
20:21 < mabshoff-1184> bsd:sage-2.8.14-moved mabshoff$ diff fraction_field_element.py devel/sage/sage/rings/fraction_field_element.py
20:21 < mabshoff-1184> 3c3
20:21 < mabshoff-1184> <
20:21 < mabshoff-1184> ---
20:21 < mabshoff-1184> >
20:21 < mabshoff-1184> 128c128
20:21 < was-1160> maybe tabs versus spaces or something.
20:21 < was-1160> I would just delete the whole weird line
20:21 < mabshoff-1184> I already did. It doesn't fix it.
20:22 < mabshoff-1184> I don't understand where the change comes from.
20:22 < mabshoff-1184> But I will take the working version and reapply the failed hunk.
20:22 < mabshoff-1184> not failed, but the doctest fix hunk.
20:25 < mabshoff-1184> Ahh, it isn't my patch that was at fault, it is mhansen-962's :)
20:26 < craigcitro-1231> hey all ... back
20:26 < rlm-1360> what directory does valgrind output get put in again?
20:26 < mabshoff-1184> Hey Craig.
20:26 < mabshoff-1184> ~/.sage
20:26 < was-1160> (but it should be .sage/valgrind/  hint hint )
20:26 < mabshoff-1184> :)
20:26 < mabshoff-1184> I never heard about that. lalalalalalala
20:28 < mabshoff-1184> Ok, the problem with that failed doctest is when I updated line 130 to the expected output.
20:29 < mabshoff-1184> Then the problem about "leading whitespace" appears.
20:29 < was-1160> can somebody look at #1349.
20:29 < was-1160> It changes the default notebook directory.
20:30 < was-1160> The tricky part is that it also cd's to the parent directory before running the twisted server.
20:30 < was-1160> pretty simple patch though, and will avoid a lot of confusion.
20:33 < craigcitro-1231> i have a pari question (again): does pari just not handle number fields defined by non-integral polynomials?
20:33 < mabshoff-1184> mhansen-962: Can you reproduce the problem with doctesting "fraction_field_element.py"?
20:34 < was-1160> craigcitro -- yes, I think it doesn't.
20:34 < was-1160> So we have to translate back and forth.
20:34 < mabshoff-1184> Ok, I am merging 1342 now unless somebody things I should wait.
20:35 < mabshoff-1184> And also 787
20:36 < was-1160> sounds good to me :-)
20:37 < mabshoff-1184> was-1160: I think you were right, there was a tab in there.
20:37 < was-1160> excellent.
20:37 < mabshoff-1184> Arrg, still failing.
20:38 < mabshoff-1184> Maybe another tab somewhere else.
20:38 < roed_> was-1160: I'm not convinced the repr string for a quotient module should have "V/W" in it
20:38 < roed_> It gets really confusing when you try to take quotients of quotients
20:39 < was-1160> That's a good point.  What would you prefer.
20:39 < was-1160> It's really hard to read "quotient of %s by %s" where %s and %s are V and W, since they are also complicated.
20:39 < rlm-1360> any chance i could get a trac admin to install a "graphs" component?
20:39 < roed_> agreed
20:40 < was-1160> It could be "Vector space quotient of dimension 2 over Rational Field:"
20:41 < was-1160> [indentation] Module:  Vector space of dimension 3 over Rational Field
20:41 < was-1160> [indentation] Submodule: Vector space of degree 3 and dimension 1 over Rational Field
20:41 < roed_> Yeah
20:41 < roed_> I like that better than what I was about to suggest
20:41 < was-1160> Then the entire Module and Submodule descriptions are uniformly indented.
20:41 < was-1160> Could you implement what I just suggested.
20:41 < was-1160> I spent way too long on #787 today, and am in the midst of another bug fix right now involving the notebook...
20:42 < roed_> Sure
20:42 < was-1160> Thanks!
20:42 < roed_> what file did FreeModule_ambient_field_quotient get put in?
20:42 < was-1160> modules/quotient_module.py, I think.
20:42 < roed_> ok
20:43 < roed_> yup
20:43 < was-1160> That should eventually get several other quotient classes, e.g., over a PID.
20:44 < mabshoff-1184> o,k, fixed that doctest.
20:44 < mabshoff-1184> I put the AUTHOR: on top and now it works.
20:44 < was-1160> excellent work.
20:44 < mabshoff-1184> damn python, I like C much better
20:44 < was-1160> I have 1160 working fine now.
20:45 < mabshoff-1184> I should write more python ;)
20:46 < was-1160> With C you can easily shoot yourself in the foot.
20:46 < was-1160> With Python, you can't find the trigger.
20:46 < mabshoff-1184> :)
20:46 < mabshoff-1184> But I have done C for close to 20 years now ;)
20:46 < was-1160> I've done C for 16 years.
20:47 < mabshoff-1184> :)
20:47 < mabshoff-1184> ok, 787 is merged.
20:47 < was-1160> excellent.
20:47 < mabshoff-1184> 1342 is next
20:48 < mabshoff-1184> 1349 is also on my list.
20:48 < mabshoff-1184> And I guess 1160 is next.
20:49 < was-1160> I already did 1160.
20:49 < mabshoff-1184> Well, I meant to merge.
20:49 < was-1160> But i haven't posted the patch, since I'm adding a few doctests to maxima.py "while I'm there".
20:49 < mabshoff-1184> ok, fine with me.
20:49 < was-1160> I figure I should always increase coverage with my patches.
20:49 < mabshoff-1184> Now doing 1342
20:49 < mabshoff-1184> I agree
20:49 < craigcitro-1231> ok, i need an opinion here.
20:49 < craigcitro-1231> if you have a polynomial defined over a number field, and you ask to factor it, we have pari actually do the factoring
20:49 < mabshoff-1184> 1342: both patches I assume.
20:50 < craigcitro-1231> unforttunately, the function we were using caused a weird error (that we're going to report to pari)
20:50 < craigcitro-1231> this was the content of #1129
20:50 < was-1160> yes, both patches.
20:50 < craigcitro-1231> so i changed this to a different function, which the documentation actually claims is faster in general
20:50 < mabshoff-1184> ok
20:50 < craigcitro-1231> so it's a good thing all around
20:50 < craigcitro-1231> but now i have a weird problem with variable priorities in pari
20:51 < craigcitro-1231> we create the pari version of the polynomial with whatever name the variable had
20:51 < was-1160> craig -- good work.
20:51 < was-1160> But regarding variable priorities, there are/were/have been/ lots of places in sage where we have to change the variables
20:51 < was-1160> in a funny way in order to use pari, then change them back.
20:51 < was-1160> it's a pain in the ass.
20:52 < craigcitro-1231> yeah, it's a pain
20:52 < cwitty-1357> Maybe we should just always translate the variables when we go to pari?  Never, ever try to preserve the name?
20:52 < craigcitro-1231> so as i was typing that, i realized i was confused about where i was having a variable collision
20:53 < mabshoff-1184> 1342 is done
20:53 < roed_> mabshoff-1184: I have another patch coming for 787
20:53 < craigcitro-1231> ah, but i do still have the problem. the point is that if the number field's defining polynomial is in x, it causes us trouble
20:54 < mabshoff-1184> roed_: No problem. make sure it is relative to the bundle ;)
20:54 < mabshoff-1184> best to send me a patch, that way I can dry-run before I apply.
20:54 < roed_> I'll just send you a patch.  It won't be relative to the bundle
20:54 < mabshoff-1184> ok, we will work it out.
20:54 < roed_> Since I can't apply the bundle: I don't have a fully upgraded version of sage
20:54 < craigcitro-1231> it's just not clear what a clean way to do it is.
20:55 < mabshoff-1184> roed_: np
20:55 < was-1160> craigcitro -- pari is a pain in the ass.
20:55 < roed_> It will be against 2.8.13 with the three patches applied
20:55 < craigcitro-1231> was-1160: snic ... exactly.
20:55 < mabshoff-1184> That should do the trick.
20:55 < was-1160> But vastly less a pain in the ass than writing everything from scratch would be.
20:56 < craigcitro-1231> true
20:57 < mabshoff-1184> was-1160: 1349 is also going in?
20:57 < mabshoff-1184> Patch looks good to me.
20:57 < mabshoff-1184> Did you test it ;)
20:58 < was-1160> I hope so.
20:58 < was-1160> I tested it a lot myself.
20:58 < was-1160> it was actually more difficult than expected as I found from testing.
20:58 < mabshoff-1184> ok, ... this is alpha2, so something needs to be broken.
20:58 < was-1160> But I think somebody besides me better at least try it.
20:59 < mabshoff-1184> After all, otherwise people get spoiled.
20:59 -!- mabshoff-1184 is now known as mabshoff
20:59 < jkantor> does this include the atlas stuff?
20:59 < mabshoff> Nope, that is coming next.
20:59 < jkantor> ok, I'll wait till that one :)
20:59 < mabshoff> i.e. once I catch some sleep, but if somebody else wants to take over.
20:59 < mabshoff> It really depends on PolyBoRi and Singular.
21:00 < mabshoff> If they don't show up tomorrow and ATLAS works: release tomorroe.
21:00 < mabshoff> Otherwise: release one or two days later.
21:00 < mabshoff> We closed 45 tickets, so it is certainly a solid release.
21:00 < jkantor> cool
21:01 < mabshoff> And there will be another release in a couple days anyway.
21:01 < mhansen-962> #1290 can go in.
21:01 < mabshoff> mhansen-962: ok.
21:01 -!- mhansen-962 is now known as mhansen
21:01 < mabshoff> Currently re-building NTL, but that should be done soon.
21:02 < mabshoff> I am no longer sleepy, so I can probably work on this release for a couple more hours ;)
21:02 < mabshoff> I think it is 9pm on the west coast?
21:02 < mhansen> Yep
21:02 < cwitty-1357> Yes.
21:03 < mabshoff> Well, in that case we can keep going :)
21:03 < mabshoff> somebody idle should test 1349 locally.
21:04 < mhansen> Will do
21:04 < mabshoff> mk
21:04 < mabshoff> Excellent
21:06 < cwitty-1357> Somebody should review 1292, since the bug is marked "critical".
21:06 < mhansen> #1349 works for me.
21:06 < mabshoff> ok, it is merged.
21:07 < mhansen> I'm looking at #1292 
21:08 < mabshoff> ok, 1290 is going in next.
21:08 < mabshoff> On the short list: 1292 and 1160.
21:08 < mhansen> cwitty-1357: Where is the implementation of the naive method for 1292?
21:08 < mhansen> Was it already in?
21:08 < cwitty-1357> Yes, it was already there.
21:09 < mhansen> Oh, okay.
21:09 < mhansen> Then #1292 looks good to me.
21:09 < mabshoff> Good, I am getting a bite for breakfast, back in 10-15. Then I will merge
21:12 < mhansen> mabshoff: I think #1201 can go in too.
21:14 < jason--> is the request in 1347 implemented in 1349 (is the directory containing the notebok printed?)  It looks like it from the patch..
21:16 < was-1160> I make it print the notebook directory on startup indeed.
21:16 < jason--> okay, I'll mark 1347 as a dup.
21:17 < mhansen> I'd mark it as fixed and say the patch for #1349 fixed it.
21:17 < jason--> okay, I'll do that instead.
21:17 < was-1160> sounds good.
21:17 < roed_> was-1160: the rest of 787 looks good
21:17 < was-1160> thanks for refereeing it!
21:17 < roed_> sure
21:18 < roed_> :-)
21:18 < roed_> I'm sure you'll be willing to return the favor for the upcoming padic patch
21:18 < roed_> ;-)
21:18 < was-1160> noooooo!!!!!
21:18 < was-1160> :-)
21:19 < roed_> Hey.  At least I won't bunch the p-adic patch and Robert and my coercion patch into one
21:19 < roed_> ;-)
21:20 < mabshoff> that would be truly evil ;)
21:20 < roed_> :-D
21:20 < mhansen> mabshoff: #1208 works for me.
21:23 < mabshoff> mhansen: you mean applying the bundle and testing it?
21:24 < mhansen> Yeah (against alpha1)
21:24 < mabshoff> Sure, nobody did touch matrix[n].pyx, so it should be smooth
21:25 < jason--> General question: are there any objections to using the threading module in python?  Or more specifically, the Timer module?  It allows for multiple threads that take turns with the global interpreter lock in python.
21:26 < mabshoff> There are 3 doctest failures in sage/modules/quotient_module.py 
21:26 < mabshoff> see http://trac.sagemath.org/sage_trac/ticket/1364
21:27 < mabshoff> I guess the 2 hashing issues are trivial, but I am not sure about the other one.
21:27 < was-1160> I've posted the fix for #1160.
21:28 < mhansen> mabshoff: #1201 works for me against alpha1.
21:28 < cwitty-1357> jason-- I'm afraid that there may be lots of code in Sage that's not thread-safe.
21:28 < mabshoff> mhansen: ok
21:28 < cwitty-1357> Maybe if the extra threads only do very restricted things, it would be OK.
21:28 < jason--> My understanding is that python will not interrupt a c extension.  Would that take care of things?
21:28 < mabshoff> ok: merge after testall finishes: 1160, 1201, 1208, 1290, 1292
21:28 < roed_> I doubt it
21:29 < mabshoff> wait for fix for 1364
21:29 < was-1160> jason--: sage is very very very non-thread safe because of the interfaces, among other things.
21:29 < was-1160> Two sage threads talking to one copy of the maxima interpreter -- it just doesn't make sense.
21:30 < jason--> right. hmm.
21:30 < cwitty-1357> And anything that uses a global variable would have to be checked.
21:30 < was-1160> I've posted #1160, and will now move on.
21:30 < mabshoff> om
21:30 < mabshoff> ok
21:31 < mabshoff> was-1160: Did you see http://trac.sagemath.org/sage_trac/ticket/1364 ?
21:31 < was-1160> Oh, that's not surprising.  
21:32 < was-1160> Those doctests for hashing always have to be done on both 32 and 64-bit.
21:32 < was-1160> I forgot to do that.
21:32 < was-1160> I'll post a patch in a second.
21:32 < mabshoff> the hashing is a non issue, the switched sign?
21:32 < mabshoff> ah, ok
21:32 < was-1160> When you compare objects of different types then the result is platform dependent.
21:32 < mabshoff> good to know.
21:34 < was-1160> patch up for #1364
21:34 < mabshoff> mk
21:35 -!- was-1160 is now known as was-799
21:36 < was-799> I'm going to look at http://trac.sagemath.org/sage_trac/ticket/799 which is about some funny issue with the tachyon ray tracer.
21:36 -!- cwitty-1357 is now known as cwitty-1363
21:36 < was-799> Somebody wrote in a solution, so implementing it should be easy.
21:36 < cwitty-1363> mabshoff, I've created new tickets for the issues robertwb raised on #1275.  Should I go ahead and close 1275?
21:37 -!- roed_ is now known as roed-1128
21:37 < mabshoff> sure
22:00 < craigcitro-1231> so i need one more opinion
22:01 < craigcitro-1231> if i'm asking to factor, say, x^2-1/36
22:01 < craigcitro-1231> what should it return?
22:01 < mabshoff> ok, I merged 1160, 1201, 1208, 1290, 1292 and 1364
22:01 < cwitty-1363> This is for number fields, right?
22:01 < craigcitro-1231> (x-1/6) * (x+1/6) ... (1/6*x-1/36)(6x+1) ... 
22:02 < craigcitro-1231> yeah, number fields
22:02 < was-799> craigcitro -- I think it is ok to return unit * blah.
22:02 < cwitty-1363> I think it should return (x - 1/6) * (x + 1/6), the same as over QQ['x'].
22:02 < craigcitro-1231> well, it's really for factoring any polynomial over number fields
22:02 < was-799> Where the unit isn't well defined.
22:02 < was-799> Though the *optimal* choice would be 1 for QQ.
22:02 < was-799> So year, do what cwitty says.
22:02 < craigcitro-1231> k
22:02 < cwitty-1363> Over QQ, it always returns monic polynomials, and whatever other factor there is gets returned as the unit.
22:02 < was-799> that's definitely most expected.
22:03 < craigcitro-1231> nod
22:04 < was-799> I've posted a fix for #799.
22:04 < was-799> Maybe cwitty would like to look at it.
22:04 < was-799> I just basically implemented what Lief wrote in to suggest.
22:05 < mabshoff> Anybody want to review http://trac.sagemath.org/sage_trac/ticket/1296?
22:05 < mabshoff> It is a 4400x times speedup by robertwb
22:06 < mhansen> I'll look at it now.
22:06 < cwitty-1363> I'll look at #799 in a few minutes.
22:06 < was-799> re, #1296 -- Finally!!!!!
22:06 < was-799> I've asked people to implement this like 20 times over the last year.
22:07 < mabshoff> :)
22:07 < was-799> mhansen -- you're definitely the person to look at that patch by the way.
22:07 < mabshoff> Maybe you should complain in IRC liek I do ;)
22:07 < was-799> 1296-fast-permgroup.patch  is funny -- it's so red (so much code deletion)
22:07 < mabshoff> was-799: Jen also posted an interesting patch.
22:08 < was-799> which one?
22:08 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1287
22:08 < mabshoff> And there is also that Simon-Descent ticket by Robert.
22:08 -!- was-799 is now known as was-1287
22:08 < was-1287> OK, I'll referee it now.
22:08 < mabshoff> :)
22:08 < mabshoff> There are only a couple patches left.
22:09 < mabshoff> Might as well merge the good ones :)
22:09 < mabshoff> I doctested after I merged the last 6 patches, so I can merge again in about 15 minutes.
22:09 < mabshoff> mhansen: If you want to do me a really, really big favor get the fast doctesting working.
22:10 < cwitty-1363> Yes!  Please work on fast doctesting, mhansen.
22:10 < mabshoff> It would help tremendously to doctests much more often, i.e. every 3,4 patches.
22:10 < mhansen> I was working with that earlier, but the newer version of nose broke some things.
22:10 < mabshoff> ok
22:10 < mhansen> I'll do it some more after I look at #1296
22:10 < mabshoff> Well, next time I chair I won't wait 4 days until I start merging.
22:11 < mhansen> I'd like to do a release when I have a bit more time later in December.
22:14 < roed-1128> Anyone want to review http://trac.sagemath.org/sage_trac/ticket/1128?
22:14 < was-1287> mhansen -- you should definitely do a release -- let us know as soon as you want to do it.
22:15 < was-1287> By the way, any thoughts on http://trac.sagemath.org/sage_trac/ticket/1366
22:15 < was-1287> sage has functors?
22:16 < mabshoff> lol
22:16 < mhansen> The functors used in the new coercion model?
22:16 < was-1287> road-1128: There are four new functions in #1128 that don't have any doctests.
22:16 < craigcitro-1231> robertwb, you still around?
22:17 < robertwb> yep
22:17 < mabshoff> was-1287: I think your maxima patch reverted something from mhansen's patches.
22:17 < was-1287> Also, doctests are supposed to be indented 4 spaces more than EXAMPLES: but they aren't indented in #1128.
22:17 < robertwb> well, actually I'm not "still" around--I just got back litterally 5 min ago
22:17 < cwitty-1363> I'm thinking that 1366 looks a lot like 1332...
22:17 < craigcitro-1231> the comment you made in 1129 -- "it seems to work for me" -- was that about the patch or the bit of pari?
22:17 < was-1287> Ah, I figured it was a dup, but couldn't find 1332.
22:18 < was-1287> I'm  makring 1332 as a dup.
22:18 < robertwb> I applied the patch, and the factor command worked for me. 
22:18 < was-1287> mabshoff -- what do you think I reverted?
22:18 < robertwb> But I though someone more knowledgable about pari might want to comment on the change of functions
22:18 < was-1287> My maxima patch only touched maxima I think.
22:18 < was-1287> I wonder what mhansen touched.
22:18 < mabshoff> I don't know yet. Looking.
22:19 < mabshoff> It shouldn't have merged cleanly if it was a direct conflict.
22:19 < craigcitro-1231> yeah ... cwitty pointed out earlier that i'm often making multiple calls to nfinit, which i fixed. however, there's an annoying issue coming up still that i'm having to write more than i'd like to fix, namely with non-integral polynomials and pari ;)
22:19 < mhansen> was-1287: Which patch was yours? I can take a look
22:19 < mabshoff> But the same thing about recursion depth exceeded in two tests.
22:19 < roed-1128> cwitty-1363: I'm looking at 1144 (coercion between real quad double field and real_mpfr)
22:20 < cwitty-1363> roed-1128: I don't like the name "algebraic closure"; because my new QQbar is the algebraic closure of QQ, but it's not at all the same operationally.
22:20 < roed-1128> It should only coerce from real fields of precision >= 215
22:20 < mhansen> robertwb: I get a Cython error with your permgroup stuff. "cdef MonoidElement _mul_c_impl(left, MonoidElement _right):" -- Syntax error in C variable declaration.  Does it need to know about MonoidElement somehow?
22:20 < roed-1128> what is QQbar?
22:20 < cwitty-1363> roed-1128: the algebraic closure of QQ (with an embedding into the complex numbers).  sage/rings/qqbar.py
22:21 < mhansen> mabshoff: Which of William's patches do you think broke things?
22:21 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1160 I believe
22:21 < cwitty-1363> For #1128, how about calling it the AdjoinIFunctor, or something like that?
22:21 -!- rlm-1360 is now known as rlm-1361
22:21 < roed-1128> I don't see sage/rings/qqbar.py
22:22 < cwitty-1363> It's new in 2.8.15.  It's in alpha1 and alpha2.
22:22 < mabshoff> mhansen: maybe not, but I think that is the only one related to calculus.
22:22 < roed-1128> I don't like AdjoinIFcuntor
22:22 < cwitty-1363> I mean alpha0 and alpha1.
22:22 < roed-1128> It's more general than that
22:22 < mhansen> mabshoff: I don't see anything in #1160 that'd do it.
22:23 < mabshoff> Me neither. Let's wait for the doctest to finish, so I can out the log up.
22:23 < cwitty-1363> Do you mean that "algebraic closure" is more general than "adjoining I"?
22:24 < roed-1128> yes
22:24 < mabshoff>       File "sage_object.pyx", line 312, in sage.structure.sage_object.SageObject._maxima_
22:24 < mabshoff>       File "sage_object.pyx", line 252, in sage.structure.sage_object.SageObject._interface_
22:24 < cwitty-1363> If so, that's sort of my point; I want to use the less general concept for pragmatic reasons.
22:24 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/site-packages/sage/interfaces/maxima.py", line 378, in __call__
22:24 < mabshoff>         return Expect.__call__(self, x)
22:24 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/site-packages/sage/interfaces/expect.py", line 738, in __call__
22:24 < mabshoff>         return cls(self, x)
22:24 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.8.15/sage-2.8.15.alpha2/local/lib/python2.5/site-packages/sage/interfaces/expect.py", line 989, in __init__
22:24 < mabshoff>         raise TypeError, x
22:24 < mabshoff> So it is about the maxima interface.
22:24 < roed-1128> I'm want to take a look at qqbar
22:24 < roed-1128> just a bit
22:25 < cwitty-1363> Otherwise I'm afraid the coercion model will end up automatically constructing coercions that go through QQbar, which will probably be very inefficient.
22:26 < mabshoff> Yep, just hand another one of the "recusion depth exceeded" and it points to the maxima interface.
22:26 < roed-1128> I don't think it will
22:26 < roed-1128> Well, maybe
22:27 < roed-1128> Is there somewhere I can read the qqbar.py code without waiting for sage-2.8.15-alpha1 to finish building?
22:27 < robertwb> mhansen: did you apply all the patches? 
22:27 < mabshoff> There is a patch at 1275
22:27 < mhansen> robertwb: Yep, and they all applied cleanly.
22:28 < robertwb> but it won't compile?
22:28 < mhansen> Nope
22:28 -!- jason-- [n=jason@12-210-255-80.client.mchsi.com] has quit [Remote closed the connection]
22:28 < mhansen> That line is the only place MonoidElement is referenced.
22:28 < robertwb> is it cimported in the pxd file?
22:28 < cwitty-1363> roed-1128, or to read the whole file, it's at http://sage.math.washington.edu/home/cwitty/sage-2.8.15.alpha0/devel/sage-main/sage/rings/qqbar.py
22:30 < mhansen> robertwb: Is there supposed to be a permgrp_element.pxd file?
22:31 < robertwb> yes. Oh, is it not there?
22:31 < mhansen> Nope
22:31 < robertwb> d'oh. I'll add it
22:31 < mhansen> Then, if I get everything to work, I'll make one big patch.
22:31 < robertwb> uh huh
22:31 < robertwb> I did patches 'cause it was on top of something else
22:32 < robertwb> btw, was, did you ever get the hg inspection to work?
22:33 < cwitty-1363> I have some patches posted, that I forgot to ask for reviews on.
22:33 < cwitty-1363> Does anybody want to review #1162 (RQDF->RealField coercion)?
22:34 < robertwb> mhansen: it's there now. BTW, MonoidElement is the superclass of GroupElement
22:34 < mhansen> Yeah, I knew that ;-]
22:34 < cwitty-1363> Or #1357 (add support for ring=QQbar to the polynomial .roots() command)?
22:34 < cwitty-1363> Or #1363 (add .sqrt() to complex intervals)?
22:35 < robertwb> roed, cwitty: I think AlgebraicClosureFunctor is probably the right thing, it is the algebraic closure of R. 
22:36 < was-1287> #1287 -- I refereed it; it has a serious bug, so can't go in until it gets addressed.
22:36 < cwitty-1363> It's certainly mathematically correct; I'm just worried about the pragmatic issues.
22:36 < mabshoff> mk
22:36 < roed-1128> So the problem would be if there were two construction towers
22:37 < mabshoff> was-1287: your maxima patch causes doctest failures.
22:37 < mabshoff> recusion depth exceeded ...
22:37 < roed-1128> And we eventually implement QQ.algebraic closure as QQbar
22:38 < roed-1128> I suspect it will depend on the relative ranks of algebraic closure and completion
22:38 < roed-1128> If completion happens first then we never go through QQbar implicitly
22:39 < roed-1128> cwitty-1363: can you actually come up with an example one would get an element of QQbar implicitly?
22:41 < cwitty-1363> Probably not.
22:41 < cwitty-1363> I didn't really understand the "ranks" part of the new coercion stuff; so if you say it can be tweaked to work, I believe you.
22:42 < roed-1128> robertwb, my intuition is that it should be fine
22:42 < robertwb> it being ?
22:43 < roed-1128> We won't implicitly be constructing elements of QQbar if we use the same construction functor for RDF->CDF, RR->CC, and QQ->QQbar
22:43 < robertwb> No, though the rank of CompletionFunctor needs to be lower
22:43 < roed-1128> lower than algebraic completion you mean
22:43 < robertwb> yes
22:43 < robertwb> which it isn't now
22:44 < roed-1128> Right.  I made it 3 so that algebraic completion would subsume algebraic extensions
22:44 < robertwb> Actually, if you have CC
22:45 < robertwb> Then you have QQ -> RR -> CC, so completion would always happen first, not matter what the ranks
22:45 < roed-1128> right
22:47 < cwitty-1363> So it will do something sensible with QQbar(1) + CC(1) (give a CC result)?
22:47 < robertwb> This makes more sense than QQ -> QQbar -> CC, because there is only a single (binary) choice for RR -> CC, but a huge unwieldily group of choices for QQbar -> CC
22:47 < cwitty-1363> Well, there's only one choice for MY QQbar -> CC.
22:47 < robertwb> Yes, as long as the coercion QQbar(1) -> CC is defined
22:47 < cwitty-1363> If somebody wants a QQbar without embedding, they'll have to write it themselves.
22:48 < robertwb> cwitty: do you ever expose your embedding (other than in printing?)
22:48 < mabshoff> Ok, failed doctests:
22:48 < mabshoff>         sage -t  devel/sage-main/sage/misc/functional.py
22:48 < mabshoff>         sage -t  devel/sage-main/sage/calculus/calculus.py
22:48 < mabshoff>         sage -t  devel/sage-main/sage/calculus/wester.py
22:48 < mabshoff>         sage -t  devel/sage-main/sage/interfaces/maxima.py
22:48 < cwitty-1363> All over the place.
22:48 < mabshoff> 2.8MB log at: http://sage.math.washington.edu/home/mabshoff/test-2.8.15.alpha2.log
22:48 < mabshoff> patches welcome :)
22:48 < robertwb> or could Gal(Qbar/Q) actually act on elements of (your) QQbar?
22:48 < cwitty-1363> QQbar can be (explicitly or implicitly) coerced to CC.
22:49 < cwitty-1363> The __pow__ method on QQbar uses the embedding to select a particular root to return.
22:49 < robertwb> ah
22:49 < cwitty-1363> To construct a QQbar, you need to select a particular root of a polynomial with a complex interval.
22:49 < robertwb> yes, it does make a choice that sqrt(-3) * sqrt(-2) == -sqrt(6)
22:50 < cwitty-1363> QQbar objects have a "conjugate()" method.
22:50 < cwitty-1363> (That implements the complex conjugate.)
22:51 < cwitty-1363> QQbar objects have "abs" and "norm" methods that act like CC.
22:52 < cwitty-1363> Really, my entire interest in the subject is in defining the real varieties of systems of polynomials with rational coefficients.
22:52 < cwitty-1363> So a version of AA without the embedding is useless to me.
22:53 < robertwb> makes sense
22:53 < was-1287> mabshoff -- my patch must do that -- I'll take a look.
22:54 < mabshoff> Thanks.
22:54 < mabshoff> Do we have any more patches qued to go in?
22:54 < mhansen> I'm just going through #1296 now.
22:54 < mabshoff> ok
22:54 < cwitty-1363> I'll probably have #799 reviewed in a few minutes.
22:55 < mabshoff> Excellent.
22:55 < mabshoff> I already mentioned in the alpha2 announcement that Bug Day 6 rocked!
22:55 -!- was-1287 is now known as was-1160-revisit
22:55 < mabshoff> :)
22:56 < robertwb> I'm looking at #1174, very small and looks good
22:57 < mabshoff> Well, we can certainly merge another batch of patches :)
22:59 < cwitty-1363> I'm still looking for reviewers for 1162, 1357, and 1363.
22:59 -!- roed-1128 is now known as roed-1242
23:00 < roed-1242> was-1160-revisit: I think I'm going to try to fix residue fields
23:00 < was-1160-revisit> Which fix?
23:01 < was-1160-revisit> Do you mean implement general quotients, or do you mean fix the printing?
23:01 < roed-1242> general quotients
23:01 < roed-1242> what's wrong with the printing?
23:01 < was-1160-revisit> 'cause I was just thinking about implementing residue fields in general too?
23:01 < roed-1242> Maybe I can fix that along the way
23:01 < roed-1242> Well then.  :-)
23:01 < was-1160-revisit> roed -- we discussed printing above and came up with a nicer way to print them, remember.
23:01 < was-1160-revisit> But I would be fine doing something else.
23:01 < was-1160-revisit> I have thought through how to do general reduction though.
23:01 < was-1160-revisit> At least in theory.
23:02 < was-1160-revisit> Unfortunately, that was a month ago.
23:02 < roed-1242> Yeah, same
23:02 < was-1160-revisit> But I thought about how to reduce it all to just linear algebra mod p, basically.
23:02 < was-1160-revisit> Did you?
23:02 < roed-1242> why don't we figure out what should be done
23:02 < was-1160-revisit> ype.
23:02 < roed-1242> nope
23:02 < was-1160-revisit> ok.  let me upload a fix for the 1160 breakage first.
23:02 < mhansen> robertwb: I get a few minor formatting errors and a segfault.
23:02 < robertwb> argh
23:03 < robertwb> do you have an example? 
23:03 < roed-1242> I already fixed the quotient of vector spaces printing problems
23:03 < mhansen> Finding it now.
23:03 < was-1160-revisit> chris wuthrich also ran into a roadblock in his research because of missing residue fields in general.
23:03 < was-1160-revisit> So it is really really needed.
23:03 < was-1160-revisit> roed-1242: good.
23:04 < roed-1242> Alright.  So, we start with an order which may or may not be maximal
23:04 < roed-1242> And a prime ideal
23:04 < was-1160-revisit> We start with a prime p and an order that definitely *is* p-maximal.
23:04 < roed-1242> Does pari automatically construct the maximal order when you do prime factorization?
23:05 < roed-1242> Fine: I was going back one step
23:05 < was-1160-revisit> We have to worry about how a prime ideal is represented -- let's just say an HNF basis.
23:05 < was-1160-revisit> Regarding whether or not pari forces maximal when factoring -- it's not too important, since we could easily implement
23:05 < roed-1242> Is that the default output of factor from pari?
23:06 < was-1160-revisit> an algorithm for factoring from scratch that doesn't force factoring.
23:06 < roed-1242> sure
23:06 < was-1160-revisit> which trac ticket are we working on?
23:06 < roed-1242> 1183 or 1242
23:06 < roed-1242> I think they're basically the same problem
23:07 -!- was-1160-revisit is now known as was-1183
23:07 < was-1183> let's call it #1183.
23:07 -!- roed-1242 is now known as roed-1183
23:08 < was-1183> sage: K.<z> = CyclotomicField(7)
23:08 < was-1183> sage: P = K.factor_integer(13)[0][0]
23:08 < was-1183> sage: P.pari_hnf()
23:08 < was-1183> [13, 0, 1, 10, 8, 10; 0, 13, 3, 5, 8, 12; 0, 0, 1, 0, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 1]
23:08 < was-1183> I think the first thing we should implement is a function I.free_module() that returns a ZZ-module that represents the ideal
23:08 < was-1183> as a ZZ-submodule of K.vector_space().
23:09 < roed-1183> ok
23:09 < was-1183> Alternatively, I.free_module() could be in terms of K.maximal_order().basis()
23:09 < was-1183> I'm not sure which is best.
23:09 < was-1183> I don't like the latter actually, since it could be very expensive to compute, *and* it is confusing.
23:09 < roed-1183> yes
23:09 < was-1183> Since you have to think about multiple bases.   It's what MAGMA/PARI do, though.
23:09 < was-1183> OK. so we implement I.free_module() first.
23:10 < was-1183> We also implement O.free_module() for O any order.
23:10 < roed-1183> Though one should be able to also create I as a submodule of a given order
23:10 < was-1183> creating ideals in orders isn't implemented at all at present.
23:10 < mhansen> robertwb: The error is pretty sporadic.
23:10 < was-1183> I think we should worry about that latter, though we should keep it in mind when designing.
23:10 < mhansen> *** glibc detected *** /opt/sage-2.8.15.alpha1/local/bin/python: munmap_chunk(): invalid pointer: 0x0000000001b8ed20 ***
23:10 < mhansen> ======= Backtrace: =========
23:10 < mhansen> /lib/libc.so.6(cfree+0x1b6)[0x2b285e527826]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python[0x435704]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python[0x434164]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalFrameEx+0xb35)[0x481d75]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalFrameEx+0x693e)[0x487b7e]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalCodeEx+0x830)[0x488ca0]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python[0x4d2bac]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyObject_Call+0x13)[0x417b03]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python[0x41e29d]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyObject_Call+0x13)[0x417b03]
23:10 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalFrameEx+0x1c12)[0x482e52]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalCodeEx+0x830)[0x488ca0]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python[0x4d2c0e]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyObject_Call+0x13)[0x417b03]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python[0x41e29d]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyObject_Call+0x13)[0x417b03]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python[0x4599d8]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python[0x45c8d2]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyObject_Call+0x13)[0x417b03]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalFrameEx+0x1c12)[0x482e52]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalCodeEx+0x830)[0x488ca0]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalFrameEx+0x5ee4)[0x487124]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalCodeEx+0x830)[0x488ca0]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalFrameEx+0x5c32)[0x486e72]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalCodeEx+0x830)[0x488ca0]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalFrameEx+0x5c32)[0x486e72]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalCodeEx+0x830)[0x488ca0]
23:11 < mhansen> /opt/sage-2.8.15.alpha1/local/bin/python(PyEval_EvalFrameEx+0x5c32)[0x486e72]
23:11 < mhansen> /opt/sage-2.
23:11 < mhansen> Oops -- sorry about that everyone.
23:11 < mhansen> *** glibc detected *** /opt/sage-2.8.15.alpha1/local/bin/python: free(): invalid next size (fast): 0x000000000244fbe0 ***
23:11 < mhansen> *** glibc detected *** /opt/sage-2.8.15.alpha1/local/bin/python: munmap_chunk(): invalid pointer: 0x0000000001b8ed20 ***
23:11 < was-1183> roed -- http://wiki.sagemath.org/bug6/1183
23:12 < was-1183> roed-1183:
23:13 < roed-1183> ok
23:13 < robertwb> hmm.... 
23:13 < was-1183> the basic idea is that to compute O/I we instead first compute (O mod p) and (Ibar subset O mod p).
23:13 < was-1183> Then we have two F_p vector spaces and compute the quotient of one by the other -- hey we just finished implementing that nicely :-)
23:13 < roed-1183> :-)
23:13 < roed-1183> Though presumably we only do this once
23:13 < was-1183> Once we have that, we "impose* the field structure on Obar/Ibar coming from the ring structure on O.
23:14 < was-1183> That's just a theoretical thing.
23:14 < roed-1183> And find a minimal polynomial
23:14 < mabshoff> was-1183: Did I miss a fix for 1160?
23:14 < was-1183> But if we just choose one random element of O, map it to Obar/Ibar, and see what it's minpoly is, we'll get an isomorphic finite field.
23:14 < was-1183> Viola!
23:14 < roed-1183> Right.  Though we would like to have it be deterministic
23:14 -!- mhansen is now known as mhansen|brb
23:14 < was-1183> mabshoff -- yes, I posted a fix for #1160.
23:15 < mabshoff> ok, testing that now.
23:15 < was-1183> roed -- yep, replace "random" by an element found in order.
23:15 < was-1183> Either you or Robert Bradshaw made exactly the same comment last time this was discussed.
23:15 < roed-1183> And the first thing that we try is the generator of the number field
23:16 < roed-1183> So if the same polynomial reduced mod p works, then we use it
23:16 < was-1183> yep.
23:16 < was-1183> Assuming the nf gen is in O.
23:16 < roed-1183> right
23:16 < was-1183> This algorithm will work for any ideal in any order.
23:17 < roed-1183> yes
23:17 < was-1183> (I.e., it makes sense in more generality...)
23:17 < was-1183> So it's the right way to go.
23:17 < roed-1183> agreed.  So the algorithm:
23:17 < was-1183> When computing the minpoly, I think we do that by computing the matrix whose rows are the powers of the reduction of our candidate.
23:17 < roed-1183> Agreed
23:17 < was-1183> We will have to invert that matrix to write down an explicit isomorphism to a GF(q).
23:17 < was-1183> See the wiki page I posted.
23:18 < roed-1183> (reloaded)
23:18 < was-1183> reload again.
23:18 < was-1183> Let's divvy up the work.
23:18 < cwitty-1363> mabshoff, I like #799.
23:18 < roed-1183> Is I a fractional ideal of K?
23:18 < mabshoff> Ok, the four doctests that used to fail now work again with william's fix.
23:18 < roed-1183> Or is I an ideal of the order
23:19 < was-1183> I is an ideal of the order.
23:19 < roed-1183> I guess it doesn't matter
23:19 < mabshoff> cwitty-1363: ok should I merge now?
23:19 < was-1183> Otherwise it doesn't work.
23:19 < roed-1183> Whatever I is, we just intersect with O
23:19 < was-1183> We could.
23:19 < cwitty-1363> Yes.
23:19 < mabshoff> ok, anybody else?
23:19 < roed-1183> Will intersecting with O cause any problems?
23:20 < was-1183> For everything to work, we'll want it to be a prime ideal for now, since we wnat to just use linear algebra over GF(p).
23:20 < was-1183> We should just require an ideal in O.
23:20 < mabshoff> Ok, looks like we need both patches for http://trac.sagemath.org/sage_trac/ticket/799?
23:20 < roed-1183> Okay.  We can add on more functionality later.
23:21 < was-1183> yep.
23:21 < cwitty-1363> mabshoff, yes, both patches.
23:21 < was-1183> refresh again.
23:21 < mabshoff> np, going in.
23:21 < was-1183> roed -- I can do 1-2, why you do 3-4 assuming 1-2?
23:21 < robertwb> #1174 is ready to merge
23:21 < roed-1183> ok
23:21 < was-1183> 3-4 is the funnest, but 1-2 will be easy for me given what I've been working on today.
23:21 < was-1183> Ok, go.
23:22 < mabshoff> 799 is in.
23:23 < was-1183> great.
23:23 < was-1183> !
23:24 < mabshoff> Well: any more prospects? Otherwise I am about to dump alpha2.
23:24 < robertwb> I'm testing #1128 now, but it looks good
23:25 < mabshoff> ok
23:25 < mabshoff> proof by induction: there is always one more patch to merge ;)
23:26 < robertwb> :), doesn't apply cleanly
23:26 < mabshoff> :(
23:26 < robertwb> roed: abort: unable to find sage/modules/quotient_module.py or sage/modules/quotient_module.py for patching
23:26 < robertwb> I bet I can edit the patch
23:27 < cwitty-1363> Looking at the patch, it doesn't seem like the quotient_module.py portion of it is vital :)
23:27 < mabshoff> ok, let me know if you have anything ready. Doctesting one last time.
23:28 < was-1183> :-)
23:28 -!- cwitty-1363 is now known as cwitty-1365
23:28 < was-1183> it's a space you added?1
23:30 < robertwb> ok, #1128 works great and is ready to go in
23:30 < mabshoff> :)
23:30 < was-1183> (robertwb -- by the way I have to say again I have a strangely very good feeling about that java3d stuff and sage...)
23:31 < rlm-1361> cwitty-1363: since you originally merged in the graph generators, could you please review #1361?
23:31 < rlm-1361> in your leisure...
23:31 < robertwb> :). I plan to get back to it a bit over the break
23:32 < cwitty-1365> robertwb, did you see me mention that I ported sage3d.jar to Jython?
23:32 < robertwb> yeah, pretty interesting
23:32 < robertwb> so, how does one run a Jython script?
23:32 < robertwb> (let alone a Jython applet?)
23:33 < cwitty-1365> Well, to get it to run as an applet, you use the "jythonc" compiler (which compiles to Java source, and then to .class files).
23:33 < cwitty-1365> And then it's just a normal applet.
23:33 < robertwb> huh
23:33 < cwitty-1365> There's also an interactive jython interpreter, that looks and acts a lot like Python.
23:33 < robertwb> well, I'm a fan
23:34 < cwitty-1365> Unfortunately, a lot of stuff (like eval) doesn't work in an applet, due to Java's security restrictions.
23:34 < robertwb> I guess Jython will be another jar to ship load with the applet though
23:34 < cwitty-1365> Yes.  1.2MB
23:35 < was-1183> Is there a Jython runtime jar?
23:35 < robertwb> I think there's hope to to have the client cache it though
23:36 < was-1183> It is amazing how fast every single thing I did with your java3d window has been so far.
23:36 < cwitty-1365> The 1.2 megabytes is the runtime jar.
23:36 < was-1183> It's quite smooth.
23:36 < was-1183> Ah, ok.
23:36 < cwitty-1365> (Well, it includes a lot of stuff that's not useful to us, so we could trim it by hand.)
23:40 < robertwb> mhansen: any more info on that segfault for permutation group elements?
23:40 < was-1183> roberwb -- by the way, thanks for finally implementing fast permutation group elements -- I've asked maybe 20 times for this from many different people...
23:41 < robertwb> It was so insanely slow for what it was doing (I was actually just cleaning up #444) and I figured I could do it faster...
23:41 < mhansen|brb> robertwb:  Nothing yet although I had to take a bit of the break.
23:42 < robertwb> New tagline for cython: "speed up your code 4400x by implementing it in Cython"
23:43 < mabshoff> talk about speed: how about rewriting parts of cython in cython? :)
23:43 < was-1183> I really interesting benchmark would be your permutations versus native gap versus native magma.
23:44 < mhansen|brb> robertwb: It occurs most often in the direct_product_permgroups() function, but that doctest passes fine from the interpreter.
23:45 < robertwb> :(
23:46 < craigcitro-1231> man ... the fact that pari doesn't deal with number fields defined by a non-integral polynomial is incredibly painful at this point. the amount of bookkeeping i have to do to deal with something like factoring x^3-1/5 over x^4 - 1/7 is incredible.
23:48 < cwitty-1365> Craig, there's an implementation of that in qqbar.py; I don't know if there's anything you can use there.
23:48 < was-1183> Now imagine doing all that book-keeping in a painful C code with weird memory "management", and you see why PARI still doesn't do it...
23:48 < was-1183> At least you get to use Python.
23:48 < craigcitro-1231> hah true
23:49 < cwitty-1365> rlm-1361, mabshoff: 1361 looks good.
23:49 < craigcitro-1231> >cwitty-1365: do you move back and forth between pari and python there?
23:50 < mabshoff> cwitty-1365: ok, will merge.
23:50 < cwitty-1365> Yes.  (Not necessarily efficiently, but I do.)
23:51 < craigcitro-1231> sweet. where should i look in here?
23:52 < cwitty-1365> Well, it's sort of scattered.
23:53 < cwitty-1365> Look at the .union() method on AlgebraicGenerator,
23:53 < cwitty-1365> and the exactify() method of ANRoot.
23:53 < cwitty-1365> Plus, I may be doing things totally stupidly anyway.
23:56 < cwitty-1365> And the actual factoring is in the exactify() method of AlgebraicPolynomialTracker, which looks like it uses factornf anyway.
23:56 < cwitty-1365> So maybe the whole "look at qqbar.py" thing was a waste of time.
23:56 < cwitty-1365> (I've been awake too long...)
23:56 < craigcitro-1231> well, something akin to what you do in do_polred is what i want ... but i'm (maybe stupidly) sticking with whatever polynomials pari chooses for these numberfields
23:57 < rlm-1361> ok, i'm done for tonight. thanks for the help everyone
23:57 < cwitty-1365> do_polred can be very slow.
23:57 < craigcitro-1231> it at least confirms that i'm not missing something obvious ;)
23:57 -!- rlm-1361 [n=rlm@c-71-197-245-35.hsd1.or.comcast.net] has quit []
23:57 < mabshoff> cu Robert
23:57 < craigcitro-1231> well, it's more serious than what i need
23:57 < craigcitro-1231> but the two maps between generators are good
23:57 < was-1183> cu
23:58 < craigcitro-1231> i mean, if i have a polynomial in T over a number field in a, and i want to change the representation for the number field
23:58 < craigcitro-1231> there's no painless way to do that, right?
23:58 < was-1183> yes, there is.
23:58 < was-1183> there is a painless way.
23:58 < craigcitro-1231> what's the painless way?
23:58 < was-1183> I added a bunch of nice stuff like that.
23:59 < craigcitro-1231> where? ;)
23:59 < craigcitro-1231> you didn't happen to also write code that deals with switching between integral and non-integral defining polynomials by chance, did you? ;)
23:59 < was-1183> sage: K.<w> = NumberField(x^4 + 1)
23:59 < was-1183> sage: L = K.change_generator(w^3 + 3)
--- Day changed Sun Dec 02 2007
00:00 < was-1183> You could trivially do that using the code I wrote, I think.
00:00 < was-1183> That L above is really a 3-tuple with isomorphisms in both directions.
00:00 < was-1183> So if the defining poly is non-integral, just rescale the gen, then use change_generator.
00:00 < was-1183> I wrote that functionality for your application...   
00:00 < was-1183> Cool, eh?
00:01 < craigcitro-1231> yeah, that seems pretty handy
00:01 < was-1183> I probably should have mentioned that before.
00:01 < craigcitro-1231> the only worry i have is that pari seems to be picking other weird polynomials when i give it a non-monic polynomial
00:01 < craigcitro-1231> (not weird, obv ... just not a scaled version)
00:02 < craigcitro-1231> but i think i could have pari tell me what it wants the number field to look like, create the new NumberField with change_generator
00:02 < craigcitro-1231> and that might be exactly what i need
00:07 < was-1183> you'll have to understand what pari is doing, since change_generator takes as input the generator (not its minpoly), and you want to avoid having to factor.
00:07 < was-1183>    
00:08 < mabshoff> 1128 & 1361 have been merged.
00:11 < craigcitro-1231> when you call nfinit with a non-monic polynomial, it returns a vec of length 2, with the first element a pari_nf, and i'm pretty sure the second is exactly what i need to pass to your change_generator above (except that it's a pari gen, which i need to convert back to python)
00:11 < was-1183> cool.
00:11 < craigcitro-1231> actually, while i'm on the subject -- when you do, it prints a warning message. can we suppress that somehow?
00:11 < was-1183> yes it's possible.  open source :-)
00:13 < craigcitro-1231> hahahahah
00:13 < craigcitro-1231> k
00:13 < craigcitro-1231> well, i'll either have to go make it optional in the pari source, or every time someone factors over a number field with a non-integral poly, they'll get a weird error message
00:14 < cwitty-1365> Craig, look at the documentation for nfinit().  I think in the non-monic case, you want to call it with flags=3.
00:14 < was-1183> it might be that the pari c library has an option to turn of the warning...
00:14 -!- mabshoff_ [n=mabshoff@p5090F7A0.dip.t-dialin.net] has joined #sage-devel
00:15 < craigcitro-1231> >cwitty-1365: yeah, i think that'll kill the warning, since i'll then be explicitly asking it to do what it implicitly does anyway
00:16 < craigcitro-1231> yep. awesome.
00:27 < mabshoff_> ok, alpha2 is out: http://sage.math.washington.edu/home/mabshoff/sage-2.8.15.alpha2.tar
00:27 < mabshoff_> roughly 167MB
00:27 < was-1183> I'll build it on bsd.
00:28 < mabshoff_> Ok, I also announced on sage-devel.
00:28 < mabshoff_> I am catching some sleep now, it is 9:30 am locally.
00:28 < mabshoff_> cu guys in about 8 hours, or maybe not :)
00:28 < was-1183> ok.
00:28 < was-1183> cu
00:28 < mabshoff_> I will go through the tickets and ask for reviews
00:28 < was-1183> good idea.
00:29 < was-1183> should i also start a build on ppc or will you?
00:29 < was-1183> ie on fermat?
00:29 < mabshoff_> If malb or burcin don't answer I would suggest doing 2.8.15 tomorrow.
00:29 < was-1183> ok.
00:29 < was-1183> I'm for that.
00:29 < mabshoff_> Feel free to start onm fermat. I will build on PPC Linux locally.
00:29 < mabshoff_> We can 2.8.16 in a week then.
00:29 < was-1183> I think getting polybori in sage, and changing licenses (to not be gpl v2 compatible anymore) is 2.9 material.
00:29 < mabshoff_> ok
00:30 < was-1183> I don't think we should change license in the 2.8.x series.
00:30 < mabshoff_> If malb fixes http://trac.sagemath.org/sage_trac/ticket/1325 we are very close to 32 bit Solaris.
00:30 < mabshoff_> Yep, that is a good point.
00:30 < mabshoff_> I don't really care about the numbers, but the GPL change should be 2.9.
00:30 < mabshoff_> Oh well, tonight has been fun and really productive.
00:30 < was-1183> definitely very very productive.
00:31 < mabshoff_> :)
00:31 < mabshoff_> I will try to sort out some more Solaris issues in the short term.
00:31 < was-1183> excellent.
00:31 < mabshoff_> If Bill Hart pops up in the next couple hours we should do a FLINT 1.0 spkg - that should build on Solaris.
00:32 < mabshoff_> ok well. cu
00:32 -!- mabshoff_ is now known as mabshoff|asleep
00:33 -!- mabshoff [n=mabshoff@p5090FF9B.dip.t-dialin.net] has quit [Read error: 110 (Connection timed out)]
00:46 < was-1183> I just found a serious bug in my #787 (quotients of vector spaces) implementation while working on #1183.  My quotients of vector spaces implementation
00:46 < roed-1183> yeah?
00:46 < was-1183> need not work over a finite field, since it assumes that dot product of a vector with itsellf is nonzero!
00:46 < roed-1183> ah...
00:47 < was-1183> roed -- by the way, I finisshed step 1and was was working on step 2 trying several example to make sure things were good.
00:47 < roed-1183> That would be an issue for us.
00:47 < was-1183> I need to change the code that extends a list of independent vectors to a basis...
00:47 < roed-1183> ::nod::
00:48 < roed-1183> I'm trying to figure out what the best strategy to search for the necessary element in 4 is
00:48 < was-1183> ah.
00:48 < roed-1183> Start with the number field generator
00:48 < roed-1183> And then you want an element whose powers span O tensor Q
00:49 < was-1183> I would do that, then just use the iterator over GF(p)^n  (i.e., O tensor F_p)
00:51 < roed-1183> Is there an easy map from GF(p^n) back to O?
00:52 < was-1183> There *will* be.
00:52 < was-1183> But it's not GF(p^n) -- it's GF(p)^n.
00:52 < was-1183> Let me paste in the spec.
00:52 < roed-1183> ok
00:53 < was-1183> see http://wiki.sagemath.org/bug6/1183
00:53 < was-1183> not done 
00:53 < was-1183> but should give you an idea.
00:53 < roed-1183> k
00:59 < roed-1183> will quotient_char_p be a class function of an order?
00:59 < roed-1183> Or a module function in residue_field.py
01:00 < was-1183> refresh the wiki.
01:00 < was-1183> it will be a method of an ideal.
01:00 < was-1183> That's for internal use.
01:01 < was-1183> Maybe it should be of an ideal.
01:01 < was-1183> I'm not too worried about that now.  I just want it to work.
01:01 < roed-1183> Okay.  It should return the two morphisms...
01:01 < roed-1183> (which it doesn't in the example)
01:01 < was-1183> yes, but it doesn't yet.  but it will.
01:01 < roed-1183> k
01:01 < was-1183> not implemented.
01:02 < roed-1183> Our design should eventually work for relative extensions, giving a relative extension of residue fields
01:02 < roed-1183> But not yet
01:02 < roed-1183> :-)
01:03 < was-1183> yes.
01:04 < was-1183> ok, I fixed the quotient bug.
01:09 < roed-1183> good
01:25 -!- burcin [i=berocal@leopard.risc.uni-linz.ac.at] has joined #sage-devel
01:32 -!- jkantor [i=jkantor@sage.math.washington.edu] has quit ["leaving"]
01:33 < was-1183> roed-1183: how's it going?
01:33 < roed-1183> Not bad
01:33 < was-1183> I think I'm done with 1 and 2.
01:33 < roed-1183> I'm working on residue_field.pyx
01:34 < roed-1183> 3 is done
01:34 < roed-1183> I'm using a slightly different method for 4:
01:34 < roed-1183> Just use coordinates_in_terms_of_powers from number_field_element
01:36 < craigcitro-1231> man ... i think i'm just about done with this factorization thing.
01:36 < craigcitro-1231> it'd be so much faster if it didn't take upwards of 100 seconds to recompile this one file. ;)
01:36 < roed-1183> yeah, that sucks
01:37 < was-1183> which file?
01:37 < craigcitro-1231> not as bad as changing a decl.pxi in libs/pari or libs/ntl, of course ;)
01:37 < craigcitro-1231> polynomial_element.pyx
01:37 < was-1183> maybe you could copy the relevant code into python, work on it there, then copy it back?  Is it really cython code?
01:38 < was-1183> Sometimes too much of sage code is in cython for no real reason...
01:39 < craigcitro-1231> well, this particular chunk of code ends up making a few pari library calls ... seems better to do that from cython
01:39 < roed-1183> I put up #3
01:41 < was-1183> I'll put up 1/2 in a moment -- I have to fix some doctest failures caused by changing how quotient works.
01:45 < was-1183> This fixes the quotient issue: http://trac.sagemath.org/sage_trac/ticket/1368
01:47 < was-1183> where did you post 3?
01:48 < was-1183> I posted 1-2 here: http://trac.sagemath.org/sage_trac/ticket/1183
01:48 < was-1183> ah, in the wiki.
01:49 < was-1183> roed-1183 -- something looks weird about 3, since it's double spaced partly??
01:49 -!- jkantor [i=jkantor@sage.math.washington.edu] has joined #sage-devel
01:50 < roed-1183> I noticed that.  I don't know why
01:50 < jkantor> did anybody build alpha-2?
01:52 < was-1183> I am trying.
01:52 < was-1183> I actually had a build and am now doctesting it.
01:52 < was-1183> on osx 10.5 intel.
01:53 < was-1183> I did a 64-bit linux build and it built fine and passed all tests.
01:53 < jkantor> on sage.math it fails
01:53 < jkantor> flint still fails 
01:54 < jkantor> and even after I disabled that it still failed
01:55 < was-1183> roed-1183 -- you seem to have ignored the changes I made to residue_field.pyx ?
01:55 < roed-1183> yeah, i realized that.  I will stick them in
01:55 < was-1183> e.g., I changed to use names which is very important so the notation K.<a> = blah... works.
01:55 < roed-1183> I haven't been keeping up to date
01:55 < roed-1183> Yeah, I know
01:55 < roed-1183> I'll fix it
01:55 < roed-1183> :-)
01:55 < was-1183> It was quite hard getting the names stuff right actually; there are lots of little subtle things that can go wrong...
01:56 < was-1183> or maybe I just was slow when I wrote it since the code you wrote was new to me.
02:00 < craigcitro-1231> wahoo! i think i'm done with this crazy changing bases in number fields.
02:01 < was-1183> yeah!
02:04 < was-1183> roed-1183, I did a little cleanup of ResideField (the names and some imports)
02:04 < was-1183> I put it at http://wiki.sagemath.org/bug6/1183
02:04 < roed-1183> cool
02:04 < was-1183> You can take it or ignore it (depending on what you're doing).
02:04 < was-1183> I didn't get it to "work" though.
02:04 < was-1183> It will run but it says the charpoly you get is reducible.
02:04 < roed-1183> I'm still editing the rest of residue_field.pyx
02:05 < was-1183> what are you doing to it?
02:05 < roed-1183> oh
02:05 < roed-1183> no, that shouldn't be the case
02:05 < was-1183> I also added a lot of doctests to it so the coverage is 100%
02:05 < roed-1183> good
02:05 < was-1183> (for the rest of the file.)
02:05 < was-1183> So if you're editing a different version that could be bad.
02:06 < roed-1183> I am, but only source code
02:06 < roed-1183> Not documentation
02:06 < was-1183> ok.
02:06 < was-1183> maybe.
02:06 < was-1183> scary.
02:06 < roed-1183> Can you give me a .patch file or something?
02:07 < was-1183> I was working with people at Reed on Thursday and ran into some major issues with residue_field, which is what I fixed...
02:07 < roed-1183> ok
02:07 < was-1183> It was unpleasant actually...
02:07 < roed-1183> :-/
02:07 < was-1183> since I was in front of several peole.
02:07 < roed-1183> yeah
02:07 < was-1183> http://trac.sagemath.org/sage_trac/ticket/1342
02:08 < was-1183> It turned out to be just that there was an assumption you made (very natural) that stupidly wasn't satisfied by 
02:08 < was-1183> pari_ext elements.
02:08 < was-1183> Fixing it wasn't so hard.
02:11 < was-1183> your algorithm for determining if x generates is wrong, I think.
02:11 < was-1183> I had thought that would work at first.
02:12 < was-1183> never mind, I may be confused.
02:12 < craigcitro-1231> cwitty-1365: you still around?
02:12 < roed-1183> You should figure it out.  :-)  I think it works, though I'm a little uneasy
02:13 < was-1183> deal.
02:14 < craigcitro-1231> well, cwitty-1365 -- if you read this in the morning, could you look at 1129 again and comment on it? i fixed the nfinit thing you pointed out, and (finally) got it working with non-integral polynomials
02:15 < craigcitro-1231> or anyone else reading this, you're welcome to comment on it.
02:19 < craigcitro-1231> was-1183: the version of pari included with sage is the stable branch, right?
02:20 < was-1183> yes.
02:20 < craigcitro-1231> k
02:20 < roed-1183> was-1183: where did you put 1 and 2?
02:21 < roed-1183> Is there a .patch file for those?
02:21 < was-1183> http://trac.sagemath.org/sage_trac/ticket/1183
02:23 < was-1183> roed -- I'm working on the ResidueField function, fyi...
02:25 < roed-1183> what about it?
02:25 < roed-1183> I'm not working on it more at this point
02:25 -!- jkantor [i=jkantor@sage.math.washington.edu] has quit ["leaving"]
02:25 < was-1183> dang; now I have to figure it out :-)
02:30 < was-1183> it's working now, maybe.
02:30 < was-1183> sage: K.<a> = NumberField(x^3-875); P = K.ideal(5).factor()[0][0]; k = K.residue_field(P); k
02:30 < was-1183> Residue field in abar of Fractional ideal (5, -2/25*a^2 - 1/5*a + 2)
02:30 < was-1183> sage: k.polynomial()
02:30 < was-1183> abar^2 + 3*abar + 4
02:30 < was-1183> sage: k.0^3 - 875
02:30 < was-1183> 2
02:31 < was-1183> Of course "abar" isn't the reduction of a.
02:35 < roed-1183> ::nod::
02:35 < roed-1183> I found a bug.  Fixing it now
02:35 < roed-1183> (raising 0^0)
02:35 < was-1183> I got that already.
02:35 < roed-1183> ok
02:35 < was-1183> I should send you an update.
02:35 < roed-1183> Sounds good
02:36 < was-1183> how?
02:36 < was-1183> I can give you a patch or the whole file or?
02:36 < roed-1183> patch probably
02:36 < roed-1183> Though I don't understand why it's working for you unless you changed other things
02:36 < was-1183> the patch will be against vanilla + #1342, ok?
02:36 < roed-1183> sure
02:36 < roed-1183> Then I'll put up a patch too
02:39 < was-1183> ok, I've posted it at http://trac.sagemath.org/sage_trac/ticket/1183
02:39 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has left #sage-devel []
02:39 < was-1183> it is: trac-1183-through_step_3.patch 
02:40 < was-1183> O
02:40 < was-1183> I'm just working on the explicit maps now.
02:45 < roed-1183> what explicit maps?
02:45 < roed-1183> I already have some of that
02:45 < craigcitro-1231> fixed 1231 (it was a <20 char fix) -- can someone look at it when they have a spare min?
02:45 < was-1183> roed -- I almost almost done implementing explicit maps.
02:46 < roed-1183> what do you mean by explicit maps?
02:46 < was-1183> Given P we need explicit (partial) maps and sections from K --> O_K/P and from O_K/P --> O_K.
02:47 < roed-1183> You mean to fix NFHomomorphism
02:47 < roed-1183> I've already done that
02:47 < was-1183> I think it would be good to have available a partial map from K (not just from O_K).  
02:47 < roed-1183> sure
02:48 < roed-1183> certainly OK.residue_field(5)(K(4/7)) or something should work
02:48 < was-1183> ok.
02:49 < was-1183> so you've rewritten NFResidueFieldHomomorphism.
02:49 < roed-1183> yeah
02:49 < was-1183> Did you do that by computing the power basis matrix again and inverting it?
02:49 < roed-1183> And the __init__ methods for the different residue fields
02:50 < was-1183> Did you do that by computing the power basis matrix again and inverting it?
02:50 < roed-1183> I used coordinates_in_terms_of_powers
02:50 < was-1183> ???
02:50 < was-1183> How can that possibly work.
02:50 < was-1183> Oh, since the its the powers of something arbitrary.
02:50 < roed-1183>     def __init__(self, k, p, x, im_gen):
02:50 < roed-1183>         self.im_gen = im_gen
02:50 < roed-1183>         if not is_FiniteFieldElement(im_gen):
02:50 < roed-1183>             raise TypeError, "im_gen must be a finite field element"
02:50 < roed-1183>         (<Element>self.im_gen)._set_parent_c(k)
02:50 < roed-1183>         self.p = p
02:50 < roed-1183>         self.x = x
02:50 < roed-1183>         self.R = PolynomialRing(k, 'x')
02:50 < roed-1183>         self.to_list = x.coordinates_in_terms_of_powers()
02:51 < roed-1183>         ResidueFieldHomomorphism.__init__(self,Hom(p.number_field().maximal_order(), k, Rings())) # should eventually change to p.order()                                
02:51 < roed-1183> Where are you editing?
02:52 < roed-1183> My import of 1342 failed and I had to do some stuff manually.  So I can offer a patch against sage without 1342 or any of our work.  Or I can just put things for you to insert manually and then you can release a final patch
02:53 < was-1183> Probably safest right now is the latter.
02:53 < roed-1183> ok
02:53 < roed-1183> I'll put them on the wiki page at the bottom
02:53 < was-1183> ok.
02:53 < was-1183> I am having some small worry about the coordinates_in_terms_of_powers function, for efficiency reasons.
02:54 < was-1183> Typically power basis can be vastly more nasty size-wise than say the basis for the ring of integers.
02:54 < was-1183> Also, all the data needed to do the reduction using the ring of integers basis is already computed (in order to those to_vs and to_order maps).
02:54 < was-1183> I think coordinates_in_terms_of_powers basically takes all the powers of an element and inverts the matrix of those powers.
02:55 < was-1183> It seems to me that it would be better to do that arithmetic mod p.
02:55 < was-1183> Do you know what I mean.
02:55 < craigcitro-1231> was-1183: i have a modular symbols question for you when you have a sec. (i'm going to start glancing in your book in the interim.)
02:57 < was-1183> If PB is the power basis matrix mod p, then:
02:57 < was-1183>             # The reduction map is just x |--> k(to_vs(x) * (PB**(-1)))
02:57 < was-1183>             # The lifting map is just x |--> to_order(x * PB)
02:57 < craigcitro-1231> actually -- do you talk about modular symbols over an arbitrary base ring in your book?
02:57 < was-1183> no
02:58 < craigcitro-1231> grin ... k
02:58 < craigcitro-1231> lemme dig out gabor's notes. ;)
03:00 < roed-1183> sure.  That sounds better
03:00 < roed-1183> So if you want you can just ignore my changes if you've already done that
03:01 < was-1183> But I can see why you liked coordiantes_in_terms_of_powers since it fits so well with the rest of your code.
03:01 < was-1183> And in the special case when the gen works, we have to not do something inefficient.
03:02 < roed-1183> yeah
03:02 < was-1183> So I guess we need two types of NFResidueFieldHomomorphism?
03:02 < was-1183> Then we pass one of those into the __init__ for each wrapper class.
03:03 < roed-1183> can't do it that way
03:03 < was-1183> why?
03:03 < roed-1183> The field has to be created first
03:03 < roed-1183> since it's the domain of the morphism
03:03 < roed-1183> Well, I guess you could do something tricky
03:03 < roed-1183> like resetting the domain after creating the map
03:03 < roed-1183> ::shrug::
03:04 < was-1183> No.
03:04 < was-1183> You're right.
03:05 < was-1183> We just make NFResidueFieldHomomorphism a factor function that constructs two possible types of objects.
03:07 < roed-1183> sure.  And we'll need another object for the morphism defined on the localization away from P, and another one for the section
03:07 < roed-1183> :-)
03:07 < was-1183> yes.
03:07 < was-1183> That makes sense.
03:08 < was-1183> But I'm very tempted to make fake-ish partial maps defined as much as possible, then implement all the structural ones in terms of those, just to keep the code organized.
03:08 < was-1183> (No duplication.)
03:08 < roed-1183> what do you mean fake-ish partial maps?
03:08 < was-1183> By "defined as much as possible" I guess I just mean on the localization.
03:08 < was-1183> class's that aren't official homomorphisms.
03:09 < was-1183> They are for internal use only.
03:09 < roed-1183> sure
03:09 < roed-1183> I like that plan
03:09 < was-1183> How about if I make two callable classes like that, then give you clean code that 100% works with those, then you could rewrite the sructural stuff to use them?
03:10 < roed-1183> sure
03:10 < was-1183> I think I could do that in < 15 minutes.
03:10 < roed-1183> Sounds good
03:10 < was-1183> I'll give it a shot.
03:10 < roed-1183> I'll work on p-adics for a little bit
03:10 < was-1183> :-)
03:12 < craigcitro-1231> was-1183: you have a sec for a modsym question?
03:12 < was-1183> you can write the question.  I might answer it.
03:12 < craigcitro-1231> namely, what happens to the atkin-lehner involution at 2?
03:13 < was-1183> at 2?
03:13 < craigcitro-1231> because suddenly there aren't two different eigenspaces
03:13 < was-1183> what's "at 2"
03:13 < craigcitro-1231> mod 2
03:13 < craigcitro-1231> sorry
03:13 < was-1183> ahh.
03:13 < was-1183> I don't know.
03:14 < was-1183> by the way, I started a google group called bsd-research -- you might want to join.
03:14 < was-1183> http://groups.google.com/group/bsd-research
03:14 < craigcitro-1231> nods ... i'll do that right now
03:31 < craigcitro-1231> wow ... karim belabas already fixed the bug in factornf ; that means i could have just *not bothered* with that numberfield code i wrote. *sigh*
03:31 < was-1183> wow.
03:32 < was-1183> is it still valuable for something?
03:32 < was-1183> e.g., could you easily make it so number fields constructed with funny polynomials work.
03:32 < was-1183> I.e., psychologically you could do that?
03:32 < craigcitro-1231> yeah, it shouldn't be too hard.
03:33 < craigcitro-1231> it'd just be basically copy-pasting that code into anything that uses pari within the number field code.
03:33 < craigcitro-1231> (or making an interface and using it everywhere, rather.)
03:33 < was-1183> it's mainly a design thing, I hope.
03:36 < craigcitro-1231> yeah. i mean, nffactor is also supposed to be faster than factornf in general (they use different algorithms, despite having basically the same name ... because that's not confusing at all).
03:36 < craigcitro-1231> so it's not all for naught.
03:36 < was-1183> :-)
03:37 < was-1183> factornf and nffactor?!
03:37 < craigcitro-1231> yeah
03:38 < craigcitro-1231> alright, i'm gonna head to bed, i think. 1129 and 1231 are done, and i commented in 1232 that once we know if something is true mathematically, it's easy to fix the code.
03:39 < was-1183> thanks.  cu
03:39 < roed-1183> goodnigth
03:39 < craigcitro-1231> lates
03:39 -!- craigcitro-1231 [n=cc@pool-71-106-26-87.lsanca.dsl-w.verizon.net] has quit []
04:01 < roed-1183> was-1183: how's it going?
04:01 < was-1183> ok.
04:01 < was-1183> I ran into a problem with _ext_pari when testing large cases.
04:01 < was-1183> I don't know if it was there before or not.
04:02 < roed-1183> what's happening?
04:02 < was-1183> it says the defining poly is reducible.
04:02 < roed-1183> Is it?
04:03 < was-1183> yes.
04:03 < roed-1183> hm
04:03 < roed-1183> So can we just insert that check after (rank == n)?
04:03 < was-1183> the poly has the wrong degree.
04:05 < was-1183> oh, of course, I forgot.
04:06 < roed-1183> oh
04:06 < roed-1183> You have to strip the zero
04:06 < was-1183> There was a problem in your code for the gen reduction case -- one still has to pick out the right factor...
04:06 < roed-1183> ah
04:06 < roed-1183> right
04:06 < roed-1183> Which I had before
04:06 < roed-1183> But deleted
04:06 < was-1183> yes.
04:06 < roed-1183> I think the way to solve the other problem
04:06 < was-1183> or maybe not.
04:07 < was-1183> I'm going to comment that case out for now.
04:07 < was-1183> Since I want to hand you something that fully works.
04:07 < roed-1183> is to change f = R((-M.column(n)).list() + [1])
04:07 < was-1183> Gees it is slow without that case...
04:07 < roed-1183> to f = R((-M.column(n)).list()[:-1] + [1])
04:08 < roed-1183> no, never mind
04:08 < roed-1183> I was thinking there was a row of zeros at the bottom
04:08 < roed-1183> But there isn't
04:08 < was-1183> that is wrong too.
04:10 < roed-1183> If M has rank n
04:11 < roed-1183> Then there is no relation between the powers of x
04:11 < roed-1183> of degree less than n
04:11 < was-1183> the degree of the poly is wrong.
04:12 < roed-1183> The degree of f isn't the residue_class_degree?
04:13 < was-1183> yes
04:13 < was-1183> it makes no sense.
04:14 < was-1183> I made a dumb mistake.
04:14 < roed-1183> what?
04:15 < was-1183> I had refactored some code so that I could keep the powerbasis mod p around.
04:15 < was-1183> But I donly did it correctly in 1 of the 2 (lamely) duplicated places.
04:15 < roed-1183> ah
04:21 < roed-1183> Alright.  I should go to sleep
04:21 < was-1183> same here.
04:21 < was-1183> I'll send you an email before I go to sleep to let you know what happened.
04:21 < roed-1183> sounds good
04:22 < roed-1183> goodnight
04:24 -!- roed-1183 is now known as roed-asleep
}}}
