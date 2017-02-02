= SAGE Bug Squash Day 7 =

The event will take place on '''FRIDAY, December 14, 2007''' and officially start at 9 am pacific standard time.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''2.9.alpha7'''.
 * [[bug7/status|STATUS]]
 * [[bug7/irc|IRC log]]
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
 1. Michael Abshoff (merging patch, build issues in general)
 1. Craig Citro (not until 2-3PM)
 1. David Harvey (might be around for some of the day)

Many other people participated, but didn't add themselves here due to the rather tight schedule.

= IRC =
{{{
06:49 < dmharvey> i'm building sage-2.9alpha7, and there's a problem in the build log with the NTL build, but the rest of it seems to be going okay (for the moment)
06:49 < dmharvey> i686-apple-darwin8-g++-4.0.1: unrecognized option '-shared'
06:49 < dmharvey> _main
06:49 < dmharvey> ___gmpn_add_n
06:49 < dmharvey> ___gmpn_addmul_1
06:49 < dmharvey> ___gmpn_divrem_1
06:49 < dmharvey> ___gmpn_gcd
06:49 < dmharvey> ___gmpn_gcdext
06:49 < dmharvey> ___gmpn_lshift
06:49 < dmharvey> ___gmpn_mod_1
06:49 < dmharvey> ___gmpn_mul
06:49 < dmharvey> ___gmpn_mul_1
06:49 < dmharvey> ___gmpn_rshift
06:49 < dmharvey> ___gmpn_sqrtrem
06:49 < dmharvey> ___gmpn_sub_n
06:49 < dmharvey> ___gmpn_tdiv_qr
06:49 < dmharvey> collect2: ld returned 1 exit status
06:49 < dmharvey> make[3]: *** [libntl.so] Error 1
06:49 < dmharvey> make[2]: *** [lib] Error 2
06:49 < dmharvey> ----------------------------------------
06:49 < dmharvey> Error building libntl.so 
06:49 < dmharvey> ----------------------------------------
06:49 < dmharvey> the static library build seems to succeed though
06:50 < dmharvey> this is OS X 10.4.10, core 2 duo
07:21 -!- mekaj [n=mekaj__@fild-357.res.umass.edu] has joined #sage-devel
07:28 -!- pdehaye [n=pdehaye@dehaye1.merton.ox.ac.uk] has quit []
07:53 -!- malb_ [n=malb@host86-144-82-165.range86-144.btcentralplus.com] has quit [Read error: 104 (Connection reset by peer)]
08:20 -!- malb [n=malb@host86-144-82-165.range86-144.btcentralplus.com] has joined #sage-devel
08:26 -!- malb [n=malb@host86-144-82-165.range86-144.btcentralplus.com] has quit [Remote closed the connection]
08:27 -!- malb [n=malb@host86-144-82-165.range86-144.btcentralplus.com] has joined #sage-devel
08:31 -!- cwitty [n=cwitty@sense-sea-MegaSub-1-205.oz.net] has quit [Read error: 110 (Connection timed out)]
08:32 -!- cwitty [n=cwitty@newtonlabs.com] has joined #sage-devel
08:56 -!- rlm is now known as rlm-building
08:57 < william_stein_> dmharvey -- libntl.dylib built fine for me on osx 10.5.1 core 2duo.
08:57 < william_stein_> It's shouldn't build libntl.so dut libntl.dylib.
08:58 < william_stein_> Using the static library will fail miserably...
08:58 < william_stein_> (as far as sage goes)
08:59 < dmharvey> well for some reason it's trying to build libntl.so
09:00 < dmharvey> the beginning of the command is;
09:00 < dmharvey> g++ -fPIC -shared -o libntl.so ....
09:03 < dmharvey> very strange: I still managed to get libntl.dylib in my SAGE/local/lib
09:04 < dmharvey> ok, in the logfile, I see it's trying to build both libntl.so and libntl.dylib
09:04 < dmharvey> is this intentional?
09:05 < william_stein_> not that I remember.
09:05 < william_stein_> I see the same in my install.log (on same computer as you)
09:05 < william_stein_> same-ish
09:06 < william_stein_> ok, it's clearly intentional in spkg-install.
09:07 < william_stein_>  it seems dumb
09:07 < william_stein_> Of course, I wrote it :-)
09:09 < william_stein_> http://trac.sagemath.org/sage_trac/ticket/1506
09:09 -!- william_stein_ is now known as was-1506
09:17 -!- mekaj [n=mekaj__@fild-357.res.umass.edu] has quit ["Leaving"]
09:34 < was-1506> http://trac.sagemath.org/sage_trac/ticket/1506 -- patch posted
09:34 -!- was-1506 is now known as was-afk
09:34 -!- was-afk is now known as wstein-afk
09:40 -!- pdehaye [n=pdehaye@dehaye1.merton.ox.ac.uk] has joined #sage-devel
09:44 -!- malb [n=malb@host86-144-82-165.range86-144.btcentralplus.com] has quit [Remote closed the connection]
09:52 -!- wstein-afk is now known as was-1507
09:52 -!- was-1507 is now known as wstein-1507
09:58 < mabshoff|asleep> Hi
09:58 -!- mabshoff|asleep is now known as mabshoff
10:00 < rlm-building> hi mabshoff
10:03 < mabshoff> hi rlm-building.
10:03 < mabshoff> It seems to be pretty quiet today.
10:03 < rlm-building> i'm working on binary code bugs
10:04 < rlm-building> are you releasing 2.9 tomorrow?
10:04 < mabshoff> Ok. I was hoping to get some more reviews and planning to do mostly merges.
10:04 < rlm-building> are there any more releases in december?
10:04 < mabshoff> I think so, because William will be away. The problem seens to be that 
10:05 < mabshoff> somebody needs to build the VMWare images. But I am not sure. 
10:05 < mabshoff> I think we will do 2.9.1 before the end of the year.
10:09 -!- jaap [n=jaap@cc73571-a.emmen1.dr.home.nl] has quit [Read error: 104 (Connection reset by peer)]
10:09 -!- janwil [n=jan@edro.at.mt.ut.ee] has joined #sage-devel
10:10 < janwil> hi
10:10 < mabshoff> Hi janwil
10:10 < janwil> i promised to bug you tonight :)
10:10 < mabshoff> I remember ;(
10:10 < mabshoff> :)
10:10 -!- malb [n=malb@host86-144-82-165.range86-144.btcentralplus.com] has joined #sage-devel
10:10 < mabshoff> Not sure how I feel about that so far I guess :)
10:11 < mabshoff> Hi malb
10:11 < janwil> i will leave now the office, but if i can be of any assistance i can come back from home
10:11 < malb> hi
10:11 < mabshoff> janwil: ok
10:11 < rlm-building> hi malb
10:12 < malb> hi rlm
10:12 < janwil> ok, bye for now, I'll try to be back in an hour or two
10:12 < mabshoff> cu
10:12 < mabshoff> dmharvey: Did you try the new ntl.spkg yet? Does it work?
10:13 -!- dmharvey is now known as dmharvey-trying-
10:13 < craigcitro> is flint not building a known issue on ppc-10.4?
10:14 < mabshoff> Hi craigcitro.
10:14 -!- dmharvey-trying- is now known as dmharvey-tryntl
10:14 < craigcitro> hey
10:14 < mabshoff> It should build just fine.
10:14 < craigcitro> i'm actually about to walk out the door
10:14 < mabshoff> What fails? The biild ot the test?
10:14 < craigcitro> so i guess i'll look at this when i get back
10:14 < craigcitro> the build
10:14 < mabshoff> cu later
10:14 -!- janwil [n=jan@edro.at.mt.ut.ee] has left #sage-devel []
10:14 < craigcitro> ah, no, it says "running test suite"
10:14 < mabshoff> ok, that isn't supposed to happen.
10:14 < craigcitro> then passes -B to build
10:14 < craigcitro> err to make
10:14 < craigcitro> which is apparently an invalid option
10:14 < mabshoff> ok.
10:15 < craigcitro> but i'll look at it more when i return
10:15 < mabshoff> Which XCode?
10:15 < craigcitro> afk
10:15 < mabshoff> su
10:15 < mabshoff> cu
10:15 < craigcitro> i forget.
10:15 < craigcitro> lates.
10:15 -!- jaap [n=jaap@cc73571-a.emmen1.dr.home.nl] has joined #sage-devel
10:15 < mabshoff> Hi jaap
10:15 < jaap> Hi
10:22 -!- jrolland-iBook [n=jrolland@dhcp-14-63.math.uwm.edu] has joined #sage-devel
10:22 < dmharvey-tryntl> mabshoff: works for me
10:22 -!- dmharvey-tryntl is now known as dmharvey
10:22 < jrolland-iBook> exit
10:22 -!- jrolland-iBook [n=jrolland@dhcp-14-63.math.uwm.edu] has quit [Client Quit]
10:23 < mabshoff> dmharvey-tryntl: thans
10:23 < mabshoff> dmharvey-tryntl: thanks
10:36 -!- malb [n=malb@host86-144-82-165.range86-144.btcentralplus.com] has quit [Read error: 104 (Connection reset by peer)]
10:37 -!- malb [n=malb@host86-144-82-165.range86-144.btcentralplus.com] has joined #sage-devel
10:39 -!- cartman [n=ismail@kde/ismail] has joined #sage-devel
10:39 -!- cartman [n=ismail@kde/ismail] has quit [Remote closed the connection]
10:42 -!- wstein-1507 [n=was@c66-235-34-166.sea2.cablespeed.com] has quit []
10:43 -!- ondrej [n=ondra@89-24-5-16.4ginternet.cz] has joined #sage-devel
10:47 < dmharvey> gotta go see some students, might be around later again
10:47 < mabshoff> cu
10:48 < rlm-building> i think i found one of my bugs...
10:48 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has quit []
11:07 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has joined #sage-devel
11:13 -!- jkantor [i=jkantor@sage.math.washington.edu] has joined #sage-devel
11:13 -!- william_stein_ [n=was@D-69-91-158-192.dhcp4.washington.edu] has joined #sage-devel
11:14 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has quit []
11:18 -!- janwil [n=jan@213-35-169-226-dsl.trt.estpak.ee] has joined #sage-devel
11:18 < janwil> hi again
11:18 < mabshoff> hi
11:19 < janwil> mabshoff, did you have a moment to look at #712?
11:20 < mabshoff> in a while, I am about to go eat dinner.
11:20 < mabshoff> probably back in a hour or so.
11:20 < janwil> ok, enjoy your dinner!
11:20 < mabshoff> thanks
11:20 < mabshoff> I feel 
11:21 < mabshoff> s like breakfast since I only recently got up.
11:21 < mabshoff> cu around
11:21 -!- mabshoff is now known as mabshoff|afk
11:25 -!- jkantor [i=jkantor@sage.math.washington.edu] has quit ["leaving"]
11:28 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
11:35 < rlm-building> hi robertwb
11:35 < robertwb> hi there
11:43 -!- rlm-building is now known as rlm
11:47 < rlm> .nick rlm-1464
11:47 -!- rlm is now known as rlm-1464
11:47 -!- william_stein_ is now known as wstein-1000
11:53 < wjp> wstein-1000: recruiting users? :-)
12:00 -!- dmharvey [n=dmharvey@dhcp-0000106358-df-53.client.student.harvard.edu] has joined #sage-devel
12:07 < wstein-1000> grants...
12:08 -!- dmharvey [n=dmharvey@dhcp-0000106358-df-53.client.student.harvard.edu] has quit []
12:09 < rlm-1464> how close did we come to 10,000 downloads during the slashdot period?
12:10 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has joined #sage-devel
12:10 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has quit [Client Quit]
12:11 < wstein-1000> wow, a retired boeing engineer just walked into my office and asked to buy a Sage CD!
12:11 < wstein-1000> I said I would give him one and he said he wanted to give us money.
12:11 < wstein-1000> Unfortunately I have no CD's made up right now...
12:11 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has joined #sage-devel
12:11 < wjp> wow, cool
12:11 < mabshoff|afk> :)
12:11 -!- mabshoff|afk is now known as mabshoff
12:11 < wstein-1000> He said he worked on scripting, math software, etc., for boeing for a very long time.
12:12 < mabshoff> Cool
12:12 < rlm-1464> it really sounds like we need hard copies of Sage
12:12 < rlm-1464> it seems symbolic or something
12:13 < rlm-1464> there's something about handing someone something for free as opposed to telling them to download it?
12:13 < mabshoff> Well, burning on demand seems like a much better idea due to the release pace.
12:13 < rlm-1464> is True, is True
12:13 < mabshoff> Maybe the guy thought that it would help development, kind a like OpenBSD
12:14 < mabshoff> where the media are used to cover expenses.
12:16 < rlm-1464> i like sage -b in alpha7
12:16 < rlm-1464> :-D
12:16 < mabshoff> Because it is quicker?
12:17 < rlm-1464> there isn't that awkward halt
12:17 < wstein-1000> My brother has a shrink-wrap machine and high-end color printers at his store in San Diego.
12:17 < mabshoff> :)
12:17 < rlm-1464> great
12:17 < wstein-1000> We could easily make a shrink-wrapped package and sell it for say $20/each or something.
12:17 < wstein-1000> and make more if people buy on day 1.
12:17 < wstein-1000> :-)
12:17 < wstein-1000> I fixed "sage -b".
12:17 < wstein-1000> Yep.
12:17 < rlm-1464> thank you for that
12:18 < mabshoff> rlm-1464: You should chair 2.9.1 which should be done about one week after 2.9, 
12:18 < mabshoff> say the 22nd.
12:18 < rlm-1464> sounds good
12:18 < mabshoff> Then we should do 2.9.2 just in time for AMS
12:18 < rlm-1464> mostly sweeping up after 2.9?
12:18 -!- cartman [n=ismail@kde/ismail] has joined #sage-devel
12:18 < mabshoff> So shoot for the 29th or so.
12:18 < wstein-1000> yep.
12:18 < mabshoff> pretty much, both should be bug & build fixes only.
12:19 < mabshoff> While you chair 2.9.1 I will finish the automated toolchain build for Sage.
12:19 < mabshoff> That way we can support people with screwy toolchains, just like FC6 or OpenSUSE 10.
12:21 < rlm-1464> just in time for san diego
12:22 < mabshoff> Well, I am not sure if it will be perfect till then and I am also somewhat unsure 
12:22 < robertwb> I'm hoping to get a jmol spkg by 2.9.2 too
12:22 < mabshoff> how to intgrate this well with Sage.
12:23 < mabshoff> robertwb: Sure. When I said bug fixes only I meant mostly no deep transitions 
12:23 < rlm-1464> what is jmol?
12:23 < robertwb> A chemists 3d visualizing applet that William found
12:23 < mabshoff> like ATLAS. jmol is stand alone and orthogonal, so it should be fine.
12:23 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has quit []
12:23 < wstein-1000> robertwb -- how's jmol going?
12:23 < wstein-1000> I'm really excited about it.
12:23 < mabshoff> He just left?
12:23 < wstein-1000> oops
12:24 < mabshoff> Is robertwb coming back? I hope that he can help out with some of the outstanding 
12:24 < mabshoff> coercion bugs.
12:25 < wstein-1000> probably.
12:25 < mabshoff> Let's hope so.
12:25 < wstein-1000> by the way, having a sage days 8 in Seattle during March spring break now looks good to go.
12:25 < wstein-1000> you heard it here first.
12:25 < rlm-1464> (!)
12:25 < mabshoff> Excellent. What will be the topic?
12:25 < rlm-1464> ANT?
12:25 < wstein-1000> No.
12:25 < mabshoff> modular forms?
12:26 < wstein-1000> Coding!
12:26 < wstein-1000> It will be a "coding week", with several topics.
12:26 < rlm-1464> so that's moving in from may
12:26 < rlm-1464> oh!
12:26 < mabshoff> Cool, so one week hard core coding sprint.
12:26 < wstein-1000> yep.
12:26 < rlm-1464> a developer's conference!
12:26 < wstein-1000> Yes.
12:26 < rlm-1464> +1
12:27 < rlm-1464> continue by induction
12:27 < mabshoff> "to infinity and beyond"
12:27 < rlm-1464> topic suggestion: computational group theory
12:28 < wstein-1000> I think we should have about 5 topics and 20 people in groups of about 4 with regular demos
12:28 < wstein-1000> and status reports.
12:28 < wstein-1000> And one colloquium talk / discussion each evening
12:32 < mabshoff> sounds good.
12:34 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has quit []
12:34 < mabshoff> I didn't see any 2.9 build failures so far. So either people are busy doing holiday stuff, 
12:34 < rlm-1464> sounds awesome
12:34 < mabshoff> or 2.9.alpha7 is close to perfect.
12:34 < mabshoff> I tend to believe the former rather than the later.
12:35 < wstein-1000> 2.9.alpha7 failed on one of my 64-bit linux installs.
12:35 < wstein-1000> The problem was major clock skew, which broke my new "sage -b" trick. :-(
12:36 < mabshoff> eeg
12:36 < wstein-1000> Yep.
12:36 < mabshoff> What happens with your script when you add files? Does that also work?
12:36 < mabshoff> It broke Bobby's old improved script.
12:36 < wstein-1000> built and failed exactly one test on rhel 5 32-bit
12:36 < wstein-1000> sage -t  devel/sage-main/sage/numerical/test.py             **********************************************************************
12:36 < wstein-1000> File "test.py", line 22:
12:36 < rlm-1464> i've added a file on alpha7
12:36 < wstein-1000>     : e 
12:36 < wstein-1000> Expected:
12:36 < wstein-1000>     array([ 3.8270...+0.j,  3.8229...+0.j,  ...+0.j,  0.
12:36 < wstein-1000>     +0.j])
12:36 < mabshoff> I know yout code is orthogonal to that code.
12:36 < wstein-1000> Got:
12:37 < wstein-1000>     array([ 3.82705826+0.j,  0.        +0.j,  0.        +0.j,  0.        +0.j])
12:37 < rlm-1464> let me check it out
12:37 < mabshoff> Well, the odd thing is that on sage.math I get that newline.
12:37 < wstein-1000> it's not the newline
12:37 < mabshoff> I don't understand why it does happen, but it bugged me back then.
12:38 < mabshoff> ok, the "0"
12:38 < mabshoff> Instead of "3.8229...+0.j"
12:38 < mabshoff> Can we do a "better doctest" in that case with more stable eigenvalues?
12:38 < mabshoff> I am also unsure what "3.82705826+0" is supposed to mean. Scientific notation?
12:39 < rlm-1464> mabshoff - adding files worked fine for me in alpha7
12:39 < mabshoff> rlm-1464: excellent.
12:39 < mabshoff> I just wanted to make sure because it was a problem in the past.
12:39 < mabshoff> William did fix that bug that when compilation failed the next sage -b wouldn't
--- Log closed Fri Dec 14 12:45:29 2007
--- Log opened Fri Dec 14 12:45:32 2007
12:45 -!- SageLogger [i=mabshoff@sage.math.washington.edu] has joined #sage-devel
12:45 -!- Irssi: #sage-devel: Total of 21 nicks [0 ops, 0 halfops, 0 voices, 21 normal]
12:45 -!- Irssi: Join to #sage-devel was synced in 3 secs
12:46 < mabshoff> I just found a 80GB 2.5'' hard disc in my random hardware pile.
12:46 < mabshoff> :)
12:46 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has joined #sage-devel
12:46 -!- fredrik3 [i=fredrik@gamma.kvi.sgsnet.se] has joined #sage-devel
12:46 < mabshoff> dmharvey: do you have some time to do reviews?
12:46 -!- fredrik3 is now known as fredrik
12:46 < janwil> mabshoff, do you have a minute now?
12:46 < mabshoff> Sure
12:46 < mabshoff> I am waiting on my rc0 test tree to build.
12:47 < janwil> ok
12:47 < mabshoff> I already pulled up the ticket http://trac.sagemath.org/sage_trac/ticket/712
12:47 < cwitty> mabshoff, on my laptop the only doctest failure with alpha7 was that same test.py failure that wstein just reported.
12:47 < janwil> let me know if i can be of any help
12:47 < janwil> i'll hang around here
12:48 < mabshoff> cwitty: Ok, that seems to depend on the BLAS used, i.e. initially when I used 
12:48 < mabshoff> BLAS on sage.math that test passed. But after switching to ATLAS it failed 
12:48 < mabshoff> the  exact same way as on OSX with the AccFW.
12:49 -!- jkantor [i=jkantor@sage.math.washington.edu] has joined #sage-devel
12:49 < mabshoff> Hi jkantor.
12:49 < jkantor> hey
12:49 < mabshoff> The aarpack doctest seems to be rather numerically unstable. 
12:50 < jkantor> ok
12:50 < mabshoff> Can you come up with something better/numerically more stable to doctest?
12:50 < jkantor> I'll do that
12:50 < mabshoff> We could do something fairly trivial, like an upper triangle if we just want to 
12:50 < mabshoff> check that it is working at all.
12:52 < jkantor> true
12:52 < mabshoff> I thought it was really funny that the import all in that test exposed that linker issue 
12:53 < mabshoff> with the missing ATL symbols.
12:53 < jkantor> for cvxopt?
12:53 < mabshoff> All doctests exept that one passed with a totally unusable sage install that wouldn't even start.
12:53 < mabshoff> Nope. On sage.math starting sage with alpha6 (i.e. with ATLAS) failed because 
12:54 < mabshoff> we only linked cblas and not also atlas.
12:54 < jkantor> I see
12:54 < jkantor> that will do it
12:54 < mabshoff> So we should have an import all doctest.
12:54 < mabshoff> numerical/test.py does that, but if somebody reports a doctest failing there it isn't obvious 
12:55 < mabshoff> that the import itself might be at fault if we get only parts of the failure.
12:55 < mabshoff> jkantor: Please open a ticket for the aarpack failure.
12:56 < jkantor> ok, there are too interfaces to arpack in the arpack module, and one appears to work better, I'll switch to the second one
12:56 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has quit []
12:56 < mabshoff> jkantor: ok
12:57 < mabshoff> janwil: I just ran "v['.P']=intersection_of_2_lines(v['_q'],v['_r']) " 100 times and it never failed.
12:57 < mabshoff> Running it a thousand times now.
12:57 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has joined #sage-devel
12:57 < mabshoff> yi: are you around?
12:58 < janwil> hmm
12:58 < janwil> which platform are you on?
12:58 < mabshoff> sage.math, linx x86-64
12:58 < mabshoff> alpha7
12:59 < mabshoff> William fixed a bug in the calculus interface with symbolic constants or something.
12:59 < mabshoff> I don't know if that is related
12:59 < janwil> hmm, should I download the latest alpha and try then?
12:59 < mabshoff> :)
13:00 < mabshoff> the ticket says it was reproduced on a *32* bit box. 
13:00 < mabshoff> You can probably just apply the patch.
13:00 < mabshoff> Let me search for the ticket number.
13:02 < mabshoff> well, the following *seems* unrelated:
13:02 < mabshoff> 1235	[with patch, positive review] bug solving equations using maxima
13:02 < mabshoff> But I am thinking of another ticket.
13:02 < mabshoff> I was thinking of http://www.sagetrac.org/sage_trac/ticket/1489
13:03 < mabshoff> So try applying those two patches to your install and see if the problem goes away.
13:03 < janwil> ok, please remind me how to apply patches to sage
13:04 < mabshoff> ok, go into SAGE_ROOT
13:04 < mabshoff> source local/bin/sage-env
13:04 < mabshoff> which hg should then point to the one in local/bin
13:04 < mabshoff> cd devel/sage
13:04 < mabshoff> download the patches form trac.
13:04 < mabshoff> hg import whatever.patch
13:05 < mabshoff> That might or might not fail, but it shouldn't
13:05 < mabshoff> Apply the second patch
13:05 < mabshoff> cd back to SAGE_LOCAL
13:05 < mabshoff> run "./sage -b"
13:05 < mabshoff> start sage then and try it out.
13:06 < janwil> $ hg import trac-1489.patch 
13:06 < janwil> applying trac-1489.patch
13:06 < janwil> abort: no diffs found
13:06 < janwil> ouch my mistake
13:07 < mabshoff> Ok, you probabyl tried to apply the html file ;)
13:07 < mabshoff> http://www.sagetrac.org/sage_trac/attachment/ticket/1489/trac-1489.patch?format=raw
13:07 < mabshoff> Do a wget on that.
13:07 < janwil> yes, i forgot the pecularities of trac
13:07 < mabshoff> not only you ;)
13:08 < janwil> you sugested applying 1235 as well? 1235 has 3 patches
13:08 < mabshoff> Well, try 1489 alone first.
13:08 < janwil> ok
13:08 < mabshoff> Solving it 1000 times worked on sage.math, too.
13:12 -!- mekaj [n=mekaj__@fild-357.res.umass.edu] has joined #sage-devel
13:18 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has quit [Read error: 110 (Connection timed out)]
13:24 < janwil> rebuilding the whole sage takes quite a long time ... is there a way to rebuild just the relevant parts?
13:25 < mabshoff> Well, if you apply the patch to an existing install it should be done in about 10-15 seconds.
13:25 < mabshoff> You can always back that patch out again.
13:27 < janwil> hmm ... I have been building for 15 minutes now ...
13:27 < mabshoff> ok, in that case you started with a binary?
13:27 < janwil> Most probably
13:28 < mabshoff> Then you end up rebuilding all of sage.spkg, which takes about 30 or so minutes 
13:28 < mabshoff> depending on the CPU speed.
13:28 < mabshoff> Believe me, I build sage a couple times a day when I do releases, so I have 
13:28 < mabshoff> been bitching about that for quite a while.
13:28 < mabshoff> I do it on different systems in parallel, so it isn't too bad.
13:29 < janwil> what about distributed build farms & such?
13:29 < mabshoff> The bottleneck is cython at the moment.
13:29 < janwil> what is that?
13:29 < mabshoff> It takes about 2/3rds of the time.
13:30 < mabshoff> Cython is the tool that generates C code from Cython files.
13:30 < mabshoff> It is what we use to integrate low level efficient C code with Python code.
13:30 < mabshoff> http://www.cython.org/
13:31 < mabshoff> "Cython is a language that makes writing C extensions for the Python language as easy as Python itself."
13:31 < janwil> sounds fun
13:32 < mabshoff> Yep, everything that needs to be implemented efficiently in Sage is often done with Cython.
13:32 < mabshoff> We also use it to interface with C and C++ libraries.
13:34 < ondrej> so why is it a bottleneck?
13:35 < mabshoff> Hi ondrej
13:35 < wstein-1000> I think arpack is random...
13:35 < mabshoff> Because the input is random?
13:35 < wstein-1000> jkantor: If you try the doctest:  E=sparse.spdiags(n,[-1,0,1],int(100),int(100)); e,v=arpack.eigen(A-E,3); e
13:35 < wstein-1000> over and over again (need setup from test.py)
13:35 < wstein-1000> then you get different answers
13:35 < jkantor> yes
13:35 < mabshoff> bug?
13:35 < wstein-1000> jkantor -- is this expected?
13:36 < jkantor> yes
13:36 < wstein-1000> OK, then that doctest failure is easy to fix!
13:36 < wstein-1000> mabshoff -- put #random
13:36 < jkantor> the algorithm generates essentially random vectors and iterates so they converge to eigenvectors
13:36 < mabshoff> Will do, and maybe add a proper comment?
13:36 < jkantor> if you have eigenvalues close together you can get different runs oscillating between eigenvalues
13:36 < jkantor> I will make a better example
13:36 < janwil> mabshoff: after 1489 the test still fails
13:37 < mabshoff> ok. I was about to ask why one would use aarpack in that case.
13:37 < mabshoff> janwil: How about the other tree patches from that ticket?
13:37 < mabshoff> the *other* ticket I mean.
13:37 < janwil> ok, I'll try applying them
13:37 < mabshoff> Thanks
13:38 < janwil> I still need tu rebuild everything?
13:38 < mabshoff> Nope, now sage -b will only rebuild the changed files.
13:38 < mabshoff> One advantage of building from source ;)
13:40 < jkantor> I picked a better example where the matrix is positive definite and I know the analytic answer
13:40 < mabshoff> Yep, that should work. 
13:40 < mabshoff> ondrej: I think parts of Cython need to be rewritten in Cython ;)
13:41 < mabshoff> But then building it needs to be a two step process so it can be self hosting 
13:41 < mabshoff> out of the box.
13:41 < mabshoff> The files created by Cython are huge, i.e. many of the c files we compile ar 1MB+
13:42 < mabshoff> So if Cython speeds up string operations compated to Python one should look into that.
13:42 < mabshoff> Speeding the Cython step up by 50% out to save about 1/3 of the total build time of 
13:42 < mabshoff> sage.spkg, which would be a big plus in my book.
13:42 < mabshoff> out->ought
13:43 < janwil> mabshoff: after 1235 i still get the same problem
13:48 < ondrej> mabshoff - is the problem in executing cython, or compiling the resulting C file?
13:50 < jkantor> mabshoff the ticket for arpack has a second patch that should make the doctest better, if it still fails on some systems, feel free to comment out the line that checks the output for now.
13:52 -!- jkantor is now known as jkantor_afk
13:52 -!- malb [n=malb@host86-144-82-165.range86-144.btcentralplus.com] has quit [Read error: 110 (Connection timed out)]
13:55 -!- fredrik [i=fredrik@gamma.kvi.sgsnet.se] has quit []
13:59 < mabshoff> janwil: ok, I need to find a system where I can reproduce the issue.
14:00 < mabshoff> ondrej: a little of both. Invoking Cython takes about 2/3rds of the time
14:00 < mabshoff> Compiling the result the other 1/3rd.
14:00 < ondrej> I see now
14:00 < mabshoff> But we should compile in parallel, on top of that.
14:00 < mabshoff> So it is two issues to potentially speed up compilation.
14:01 < mabshoff> The first one would benefit everybody, the second one people with loads of cores ;)
14:01 < janwil> mabshoff: would you like me to try and set up the environment for you?
14:01 < mabshoff> janwil: sure, but I doubt I will get quick resutls.
14:02 < mabshoff> Does that box have a static IP?
14:02 < mabshoff> Or alternatively a FQDN?
14:03 < janwil> which version of sage should i download?
14:03 < mabshoff> Are you going to build from scratch?
14:03 < mabshoff> Then 2.9.alpha7 and/or 2.8.15
14:03 < janwil> well, you tell me which one you'd like :)
14:03 < mabshoff> 2.7.rc0 should be out by morning CET
14:04 < mabshoff> 2.7.alpha7 is better since it has a bunch of fixes.
14:04 < mabshoff> If you set up an account I can certainly build it.
14:05 < janwil> i'd first like to build it myself to see if i still get the same problem
14:05 < mabshoff> I still suspect that the toolchain might be potentially involved in this.
14:05 < mabshoff> janwil: Ok, that sounds like a good idea.
14:05 < mabshoff> Do you have the link to 2.9.alpha7?
14:05 < janwil> and if I won't, I will have a working sytem and be happy :)
14:05 < janwil> no
14:06 < janwil> I was just about to ask for a link
14:06 < mabshoff> http://sage.math.washington.edu/home/mabshoff/sage-2.9.alpha7.tar
14:06 < mabshoff> About 183 MB in size.
14:06 < mabshoff> When I do the release all alphas and rcs end up in that home directory.
14:07 < janwil> ok ... so i unpack it, cd in there and build it ... will ./sage -b work or do I have to do something else?
14:08 < mabshoff> If you execute make it will build it all. No need to do anything after that.
14:08 < janwil> ok
14:08 < mabshoff> Once make is done succesfully you should execute "make check"
14:08 < mabshoff> That will run all doctests.
14:09 < mabshoff> If any other problem pops up there we might have another lead to what might go wrong.
14:16 -!- ondrej [n=ondra@89-24-5-16.4ginternet.cz] has quit ["Leaving"]
14:28 -!- dmharvey [n=dmharvey@140.247.249.147] has joined #sage-devel
14:30 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has quit []
14:38 -!- dmharvey [n=dmharvey@140.247.249.147] has quit []
14:39 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has joined #sage-devel
14:44 < mabshoff> jaap?
14:44 < janwil> does make run some tests out of its own wisdom as well?
14:45 < mabshoff> Nope.
14:45 < jaap> Hi mabshoff
14:45 < mabshoff> jaap: thanks for the report. jkantor is fixing the numerical/test.py issue.
14:45 < jaap> ok
14:46 < mabshoff> janwil: make check runs the doctests after it finishes compiling, *but* 
14:46 < janwil> weird ... i just typed make, it built for some time and is now testing
14:46 < jaap> I was surprised it shows up again
14:46 < mabshoff> it runs the doctests even when the compilation fails. there is a ticket
14:46 < mabshoff> open about that.
14:46 < mabshoff> numerical/test.py is more or less random :)
14:47 < mabshoff> And it also depends on the BLAS used. It result changes from netlib.org to ATLAS on 
14:47 < mabshoff> the same box.
14:47 < mabshoff> It is a known problem with Lapack testers for example that ATLAS doesn't pass 
14:47 < mabshoff> the testsuite some of the time because it does operations differently than netlib.org BLAS
14:47 < mabshoff> Consequently the numercial errors can diverge.
14:48 < jaap> Thanks for the explanation
14:48 < mabshoff> Sure, no problem. Hanging around the net for years shoud pay off at some point ;)
14:52 < mabshoff> jaap: Are you willing to test an updated singular.spkg in a couple minutes? 
14:52 < mabshoff> it is a x86 linux only fix ;)
14:53 < jaap> Ok,
14:53 < mabshoff> I will ping you shortly.
14:58 -!- cartman [n=ismail@kde/ismail] has quit ["I can barely stop"]
15:01 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has joined #sage-devel
15:01 < mabshoff> jaap: http://sage.math.washington.edu/home/mabshoff/singular-3-0-4-1-20071209.p0.spkg
15:01 < mabshoff> yi: are you around?
15:01 < mabshoff> I am curious if I should merge that existing DSage patch?
15:03 < yi> mabshoff: yeah i'm here right now
15:03 -!- jkantor_afk is now known as jkantor
15:06 < jaap> mabshoff: running
15:06 < mabshoff> hi yi
15:06 < mabshoff> So what do you think about http://trac.sagemath.org/sage_trac/ticket/1077 ? 
15:07 < mabshoff> Apply it now or alternatively wait on some larger code drop you have?
15:07 < mabshoff> I would prefer to apply 1077 now, unless your code is pretty much ready to go in 
15:07 < mabshoff> the next couple your
15:07 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has quit []
15:07 < mabshoff> your->hours.
15:07 < yi> mabshoff: ok, i agree with that
15:07 < yi> mabshoff: let me look at it again first though
15:08 < mabshoff> We will do two more releases this year, so there are plenty of chances.
15:08 < mabshoff> Sure, let me know what you think.
15:11 < craigcitro> mabshoff: so the issue with "make" before is just that the version of make on my machine (which i installed with fink) doesn't recognize -B. it's 3.79-1 ... apparently 3.81-2 is current, but i can't figure out how to make fink update its list of available packages. ;)
15:12 < yi> mabshoff: ok, go ahead and merge that one in, let me if any unit tests fail
15:14 < yi> me know rather
15:14 < mabshoff> yi: sure
15:15 < jaap> mabshoff:
15:15 < mabshoff> craigcitro: xcode ships its own make, so I don't understand why fink's would be in $PATH first.
15:15 < jaap> Singular-3-0-4
15:15 < jaap> real    8m26.464s
15:15 < jaap> user    7m24.699s
15:15 < jaap> sys     0m38.182s
15:15 < jaap> Successfully installed singular-3-0-4-1-20071209.p0
15:15 < jaap> Now cleaning up tmp files.
15:15 < jaap> Making SAGE/Python scripts relocatable...
15:15 < jaap> Making script relocatable
15:15 < jaap> [jaap@paix sage-2.9.alpha7]$ 
15:15 < mabshoff> jaap: thanks
15:15 < craigcitro> mabshoff: once you install fink, it puts its paths (/sw/bin, etc) at the beginning of your path by default
15:15 < mabshoff> ok, that sucks.
15:16 < craigcitro> or, at least, i think it did. maybe i did at some point.
15:16 < mabshoff> Well, I hadn't heard of that issue before. How old is your fink install=
15:16 < mabshoff> ?
15:16 < craigcitro> 2 years? ;) from when i got the comp.
15:16 < craigcitro> i installed fink the first day
15:16 < mabshoff> :)
15:16 < craigcitro> and then have let it sit
15:16 < mabshoff> Never updated I assume?
15:16 < craigcitro> causing occasional annoyances
15:16 < craigcitro> hah nods of course
15:16 < craigcitro> i only think of it at times like this, where i don't want to wait while it updates 500 packages or whatever
15:17 < mabshoff> :) - let me look at the makefiles then. I am not even sure why Bill uses "-B"
15:17 < craigcitro> grin
15:17 < mabshoff> Please open a ticket for it.
15:17 < craigcitro> sure.
15:18 < janwil> oh well, sage really builds a long time from the sources ... I'll go to bed now ... mabshoff, I will let you know how this test with alpha7 source build ended in near future
15:18 < mabshoff> janwil: no problem. 
15:18 < mabshoff> I will still be up by the time you should wake up ;)
15:18 < janwil> ok, then perhaps see you in 8 hours or so :)
15:19 < mabshoff> cu
15:19 -!- janwil [n=jan@213-35-169-226-dsl.trt.estpak.ee] has left #sage-devel []
15:20 < craigcitro> according to the fink database online, 3.79.1 is the newest version of make in the stable branch, which means that I'm not likely to be the only person running into this problem.
15:21 < mabshoff> shesh
15:21 < mabshoff> They need to get with the program.
15:21 < mabshoff> -B is an alias to --always build.
15:21 < mabshoff> I think we can drop it. I am testing on sage.math and bsd to see what happens.
15:21 < craigcitro> --always-build isn't in the old verison of make either
15:21 < mabshoff> It is "only" needed for the check target anyway.
15:22 < mabshoff> ok
15:22 < mabshoff> gmake 2.79 is ancient I think.
15:22 < mabshoff> Bill probably added the -B to force a rebuild every time when testing.
15:23 < mabshoff> Since we always build from a clean tree I don't think it will be an issue for us.
15:23 < craigcitro> k
15:24 < mabshoff> craigcitro: try http://sage.math.washington.edu/home/mabshoff/flint-1.02.p0.spkg
15:24 < craigcitro> can i just kill the copy of the flint spkg in my install directory, drop that in, and type make again?
15:25 < mabshoff> Yep
15:25 < craigcitro> or is the name of that spkg also in a file?
15:25 < craigcitro> k
15:25 < mabshoff> You don't even need to delete the old copy.
15:25 < mabshoff> The one with the latest time stamp will get build.
15:26 < craigcitro> k, it's installing. i'll keep an eye on it.
15:26 < craigcitro> and in the meantime, start working on my other machine.
15:26 < mabshoff> Sure, the tests will run a while.
15:26 < mabshoff> ;)
15:27 < craigcitro> nods
15:27 < craigcitro> especially on my slow laptop.
15:27 < mabshoff> But a less buggy FLINT will pay of in the long term.
15:27 < mabshoff> The mandatory make check will be removed in the final 2.9 release.
15:27 < craigcitro> wstein-1000: so for sd8, is it going to be exactly during that week of spring break, or will it include the weekend before?
15:29 -!- pdehaye [n=pdehaye@dehaye1.merton.ox.ac.uk] has quit []
15:39 < mabshoff> craigcitro: It build and passes tests for me on linux and OSX.
15:39 < craigcitro> the flint pkg?
15:39 < mabshoff> So if your tests started running I can close this ticket.
15:39 < mabshoff> Yep.
15:39 < craigcitro> it built fine for me, tests are running.
15:40 < mabshoff> ok, then I am done with that done.
15:40 < craigcitro> good times.
15:40 < mabshoff> Pfeww, much easier than I feared.
15:40 < mabshoff> :)
15:40 < wstein-1000> i just got off the phone with Fernando Perez and the enthought cure!
15:40 < mabshoff> cure?
15:40 < wstein-1000> Maybe we'll have a Sage Days at Enthought soon...
15:40 < wstein-1000> crew.
15:40 < jkantor> that would be cool
15:40 < wstein-1000> s/cure/crew
15:40 < mabshoff> yep
15:41 < craigcitro> so that would definitely be another numerical-themed SD, right?
15:44 < jaap> Anybody interested could try to build my very, very experimental enthought  spkgs :)!
15:46 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has joined #sage-devel
15:47 < dmharvey> hi
15:47 < dmharvey> maybe I can work on a bug now
15:47 < mabshoff> Hi
15:47 < dmharvey> 2.9.alpha7 took like 5 hours to build on my G5
15:47 < dmharvey> that's ridiculous
15:48 < mabshoff> :|
15:49 < jkantor> its not atlas 
15:56 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
15:57 < mabshoff> hi robertwb
15:58 < robertwb> hi
15:58 < mabshoff> Do you think your rubik's cube solver is ready to go in?
15:58 < mabshoff> William wants it and 400 kb is an acceptable size increase from what I understand.
15:59 < mabshoff> And since David's new book uses that code it might also be a good idea in general ;)
15:59 < mabshoff> ok, merging 1077 for now.
15:59 < robertwb> I think it's ready to go
16:00 < robertwb> Of course, we need to get a lot more people to test it, but there's nothing too tricky about it. 
16:00 < dmharvey> question about http://sagetrac.org/sage_trac/ticket/1400
16:00 < mabshoff> ok. Maybe wstein-1000 has some input on it?
16:00 < dmharvey> does it suffice for now to just have a stupid algorithm?
16:00 < dmharvey> i.e. just take powers until we hit 1?
16:00 < wstein-1000> rmharvey -- I just built sage on an old G5 at Harvard.
16:00 < wstein-1000> It took 197 minutes.
16:00 < wstein-1000> So 3 hours.
16:01 < dmharvey> wstein: dual-core?
16:01 < wstein-1000> i mean dmharvey
16:01 < wstein-1000> no -- i used non-parallel make.
16:01 < dmharvey> hmmm
16:01 < dmharvey> my machine must suck
16:01 < wstein-1000> I don't know if it is dual processor or not
16:01 < mabshoff> rm harvey ;)
16:01 < wstein-1000> possible.
16:01 < dmharvey> wstein: see my Q above?
16:01 < mabshoff> There are several G5 generations.
16:01 < wstein-1000> i built on fermath.math.harvard.edu, which is an xserve
16:01 < wstein-1000> I just got done with an endless stream of meetings and stuff.
16:01 < wstein-1000> now I can work on sage.
16:02 < mabshoff> :)
16:02 < dmharvey> re: 1400, does PARI have a function for orders of elements of class groups, or do I just implement something stupid?
16:02 < cwitty> robertwb: any thoughts on #1419 (java3d requires Internet)?
16:02 < wstein-1000> what's the score?
16:02 < robertwb> being an xserve, it might have faster hard drive access (which may be a significant factor in building sage)
16:02 < wstein-1000> yes
16:02 < mabshoff> I think on OSX process creation and linking is really expensive.
16:02 -!- wstein-1000 is now known as wstein-1400
16:02 < robertwb> cwitty: not yet. I've been playing with jmol, and also looking at another 3d bug
16:03 < mabshoff> If I run testall on my iBook under Linux sage starts 3 times as fast as under OSX 10.4.11 on the  same hardware
16:03 < mabshoff> So there is a sigificant difference in total time for testall.
16:03 < wstein-1400> we *really* need a symbolic matrix type!
16:03 < wstein-1400> this is ridiculous
16:04 < wstein-1400> so many people get confused by the pitiful speed of generic symbolic matrices.
16:04 < dmharvey> wstein-1400: huh? are you talking about 1400?
16:04 < wstein-1400> no
16:04 < wstein-1400> I just checked email
16:08 < craigcitro> mabshoff: just got another build error, this time on libgpg_error.
16:09 < mabshoff> really? That one we haven't touched in a while.
16:09 < mabshoff> When was the last time you build on that box?
16:09 < craigcitro> yeah ... it's a weird one. it says it was a parse error, but i'm looking at that point in the file, and it looks fine.
16:09 < mabshoff> Can you paste the error?
16:09 < craigcitro> honestly, i'm not sure ... somewhere around sd5 for sure, but i've been busy, so i might have just been doing -upgrade since then.
16:09 < craigcitro> sure
16:09 < craigcitro> oh, wait, i can't read
16:09 < mabshoff> yi: your dsage bundle contains 22 or so changesets.
16:09 < craigcitro> lemme look one more sec
16:10 < mabshoff> yi: Is that the right one?
16:10 < craigcitro> wow ... awk apparently produced some bogus output.
16:11 < yi> mabshoff: yeah unfortunately i didn't just export a single patch, most of the changes are for the web interface stuff
16:11 < mabshoff> Should I still apply?
16:11 < craigcitro> gcc -I. -I. -o mkerrcodes ./mkerrcodes.c
16:11 < craigcitro> In file included from ./mkerrcodes.c:26:
16:11 < craigcitro> ./mkerrcodes.h:17: error: parse error before â
16:11 < craigcitro> ./mkerrcodes.h:39: error: parse error before â
16:11 < craigcitro> ./mkerrcodes.h:41: error: parse error before â
16:11 < craigcitro> ./mkerrcodes.h:58: error: parse error before â
16:11 < craigcitro> ./mkerrcodes.h:60: error: parse error before â
16:11 < craigcitro> ./mkerrcodes.h:76: error: parse error before â
16:11 < craigcitro> ./mkerrcodes.h:79: error: parse error before â
16:11 < craigcitro> ./mkerrcodes.h:86: error: parse error before â
16:11 < craigcitro> ./mkerrcodes.h:96: error: parse error before â
16:11 < craigcitro> ./mkerrcodes.h:98: error: parse error before â
16:11 < craigcitro> make[4]: *** [mkerrcodes] Error 1
16:11 < craigcitro> make[3]: *** [all-recursive] Error 1
16:11 < craigcitro> make[2]: *** [all] Error 2
16:11 < craigcitro> that was the error.
16:11 < craigcitro>   { 36, "GPG_ERR_EINPROGRESS" },
16:11 < craigcitro>   { 4 GPG_ERR_EINTR, "GPG_ERR_" },
16:11 < craigcitro>   { 22, "GPG_ERR_EINVAL" },
16:11 < craigcitro>   { 5 GPG_ERR_EIO, "GPG_ERR_" },
16:11 < craigcitro>  
16:11 < craigcitro> that's two good and two bad lines from mkerrcodes.h
16:11 < craigcitro> you can see that the two really are just wrong
16:12 < mabshoff> Can you add two commas?
16:12 < mabshoff> wait.
16:12 < mabshoff> nonsense.
16:12 < craigcitro> nod, i know
16:12 < mabshoff> What package is that in?
16:12 < craigcitro> it looks like those just got totally screwed up.
16:12 < mabshoff> I assume fink is interferring.
16:13 < craigcitro> libgpg_error-1.5
16:13 < craigcitro> different awk version maybe?
16:13 < mabshoff> Can you compare the awk release numbers for OSX and fin?
16:13 < wstein-1400> does the source code ?? work for *anybody* from the notebook in alpha7?
16:13 < mabshoff> +l
16:14 < wstein-1400> from command line it works fine.
16:14 < craigcitro> the spkg is *identical* to the one that's successfully installed on my system (in my 2.8.15 install)
16:14 < wstein-1400> actually, no it doesn't...
16:14 < wstein-1400> I mean for cython files.
16:15 < mabshoff> craigcitro: Is that a different system?
16:16 -!- wstein-1400 is now known as wstein-1514
16:17 < craigcitro> no, it's the same system
16:17 < craigcitro> that's what i mean ... it's obviously installed fine before
16:17 < craigcitro> which is weird
16:17 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has quit []
16:17 < mabshoff> Did you update anything else?
16:17 < craigcitro>  /usr/bin/awk won't tell me its version.
16:17 < craigcitro> nope.
16:17 < craigcitro> there we go
16:17 < craigcitro> -V
16:18 < mabshoff> Any chance you hit the dreaded vfork() ceiling??
16:18 < wstein-1514> robertwb -- capeman in jmol -- w00t!
16:18 < robertwb> :)
16:18 < craigcitro> awk version 20040207 vs. GNU Awk 3.1.4
16:18 < wstein-1514> robertwb is it a scene description file?
16:18 < craigcitro> mabshoff: maybe ... how do i check that again? 
16:18 < robertwb> it's a bunch of files, with a jmol script
16:18 < wstein-1514> I see
16:18 < wstein-1514> Fascinating.
16:19 < robertwb> (all automatically generated though)
16:19 < wstein-1514> Does it feel snappy to rotate around or sluggish.
16:19 < wstein-1514> ?
16:19 < mabshoff> "ulimit -u"
16:19 < robertwb> it's pretty snappy, better than I expected
16:19 < wstein-1514> cool!
16:19 < robertwb> There's some numbers at the bottom--44ms, which I think is the render time.
16:20 < mabshoff> craigcitro: If it is a "100" you might need to raise it, especially 
16:20 < craigcitro> mabshoff: it's 100 ... how do i bump it up? (i know this is in an old email from justin walker ...)
16:20 < mabshoff> http://www.macosxhints.com/article.php?story=20060315121122636
16:20 < craigcitro> s'weird, becaues i've never run into it before.
16:20 < wstein-1514> that sounds good.
16:20 < mabshoff> But if that is the problem it should say somewhere in the logs that vfork() failed.
16:20 -!- malb [n=malb@host217-44-106-17.range217-44.btcentralplus.com] has joined #sage-devel
16:20 < mabshoff> Hi malb
16:20 < robertwb> up to 100ms, or maybe even 200ms should still be snappy enough
16:20 < wstein-1514> I turned sagemath.org back on as a download site this morning -- and it's got > 200 downloads since then.
16:21 < malb> hi
16:21 < wstein-1514> hi malb
16:21 < mabshoff> :)
16:21 < malb> how is the bugday going
16:21 < malb> ?
16:21 < wstein-1514> i just joined.
16:21 < mabshoff> A little slow for starters, but now it seems to pick up.
16:21 < craigcitro> mabshoff: interestingly, i don't have the file they tell me to modify.
16:22 < mabshoff> I rolled a new singular.spkg with the Slackware 12 fix.
16:22 < wstein-1514> excellent.
16:22 < mabshoff> craigcitro: you might need to create it. I think it applies to OSX 10.4.
16:22 < mabshoff> wstein-1514: it is already in rc0 :)
16:22 < mabshoff> As well as the updated ntl.spkg
16:23 < mabshoff> waiting on yi to tell me if I should really merge all of dsage_latest. 
16:23 < wstein-1514> excellent.  
16:23 < mabshoff> Unless I overlooked his answer in which case I am sorry.
16:23 < wstein-1514> by the way, building sage on my build farm everything worked fine.
16:23 < wstein-1514> except the one weird clock skew issue.
16:23 < yi> mabshoff: yes you should
16:23 < mabshoff> I want to merge Robert's rubic's cube.
16:23 < mabshoff> yi: thanks.
16:23 < craigcitro> k, restarting.
16:23 -!- craigcitro [n=cc@pool-71-106-26-87.lsanca.dsl-w.verizon.net] has quit []
16:23 < mabshoff> Well, make adds really odd with clockskew, too.
16:24 < yi> wstein-1514: you have a build farm now? :)
16:24 < mabshoff> Remember the guy whose clock was a year or so in the future? That didn't go over too well ;)
16:25 < wstein-1514> :-)
16:26 < wstein-1514> I think sage-spkg used to touch all the files once before building....  back in the old days
16:26 < mabshoff> Eventually the build will succeed, but make will spin for a while.
16:26 < mabshoff> :)
16:26 -!- craigcitro [n=cc@pool-71-106-26-87.lsanca.dsl-w.verizon.net] has joined #sage-devel
16:27 < cwitty> robertwb, capeman's face looks oddly bumpy.  Is that a jmol sphere, or a mesh?
16:27 < mabshoff> yi: your patch touches "sage/rings/polynomial/polynomial_element.pyx"
16:27 < robertwb> jmol sphere
16:27 < yi> mabshoff: can you just ignore that changeset?
16:27 < craigcitro> mabshoff: same problem.
16:27 < yi> i don't know why it would touch that, it shouldn't
16:28 < mabshoff> I am looking into what changed.
16:28 < mabshoff> That is the exact reason I really dislike bundles.
16:28 -!- malb [n=malb@host217-44-106-17.range217-44.btcentralplus.com] has quit [Remote closed the connection]
16:29 -!- malb [n=malb@host217-44-106-17.range217-44.btcentralplus.com] has joined #sage-devel
16:30 < robertwb> cwitty: I'm sending a copy as a mesh, it looks smoother (but a lot more data transfer)
16:30 < wstein-1514> capeman has "character".
16:31 < mabshoff> odd, sage/rings/polynomial/polynomial_element.pyx doesn't show any changes by Yi.
16:31 < mabshoff> Maybe just a timestamp update? Does mercurial do that?
16:32 < mabshoff> Ok, I am doing a -ba followed by a testall to be on the save side.
16:34 -!- malb_ [n=malb@host86-141-246-136.range86-141.btcentralplus.com] has joined #sage-devel
16:34 < mabshoff> craigcitro: Can you try compiling with "sw" removed from PATH as well as DYLDLIBRAYPATH?
16:35 < mabshoff> Which OSX version are you running exactly?
16:37 < craigcitro> 10.4.11
16:37 < craigcitro> i probably got the .11 update since the last time i built sage from scratch.
16:37 < mabshoff> ok, same here on my end and I never saw that problem
16:37 < mabshoff> Did you try without "sw" yet?
16:39 < craigcitro> yep, that worked.
16:39 < wstein-1514> craigcitro -- i have a fresh alpha7 for ppc 10.4 sitting around.
16:39 < wstein-1514> want it?
16:39 < craigcitro> apparently gawk and awk do something slightly different.
16:39 < craigcitro> wstein-1514: sure. that'd make this easier. ;)
16:39 < wstein-1514> I'll make the bdist right now -- and have it to you in < 10 minutes.
16:40 < craigcitro> i was planning on installing 10.5 over the break ... maybe i'll do the work to just dump fink at the same time. :)
16:40 < mabshoff> alpha7 for OSX 10.4 ppc?
16:40 -!- photonn [i=not@cpe-76-182-223-216.tx.res.rr.com] has joined #sage-devel
16:40 < mabshoff> craigcitro: you are the canary for fink problems.
16:41 < craigcitro> grin
16:41 < craigcitro> it might also be that the versions of programs i have installed via fink are all really old.
16:41 < craigcitro> since i haven't really updated in about 2 years.
16:41 < mabshoff> Sure, but why now?
16:41 < craigcitro> true
16:41 < wstein-1514> fink isn't a "just works" sort of thing..
16:42 < craigcitro> that one was weird. looking at the input to gawk, it looked just fine
16:42 < craigcitro> but some of the lines were being treated differently than others
16:42 < mabshoff> wstein-1514: Does fink suck as badly as cygwin?
16:42 < wstein-1514> there were about 350 downloads of sage so far today just from my servers.
16:43 < wstein-1514> fink is way better than cygwin!!
16:43 < mabshoff> :)
16:43 < wstein-1514> at least os x is unix.
16:43 < wstein-1514> and at least fink "is" debian.
16:43 < mabshoff> Let's see what happens once we release 2.9. Maybe we will get another huge spike.
16:43 < wstein-1514> cygwin has some crazy crap package system that makes no sense.
16:43 < wstein-1514> fink has apt-get, which rocks.
16:43 < mabshoff> :]
16:44 < mabshoff> That is your opinion, but there are too many Debian fans in this channel.
16:44 < wstein-1514> alright -- I just fixed things to foo.bar?? works vastly vastly better...
16:45 < wstein-1514> it was great talking to all the enthought people on the phone by the way today.
16:45 < photonn> I dream of the day I can "apt-get install sage"  :)
16:45 < wstein-1514> they got majorly slashdotted as a result of sage and really appreciate it.
16:46 < wstein-1514> photonn -- same here ;-)
16:46 < wstein-1514> though evidently Robert Kern had to go home in order to get work done since they were so slashdotted.
16:46 < mabshoff> :)
16:46 < craigcitro> so that's weird
16:46 < mabshoff> I couldn't work on sage.math due to insane traffic.
16:47 < craigcitro> if i run the command that was breaking things, it works fine. but then i source local/bin/sage-env, and it breaks
16:47 < mabshoff> Anything I did I couldn't get off the server, not even to and other UW boxen.
16:47 < mabshoff> ok
16:47 -!- malb_ [n=malb@host86-141-246-136.range86-141.btcentralplus.com] has quit [Remote closed the connection]
16:47 -!- malb_ [n=malb@host86-141-246-136.range86-141.btcentralplus.com] has joined #sage-devel
16:48 -!- malb [n=malb@host217-44-106-17.range217-44.btcentralplus.com] has quit [Read error: 110 (Connection timed out)]
16:48 < wstein-1514> robertwb just posted a bundle for the jmol graphics stuff!
16:48 < mabshoff> Nice
16:48 < craigcitro> do we build our own gawk when building sage?
16:49 < mabshoff> Nope, but something else might interfere.
16:49 < mabshoff> What command are you running?
16:49 < craigcitro> no, it's still my system-wide one.
16:49 < craigcitro> it's just taking some output from grep and piping it into gawk -f  mkerrcodes.awk
16:50 < mabshoff> gawk if fink I assume?
16:50 < mabshoff> if->is
16:50 < craigcitro> nods
16:50 < craigcitro> gnu awk
16:50 < wstein-1514> craig -- in 3 minutes the binary at /home/was/tmp will be for you (on sage.math)
16:50 < craigcitro> my system-wide one doesn't identify itself as gnu, anyway
16:50 < craigcitro> cool
16:50 < mabshoff> Well, I knew that ;)
16:50 < wstein-1514> ETA 3.5 minutes.
16:51 < mabshoff> Well, rename gawk to something else temporarily and see if the problem goes away.
16:51 < craigcitro> though i am still a little curious what's causing the difference.
16:51 < mabshoff> +1
16:52 < craigcitro> well, gawk in my normal environment is producing correct output
16:52 < craigcitro> it's gawk + local/bin/sage-env that's causing something weird
16:52 < mabshoff> Sure, but in fink it seems to suck.
16:53 < mabshoff> Can you diff env before and after?
16:53 < mabshoff> wstein-1514: no patch at that ticket yet. Is it coming?
16:53 < craigcitro> mabshoff: i don't understand what you mean about "in fink"
16:53 < craigcitro> gawk is the fink-installed gawk
16:54 < mabshoff> I mean the old awk shipped by fink.
16:57 < craigcitro> wstein-1514: 258M total?
17:06 < mabshoff> sounds reasonable for a bdist.
17:15 < wstein-1514> yes
17:16 -!- cwitty_ [n=cwitty@sense-sea-MegaSub-1-205.oz.net] has joined #sage-devel
17:21 -!- cwitty [n=cwitty@newtonlabs.com] has quit [Read error: 113 (No route to host)]
17:23 -!- cwitty_ is now known as cwitty
17:33 < mabshoff> wstein-1514: first page: chunck->chunk
17:34 < mabshoff> Maybe: We envisage->We envison 
17:36 < mabshoff> mhh, it looks like you guys really like "to envisage" things. It sounds odd to my ears.
17:39 < mabshoff> page 3: soltions->solutions
17:40 < mabshoff> page4: veiws->views
17:41 < wstein-1514> thanks.  can you email them?  I'm going to forward all the emails of comments to my co-author who is working on the proposal all day tomorrow
17:41 < mabshoff> Sure, I am still reading.
17:42 < craigcitro> wstein-1514: just email you all comments on the proposal?
17:42 < wstein-1514> yep.
17:42 < wstein-1514> thanks!
17:42 < mabshoff> craigcitro: you might as well add my comments/corrections I post here -> less overlap.
17:43 < craigcitro> grin ok
17:43 < mabshoff> so, who likes envisage? Later on in the text you switch to envision ;)
17:43 < craigcitro> mabshoff: i found the root of the awk problem.
17:43 < craigcitro> envision is better, i think
17:43 < mabshoff> nice. please tell.
17:43 < mabshoff> Yep, it sounds less stuffy.
17:43 < mabshoff> I envisage sounds "overly Bitisch"
17:43 < wstein-1514> check out the rockin' patch : http://trac.sagemath.org/sage_trac/ticket/1514
17:44 < mabshoff> oops British
17:44 < mabshoff> Well, cwitty: are you around?
17:44 < mabshoff> It would rock if you could do patch review.
17:44 < mabshoff> There are so many patches in there ;)
17:45 < mabshoff> wstein-1514: Since you disliked 553 last time could you take another look? 
17:45 < mabshoff> Some other calculus fix depends on it.
17:45 < craigcitro> so the problem is one about the width of the number associated to the error code
17:45 < craigcitro> anything with two digits works fine, everything else breaks
17:45 < mabshoff> ok
17:46 < yi> mabshoff: ok i'm off now, let me know if something funky happens with the dsage bundle!
17:46 < mabshoff> So gawk screws up with the sage env.
17:46 < craigcitro> so they use FS="[ \t]+GPG_ERR_" as the "field separator" (i'd never known what this was before)
17:46 < mabshoff> yi: it compiled and seems to doctest well.
17:46 < craigcitro> mabshoff: i think it's the other way around. something in sage-env is changing how gawk behaves
17:46 < mabshoff> yi: Still waiting on the testall to finish.
17:46 < mabshoff> craigcitro: ok. please do the following: 
17:46 < wstein-1514> craigcitro -- did the binary work for you?
17:46 < craigcitro> the same gawk (i.e. exact same file getting run) has different behavior before and after sourcing sage-env
17:46 < mabshoff> a) from a clean shell: env >before.env
17:47 < mabshoff> b) sourecing local/bin/sage-env
17:47 < mabshoff> c) env >after.env
17:47 < craigcitro> wstein-1514: just grabbed it, haven't untarred yet ;)
17:47 < mabshoff> post the diff :)
17:47 < craigcitro> mabshoff: i already diff'd the two environments
17:47 < mabshoff> ok. And?
17:48 < craigcitro> so gawk has a "provide this variable to the environment while running" option, and playing with the path stuff didn't fix anything
17:48 < mabshoff> mhh
17:48 < craigcitro> lemme start looking at the rest of them.
17:48 < cwitty> I'll start reviewing patches in a few minutes.
17:48 < mabshoff> no sweat, but we should track that.
17:48 < mabshoff> cwitty: Excellent
17:49 < rlm-1464> mabshoff - i'm having some odd trouble with sage -b
17:49 < wstein-1514> hi.
17:50 < wstein-1514> I am going home and to dinner with wife etc right now.
17:50 < mabshoff> cu
17:50 < wstein-1514> I will be _back_ though for more bug day afterwards for the rest of the evening, I hope.
17:50 < mabshoff> :)
17:50 < rlm-1464> i can't get sage to build after *reverting*
17:50 < mabshoff> rlm-1464: what is happening?
17:51 < mabshoff> I assume the time stamp doesn't change in that case or alternatively is set back to the original date?
17:51 < rlm-1464> that's probably it
17:51 < rlm-1464> touching files will probably solve it
17:52 < mabshoff> Yeah, but that certainly isn't a good thing, since required manual interaction is always bad.
17:52 < mabshoff> yi: doctests pass with 1077 applied.
17:52 < rlm-1464> no, touching setup.py does nothing
17:52 < mabshoff> You have to touch the individual py[ixd] file I assume.
17:53 < mabshoff> "sage -ba" is the last ressort I guess.
17:54 < rlm-1464> setup.py was one of them, though
17:54 < mabshoff> ok, Did that used to work?
17:54 < rlm-1464> i don't know if it's because of that particular patch, but it did not too long ago
17:55 < mabshoff> Well, that patch is the only one effecting that functionality
17:56 < mabshoff> You might want to delete the cached sobj, but that might force a complete rebuild.
17:56 < rlm-1464> i'm doing -ba anyway...
17:56 < mabshoff> Well, that's certainly the radical solution.
17:57 < mabshoff> But open a ticket about this, we need to have that fixed.
17:57 < craigcitro> mabshoff: is there an easy way to track what files a program touches when it runs? i used to know something like this on my linux box, maybe strace?
17:58 < craigcitro> AHA
17:58 < craigcitro> nevermind
17:58 < craigcitro> i think i found the problem
17:58 < wstein-1514> robertwb -- before going home I had to try your trachttp://sagetrac.org/sage_trac/ticket/1511
17:58 < wstein-1514> it frickin' *** rocks ***
17:58 < wstein-1514> this it the 3d we've been waiting for.  seriously.
17:58 < mabshoff> :)
17:58 < craigcitro> mabshoff: yep, i spotted the problem. it's the LANG=...
17:59 < craigcitro> setting or unsetting that breaks things with the gawk on my machine.
17:59 < mabshoff> ok, that is really annoying.
17:59 < robertwb> wstein-1514: I totally agree. 
17:59 < mabshoff> What does Sage set it to?
17:59 < craigcitro> en_US.UTF-8
17:59 < mabshoff> ok, but awk is probably too old to handle that.
17:59 < robertwb> I'm going to integrate it into the notebook next
18:00 < mabshoff> Any particular reason we decided to go with that LANG?
18:00 < craigcitro> maybe someone recently added it with an eye towards our multi-language support?
18:01 < wstein-1514> robertwb -- do it!
18:01 < mabshoff> Well, in the spkg-install export LANG=C or something else unoffensive.
18:01 < wstein-1514> I have to admit that when I first ever used math software -- when an undergrad -- I used Mathematica,
18:01 < wstein-1514> and all I ever did was draw 3d graphs.
18:01 < wstein-1514> That's it.
18:01 < robertwb> BTW, should we go ahead and order some red/blue glasses for the booth?
18:01 < wstein-1514> I feel nostalgic, since finally this is something that can really work for us.
18:01 < robertwb> ($0.40 or so each, for 50 or more)
18:01 < wstein-1514> (Given all the constraints)
18:01 < wstein-1514> Definitely, we need to trac down glasses.
18:03 < robertwb> BTW, I fixed that parametric surface bug you sent me
18:03 < robertwb> http://sagetrac.org/sage_trac/ticket/1515
18:05 < jkantor> is there a wiki about the 3d stuff
18:05 < robertwb> Funny how the chemists came in, first for Tachyon, and now for dynamic 3D
18:06 < robertwb> BTW, here's the cheapest place I found for glasses
18:06 < robertwb> http://store.rainbowsymphonystore.com/3dglasses.html
18:06 < jkantor> jaap:?
18:06 < wstein-1514> And the Pi on the Sage grant proposal I just posted -- Bill Reinhardt -- he's a chemist!
18:06 -!- wstein-1514 [n=was@D-69-91-158-192.dhcp4.washington.edu] has quit []
18:10 -!- cwitty is now known as cwitty-review-13
18:10 -!- cwitty-review-13 is now known as cwitty-rvw-1395
18:14 < cwitty-rvw-1395> mabshoff, 1395 looks good.
18:17 -!- cwitty-rvw-1395 is now known as cwitty-rvw-1423
18:18 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has quit []
18:20 < rlm-1464> mabshoff - amazingly, sage -ba does not affect it
18:20 < rlm-1464> the .pyx file is gone, but the .c file is still there
18:20 < mabshoff> So does the C file still get build? 
18:21 < mabshoff> cwitty: thanks, in the merge que
18:22 < rlm-1464> it seems to just be still sitting around to be imported
18:22 < craigcitro> rlm-1464: what's the filename? any chance this is a case-insensitivity issue? (i once ran into something similar with that being the cause.)
18:22 < rlm-1464> it doesn't copy the .so file to the python directory...
18:22 < rlm-1464> everything has been lower case the whole time
18:23 < mabshoff> ok.
18:24 < mabshoff> rlm-1464: try deleting .cython_hash
18:24 < rlm-1464> also, i cannot clone out from under the changes
18:24 < mabshoff> bad
18:24 -!- malb_ [n=malb@host86-141-246-136.range86-141.btcentralplus.com] has quit [Read error: 110 (Connection timed out)]
18:24 < rlm-1464> where?
18:24 < mabshoff> in SAGE_LOCAL/devel/sage
18:25 < mabshoff> But the cloning issue might be related to the revert.
18:26 < rlm-1464> hey craig, remember the last time i ran out of disk space??
18:26 < craigcitro> hahahah
18:26 < rlm-1464> now where are my emoticons...
18:26 < craigcitro> is it the same issue?
18:26 < rlm-1464> god damnit
18:26 < craigcitro> that's pretty funny
18:26 < craigcitro> not so much for you
18:26 < craigcitro> but for me.
18:26 < mabshoff> :)
18:26 < rlm-1464> clearly i need more disk space
18:26 < mabshoff> I ran out of disc space on sage.math 
18:27 < craigcitro> yep. external hard drives are getting cheap these days ...
18:27 < mabshoff> In the *root* partition!
18:27 < rlm-1464> well, i found a couple leads on my bugs today
18:27 < rlm-1464> maybe this is a sign...
18:28 < mabshoff> :)
18:28 < cwitty-rvw-1423> rlm-1464, is there a bug where some Sage component is not printing "out of disk space" when it should?
18:28 < rlm-1464> if you call it a bug
18:28 < rlm-1464> i would be more sane if my computer told me when i ran out of disk space, yes
18:28 < mabshoff> Well, mabye we should check in sage-spkg that there is at least k MB free and 
18:28 < mabshoff> otherwise bail out.
18:29 < cwitty-rvw-1423> Sounds like a bug to me...
18:29 < mabshoff> Yep
18:29 < mabshoff> I will open a ticket
18:29 < rlm-1464> and it's still importing the missing module...
18:29 < mabshoff> I have been bitting by that issue also on the Sun box William has.
18:29 < mabshoff> Too little disc space, until I moved to scratch to build.
18:30 < rlm-1464> hmm
18:30 < rlm-1464> i'll try to provide a simple repro of this revert bug tomorrow (promised girlfriend dinner tonight!)
18:30 < rlm-1464> cu later
18:30 -!- rlm-1464 [n=rlm@c-71-197-245-35.hsd1.or.comcast.net] has quit []
18:34 < mabshoff> craigcitro: Did you send an email with the suggestions?
18:34 < craigcitro> i'm about to do that -- more to add?
18:34 -!- william_stein_ [n=was@c66-235-34-166.sea2.cablespeed.com] has joined #sage-devel
18:34 < mabshoff> Nope, didn't see any more issues.
18:34 < william_stein_> hi
18:34 < mabshoff> Except I thought that "cyber" sounded very 90's :)
18:34 -!- william_stein_ is now known as wstein-1515
18:34 < wstein-1515> I'll look at at 1515 now.
18:34 < cwitty-rvw-1423> wstein-1515, I just gave your #1423 patch a negative review.
18:34 < wstein-1515> mabshoff -- it's forced on us "cyber"
18:35 < mabshoff> really? Why?
18:35 < wstein-1515> thanks
18:35 -!- cwitty-rvw-1423 is now known as cwitty-rvw-1425
18:35 -!- Yasumoto [n=Yasumoto@unaffiliated/yasumoto] has quit [Read error: 113 (No route to host)]
18:35 -!- wstein-1515 is now known as wstein-1423
18:35 < craigcitro> mabshoff: i don't see the veiws on pg 4
18:35 < craigcitro> where is it?
18:35 < mabshoff> page 3
18:36 < mabshoff> I think it was "off by one" :)
18:36 < mabshoff> isn't the pdf searchable?
18:37 < mabshoff> wstein-1423: rlm found an issue with the cython timestamp version of "sage -b"
18:37 < wstein-1423> what?
18:37 < mabshoff> If you revert a changeset that thereby removes a file bad things happen.
18:37 < mabshoff> But we haven't really tracked it down, he is gone, making dinner for his GF
18:38 < mabshoff> Even "sage -ba" doesn't fix it. But it might "just" be a bad revert. I have no idea
18:38 < mabshoff> which patches he reverted.
18:38 < wstein-1423> hmmm.
18:38 < wstein-1423> What bad thing happens?
18:39 < mabshoff> the pyx file was gone, the C file still there.
18:39 < mabshoff> And the module seems to still be imported.
18:39 < mabshoff> I think he should give some more details once he is back/shows up again.
18:39 < wstein-1423> ok
18:39 < mabshoff> He didn't open a ticket yet.
18:39 < wstein-1423> my patch is incredibly simple, so....
18:39 < cwitty-rvw-1425> wstein-1423: about #1423; it looks dangerous to have default parameters globals={}, locals={}.  If those are side-effected, the side effects will persist across function invocations.
18:40 < mabshoff> I told him to delete the hash value in .cython_hash, but I have no idea if he did that.
18:40 < wstein-1423> cwitty -- agreed!
18:44 < wstein-1423> re: deleting .cython_hash -- touching *any* pyx file should be equivalent.
18:44 < mabshoff> ok, then maybe something else is wring
18:45 < mabshoff> -i+o
18:46 < cwitty-rvw-1425> If all he did was delete a pyx file (by reverting the patch), then that probably doesn't count as "touching any pyx file".
18:47 < mabshoff> well, I think he also simultaniously ran out of disc space, so something else might have happened.
18:48 -!- cwitty-rvw-1425 is now known as cwitty-rvw-1460
18:51 < wstein-1423> cwitty -- see http://sagetrac.org/sage_trac/ticket/1423
18:51 < wstein-1423> Try applying part2 now.
18:51 < wstein-1423> I think it fixes all the issues you remarked about.
18:51 < mabshoff> Tim answered you special functions proposal
18:52 < wstein-1423> tim's answer is great.
18:53 -!- cwitty-rvw-1460 is now known as cwitty-rvw-1423
18:53 < mabshoff> great wink wink or great?
18:55 < wstein-1423> :-)
18:55 < wstein-1423> Great in a good sense -- see my response.
18:55 < mabshoff> He certainly has a point about branch cuts and so on. And some interesting 
18:55 < mabshoff> perspective on past efforts since he seemed to have participated.
18:58 < wstein-1423> that sort of technical stuff will only be needed if we get past the pre-proposal stage.
18:59 < mabshoff> sure
18:59 < wstein-1423> There are going to be something like 1,500 pre-proposals; then several hundred actual proposals; then like 40-50 get funded.
18:59 < cwitty-rvw-1423> mabshoff, I like #1423 now.
18:59 < wstein-1423> cool.
18:59 -!- cwitty-rvw-1423 is now known as cwitty-rvw-1460
18:59 < mabshoff> Cool, I am about to start merging again.
19:00 < mabshoff> Does anybody know if http://trac.sagemath.org/sage_trac/ticket/1123 is still a problem?
19:00 < mabshoff> That seems like a ticket that should be fixed before AMS.
19:01 < craigcitro> so there's a bug mentioned in comments in libs/pari/gen.pyx that isn't on trac (yet). i've figured out what's going wrong, but i'm not sure how to fix it ... so i'm looking for suggestions. :)
19:01 < craigcitro> here's the bug: if you do v = pari(range(5)), w = pari(range(3)), v[0] = w
19:02 < craigcitro> then do v[0][0] = 10
19:02 < craigcitro> it doesn't work
19:02 < craigcitro> the problem is a memory management issue
19:02 < mabshoff> ok. Which line is the comment on?
19:02 < craigcitro> v[0][0] gets turned into v.__getitem__(0).__setitem__(0,10)
19:02 < mabshoff> oops
19:02 < craigcitro> it's in the docstring for __setitem__ (i've edited my file here and there)
19:02 < mabshoff> ok
19:03 < craigcitro> so the issue is this. v.__getitem__ will return a *new object* that references the GEN pointed to by v[0]
19:03 < craigcitro> so then the __setitem__ call does what it's supposed to, and everything is good just before that function returns
19:04 < craigcitro> so __setitem__ knows about this problem, and adds a reference in self.refers_to
19:04 < craigcitro> which is a nice and simple solution
19:05 < craigcitro> the problem is that the value returned by v.__getitem__ is the one that gets the value dropped in its refers_to dictionary, and that gets deallocated after the __setitem__ call is processed, because it's not needed anymore!
19:05 < craigcitro> so the first simple fix would be to have __getitem__ add info into its refers_to dictionary
19:05 < craigcitro> at least the most naive version of that can be easily made to fail, though.
19:06 < craigcitro> so these are the solutions i can think up so far:
19:07 < craigcitro> (1) have a (python) list floating around in gen.pyx, that's called "outsmart_python_garbage_collector" that we just wantonly add references to (this is a horrible idea, but would work)
19:07 < wstein-1423> I think #1123 is invalid.
19:07 < wstein-1423> regarding #1123 -- if that were valid *nobody* who used the binaries of sage would be able to use the notebook.
19:07 < mabshoff> invalid or fixed at some previous point in time?
19:07 < wstein-1423> Clearly that isn't the case.
19:07 < wstein-1423> I suspect it was a permissions error that had nothing to do with the notebook per se.
19:07 < mabshoff> Yep, I would think it would have popped up more often.
19:07 < wstein-1423> But they saw some paths in the error message and got confused.
19:07 < craigcitro> (2) let self.refers_to (which i think should be renamed _refers_to) store a list for each index, and keep adding onto it.
19:08 < mabshoff> ok, let's invalidate.
19:08 < wstein-1423> There *was* a path hardcoding issue with the notebook, not that one, which I fixed about a month ago...
19:08 < wstein-1423> ok, I'm now really off to dinner; will be back for a while tonight and very available tomorrow too to help with 2.9
19:08 < mabshoff> That is one of the good things about the vmware image: Once it is configured properly it should just work.
19:08 < wstein-1423> that vmware image rocks.
19:08 < wstein-1423> I have to say.
19:08 < mabshoff> cu wstein-1423
19:08 < mabshoff> Yep. 
19:09 < craigcitro> this isn't bad, but we're still artificially adding references to things, which means that it's possible for us to be pointing to something that is actually ready for deallocation
19:09 < wstein-1423> it's very secure and people can set it up as a server, etc...
19:09 < mabshoff> I will be around all day tomorrow to get 2.9 out the door.
19:09 -!- wstein-1423 [n=was@c66-235-34-166.sea2.cablespeed.com] has quit []
19:09 < craigcitro> which is ultimately a memory leak; mabshoff will hate that option.
19:09 < mabshoff> :)
19:09 < mabshoff> I still have to hunt those NTL issue down.
19:10 < craigcitro> cwitty-rvw-1460: could i con you into reading the stuff i said above and seeing if you can think of something? (you seem like you've dealt with the pari/sage interface a decent bit at this point)
19:10 < craigcitro> yeah, did you get an omega log?
19:10 < mabshoff> I started a clean omega session (which takes two hours) and killed it by accident.
19:10 < craigcitro> snic
19:10 < mabshoff> CTRL-D .... D'oh
19:10 < craigcitro> so did you document that LANG=... issue somewhere?
19:10 < mabshoff> Note yet. Open a ticket, so we can fix it in that package only for now.
19:10 < craigcitro> the build is progressing other than that.
19:10 -!- william_stein_ [n=was@c66-235-34-166.sea2.cablespeed.com] has joined #sage-devel
19:10 < mabshoff> I think LANG=C is posix, so that should work.
19:11 < mabshoff> quick dinner?
19:11 < craigcitro> mabshoff: what are the known doctest failures on osx-intel?
19:11 < mabshoff> maybe numerical/test.ps
19:11 < craigcitro> i forgot that i'd started a make check on my other machine, seems to have come up with a bunch of doctest failures
19:11 < mabshoff> ok, which ones?
19:12 < cwitty-rvw-1460> mabshoff, you could run "sage -omega" under vmware and take a snapshot once it got to the prompt.
19:12 < craigcitro> if i do a "make check", does it save that anywhere by default?
19:12 < mabshoff> cwitty: What do you mean by snapshot?
19:13 < mabshoff> craigcitro: If compilation fails the check target is executed on the broken tree.
19:13 < cwitty-rvw-1460> I'm pretty sure you can save the current state of vmware (including running programs, etc.)
19:13 < mabshoff> So you should make sure that "check" finished.
19:13 < mabshoff> cwitty-rvw-1460: Excellent point. 
19:13 < mabshoff> D'ooh 
19:14 < mabshoff> It is so obvious once you get told how to do it.
19:14 < mabshoff> I am actually planning on using the instant report mode, i.e. the leaks are 
19:14 < mabshoff> reported as they happen. 
19:14 < cwitty-rvw-1460> craigcitro, I'm looking at your pari question.
19:14 < craigcitro> mabshoff: i'm confused. the make check finished, but it's on my other machine, so i can't easily copy-paste into irc.
19:14 < craigcitro> :)
19:15 < craigcitro> i can ssh over there though -- should i manually stick it in a file?
19:15 < cwitty-rvw-1460> The actual question is whether the original build finished.
19:15 < craigcitro> cwitty-rvw-1460: cool. let me know if i need to explain more -- i have a nice picture on a piece of paper next to me with the problem.
19:15 < mabshoff> craigcitro: Just scp the log to sage.math, I will look at it here
19:15 < cwitty-rvw-1460> Look at install.log, and see if the end looks reasonable.
19:15 < mabshoff> +1
19:15 < craigcitro> ahh, no, i wanted the info "tmp/test.log"
19:15 < craigcitro> i was probably asking not the right question.
19:16 < cwitty-rvw-1460> We skipped right past your question, and went into trying to figure out why you might have lots of doctest failures when other people have few or none.
19:16 < craigcitro> ahhh
19:16 < mabshoff> :)
19:17 < craigcitro> yeah, the original install finished fine, i'm pretty sure
19:17 < craigcitro> lemme scp that, too
19:17 < mabshoff> pay attention, craig :-)
19:17 < craigcitro> hah exactly
19:18 < craigcitro> so despite william's urging to just use the binary he gave me, i've still got the install going on my ppc, and it just died on matplotlib
19:18 -!- wstein_iphone [n=root@32.154.209.104] has joined #sage-devel
19:19 < mabshoff> So my guess is that fink is screwing with you.
19:19 < craigcitro> fink is likely the problem on my machine, but it's never caused me trouble before, which is odd
19:19 < mabshoff> Maybe we should remove all references to sw in PATH as well as LD_LIBRARY_PATH
19:19 < wstein_iphone> just mv itout of the way
19:20 < mabshoff> That is what bothers me the most.
19:20 < mabshoff> There most by other people who have fink installed on their macs and there 
19:20 < mabshoff> aren't any plausible bug reports pointing to fink.
19:20 -!- wstein_iphone [n=root@32.154.209.104] has quit [Read error: 104 (Connection reset by peer)]
19:21 < craigcitro> nod
19:21 < craigcitro> ok, so /home/citro/2.9-alpha7-test.log and -install.log
19:21 < mabshoff> mk
19:21 < craigcitro> those are off my intel osx 10.4
19:21 < mabshoff> Is that from the binary?
19:21 < craigcitro> the install.log seems clean -- the word "failed" only occurs in the reasonable places
19:21 < craigcitro> no, the binary is for ppc
19:21 < mabshoff> :)
19:22 < craigcitro> sorry, i'm being confusing, because i have issues on two different machines
19:22 < mabshoff> ok, one thing for potential problems: If you source sage-env from an older install 
19:22 < craigcitro> those files are for an intel box, where it compiled fine, but failed to make check
19:22 < mabshoff> and then unpack another install and run testall on that odd things tend to happen.
19:22 < craigcitro> i haven't done that.
19:22 < mabshoff> ok
19:22 < craigcitro> so, on a different thread, my laptop
19:22 < mabshoff> I have been burned by that before.
19:22 < craigcitro> that's where matplotlib is dying
19:22 < mabshoff> ok
19:22 < craigcitro> but i'm about to look at that.
19:22 < mabshoff> Not I am not paying attention ;)
19:23 < mabshoff> not->now
19:23 < craigcitro> you can see a bunch of doctest failures in that test.log, though
19:23 -!- wstein_iphone [n=root@32.156.203.114] has joined #sage-devel
19:23 -!- wstein_iphone [n=root@32.156.203.114] has quit [Read error: 104 (Connection reset by peer)]
19:23 < mabshoff> "You don't have permission to access /home/citro/2.9-alpha7-test.log on this server."
19:24 < craigcitro> snic
19:24 < craigcitro> fixed.
19:24 -!- wstein_iphone [n=root@32.156.189.81] has joined #sage-devel
19:24 < craigcitro> so i'm just looking at those -- what's SystemExit(1) getting spurred by?
19:24 -!- wstein_iphone [n=root@32.156.189.81] has quit [Read error: 104 (Connection reset by peer)]
19:25 < mabshoff> Where is that?
19:25 < craigcitro> look at the first error
19:25 < craigcitro> err, sorry, SystemExit: 1
19:25 < craigcitro> it tried to save()
19:25 < mabshoff> I see
19:25 < mabshoff> permission issue?
19:25 < mabshoff> Out of space? *ducks*
19:25 < craigcitro> could be ... that'd be a little weird
19:25 -!- wstein_iphone [n=root@32.157.210.84] has joined #sage-devel
19:25 < craigcitro> hah, that'd be funny
19:26 < mabshoff> Karma, one would presume.
19:26 -!- wstein_iphone [n=root@32.157.210.84] has quit [Read error: 104 (Connection reset by peer)]
19:26 < craigcitro> 100GB free on that machine
19:26 < craigcitro> so not a space issue
19:26 < mabshoff> I guess AT&T's network sucks.
19:26 < mabshoff> ok
19:27 < craigcitro> i own all the files in those directories, so i'm not sure how it would be a permission issue
19:27 < craigcitro> but they all have something with matplotlib in the traceback
19:27 < craigcitro> lemme look at the install log
19:27 < mabshoff> Well, those doctests certainly didn't fail on bsd, i.e. OSX 10.5
19:27 -!- wstein_iphone [n=root@32.159.144.91] has joined #sage-devel
19:27 < mabshoff> "Bad key "lines.markeredgecolor" on line 48 in"
19:27 -!- wstein_iphone [n=root@32.159.144.91] has quit [Read error: 104 (Connection reset by peer)]
19:28 < mabshoff> Can you move ~/.sage  out of the way for now?
19:28 < craigcitro> sure
19:28 < craigcitro> oh hang on
19:28 < mabshoff> All the failures seem matplotlib related.
19:28 < craigcitro> when you do make check, it uses ./sage, right?
19:28 -!- wstein_iphone [n=root@32.158.197.211] has joined #sage-devel
19:28 < craigcitro> because the system-wide sage there is older
19:29 < mabshoff> It certainly uses the matplotlib.rc there.
19:29 -!- wstein_iphone [n=root@32.158.197.211] has quit [Read error: 104 (Connection reset by peer)]
19:29 < cwitty-rvw-1460> craigcitro, what does "snic" mean?
19:29 < craigcitro> oh, it stands for "snicker"
19:29 < craigcitro> so a shorter laugh
19:29 < mabshoff> Very Califonia-isch
19:29 < craigcitro> i picked it up when i used to mud a lot in high school.
19:29 < craigcitro> long before cali, actually
19:30 -!- wstein_iphone [n=root@32.158.114.209] has joined #sage-devel
19:30 < mabshoff> Well, Hollywood poisons the mind of young people globally.
19:30 < craigcitro> mabshoff: moving ~/.sage out of the way, trying again
19:30 < craigcitro> hah, true
19:30 < craigcitro> and all tests pass
19:30 < cwitty-rvw-1460> craigcitro: how much work do you want to put into this gen.pyx fix?
19:30 < craigcitro> i'll make check again
19:30 < mabshoff> :)
19:30 < craigcitro> cwitty-rvw-1460: well, a fair amount -- what did you have in mind?
19:30 < cwitty-rvw-1460> I have a couple of ideas; the simple one leaks more memory than the complicated one.
19:31 < cwitty-rvw-1460> OK.  You need to set .refers_to in the original object (v, in your example).
19:31 < craigcitro> mabshoff: i'm starting a new make check, so let's wait and see on that one.
19:32 < craigcitro> cwitty-rvw-1460: well, not just in v, right?
19:32 < cwitty-rvw-1460> You can get at the original object by tracing "parent" links.  These links already exist; they're in self.refers_to[-1].  (See new_ref for details.)
19:32 < craigcitro> v = pari(range(10)) ; w = pari(range(5)) ; v[0] = w ; v[0][0] = 5 
19:33 < craigcitro> (i like the self.refers_to[-1] -- i didn't think of that.)
19:33 < craigcitro> so there i'm all set
19:33 < craigcitro> but when i do v[0][0] = 25 further down, w is likely to break
19:34 < craigcitro> in the sense that no python object will reference the GEN that w.g[1] points to
19:34 -!- wstein_iphone [n=root@32.158.114.209] has quit [Read error: 104 (Connection reset by peer)]
19:34 < mabshoff> craigcitro: ok, let us know if make check now passes
19:34 < craigcitro> v and w are "unrelated" python objects (i.e. nothing involving parents works) that involve the same GENs.
19:35 < cwitty-rvw-1460> What do you mean by w.g[1]?
19:36 < craigcitro> oh, w.g is the GEN that w points to. it's a pari t_VEC, whose indices are off by 1 -- so w[0] is "really" (w.g)[1], i.e. that's where the underlying GEN is stored.
19:39 < cwitty-rvw-1460> OK, this is a lot more work, but I think it's still possible.  (It may be too much work to be worthwhile, though... it would be much easier to just have subscripting make copies!)
19:39 < cwitty-rvw-1460> For each Python object that wraps a GEN, you need to be able to determine whether it's a "root" GEN object, or whether it's part of some other GEN (wrapped by some other Python object).
19:40 < cwitty-rvw-1460> And if it's part of another GEN, you need to know exactly how (you need to know that it's the third element of the fifth element of the fourth element, for instance).
19:40 < cwitty-rvw-1460> This requires modifying new_ref, because that information isn't actually stored currently.
19:41 < cwitty-rvw-1460> Then when you modify an element of a GEN, you find the Python wrapper for the root GEN object that you're actually modifying, and set its .refers_to.  So in the above case, you might set .refers_to[4,5,3] to the new Python wrapper.
19:42 < craigcitro> so there's one confusing thing about this
19:42 < craigcitro> (to me)
19:43 < cwitty-rvw-1460> But you need to check the existing .refers_to values first.  If you're trying to set .refers_to[4,5,3] but .refers_to[4,5] already exists, then you want to look up that value and set .refers_to[3] in that value instead.
19:43 < craigcitro> the "root object" is the first one allocated that points to that GEN?
19:43 < cwitty-rvw-1460> Yes.
19:43 < craigcitro> (it's funny -- we're basically setting up our own reference counting, right?)
19:43 < cwitty-rvw-1460> Basically.
19:43 < craigcitro> ok, so let's say in a function, you do x = pari(5)
19:43 < craigcitro> and then return x
19:44 < craigcitro> that's going to make a copy of x, right?
19:44 < craigcitro> but then x gets deallocated
19:44 < craigcitro> so the "root object" gets deallocated, but the object still needs to exist
19:44 < craigcitro> so that seems ... messy.
19:44 < craigcitro> or is something cool going to happen that i'm not seeing? :)
19:44 < cwitty-rvw-1460> When you say pari(5), that creates a copy of the Pari number 5 on the Python heap, and a Python wrapper for this Pari number.
19:45 < cwitty-rvw-1460> Then x = pari(5) sets x to this Python wrapper, and "return x" returns that same Python wrapper.
19:46 < cwitty-rvw-1460> I'm not sure what you mean by 'the "root object" gets deallocated' here.
19:47 < craigcitro> well, ultimately, i was trying to think of an example where the root object gets deallocated (say, goes out of scope, in this case), but there are still other references to the pari object
19:47 < craigcitro> oh, but that's just it
19:48 < cwitty-rvw-1460> Well, if that happens, it's a bug; but it's not supposed to happen.  For instance, that's the reason for these lines in new_ref:
19:48 < cwitty-rvw-1460>             p.refers_to[-1] = g  # so underlying memory won't get deleted
19:48 < cwitty-rvw-1460>                                  # out from under us.
19:48 < craigcitro> you're saying that everyone that knows about the underlying pari object will have a reference (in their refers_to) to the root object
19:49 < cwitty-rvw-1460> Yes.  (Which is currently just elements of vectors and matrices.)
19:54 < craigcitro> so i think you could still write cython code that breaks this.
19:54 < craigcitro> but that could be okay, it just means the advanced user (i.e. any cython user) should be careful.
19:55 < craigcitro> so this means that i have to do some work looking up references in objects any time i'm creating a new reference, though. this sounds bad for performance.
19:55 < cwitty-rvw-1460> I don't think you actually have to look up references in __getitem__; it should suffice to look them up only in __setitem__.
20:02 < craigcitro> yeah, i think this should work. i'm about to eat dinner, but i'll start coding it up after i eat.
20:03 < craigcitro> mabshoff: do you want me to upload the install.log from my ppc-osx install that died on matplotlib?
20:03 < mabshoff> Sure. 
20:03 < mabshoff> I can look at it :) no promises of solutions
20:04 < craigcitro> hah nods
20:04 < mabshoff> Does it work if you move sw out of the way like was suggested?
20:04 < craigcitro> i haven't looked yet. i've been thinking about what cwitty-rvw-1460 said. ;)
20:05 < mabshoff> np, I just fixed a bug with cython and ATLAS
20:05 < craigcitro>  /home/citro/ppc-osx-broken-2.9alpha7.log
20:05 < mabshoff> thanks
20:05 < craigcitro> hah, i did just comment out the LANG=... lines from my sage-env. maybe that broke matplotlib! :)
20:06 < craigcitro> testing that
20:07 < cwitty-rvw-1460> mabshoff, #1460 looks good.
20:08 < mabshoff> thanks, added it to the merge que
20:18 < cwitty-rvw-1460> jkantor, are you here?
20:36 -!- photonn [i=not@cpe-76-182-223-216.tx.res.rr.com] has left #sage-devel []
20:37 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has quit [Read error: 104 (Connection reset by peer)]
20:37 -!- ajhager_ [n=ajhager@ip72-197-64-239.sd.sd.cox.net] has joined #sage-devel
20:38 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has joined #sage-devel
20:41 -!- ajhager [n=ajhager@ip72-197-64-239.sd.sd.cox.net] has quit [Read error: 110 (Connection timed out)]
20:45 < cwitty-rvw-1460> mabshoff: I see that spkg/standard/pycrypto-2.0.1.p1.spkg is not world-readable (and all the other spkgs are); I assume that's for extra security? :)
20:46 < mabshoff> :)
20:46 < mabshoff> I will check permissions mow.
20:46 < mabshoff> now.
20:47 < mabshoff> fixed. It seem to have been the only spkg with too tight permissions.
20:47 < jkantor> hey
20:47 < jkantor> I'm here now
20:47 < mabshoff> hi jkantor.
20:48 < mabshoff> from rc0:
20:48 < mabshoff> Overall weighted coverage score:  34.9%
20:48 < mabshoff> Total number of functions:  17896
20:49 < cwitty-rvw-1460> Hi jkantor.
20:49 < jkantor> hey
20:50 < cwitty-rvw-1460> I was trying to review your new gnuplotpy package, and so I was wondering if you could give me an example of a command you fixed.
20:50 < jkantor> oh
20:50 < jkantor> well the issue is the old gnuplotpy first installed numeric
20:51 < jkantor> this version uses numpy
20:53 < jkantor> http://www.math.washington.edu/~jkantor/Numerical_Sage/node13.html
20:53 < jkantor> if you want a (somewhat complicated) example of plotting to test
20:54 < cwitty-rvw-1460> Thanks, that's the sort of thing I was looking for.
20:55 < jkantor> you should just be able to paste the code in the notebook
20:55 < cwitty-rvw-1460> BTW, a bug in your document: s/gnuplot package/gnuplot and gnuplotpy packages/
20:55 < jkantor> oh?
20:56 < cwitty-rvw-1460> I think that's what you mean, anyway.
20:56 < cwitty-rvw-1460> Just above the plotting example.
20:56 < jkantor> oh
20:56 < jkantor> yes
21:00 < cwitty-rvw-1460> jkantor, when I try pasting the code from that web page into the notebook, I get this error from the second chunk:
21:00 < cwitty-rvw-1460> Traceback (most recent call last):    u[num_points-1,:]=numpy.sin(x)
21:00 < cwitty-rvw-1460> AttributeError: 'float' object has no attribute 'sin'
21:00 < jkantor> oh
21:00 < jkantor> can you do
21:00 < jkantor> RealNumber=float
21:00 < jkantor> Integer=int
21:01 < jkantor> the numpy stuff gets confused by sage numbers frequently
21:02 < cwitty-rvw-1460> Yes, that fixed it.
21:02 < jkantor> I wish there was an easy way to fix that
21:09 -!- cwitty-rvw-1460 is now known as cwitty-rvw-1472
21:10 < william_stein_> hi
21:11 < william_stein_> jkantor -- this will obviously require changing numpy
21:11 < jkantor> :(
21:11 < william_stein_> i talked to Travis Oliphant about it today on the phone.
21:11 < jkantor> :)
21:11 < william_stein_> We're very very likely going to have a coding week Feb 29 - Mar 3 or so at Enthought with about 10-15 sage people and the enthought people,
21:11 < william_stein_> if all goes as planned :-)
21:11 < william_stein_> how is bug day going?
21:11 < jkantor> cwitty-rvw-1472: did that work
21:12 < mabshoff> Allright I guess
21:13 < mabshoff> About as many new tickets as close ones.
21:13 < cwitty-rvw-1472> did what work?
21:13 < jkantor> the plot
21:13 < mabshoff> But there are plenty of patches to review.
21:13 < cwitty-rvw-1472> Yes.
21:13 -!- william_stein_ is now known as wstein-rvw-1119
21:13 < mabshoff> :)
21:13 < jkantor> cool
21:13 < mabshoff> I am current with merging and doctesting again at the moment.
21:13 < cwitty-rvw-1472> mabshoff, wstein-rvw-1119: #1472 looks good.  But it's not a "merge"; it's a new version of an optional spkg.
21:14 < jkantor> yeah
21:15 < mabshoff> Sure, I can drop that into sagemath.org
21:15 < jkantor> wstein-rvw-1119: would the coding week be at enthought?
21:15 < mabshoff> wstein-rvw-1119: 553 would be nice to get in since 1139 depends on it.
21:16 < wstein-rvw-1119> yes, enthought has two conference rooms and lots of offices.
21:16 < jkantor> cool
21:17 < mabshoff> is that planned for March then or later?
21:17 < cwitty-rvw-1472> mabshoff, #1491 looks good.
21:17 < wstein-rvw-1119> it's not official yet, but would likely be feb 29 - mar xxx
21:17 < mabshoff> ok
21:17 -!- cwitty-rvw-1472 is now known as cwitty-rvw-1515
21:23 < wstein-rvw-1119> ticket #1119 is slow.
21:23 < wstein-rvw-1119> it looks correct but slow.
21:23 < mabshoff> Ok, merge it but open a ticket for an efficient implementation?
21:24 < wstein-rvw-1119> yes, merge it.
21:24 -!- craigcitro [n=cc@pool-71-106-26-87.lsanca.dsl-w.verizon.net] has quit []
21:24 < wstein-rvw-1119> I want to try the one obvious trick to make it faster though.
21:24 < mabshoff> ok, on the list.
21:24 < mabshoff> Will it be relative to 1119?
21:25 < cwitty-rvw-1515> jkantor, are you still hoping to make #705 (vtk) an optional package, or do we want to go for mayavi2 instead?
21:25 < wstein-rvw-1119> yes, relative to 1119
21:25 < mabshoff> np
21:26 < wstein-rvw-1119> mayavi2 would also depend on vtk.
21:26 < mabshoff> That is unrelated to 1119 I assume?
21:26 < wstein-rvw-1119> yes
21:26 < cwitty-rvw-1515> Right, but the current vtk meta-package also includes mayavi1.
21:27 -!- craigcitro [n=cc@pool-71-106-26-87.lsanca.dsl-w.verizon.net] has joined #sage-devel
21:27 < wstein-rvw-1119> by the way, I hope somebody looks at http://trac.sagemath.org/sage_trac/ticket/1514
21:27 < craigcitro> i hate spotlight.
21:27 < wstein-rvw-1119> It's with patch, and I've just upgraded it to BLOCKER.
21:28 < wstein-rvw-1119> Since I think without it foo?? is often broken for no reason for many sage installs these days...
21:28 < cwitty-rvw-1515> OK, I'll look at 1514 in a few minutes.
21:28 -!- cwitty-rvw-1515 is now known as cwitty-rvw-444
21:29 < mabshoff> wstein-rvw-1119: by the way: Overall weighted coverage score:  34.9%
21:29 < wstein-rvw-1119> argh  so close.
21:29 < mabshoff> Well, all the new patches have doctests, so it might still hit the magic 35%
21:30 < jkantor> well
21:30 < jkantor> there are far more dependences required for mayavi2
21:30 < jkantor> I haven' successfully installed wxpython into sage 
21:30 < jkantor> yet
21:31 < mabshoff> :)
21:32 < jkantor> vtk will be required for mayavi2 anyway
21:32 < jkantor> so I should fix up the vtk package
21:32 < mabshoff> Hasn't jaap done some work in that direction?
21:32 < jkantor> the remaining issue is reliably detecting opengl befor vtk builds
21:32 < mabshoff> ok
21:32 < jkantor> towards mayavi
21:32 < jkantor> 2
21:33 < jkantor> ?
21:37 < craigcitro> wstein-rvw-1119: did you read cwitty's suggestion above about the fix for that pari issue?
21:37 < wstein-rvw-1119> no clue what you're talking about.
21:37 < craigcitro> k.
21:37 < craigcitro> i didn't know if you had a scrollback.
21:37 < craigcitro> it's the v[1][1] = 5 issue for v a pari object
21:38 < wstein-rvw-1119> oh
21:38 < craigcitro> it's currently broken, and there's a note in gen.pyx about it
21:38 < craigcitro> so i figured out what the issue is, and cwitty came up with a nice idea for a fix
21:38 < wstein-rvw-1119> cool.
21:38 < craigcitro> because the bandaid-ish solutions are still pretty easy to break.
21:38 < cwitty-rvw-444> mabshoff, #444 looks good.
21:39 < craigcitro> did anyone ever spot what caused this: /usr/bin/ld: warning can't open dynamic library: libpari-gmp.dylib referenced from: /Users/craigcitro/bd7-sage/local//lib/libcsage.dylib (checking for undefined symbols may be affected) (No such file or directory, errno = 2)
21:40 < craigcitro> i remember this came up like two bug days ago
21:40 < craigcitro> it doesn't seem to break anything, so it might not be worth worrying about.
21:40 < craigcitro> or, rather, it doesn't break anything that i've noticed. ;)
21:40 < mabshoff> I think it is because you implicitly link gmp and pari does provide them, too.
21:41 < mabshoff> Add an explicit -lgmp should fix that issue.
21:42 < craigcitro> some of the files with that error already have -lgmp
21:42 < craigcitro> change the order maybe?
21:42 -!- cwitty-rvw-444 is now known as cwitty-rvw-1514
21:43 < mabshoff> Yep, that could also be it.
21:43 < mabshoff> The OSX linker is funny that way.
21:43 < cwitty-rvw-1514> wstein-rvw-1119, it looks like #1514 does not have any doctests for whatever bugs you are fixing?
21:43 < craigcitro> gmp comes before pari in the build order for libcsage
21:44 < wstein-rvw-1119> cwitty-1514 -- the buginess is that nothing works at all.
21:44 < wstein-rvw-1119> it's hard to have a doctest for that.
21:44 < wstein-rvw-1119> However, notice the first line of the patch, which turns *on* doctesting for the sageinspect.py file
21:44 < wstein-rvw-1119> So there are many new doctests as a result.
21:45 < wstein-rvw-1119> It's really a design change anyway -- to use the files in SAGE_ROOT/devel/sage/sage instead of SAGE_ROOT/local/lib/python/site-packages/sage/,
21:45 < wstein-rvw-1119> since for some reason often some .pyx files or other files that are relevant don't get copied over there.
21:45 < wstein-rvw-1119> But SAGE_ROOT/devel/sage/sage does.
21:46 -!- wstein-rvw-1119 is now known as wstein-rvw-1232
21:47 < craigcitro> ah, 1232. that sounds familiar.
21:48 < craigcitro> wstein-rvw-1232: that binary for osx you gave me ... it works fine to run, but i can't develop on it; apparently some of the libraries have hardcoded paths, because i'm getting errors about /Users/was/...
21:49 < wstein-rvw-1232> ????
21:49 < mabshoff> craigcitro: Which pyx files?
21:49 < wstein-rvw-1232> report it.  that's a bug
21:49 < craigcitro> k
21:49 < mabshoff> Anything NTL related?
21:49 < craigcitro> this was ntl_GF2.pyx
21:49 < craigcitro> grin
21:49 < mabshoff> Mhh, I thought I fixed all those.
21:51 < craigcitro> i'm just curious, what needs rebuilt?
21:51 < wstein-rvw-1232> definitely that is a bug to report.
21:51 < wstein-rvw-1232> Binaries should work for development.
21:51 < mabshoff> Is the OSX 10.4 ppc build still on fermat?
21:51 < wstein-rvw-1232> yes
21:53 -!- wstein-rvw-1232 is now known as wstein-1519
21:53 < wstein-1519> I'm going to fix this sort I can apply #1232: http://trac.sagemath.org/sage_trac/ticket/1519
21:53 < mabshoff> craigcitro: let me know which libraries are broken.
21:53 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has quit []
21:53 < mabshoff> ?sort?
21:54 < craigcitro> mabshoff: seems to be gmp
21:54 < craigcitro> at least, that's what's throwing the errors at me
21:54 < craigcitro> this is #1520
21:54 < cwitty-rvw-1514> wstein-1519, doctesting sageinspect.py fails for me after #1514.
21:55 < cwitty-rvw-1514> This "expected" line:
21:55 < cwitty-rvw-1514>         'Inspect Python, Sage, and Cython objects...
21:55 < craigcitro> grin ... i have yet to get a running 2.9-alpha7 on my laptop ;)
21:55 < wstein-1519> Does it start with "
21:55 < cwitty-rvw-1514> starts with a double-quote instead of a single-quote.
21:55 < mabshoff> craigcitro: Sure, but it some other library at fault.
21:55 < wstein-1519> Ah, could you try testing with that one quote changed?
21:55 < wstein-1519> I think I must have got confused between two versions of sage on my laptop.
21:55 < mabshoff> craigcitro: the *.la files in $SAGE_LOCAL/lib also point to the wrong files.
21:56 < mabshoff> Correcting those *might* fox the problem.
21:56 < mabshoff> There is a ticket for that issue already.
21:56 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1358
21:56 < cwitty-rvw-1514> wstein-1519, if I change that quote, then it fails the other way: it expects a double quote, but prints with a single quote.
21:57 < wstein-1519> weird
21:57 < craigcitro> mabshoff: i'm not sure i understand. you're saying broken symlinks, or built with bad dependencies?
21:57 < mabshoff> craigcitro: The OSX 10.4 linker is much different than the 10.5 one.
21:57 < craigcitro> ahh
21:57 < cwitty-rvw-1514> Maybe it usually prints with a double quote, unless the string has a double quote in it, and then it prints with a single quote?
21:57 < mabshoff> Nope, I mean the following: look at the content of any .la file.
21:57 < craigcitro> yeah, that's a good sign for 10.5, because the 10.4 one seems to make headaches.
21:57 < craigcitro> ahh, ok
21:58 < mabshoff> # Directory that this library needs to be installed in:
21:58 < mabshoff> libdir='/tmp/Work-mabshoff/release-cycles-2.9/sage-2.9.rc0/local/lib'
21:58 < wstein-1519> cwitty -- amusing
21:58 < mabshoff> Correct that libdir and see if it works.
21:58 < craigcitro> which ones are wrong? because the first two i looked at were fine
21:58 < mabshoff> It is only a potential solution, but that issue always bothered me.
21:59 < wstein-1519> cwitty -- double quote always works for me now.
21:59 < craigcitro> mabshoff: i don't see anything wrong with any of the files mentioned on that ticket ...
22:00 < cwitty-rvw-1514> wstein-1519, did you do "sage -b"?
22:00 < wstein-1519> oh, good point!
22:00 < craigcitro> (mabshoff: on my current install, i mean.)
22:01 < wstein-1519> cwitty -- change the doctest to this:
22:01 < wstein-1519>         sage: print sage_getdoc(sage.misc.sageinspect).lstrip()[:40]
22:01 < wstein-1519>         Inspect Python, Sage, and Cython objects
22:01 < wstein-1519> ok?
22:02 < craigcitro> mabshoff: i'm forcing it to reinstall gmp, see if that does the trick
22:02 < craigcitro> because that's the library that it's complaining about
22:03 < cwitty-rvw-1514> OK.
22:03 < wstein-1519> :-)
22:04 < craigcitro> wstein-1519: did you ever hear anything definite from allen k?
22:04 < craigcitro> or just silence?
22:05 < mabshoff> craigcitro: If you open libgmp.la it should point to the wrong directory.
22:05 < craigcitro> mabshoff: nope, it was fine.
22:05 < wstein-1519> silence
22:05 < mabshoff> And the NTL code also links against the gmpxx wrapper I beliecve.
22:06 < mabshoff> craigcitro: Then you must have rebuild gmp.
22:06 < craigcitro> gmp is still just getting started rebuilding; i did
22:06 < craigcitro> cat *.la | grep libdir
22:06 < craigcitro> and saw only the right directory
22:06 < mabshoff> ok, that is odd.
22:07 < mabshoff> Another problem with libgmpxx.la:
22:07 < mabshoff> # Libraries that this one depends upon.
22:07 < mabshoff> dependency_libs=' /tmp/Work-mabshoff/release-cycles-2.9/sage-2.9.rc0/local/lib/libgmp.la'
22:07 < cwitty-rvw-1514> mabshoff, #1514 looks good.
22:08 < craigcitro> mabshoff: same thing for dependency_lib gets only valid paths
22:08 < craigcitro> let's see what happens when gmp finished.
22:08 < craigcitro> finishes.
22:08 < mabshoff> ok, maybe OSX 10.4 handles that differently.
22:09 < craigcitro> could be.
22:10 < craigcitro> ugh ... rebuilt gmp, same problem.
22:10 < mabshoff> ok, which pyx file again? :)
22:10 < craigcitro> ntl_GF2.pyx
22:10 < mabshoff> ok, let me check on fermat ;)
22:12 < mabshoff> wstein-1519: where is the bdist of 2.9.alpha7 on fermat?
22:12 < craigcitro> yeah, /Users/was/... occurs in ntl_GF2.so
22:13 < wstein-1519> mabshoff -- I'm one step ahead of you :-)
22:13 < wstein-1519> it's /Users/was/sage-2.9.alpha7.move/dist/sage-2.9.alpha7-PowerMacintosh-Darwin
22:13 < mabshoff> ok
22:13 < mabshoff> ok
22:13 < cwitty-rvw-1514> wstein-1519: on #1424 (map_threaded), how would you feel about changing the name?  "map_threaded" doesn't make any sense to me.
22:13 < wstein-1519> I moved the orig install directory then did a "sage -ba".
22:13 < wstein-1519> it's in the works.
22:13 < mabshoff> ok
22:13 < cwitty-rvw-1514> I would prefer "map_recursive", or "deep_map".
22:13 < wstein-1519> I would be happy with a better name, as long as it *starts* with map.
22:13 < wstein-1519> I.e., map_recursive would be good but deep_map is bad.
22:16 -!- cwitty-rvw-1514 is now known as cwitty-rvw-1473
22:18 < wstein-1519> http://trac.sagemath.org/sage_trac/ticket/1519 --- done
22:19 -!- wstein-1519 is now known as wstein-rvw-1232
22:21 -!- mallockilx [n=malloc@63.135.231.219] has joined #sage-devel
22:22 < cwitty-rvw-1473> wstein-rvw-1232: for "Simon's new gp two descent code", is it enough to check that the new doctests pass, or should somebody who knows what "two descent" means review it?
22:22 < mallockilx> If I have a function like:
22:22 < mallockilx> def ysquared(x):
22:22 < mallockilx>     y=(3^x)
22:22 < mallockilx>     return y 
22:22 < mallockilx> er
22:22 < mallockilx> how can i plot that? 
22:22 < wstein-rvw-1232> cwitty -- I know what 2-descent means.
22:22 < wstein-rvw-1232> which ticket is it?
22:22 < cwitty-rvw-1473> #1239
22:23 < wstein-rvw-1232> i mallockilx
22:23 < wstein-rvw-1232> (1) try  plot(ysquared, 2, 5).show()
22:24 < mabshoff> craigcitro: that scary linker message comes from free_module_element
22:24 < wstein-rvw-1232> (2) you may want to instead do plot(exp(x*log(3)), 2,5).show(), which is equivalent.
22:24 < mabshoff> craigcitro: And that one clearly doens't link explicitely against gmp
22:24 < mabshoff> hah, I also get an error!
22:24 < craigcitro> mabshoff: the message about libpari-gmp getting moved?
22:24 < craigcitro> wahoo!
22:25 < craigcitro> for once i'm not the only one ;)
22:25 < wstein-rvw-1232> mabshoff -- i get the same error craigcitro reports.
22:25 < mabshoff> g++ -bundle -undefined dynamic_lookup build/temp.macosx-10.3-ppc-2.5/sage/libs/ntl/ntl_GF2.o -L/Users/mabshoff/sage-2.9.alpha7-PowerMacintosh-Darwin/local//lib -lcsage -lcsage -lntl -lstdc++ -lstdc++ -lntl -o build/lib.macosx-10.3-ppc-2.5/sage/libs/ntl/ntl_GF2.so
22:25 < mabshoff> No gmp, gmpxx
22:25 < mabshoff> I am fixing that
22:25 -!- cwitty-rvw-1473 is now known as cwitty-rvw-1507
22:26 < wstein-rvw-1232> that works to get past this problem!
22:26 < mabshoff> Patch is obvious :)
22:26 < mabshoff> I wonder how that even linked in the first place.
22:26 < mabshoff> I will open a ticket shortly and submit a patch.
22:29 < craigcitro> silly question: my sage prompt isn't in color. ;) how do i fix that?
22:29 < wstein-rvw-1232> 1232 -- another positive review.
22:29 < mabshoff> cool
22:29 < wstein-rvw-1232> .sage/ipythonrc
22:29 < wstein-rvw-1232> it's a new feature -- not being in color.
22:29 < mabshoff> what about 1473?
22:29 -!- wstein-rvw-1232 is now known as wstein-rvw-1473
22:30 < wstein-rvw-1473> I'll take a look at #1473 now.
22:30 < craigcitro> do people really prefer no color?
22:30 < mabshoff> ok
22:30 < wstein-rvw-1473> btw, I just posted http://trac.sagemath.org/sage_trac/ticket/1519
22:30 < mabshoff> I didn't even know you could have color.
22:30 < cwitty-rvw-1507> Don't forget #1239.
22:30 < wstein-rvw-1473> craigcitro -- the color *sucks* if the background is white instead of black (or conversely).
22:30 < wstein-rvw-1473> it's terrible.
22:30 < mabshoff> That fixes the problem with "?" in the url?
22:30 < wstein-rvw-1473> and there is no possible way to no which.
22:30 < craigcitro> ctrl-alt-openapple-8! ;)
22:30 < craigcitro> nods, it's smart to have the user select, and the three lines are right there
22:31 < mabshoff> cwitty: yep, merging http://trac.sagemath.org/sage_trac/ticket/1239 
22:31 -!- wstein-rvw-1473 is now known as wstein-rvw-1239
22:31 < wstein-rvw-1239> I'll look at 1239 instead.
22:31 < wstein-rvw-1239> since that requires expertise.
22:31 < cwitty-rvw-1507> mabshoff: I was reminding wstein to review 1239.  It hasn't been reviewed yet.
22:32 < mabshoff> ok, that's for clearing that up.
22:32 < jkantor> mabshoff: were there any other atlas problems?
22:35 < mabshoff> jkantor: Not that I know of. I wanted to fix LinBox to use it.
22:35 < mabshoff> And make it use the AccFW on OSX.
22:35 < jkantor> i isee
22:35 < cwitty-rvw-1507> mabshoff, #1507 looks good.
22:35 < mabshoff> ok, merging.
22:36 -!- cwitty-rvw-1507 is now known as cwitty-rvw-1473
22:42 < mabshoff> Slight numerical doctest failure:
22:42 < mabshoff> File "code_bounds.py", line 371:
22:42 < mabshoff>     sage: elias_bound_asymp(1/4,2)
22:42 < mabshoff> Expected:
22:42 < mabshoff>     0.399123963308
22:42 < mabshoff> Got:
22:42 < mabshoff>     0.399123963307
22:42 < wstein-rvw-1239> seems ok
22:42 < mabshoff> "..." will fix it.
22:42 < mabshoff> It is only the last digit.
22:44 < mabshoff> oops: 
22:44 < mabshoff> applying trac-1507.patch
22:44 < mabshoff> patching file sage/plot/plot.py
22:44 < mabshoff> Hunk #2 FAILED at 127
22:44 < mabshoff> 1 out of 2 hunks FAILED -- saving rejects to file sage/plot/plot.py.rej
22:44 < mabshoff> abort: patch failed to apply
22:44 < cwitty-rvw-1473> Did you read my review?
22:44 < mabshoff> Obviously not.
22:45 < mabshoff> :)
22:45 < mabshoff> I am sorry.
22:46 < mabshoff> I just deleted the second hunk from the patch ;)
22:46 < cwitty-rvw-1473> That works too :)
22:46 < mabshoff> :)
22:52 < mabshoff> craigcitro: http://trac.sagemath.org/sage_trac/ticket/1520 has a patch for your linker problem
22:52 < craigcitro> cool.
22:52 < wstein-rvw-1239> with that, sage will build on ppc
22:52 < mabshoff> :)
22:52 < wstein-rvw-1239> i'm so glad you reported the problem craig
22:52 < mabshoff> Yep, even a moved install.
22:52 < mabshoff> +1
22:52 < mabshoff> Only bugs we know about can be fixed.
22:52 < craigcitro> grin
22:53 < mabshoff> Once we knew which test failed it was obvious to fix.
22:53 < wstein-rvw-1239> 1239 -- has a lot of missing doctests.
22:53 < wstein-rvw-1239> I'm going to write them.
22:53 < wstein-rvw-1239> yep
22:53 < mabshoff> Cool
22:54 < craigcitro> does it get rid of the weird libpari-gmp linker warning, too? or unlikely?
22:54 < mabshoff> It should.
22:55 < mabshoff> But there might be some other libs which were implicitely linked against the wrong 
22:55 < mabshoff> libs, so we need to fix those instead.
22:55 < mabshoff> Make a list, I will fix them.
22:56 < craigcitro> hmm ... i'm getting another error. now about libntl ... this is trying to build libcsage.dylib
22:56 < craigcitro> delete that from devel/sage/c_lib/ and tell me if it builds for you
22:56 < mabshoff> Odd. That I did fix.
22:56 < mabshoff> Ok, will look into that.
22:57 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
22:57 < craigcitro> yep, /Users/was/ occurs in strings - for libntl.dylib
22:58 < mabshoff> Well, that by itself isn't really a problem.
22:58 < mabshoff> Most libs should have that string in them.
22:58 < craigcitro> in this case it's the exact path of the file mentioned in the error message
22:58 < craigcitro> so i'm guessing it's related ;)
22:59 < craigcitro> it's libgmp being mentioned in libntl
22:59 < craigcitro> should i make another ticket?
23:00 < mabshoff> Sure
23:00 < craigcitro> or try rebuilding ntl first?
23:00 < mabshoff> Well, we still need to fix it,
23:00 < mabshoff> I did fix the NTL issue a while back, so this is something else, unless was 
23:01 < mabshoff> broken it again in p8 since p7 survived a move and rebuilf.
23:01 < craigcitro> 1522.
23:01 < mabshoff> craigcitro: If I delete libcsage.dylib and rebuild it all works. 
23:01 < mabshoff> What did you delete? 
23:02 < craigcitro> libcsage.dylib ...
23:02 < cwitty-rvw-1473> Hi, robertwb.
23:02 < craigcitro> that's what it's trying to build when i get that error.
23:02 < craigcitro> hey robertwb 
23:02 < cwitty-rvw-1473> I'm just looking at #1473 (use java3d from the command line).
23:02 < cwitty-rvw-1473> I get this error:
23:02 < mabshoff> hmm.
23:02 < cwitty-rvw-1473> Exception in thread "main" java.lang.UnsatisfiedLinkError: no j3dcore-ogl in java.library.path
23:03 < mabshoff> craigcitro: What are you building in that case? libcsage.dylib or does something else fail to link?
23:03 < craigcitro> well, i'm doing sage -br, but that's the file it's trying to build when it gets that error
23:03 < mabshoff> well, that might be different. It might link, but have unresolved symbols at startup!
23:04 < craigcitro> ?
23:04 < robertwb> cwitty: hmm... I have an idea
23:04 < mabshoff> craigcitro: never mind, it starts up.
23:04 < mabshoff> Did you apply the patch for http://trac.sagemath.org/sage_trac/ticket/1520 yet?
23:04 < craigcitro> mabshoff: i'm not sure i understand what you mean. i can't build libcsage.dylib, but you said it built for you
23:04 < robertwb> (The problem is java 3d is built in on OS X, and I don't have another system except via command line to test it on...)
23:04 < mallockilx> when I come across errors like: "AssertionError: BUG:  Rational.__pow__ called on a non-Rational" should I report them?
23:05 < craigcitro> mabshoff: that just fixed one line in setup.py about ntl_GF2 ... i don't think that could fix this problem.
23:05 < mabshoff> :) - can you try, I cannot reproduce your issue.
23:05 < craigcitro> mabshoff: oh, i already applied it. but i'm just saying there's no way that could fix the problem i'm having.
23:06 < cwitty-rvw-1473> mallockilx: YES!
23:06 < mabshoff> ok, I just tried again and it works for me.
23:06 < cwitty-rvw-1473> Except that you should look here first: http://sagetrac.org/sage_trac/report/3
23:06 < cwitty-rvw-1473> to see if the bug has already been reported.
23:06 < mallockilx>   x=(y^2)^(1/2)+(3600)^(1/2) is making sage squeel.
23:06 < mabshoff> craigcitro: which gcc are you using? NTL can be really odd with different gcc releases
23:06 < cwitty-rvw-1473> And we see that it has; it's #1457.
23:07 < craigcitro> 4.0.1
23:07 < mabshoff> gcc -v please :)
23:07 < mabshoff> gcc version 4.0.1 (Apple Computer, Inc. build 5367)
23:07 < craigcitro> [craigcitro@craig-citros-powerbook58 ~]  $ gcc -v
23:07 < craigcitro> Using built-in specs.
23:07 < craigcitro> Target: powerpc-apple-darwin8
23:07 < craigcitro> Configured with: /private/var/tmp/gcc/gcc-5367.obj~1/src/configure --disable-checking -enable-werror --prefix=/usr --mandir=/share/man --enable-languages=c,objc,c++,obj-c++ --program-transform-name=/^[cg][^.-]*$/s/$/-4.0/ --with-gxx-include-dir=/include/c++/4.0.0 --with-slibdir=/usr/lib --build=powerpc-apple-darwin8 --host=powerpc-apple-darwin8 --target=powerpc-apple-darwin8
23:07 < craigcitro> Thread model: posix
23:07 < craigcitro> gcc version 4.0.1 (Apple Computer, Inc. build 5367)
23:08 < mabshoff> Ok. That isn't the problem.
23:08 < craigcitro> nod
23:08 < cwitty-rvw-1473> robertwb, let me know if you want me to test anything.
23:08 < robertwb> yep, I'm making a new patch
23:09 < craigcitro> mabshoff: i guess i'll rebuild ntl, see what happens?
23:10 < mabshoff> craigcitro: Can you paste the line what gcc compiles exactly?
23:10 < mabshoff> Sure, that should be next.
23:10 < craigcitro> it's in the trac ticket
23:10 < mabshoff> thanks, looking
23:11 < wstein-rvw-1239> #1239 -- negative review for now.
23:11 < mabshoff> craigcitro: Did you already build ntl?
23:11 < craigcitro> working on it
23:12 < mabshoff> Well, *before* reporting the other problem? I assume not.
23:12 < robertwb> cwitty: try applying the patch for #1473 and running it again
23:12 < craigcitro> mabshoff: no, i hadn't tried rebuilding ntl before i got that error.
23:13 < wstein-rvw-1239> robertwb -- #1239 (your code) has some major issues.
23:13 < mabshoff> ok. I am out of ideas for now, but maybe something will come along
23:13 < wstein-rvw-1239> some of it is too confusing for me to work out actually.
23:13 < robertwb> ?
23:13 < robertwb> what is breaking with it? 
23:13 < wstein-rvw-1239> see http://trac.sagemath.org/sage_trac/ticket/1239
23:14 < wstein-rvw-1239> It might be easy for you to fix the problems.
23:14 < wstein-rvw-1239> E.g.,             sage: E = EllipticCurve([0, 0, 1/216, -7/1296, 1/7776])
23:14 < wstein-rvw-1239>             sage: F = E.global_integral_model(); F
23:14 < wstein-rvw-1239> doesn't return an integral model.
23:14 < wstein-rvw-1239> E = EllipticCurve([1/3, 5]); E
23:14 < wstein-rvw-1239> E.integral_model()
23:14 < wstein-rvw-1239> returns a non-integral model
23:15 < robertwb> Hmm... that's John's code. 
23:15 < robertwb> that is an issue though. 
23:15 < wstein-rvw-1239> it didn't look like your style, actually.
23:15 < wstein-rvw-1239> check out this line:
23:15 < wstein-rvw-1239>                   e  = min([(ai[i].valuation(p)/[1,2,3,4,6][i]) for i in range(5)]).floor()
23:15 < wstein-rvw-1239> it almost looks like mathematica :-)
23:16 < robertwb> I'm not understanding your "number_field_element.pyx -- nth_root has \ but no r" comment
23:16 < wstein-rvw-1239> if a docstring has a \ in it, you had better make the docstring a raw string.
23:16 < wstein-rvw-1239> otherwise \r gets turned into a weird control character, etc.
23:16 < robertwb> ah
23:17 < cwitty-rvw-1473> robertwb, I still get the exact same error.
23:17 < robertwb> ok, I'll work on that now
23:17 < wstein-rvw-1239> on 1239?
23:17 < wstein-rvw-1239> or on 1473?
23:17 < robertwb> on 1239, sorry
23:17 < mabshoff> ok, merging http://trac.sagemath.org/sage_trac/ticket/1514 now
23:17 < wstein-rvw-1239> ok.  I'lll stop working on 1239 and move onto the next thing.
23:17 < wstein-rvw-1239> OK?
23:17 < robertwb> I'm not sure what to say about 1473...
23:17 < robertwb> sure
23:17 < wstein-rvw-1239> btw I just tested jmol under Linux and it works very nicely.
23:18 < wstein-rvw-1239> I'll try 1473 now
23:18 < robertwb> cool
23:18 -!- wstein-rvw-1239 is now known as wstein-rvw-1473
23:18 < mabshoff> I assume http://trac.sagemath.org/sage_trac/ticket/1519 is also ready to go?
23:18 < robertwb> (On 1473, perhaps one has to install java3d directly to get it to work?)
23:18 < cwitty-rvw-1473> wstein-rvw-1473, interesting things to consider while reviewing 1473:
23:18 < cwitty-rvw-1473> 1) did you notice that it doesn't work for me?
23:19 < cwitty-rvw-1473> 2) extcode-3d-cmd.hg includes the extcode patches from #1239
23:19 < robertwb> wstein: on #1239, you said "I am working on some [issues] now" Have you done anything?
23:20 < wstein-rvw-1473> I NOTE -- the extcode patches are *fine* from 1239.
23:20 < cwitty-rvw-1473> robertwb, I'm going to try to figure out how to use my download of java3d now.
23:20 < wstein-rvw-1473> robertwb -- I did a little.
23:20 < wstein-rvw-1473> I'll upload what I did.
23:21 < wstein-rvw-1473> roberwb -- i uploaded trac-1239.patch.
23:21 < robertwb> ok
23:21 < wstein-rvw-1473> It might be useful it might not be...
23:21 < craigcitro> mabshoff: rebuilding ntl fixed that problem.
23:21 < mabshoff> ok. I am not happy about that.
23:21 < craigcitro> mabshoff: oh, duh -- are you testing this on the same machine was built those on? because if so, it's going to find the files mentioned in there!!
23:22 < craigcitro> you have to move william's build and then try again, i think.
23:22 < mabshoff> William moved the original install, so the files are no longer there.
23:22 < craigcitro> oh
23:22 < craigcitro> check that path anyway
23:22 < mabshoff> I *think* so, cheking
23:22 < craigcitro> make sure there's nothing that's ended up there.
23:22 < craigcitro> grin
23:22 < craigcitro> that'd be a pretty funny reason for not finding the same problem
23:23 < mabshoff> Ok, "no such file or directory"
23:23 < craigcitro> hmm
23:23 < craigcitro> then i'm stumped.
23:23 < mabshoff> So I am really puzzled.
23:23 < mabshoff> Did you rebuild any of the object files that end up in libcsage.so?
23:24 < craigcitro> i still get that weird "can't open dynamic library: libpari-gmp" message
23:24 < craigcitro> and it's got /Users/was/... in the error message that comes up.
23:24 < mabshoff> Which pyx file is that from?
23:25 < craigcitro> dozens of them
23:25 < mabshoff> hmm.
23:25 < craigcitro> matrix_integer_sparse, matrix_complex_double_dense just went by
23:26 < craigcitro> i bet anything that links in pari
23:26 < mabshoff> I think I will download the binary later and try on my local box
23:26 < mabshoff> Probably.
23:26 < craigcitro> oh, or csage
23:26 < mabshoff> Maybe it is the order of the linker arguments.
23:26 < craigcitro> could be.
23:26 < craigcitro> it doesn't seem to cause any obvious troubles, but it's still unsettling
23:26 < craigcitro> matrix_mod2_dense
23:27 < craigcitro> damn ... and now we have another "can't find files" showstopper with singular
23:27 < craigcitro> g++ -bundle -undefined dynamic_lookup build/temp.macosx-10.3-ppc-2.5/sage/matrix/matrix_mpolynomial_dense.o -L/Users/craigcitro/bd7-sage/local//lib -lcsage -lm -lreadline -lsingular -lsingcf -lsingfac -lomalloc -lgivaro -lgmpxx -lgmp -lstdc++ -lntl -o build/lib.macosx-10.3-ppc-2.5/sage/matrix/matrix_mpolynomial_dense.so
23:27 < craigcitro> ___gmpq_canonicalize referenced from libsingular expected to be defined in /Users/was/sage-2.9.alpha7/local/lib/libgmp.3.dylib
23:27 < craigcitro> ___gmpq_clear referenced from libsingular expected to be defined in /Users/was/sage-2.9.alpha7/local/lib/libgmp.3.dylib
23:27 < craigcitro> ___gmpq_div referenced from libsingular expected to be defined in /Users/was/sage-2.9.alpha7/local/lib/libgmp.3.dylib
23:27 < craigcitro> ___gmpq_init referenced from libsingular expected to be defined in /Users/was/sage-2.9.alpha7/local/lib/libgmp.3.dylib
23:27 < craigcitro> ___gmpq_mul referenced from libsingular expected to be defined in /Users/was/sage-2.9.alpha7/local/lib/libgmp.3.dylib
23:27 < craigcitro> another 15 lines of undefined symbols
23:28 < mabshoff> singular also links against NTL.
23:28 < craigcitro> but it's clearly saying it wants one of william's paths
23:28 < mabshoff> switch the arguments so that ntl is before the two gmp libs.
23:28 < cwitty-rvw-1473> I know how to strip at least 2.5MB from the Sage tarball, and 6MB from the Sage install:
23:29 < cwitty-rvw-1473> stop shipping two separate copies of java3d (one in extcode, one in java3d).
23:30 < craigcitro> mabshoff: same problem.
23:31 < wstein-rvw-1473> cwitty :-)
23:31 < craigcitro> did you try touching matrix_mpolynomial_dense and building?
23:31 < robertwb> I thought we got rid of the one in extcode
23:32 < mabshoff> craigcitro: I think if you force a singular.spkg rebuild the link issue will go away.
23:32 < cwitty-rvw-1473> Nope.  I just extracted spkg/standard/extcode-2.9.alpha7.spkg, and the files are in there.
23:32 < mabshoff> I assume libSingular is missing some proper flags, just like NTL.
23:32 < mabshoff> Well, like NTL used to.
23:36 -!- janwil [n=jan@213-35-169-226-dsl.trt.estpak.ee] has joined #sage-devel
23:36 < mabshoff> Actually, when I fixed NTL to be movable I had to force a rebuild of libSingular to make 
23:36 < wstein-rvw-1473> 1473 worksforme fine.
23:36 < janwil> good morning
23:36 < mabshoff> the pyx files compile.
23:36 < mabshoff> Hi janwil.
23:38 < janwil> my alpha7 build completed last night (took 3 hours) and i am running make check now ... when that will be complete, i will try my favourite test
23:38 < mabshoff> :)
23:39 < mabshoff> craigcitro: The magic change in NTL was:
23:39 < mabshoff> -       $(CXX) -single_module -fPIC -dynamiclib -o libntl.dylib $(OBJ) $(GMP_LIBDIR) $(GMP_LIB)
23:39 < mabshoff> +       $(CXX) -fPIC -dynamiclib -undefined dynamic_lookup -o libntl.dylib $(OBJ) $(GMP_LIBDIR) $(GMP_LIB)
23:39 < craigcitro> so just killing -single-module ?
23:39 < mabshoff> So we might teach libSingular also to do -undefined dynamic_lookup
23:40 < craigcitro> oh, nods
23:40 < craigcitro> you did that in the spkg-install for NTL?
23:40 < mabshoff> -single_module is some old style linker option, pre 10.3 maybe.
23:40 < mabshoff> Yep
23:40 < mabshoff> I added a comment to 1522, so I don't forget.
23:41 -!- wstein-rvw-1473 is now known as wstein-1183
23:41 < wstein-1183> I'm going to fix 1183 finally.
23:42 < mabshoff> can we get a review on 1494? robertwb maybe since it deals with corecion?
23:42 < cwitty-rvw-1473> robertwb, wstein-1183: I just posted on #1473 the magic steps I had to follow to get command-line java3d to work for me.
23:43 < wstein-1183> cool.
23:43 < wstein-1183> nice.
23:43 < wstein-1183> cwitty -- did you try jmol yet, by the way?
23:43 < wstein-1183> e.g., from their websie?
23:44 < cwitty-rvw-1473> I watched the demo on the main page.
23:44 < wstein-1183> robert posted a patch that you can try out.
23:44 < wstein-1183> http://trac.sagemath.org/sage_trac/ticket/1511
23:44 < wstein-1183> and
23:45 < wstein-1183> that's it for now.
23:45 < wstein-1183> you have to download the jmol binary from the jmol site and extract it somewhere.
23:45 < wstein-1183> then write a scene to it that directory
23:45 < wstein-1183> then do ./jmol scene_file
23:45 < wstein-1183> and you get a viewer.
23:47 < cwitty-rvw-1473> I'll give it a try.  I'm not really interested in jmol, though; my goal is 3D graphics where you can do things like click and drag a vertex to change the shape, and I think it's going to be much easier to write such a thing based on java3d than jmol.
23:48 < wstein-1183> interesting.
23:48 < wstein-1183> I think jmol is much much more likely to be really usable in sage.
23:48 < mabshoff> craigcitro: the libSingular linker flags on OSX seem to be: 
23:48 < mabshoff> SLDFLAGS="-dynamic -twolevel_namespace -weak_reference_mismatches weak -undefined dynamic_lo
23:48 < mabshoff> okup"
23:49 < craigcitro> the -undefined dynamic_lookup sounds pretty good.
23:49 < wstein-1183> it runs almost any java install, embeds nicely in the notebook, and seems to be very solid.
23:49 < mabshoff> We should ask somebody about twolevel_namespace and why that is needed.
23:49 < mabshoff> I *hate* Apple's linker.
23:49 < craigcitro> snic
23:49 < craigcitro> is it better in 10.5?
23:49 < cwitty-rvw-1473> Plus, java3d is at least an order of magnitude faster for spinning things around :)
23:49 < mabshoff> Well, they just keep piling on more and more shit.
23:50 < cwitty-rvw-1473> (If you've got hardware-accelerated OpenGL.)
23:50 < wstein-1183> I guess java3d and jmol will just serve two very different purposes for sage.
23:50 < mabshoff> if you want to change the options edit it in src/kernel/configure.in and rerun automake or whatever
23:50 < wstein-1183> We really *desperately* need solid 3d graphics that "just work" and jmol is the best hope I've seen so far.
23:51 < wstein-1183> Something intermediate between performance and ugliness.
23:51 < wstein-1183> java3d / mayavi2/vtk are on the high-performance side.
23:51 < wstein-1183> jmol and tachyon would be on the "just always easily works everywhere and is lightweight" side.
23:52 < craigcitro> mabshoff: in the libsingular package stuff?
23:52 < wstein-1183> This is the biggest glaring gap in sage right now.
23:52 < robertwb> getting java3d to work accross all platforms/browsers has been where 90% of the effort has been placed (and it doesn't look like it's going to stop). 
23:52 < craigcitro> mabshoff: i'm very mystified that this doesn't pop up on your machine.
23:52 < wstein-1183> and jmol already works on everything under the sun.
23:52 < mabshoff> craigcitro: I would also like to figure out why it blows up on your box.
23:53 < cwitty-rvw-1473> robertwb, just so you know: now that I have 1473 working on my laptop, I don't personally care about 1419 (java3d notebook requires internet access) any more.
23:53 < robertwb> As you've mentioned, java3d with openGL is faster (I've confirmed that in actually tests, an order of magnitude is about right) and has more options (e.g. for animation, lighting, etc.) but doesn't "just work" everywhere yet
23:53 < mabshoff> craigcitro: our best hope might be to use  -dynamiclib
23:54 < wstein-1183> You can easily have 10 jmol 3d graphics embedded in a single worksheet, and it works fine.
23:54 < mabshoff> for libSingular that is.
23:54 < robertwb> cwitty: me either :), at least not for the short run
23:55 < craigcitro> mabshoff: that could work. do you want to put a new spkg somewhere, or should i open this thing up and fiddle?
23:55 < cwitty-rvw-1473> robertwb, have you tried high-resolution surface plots in jmol yet?
23:56 < mabshoff> Well, I think this needs extensive testing, i.e. 10.5 vs. 10.4 in place rebuild vs. moved rebuild 
23:56 < robertwb> I pushed it up to about 40K triangles, and there it started to really slow down. 
23:56 < mabshoff> and I don't want to tangle with that over the next 24 hours.
23:56 < mabshoff> I am somewhat concerned that Martin uses " -weak_reference_mismatches weak" which 
23:56 < mabshoff> isn't good as far as I understood the ld man page.
23:56 < craigcitro> grin
23:57 < mabshoff> to fix your problem for a singular.spkg rebuild.
23:57 < craigcitro> you could try asking on the appropriate irc channel, but they weren't terribly helpful last time i had a question.
23:57 < mabshoff> Well, it isn't really something you can properly describe in 3 sentences.
23:57 < craigcitro> that's true
23:58 < craigcitro> though at some point i wanted to know the difference between two linker options
23:58 < mabshoff> But the linker options for linSingular on OSX certainly seem to be sub-optimal.
23:58 < craigcitro> and no one could tell me.
23:58 < mabshoff> "man ld"
23:58 < craigcitro> grin nods
23:58 < mabshoff> *RTFM* :)
23:58 < craigcitro> nod, but it isn't clearly explained in the man page
23:58 < mabshoff> hehe, I agree. 
23:58 < craigcitro> which is what i was asking them about
23:59 < mabshoff> Just the fact that Apple has all these stupid link options makes me want to hit 
23:59 < craigcitro> it's the -undefined dynamic_lookup versus -undefined something
23:59 < mabshoff> my head against the wall.
23:59 < jkantor> just to agree ld is retarded on OSX
23:59 < mabshoff> Yep. On proper Linux/UNIX you link all symbols at link time.
23:59 < mabshoff> Not in some magic "the ld is smarter than you" way
--- Day changed Sat Dec 15 2007
00:00 < cwitty-rvw-1473> wstein-1183, robertwb: should we merge 1473?  I think so; without my workaround, it changes S.show() from "silently does nothing" to "silently does nothing", so at least it's not a regression. :)
00:00 < mabshoff> That makes code go *boom* are runtime.
00:00 < cwitty-rvw-1473> And on OSX, it actually works, right?
00:00 < wstein-1183> yep, it works fine on osx.
00:00 < mabshoff> jkantor: +1
00:01 < craigcitro> grin jkantor 
00:01 < mabshoff> Apple needs to stop reinventing the wheel.
00:01 < wstein-1183> they aren't as bad as MS.
00:01 < mabshoff> And maybe somebody needs to send them a link that explains KISS
00:01 < wstein-1183> indeed
00:01 < cwitty-rvw-1473> and you're confident that incidentally merging the extcode patches from 1239 doesn't hurt anything?
00:01 < wstein-1183> yes.
00:01 < wstein-1183> wait!
00:02 < wstein-1183> It will completely break things
00:02 < mabshoff> wstein-1183: You are partially wrong: linking on Windows is a pleasure.
00:02 < wstein-1183> I.e., it will break simon 2 descent
00:02 < wstein-1183> however, I think robert is fixing the updated simon 2 descent now.
00:02 < wstein-1183> There is nothing truly broken about that -- it just needs some polish.
00:02 < wstein-1183> So I would recommend merging 1472 and 1239, but opening a ticket to polish 1239.
00:03 < wstein-1183> Since 1239 works.
00:03 < wstein-1183> it's just easy to get lies from some of the new functions :-)
00:03 < jkantor> linking may be fine, but that would be about all . . .
00:04 < cwitty-rvw-1473> Sounds good to me.  Do you want to change your review of 1239, and open the new ticket?
00:04 < wstein-1183> yes
00:06 < mabshoff> cwitty-rvw-1473: Can you look at 1494, it is require for 1183
00:06 < mabshoff> +d
00:06 < wstein-1183> robertwb -- you are now working on http://trac.sagemath.org/sage_trac/ticket/1524
00:06 < mabshoff> Or anybody else who wants to :)
00:07 < wstein-1183> ok?
00:07 < robertwb> yes
00:07 < robertwb> I put another patch up at #1239
00:07 -!- cwitty-rvw-1473 is now known as cwitty-rvw-1494
00:07 < robertwb> It fixes some doctest issues, but the integral model stuff is still bad
00:08 < robertwb> we need that one to merge in the new extcode patch thoug, so it won't break
00:09 < mabshoff> robertwb: Let me know when to merge what in which order ;)
00:10 < robertwb> mabshoff: just merge them in the order they're listed
00:10 < mabshoff> ok
00:10 < robertwb> (assuming you're talking about #1239)
00:10 < wstein-1183> robertwb -- if we can't fix it, then we can put a NotImplementedError in at least and ask john to work on it.
00:10 < wstein-1183> But still merge the code in.
00:10 < mabshoff> Yes. Are they ready to go in now?
00:11 < robertwb> yes, if I don't see a straightforward solution, I'll do taht
00:11 < mabshoff> Well, I have to wait for doctests to finish first.
00:11 < wstein-1183> He's just writing an explicit transformation to integral form... i.e., rescaling x and y, I guess.
00:11 < robertwb> if you want to wait a little bit, maybe I could resolve the other issue...
00:11 < wstein-1183> robertwb -- but I'm sure you'll figure out the algebra :-)
00:11 < wstein-1183> ok.
00:11 < cwitty-rvw-1494> wstein-1183: did you doctest 1494?
00:11 < cwitty-rvw-1494>     sage: sage: K(O.1^2 + O.1 - 2)
00:11 < cwitty-rvw-1494>           ^
00:11 < cwitty-rvw-1494>      SyntaxError: invalid syntax
00:11 < wstein-1183> I almost have residue fields -- I'm going to get that done.
00:11 < mabshoff> :)
00:11 < wstein-1183> cwitty -- I didn't.
00:12 < wstein-1183> But that was a very important fix...
00:12 < wstein-1183> that was easy to do.
00:12 < wstein-1183> And it does work. 
00:12 < wstein-1183> I posted it in a hurry when I was working with a student (Ally) on Sage.
00:13 < cwitty-rvw-1494> OK; I'll fix the doctest.
00:13 < wstein-1183> thanks.
00:16 < cwitty-rvw-1494> mabshoff, #1494 looks good.
00:17 -!- cwitty-rvw-1494 is now known as cwitty-rvw-1511
00:17 < robertwb> looks like the bug in integral_model was a indentation error--the return statement was in the loop!
00:18 < wstein-1183> python n00b
00:18 < wstein-1183> nicely spotted !
00:19 -!- mabshoff_ [n=mabshoff@p5090C65B.dip.t-dialin.net] has joined #sage-devel
00:21 < mabshoff_> Ok, I changed the release manager for 2.9.1 to Robert Miller and added a 2.9.2 release for the end of the year
00:22 -!- mabshoff_ changed the topic of #sage-devel to: Bug Day 7 in progress - 2.9.rc0 will be out in a couple hours
00:28 < janwil> ok, make check of alpha7 is complete
00:28 < janwil> The following tests failed:
00:28 < janwil>         sage -t  devel/sage-main/sage/numerical/test.py
00:28 < mabshoff_> Don't worry about that one.
00:28 < janwil> ok
00:29 < mabshoff_> It is more or less random, we should have a better doctest for that before 2.9.final
00:29 < jkantor> mabshoff did the second patch ever get tested
00:29 < mabshoff_> Nope, I don't think so. I don't know where it is yet.
00:29 < jkantor> on the ticket ?
00:29 < mabshoff_> Something like that.
00:30 < mabshoff_> Which number?
00:30 < jkantor> 1430
00:30 < mabshoff_> thanks. I will merge that shortly after http://trac.sagemath.org/sage_trac/ticket/1239
00:31 < robertwb> OK, http://sagetrac.org/sage_trac/ticket/1239 has one last patch (for a total of 5 attachments) and I think it's good to go.  
00:32 < mabshoff_> Yep, I refreshed and saw the 5th :)
00:32 < mabshoff_> I had to look where ell.gp was, but I found it.
00:33 < robertwb> cwitty, on #1494 (number fields)
00:35 -!- mabshoff [n=mabshoff@p5090C031.dip.t-dialin.net] has quit [Read error: 110 (Connection timed out)]
00:36 < janwil> ok, my favourite bug still occurs in the freshly built sage
00:36 < janwil> mabshoff, do you want access to the machine where it can be reproduced?
00:36 < mabshoff_> Sure. Is it a static IP?
00:36 < janwil> yes
00:36 < robertwb> nevermind
00:37 < mabshoff_> ok, send me an email with the details, but better cc William, too.
00:37 < janwil> give me your email, i will send you the location, username and password
00:37 < mabshoff_> Michael.Abshoff@googlemail.com
00:37 < janwil> ok
00:37 < mabshoff_> I assume you have William's address?
00:38 < janwil> wstein@gmail?
00:38 < wstein-1183> janwil -- you are very persistent.
00:38 < wstein-1183> I wish you had way *more* favoriate bugs.
00:38 < wstein-1183> We can definitely use lots of people finding bugs and being persistent!!1
00:39 < mabshoff_> He threatend to use Mathematica instead :)
00:39 < mabshoff_> I thought that would get you motivated
00:39 < janwil> well, this is the one that stops me from moving further -- once i get over it, i'öll find more :)
00:39 < wstein-1183> i didn't see that.
00:39 < mabshoff_> It happened when you weren't here.
00:40 < wstein-1183> I use mathematica.
00:40 < wstein-1183> I used it today :-)
00:40 < mabshoff_> ok, all 5 patches from 1239 merged. Closing it unless somebody things of a reason why not.
00:40 < wstein-1183> good
00:43 < robertwb> I closed #1524 (the "other #1239 issues") ticket as well
00:43 < mabshoff_> ok, merging the second doctest for 1430 and 1494 next.
00:44 < janwil> ok, Michael and Willaim, you should have the info now
00:44 < mabshoff_> jkantor: no, those are leftover issues from 1239.
00:45 < mabshoff_> As far as I understand. Or am I wrong?
00:45 < mabshoff_> janwil: go it.
00:45 < mabshoff_> Will was & I work on the same install?
00:45 < mabshoff_> It looks like it.
00:45 < jkantor> what ?
00:46 < mabshoff_> re 1524.
00:46 < mabshoff_> jkantor: never minf.
00:47 < mabshoff_> -f+d
00:47 < mabshoff_> I misinterpreted something that robertwb wrote and attributed it to you.
00:47 < jkantor> ok
00:48 < mabshoff_> http://trac.sagemath.org/sage_trac/ticket/1239 is now officially closed.
00:49 < cwitty-rvw-1511> robertwb, is it expected that with your example in #1511, that capeman's eyes and mouth will each be a single triangle
00:49 < cwitty-rvw-1511> ?
00:49 < robertwb> no...
00:50 < cwitty-rvw-1511> You guys are using jmol-11.2.14?
00:50 < robertwb> is that what you're getting?
00:50 < cwitty-rvw-1511> Yes.
00:50 < wstein-1183> yes
00:50 < robertwb> yep...downloaded it last night...
00:51 < robertwb> can you post/mail a screenshot?
00:51 < cwitty-rvw-1511> Yes, working on it.
00:54 < cwitty-rvw-1511> http://sage.math.washington.edu/home/cwitty/capeman.png and http://sage.math.washington.edu/home/cwitty/capeman2.png
00:55 < robertwb> hmm... that's not good. 
00:55 < robertwb> Can you send post the files that it's generating?
00:55 < cwitty-rvw-1511> And also in that directory is cape.script*
00:56 < robertwb> oh
00:57 < cwitty-rvw-1511> using this command line: /tmp/jmol-11.2.14/jmol.sh cape.script
00:58 < wstein-1183> test
00:58 < cwitty-rvw-1511> BTW, that's with a zoom of 800%; by default, I just get a tiny capeman in the middle of the window.
00:59 -!- wstein-1183 [n=was@c66-235-34-166.sea2.cablespeed.com] has left #sage-devel []
00:59 -!- wstein-1183 [n=was@c66-235-34-166.sea2.cablespeed.com] has joined #sage-devel
00:59 -!- wstein-1183 [n=was@c66-235-34-166.sea2.cablespeed.com] has left #sage-devel []
00:59 -!- wstein-1183 [n=was@c66-235-34-166.sea2.cablespeed.com] has joined #sage-devel
01:00 < robertwb> I bet the zoom has something to do with it--how it's rendering the spheres
01:00 < cwitty-rvw-1511> Do you not have to zoom in?
01:03 < robertwb> I scaled mine up before rendering it
01:03 < robertwb> (in Sage)
01:04 < robertwb> It looks like jmol has a fixed rendering size
01:04 < robertwb> and virtually ignores things that are too small
01:05 < cwitty-rvw-1511> mabshoff_, #1518 looks good.
01:05 < mabshoff_> ok, will merge
01:10 < wstein-1183> hi
01:10 < wstein-1183> testing
01:11 < cwitty-rvw-1511> Hi.
01:11 < mallockilx> wstein-1183: whats a PI (i.e. "the PI" as written in your docs) ?
01:11 < wstein-1183> where?
01:12 < mabshoff_> the grant application
01:12 < wstein-1183> Principal investigator
01:12 < mallockilx> Ahh.
01:12 -!- mabshoff_ is now known as mabshoff
01:15 -!- cartman [n=ismail@kde/ismail] has joined #sage-devel
01:16 < cwitty-rvw-1511> mabshoff_, did you catch that we do want to merge #1473?
01:16 < mabshoff> Hi cartman.
01:16 < mabshoff> Any news on that clisp vs. 32 bit gcc 4.2 bug?
01:17 < mabshoff> cwitty-rvw-1511: Nope, must have overlooked it. It is in the next batch to merge
01:17 -!- cwitty-rvw-1511 is now known as cwitty
01:17 < cwitty> Good night.
01:18 < mabshoff> cu cwitty. Thanks for all the excellent work.
01:18 < cartman> yoyo mabshoff
01:19 < cartman> mabshoff: I found & fixed an important bug in python 2.5 with gcc 4.3
01:19 < cartman> mabshoff: http://bugs.python.org/issue1608
01:19 < cartman> you might want to poke Debian python maintainers
01:20 < mabshoff> having a look
01:23 < mabshoff> shhesh: "GCC 2.96 is still the golden standard for me"
01:24 < cartman> ;)
01:24 < mabshoff> That is one scary bug report.
01:24 < cartman> I was about to tell him http://gcc.gnu.org/gcc-2.96.html
01:24 < cartman> but didn't
01:24 < mabshoff> :)
01:25 < cartman> anyway scary indeed
01:25 < mabshoff> Yeah, I remember that "special" gcc release.
01:25 < cartman> :D
01:25 < cartman> heheh
01:30 < mabshoff> jkantor: still aorund?
01:30 < jkantor> yah
01:30 < jkantor> yeah
01:30 < mabshoff> can you send my numerical/test.py - the new patch doesn't apply because 
01:30 < mabshoff> of fixes I did.
01:31 < jkantor> take the one in /home/jkantor/sage-2.8.15-.../devel
01:31 < mabshoff> ok, will do
01:33 < janwil> ok, moving away now ... mabshoff, please let me know when you're have logged in to my machine and figured out what's wrong ... I wouldn't like keeping credentials open for longer than necessary
01:37 < mallockilx> A ball is dropped from a height of 'h' feet and repeatedly bounces off the floor. After each bounce, the ball reaches a height that is 2/3of the height from which it previously fell. for example, after the first bounce, the ball reaches a height of 2/3h fet. Which of the following represent the total number of feet the ball travels between the first and the sixth bounce. it is: ( 5 [on top of] sigma [with an setter of] i=1 )(2h)(2/3)^i
01:37 < mallockilx> Why is it 2h? and not just h?
01:38 < mabshoff> janwil: Ok, I will be sleeping soon. 
01:38 < mallockilx> woah
01:38 < janwil> sweet dreams :)
01:38 < mallockilx> sorry wrong channel.
01:38 < mabshoff> Well, I guess soon is about 2 hours away.
01:38 < craigcitro> mabshoff: when is rc0 likely to be around?
01:39 < mabshoff> It depends. If there aren't any reviews comping in the next hour I will doctest 
01:39 < mabshoff> and create a -sdit.
01:39 < mabshoff> Then I will do build tests with vanilla sources and if those build and doctests 
01:39 < mabshoff> I will announce.
01:40 < craigcitro> k
01:40 < craigcitro> i'll make sure to build & make test on this machine from scratch
01:40 < mabshoff> is William gone?
01:40 < mabshoff> :)
01:40 < craigcitro> because it seems to be a hotbed of trouble :)
01:40 < mabshoff> Better nuke fink ;)
01:40 < craigcitro> snic
01:40 < mabshoff> +1
01:40 < craigcitro> well, that's the thing -- i'm probably not the only one with fink
01:41 < mabshoff> next time I want to debug insane build issues I will ping you ;)
01:42 < mabshoff> ok, merging 1473 now, the last ticket with positiv review.
01:42 -!- janwil [n=jan@213-35-169-226-dsl.trt.estpak.ee] has quit ["Leaving."]
01:42 < mabshoff> Well, there is http://trac.sagemath.org/sage_trac/ticket/444 
01:43 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1258
01:43 < mabshoff> So, 3 more ticket to merge.
01:46 < mabshoff> robertwb: What does the rubic cube solver spkg depend upon?
01:47 < robertwb> just gcc, I belive
01:47 < robertwb> and make
01:47 < mabshoff> ok. 
01:47 < mabshoff> :)
01:47 < jkantor> is the rubic cube solver in C
01:47 < robertwb> yes
01:48 < jkantor> cool
01:48 < robertwb> there's actually 3 of them
01:48 < robertwb> an optimal solver, a "asymtotically optimal" solver, and a extreemy fast non-optimal solver
01:49 < jkantor> cool, do they use external libraries at all
01:49 < jkantor> I guess not
01:49 < robertwb> nope
01:50 < robertwb> just stdio
01:50 < mabshoff> Where do I apply the different bundles from 1473?
01:50 < mabshoff> extcode-3d-cmd.hg says unknown parent in sage/ext.
01:51 < robertwb> apply extcode to the extcode branch
01:51 < robertwb> the others to sage-main
01:51 < mabshoff> ok
01:52 < mabshoff> That does work, indeed ;)
01:52 < robertwb> actually, there's two extcode patches (both labeled as such)
01:52 < robertwb> great
01:52 < mabshoff> Yep, I assumed that much.
01:52 < mabshoff> The second patch is against the "main" repo
01:55 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1473 is merged ;)
02:00 < craigcitro> mabshoff: is the rule that no new non-bugfixes will make it into 2.9 after rc0?
02:00 < wstein-1183> no
02:01 < wstein-1183> oh, non-bugfixes.
02:01 < mabshoff> It shouldn't cause major problems.
02:01 < wstein-1183> yes.
02:01 < craigcitro> grin ... k
02:01 < mabshoff> best scenario is that it is new code that doesn't touch or change existing behavior.
02:01 < mabshoff> i.e. 444 is the perfect example.
02:01 < craigcitro> well, i think i've got this pari bug kicked.
02:02 < mabshoff> oooh, that one is potentially troublesome ;)
02:02 < craigcitro> grin nods
02:02 < wstein-1183> I think I have the residue class field bug solved.
02:02 < mabshoff> wstein-1183: I want to merge 444 and 1259 and release 2.9.rc0
02:02 < wstein-1183> doctesting now.
02:02 < wstein-1183> This is a big patch.
02:02 < mabshoff> :)
02:02 < wstein-1183> I think you should merge 1183.
02:02 < mabshoff> Any probably 1183 ;)
02:02 < wstein-1183> It fixes a number of other trac issues to.
02:03 < wstein-1183> too
02:03 < mabshoff> ok
02:03 < wstein-1183> and it might improve coverage.
02:03 < mabshoff> +1
02:03 < wstein-1183> since i just wrote some doctests.
02:03 < mabshoff> Well, this is rc0, so we have about 24 hours to fic the remaining issues.
02:03 < mabshoff> fic->fix
02:04 < wstein-1183> ok, 1183 is now up and done.
02:04 < mabshoff> And we will two stabilitzation/bugfix releases before the AMS meeting.
02:04 < wstein-1183> the single most important thing before the AMS meeting is that we have a release with descent dynamic working
02:04 < mabshoff> ok, have you looked at 553? That is another patch that ought to go in, together with 1183
02:05 < wstein-1183> 3d graphics in the notebook.
02:05 < wstein-1183> seriously.
02:05 < wstein-1183> 1183 also fixes 1242
02:05 < mabshoff> I didn't mean 1183, there is another ticket that depends on 553, 
02:05 < mabshoff> 1189 I believe.
02:05 < mabshoff> Good
02:05 < wstein-1183> and maybe 1185
02:05 < mabshoff> ok
02:06 < wstein-1183> yep it fixes 1185 too
02:06 < wstein-1183> though the example has to be changed slightly.
02:08 < mabshoff> ok, http://trac.sagemath.org/sage_trac/ticket/1139 depends on http://trac.sagemath.org/sage_trac/ticket/1139
02:08 < wstein-1183> so apply 1183, then close 1185 and 1242.
02:08 < mabshoff> will do.
02:08 < mabshoff> ok, 1139 depends on http://trac.sagemath.org/sage_trac/ticket/553
02:09 < mabshoff> mmh, Konversation is buggy with replacement rules.
02:09 < cartman> :/
02:09 < wstein-1183> 1139 is easy.
02:09 < mabshoff> I won't fix that, too tired.
02:09 < mabshoff> There is a patch.
02:09 < wstein-1183> just kidding
02:09  * cartman is an ex. Konversation developer
02:09 < mabshoff> nice
02:09 < mabshoff> mhansen also has a new patch fir 553
02:09 < mabshoff> -i+o
02:13 -!- malb_ [n=malb@host86-141-246-136.range86-141.btcentralplus.com] has joined #sage-devel
02:14 < mabshoff> wstein-1183: Anything else you would like to get merged?
02:15 -!- wstein-1183 is now known as trac-1139
02:15 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1421 looks nice
02:15 < trac-1139> I think for 1139 we should just give a better NotImplementedError message or something.
02:16 -!- burcin [i=berocal@leopard.risc.uni-linz.ac.at] has joined #sage-devel
02:16 < trac-1139> 1421 does look good.
02:16 < mabshoff> Yep, maybe soon sympy can do that job with high precision.
02:16 < trac-1139> if it passes tests, I say "positive review"
02:16 < trac-1139> I VERY MUCH doubt it.
02:16 < trac-1139> That isn't at all the sort of thing Ondrej cares about.
02:16 < mabshoff> about sympy?
02:16 < mabshoff> ok
02:16 < trac-1139> PARI is the best program for high-precision integration, I think.
02:17 < mabshoff> ok
02:19 < trac-1139> Tthere are examples in the docstring for f.nintegrate(..) in calculus.py of how to use pari.
02:19 < trac-1139> but it needs to be trivial for users...
02:19 < burcin> is there an alpha7 binary I can use on sage.math?
02:19 < mabshoff> Excellent. Is there a reason not to switch per default, i.e. performance?
02:20 < mabshoff> Hi burcin.
02:20 < trac-1139> not every sage symbolic function makes sense in pari.
02:20 < trac-1139> in fact most don't.
02:20 < burcin> I want to test #1447
02:20 < mabshoff> I can roll you one that is very close to alpha7. I applied some patches that went into rc0
02:20 < burcin> hello
02:21 < burcin> mabshoff, that would be great
02:21 < mabshoff>  tmp/Work-mabshoff/release-cycles-2.9/sage-2.9.rc0 is the current tree
02:22 < mabshoff> if you want to just look that should be fine. I am doing a bdist on the alpha7 tree next to it
02:22 < burcin> ok.. let me see
02:22 < mabshoff> rolling bdist
02:26 < trac-1139> bdist?
02:26 < trac-1139> sdist
02:26 < mabshoff> bdist, but  alpha7
02:26 < mabshoff> http://sage.math.washington.edu/home/mabshoff/sage-2.9.alpha7-sage-math-x86_64-Linux.tar.gz
02:26 < mabshoff> burcin: there is also a ticket to make m4ri a static library.
02:27 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1505
02:27 < burcin> thanks for the package
02:27 < mabshoff> np
02:29 < burcin> about 1505.. I thought about that, but chose the quick fix for now
02:29 < mabshoff> mk
02:29 < burcin> is the plan to take m4ri out of the sage library, and make it a package?
02:29 < trac-1139> yes
02:29 < mabshoff> Well, the plan is to build a static version
02:30 < trac-1139> ok, 1139 looks good.
02:30 < mabshoff> ok, added to the merge list
02:31 < trac-1139> what about 1407?
02:32 < trac-1139> I think that's an important one to go in.
02:32 < trac-1139> It greatly speeds up certain algebraic number theory things.
02:32 < mabshoff> Is it reviewed?
02:33 < mabshoff> Well, I tend to trust your patches ;)
02:33 < trac-1139> no it's not.
02:33 < trac-1139> anybody around who wants to review 1407
02:33 < trac-1139> it worksforme
02:34 < mabshoff> There are also the mathematica plot and special function ticket with patches.
02:34 < trac-1139> mathematica plot should go in.
02:34 < trac-1139> it's a few lines and easy.
02:34 < trac-1139> the function one (formal functions) definitely also needs to go in.
02:34 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1504 ?
02:35 < mabshoff> Which one is the other one?
02:35 < trac-1139> 1504 is invalid.
02:35 < mabshoff> I just saw that, too
02:35 < trac-1139> 1503
02:35 < mabshoff> ah, ok
02:36 < trac-1139> all that is is 2 more docstrings and doctests + using [] instead of () when coercing a function mathematica
02:36 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1442 should also be merged
02:37 < trac-1139> yes, definitely.
02:37 < trac-1139> That used to be true, but we changed it.
02:37 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1502 is the other mathematica ticket that should be merged?
02:37 < trac-1139> give me 3 minutes to referee #1502.
02:38 < mabshoff> Sure
02:38 < trac-1139> I'm very glad to see that mhansen did it!
02:38 < mabshoff> That makes 8 ticket to merge.
02:38 -!- jkantor [i=jkantor@sage.math.washington.edu] has quit ["leaving"]
02:38 < trac-1139> hold on, anything else?
02:38 < mabshoff> Do you have an opinionon 553?
02:38 < trac-1139> yes, what about 553.
02:38 < mabshoff> Well, it was rejected last time.
02:39 < mabshoff> But there is a new patch.
02:39 < trac-1139> i'm all for the current 553.
02:39 < mabshoff> ok, didn't know that.
02:39 < trac-1139> but I want to try it first.
02:39 < trac-1139> I looked over the code and it looked good.
02:39 < trac-1139> so I'l ref 553 and 1502 right now, ok?
02:39 < mabshoff> ok, has 1139 been changed to throw not implemented yet?
02:39 < mabshoff> yep, sounds good go me.
02:39 < trac-1139> what about 1137?
02:40 < trac-1139> 1162 also looks important
02:40 < mabshoff> the tp_new issue? So far unresolved.
02:40 < mabshoff> sorry, 1137 should go in as doctest.
02:40 < trac-1139> it says "with patch"?
02:41 < mabshoff> I tested on 10.4 and didn't see any touble.
02:41 < craigcitro> hey ... i can review 1407
02:41 < trac-1139> i'll do 553, 1502, 1162, 1237.
02:42 < trac-1139> 1363 -- is that closed now?
02:42 < trac-1139> 1275 is closed so...
02:42 < mabshoff> I have the feeling we merged 1162 already.
02:42 < trac-1139> yep
02:42 < mabshoff> ok, close it?
02:43 < trac-1139> no, wait.
02:43 < mabshoff> ok,
02:43 < trac-1139> it's definitely not in alpha7
02:43 < mabshoff> what about http://trac.sagemath.org/sage_trac/ticket/1401 ?
02:43 < trac-1139> and there is no review, so don't close it yet.
02:43 < mabshoff> Then it wasn't merged
02:44 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1404 also
02:44 < trac-1139> wow, 1401 looks very nice.
02:44 < trac-1139> my list now: 553, 1502, 1162, 1237, 1401
02:44 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1425 also seems important
02:45 < trac-1139> there is no patch for 1404?!!
02:45 < trac-1139> oh, it is that one-liner.
02:45 < trac-1139> ok.
02:45 < trac-1139> my list now: 553, 1502, 1162, 1237, 1401, 1404
02:45 < mabshoff> Well, it is in the ticket description.
02:45 < mabshoff> ok, brewing some tea to stay awake, will start merging shortly.
02:46 < mabshoff> Still doctesting the last batch.
02:46 < burcin> can I close #1447 myself, or does someone need to test it first?
02:46 < mabshoff> Close it.
02:46 < mabshoff> How was it fixed?
02:46 < trac-1139> I have problems with 1425.
02:46 < trac-1139> but I can easily resolve it.
02:46 < burcin> it was because of the symlinks issue..
02:46 < trac-1139> wait until we have the spkg from you.
02:46 < trac-1139> ?
02:46 < mabshoff> ok, close it with that comment.
02:46 < trac-1139> ok.
02:47 < mabshoff> We already have the updated spkg.
02:47 < burcin> new package with relative symlinks fixed it..
02:47 < burcin> ok.. will do
02:47 < mabshoff> put that in the comment section, too
02:47 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has quit []
02:48 < trac-1139> what else?
02:48 < burcin> btw, about package naming
02:48 < burcin> the polybori package you put in the tree is named polybori-0.1.p4.spkg
02:48 < burcin> my packages are named polybori-0.1-r5.spkg
02:48 < trac-1139> #1393 looks easy to referee
02:49 < burcin> should I change my naming? is there a convention?
02:49 < trac-1139> yes, we always use .pn.spkg for the nth-patch.
02:49 < trac-1139> "patch"
02:49 < trac-1139> package_name-version-number.pn.spkg
02:49 < burcin> ok.. new packages will be named in that format then
02:53 < trac-1139> Could somebody look at #1454.
02:53 < trac-1139> I think that should go in Sage now, since it is really convenient.
02:53 < craigcitro> trac-1139: if there are little things with 1407, should i change them and post a new patch, or do you want to? (i just noticed something in the docstring that doesn't make sense, for instance.)
02:53 < trac-1139> It changes the sage prompt when you do "sage -sh".
02:53 < trac-1139> It can save you lots of hell.
02:54 < trac-1139> 1407 -- just change them. 
02:54 < craigcitro> k.
02:54 < trac-1139> I'll look over the changes too if you let me know.
02:54 -!- craigcitro is now known as craigcitro-rvw-1
02:54 -!- craigcitro-rvw-1 is now known as cc-rvw-1407
02:55 < trac-1139> iIt would be good to get #1461 in too, since Ondrej Certik has requested that like 10 times, and it is only 5 or so lines of code.
02:55 < mabshoff> the sage -sh ticket should be merged, too.
02:55 < trac-1139> can you put "positive review" for sage -sh?
02:55 < mabshoff> yep
02:56 < trac-1139> 1515 would be very good, since that one is embarassing -- that parametric surface plots don't work.
02:56 < trac-1139> i can referee that one easily.
02:56 < trac-1139> 1519 is I think good to go, in that I just used it a bunch this evening and it worksforme.
02:56 < trac-1139> mabshoff -- you might want to referee it.  You would find it useful.
02:57 < trac-1139> To apply a plain text patch, you just paste a url -- no need to download the patch.
02:57 < mabshoff> ok
02:58 < trac-1139> so this is the list of things I think we should try hard to get in asap: 553 1502 1162 1237 1393 1401 1404 1407 1425 1454 1461 1480 1502 1515 1519
02:58 < trac-1139> most came out of bugs found because of new users, etc.
02:58 < trac-1139> i can referee most
02:58 < trac-1139> right now
02:58 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1519 is refereed
02:59 < trac-1139> good
02:59 < cc-rvw-1407> trac-1139: how do you feel about error checking? for instance, monomials([x,y],[3]) gives a "list index out of range"
02:59 < trac-1139> bug
03:00 < trac-1139> can you fix it?
03:00 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1454 also looks good (sage -sh)
03:00 < trac-1139> monomials is a useful function
03:00 < trac-1139> cool.
03:00 < cc-rvw-1407> nods i'll fix it
03:00 -!- trac-1139 is now known as was-553
03:02 < cc-rvw-1407> i think monomials([],[]) should return [] -- that sound reasonable?
03:02 < was-553> yes
03:02 < cc-rvw-1407> k
03:04 < was-553> I found a subtle bug in #533.
03:04 < was-553> I'm glad for this referee process!
03:04 < mabshoff> 1519 is merged.
03:04 < mabshoff> +
03:04 < mabshoff> ü1
03:04 < mabshoff> +1
03:04 < was-553> sage: f = y - y + 3; f
03:04 < was-553> 3
03:04 < was-553> sage: f.number_of_arguments()
03:04 < was-553> 1
03:04 < was-553> bug :-)
03:04 < mabshoff> Is it fixable?
03:04 < was-553> easily.
03:05 < mabshoff> ok
03:07 -!- pdehaye [n=pdehaye@dehaye1.merton.ox.ac.uk] has joined #sage-devel
03:07 -!- pdehaye [n=pdehaye@dehaye1.merton.ox.ac.uk] has quit [Client Quit]
03:07 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has joined #sage-devel
03:07 < was-553> hi yi
03:07 < mabshoff> Hi yi
03:08 < yi> hey guys
03:08 < cc-rvw-1407> hey yi
03:08 < was-553> we're refereeing patches.
03:10 < mabshoff> Ok, let me know about any patches that are refereed.
03:10 < mabshoff> I am working on http://trac.sagemath.org/sage_trac/ticket/444 now.
03:11 < was-553> ok 553 is ready to go.
03:11 < mabshoff> cool
03:11 < was-553> apply *only* the second and third patch!
03:11 < mabshoff> ok
03:12 -!- was-553 is now known as was-1502
03:13 < was-1502> mabshoff -- how is coverage in your rc1 branch?
03:15 < was-1502> #1502 -- excellent review; ready to merge as is!
03:15 -!- was-1502 is now known as was-1162
03:15 < was-1162> now looking at #1162 -- fix issues in RealField <-> RQDF conversions
03:16 < cc-rvw-1407> was-1162: so orders have changed to just be absolute in your patch, right?
03:16 < mabshoff> haven't check yet, but was 34.9%
03:16 < was-1162> craig -- orders have base ZZ
03:16 < cc-rvw-1407> because the __repr__ still says "over its base field" at the end; this should maybe be changed.
03:16 < was-1162> but relative orders are still relative in how elements are represented.
03:16 < was-1162> ah.
03:16 < cc-rvw-1407> ah, ok
03:16 < was-1162> I didn't change the representation.
03:16 < cc-rvw-1407> well, wait, that might make sense in this example
03:17 < cc-rvw-1407> it's an equationorder
03:17 < was-1162> I mean the elements and structure are all relative still
03:17 < was-1162> Relative order = Order in a relative number field.
03:17 < was-1162> That hasn't changed.
03:17 < cc-rvw-1407> nod
03:18 < cc-rvw-1407> was it a design choice for relative orders to not have parents? (i could see some debate about what the parent should be)
03:18 < mallockilx> def bounce(i):
03:18 < mallockilx>     2(10)(2/3)^i
03:18 < mallockilx> a = [[i,bounce(i)] for i in range(5)]
03:19 < mallockilx> TypeError: 'sage.rings.integer.Integer' object is not callable
03:19 < was-1162> What does 2(10) mean?
03:19 < mallockilx> duh
03:19 < was-1162> Put 2*10?
03:19 < mallockilx> sorry i think i forgot to return something
03:20 < mallockilx> 2*10
03:20 < mallockilx> okie doke that did it
03:20 < was-1162> yeah
03:21 < mallockilx>  x=2*10*(2/3)^i
03:22 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/444 is in.
03:22 < mabshoff> merging 553 now
03:23 < was-1162> nice
03:25 < cc-rvw-1407> so i've never heard the term "equation order" before. Should EquationOrder( [f, g], 'a,b' ) be the following: the order generated over the ring of integers of QQ[g] by a root of f ?
03:26 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/553 is in.
03:26 < mabshoff> w00t:
03:26 < mabshoff> Overall weighted coverage score:  35.0%
03:26 < mabshoff> Total number of functions:  17871
03:26 < was-1162> Nice!
03:27 < was-1162> let's keep it that way.
03:27 < mabshoff> Well, since no patch gets applied without doctests it should never go down again.
03:27 < was-1162> #1162 is ready.
03:27 < was-1162> But it is hard to apply.
03:27 < mabshoff> ok
03:27 < was-1162> Basically apply each patch, ignore all the failed hunks.
03:28 < mabshoff> arrg. 
03:28 < mabshoff> will do.
03:28 < was-1162> then go into real_mpfr.pyx and manually delete 
03:28 < was-1162> 658	 	        elif hasattr(x, '_mpfr_'): 
03:28 < was-1162> 659	 	            return x._mpfr_(self) 
03:28 < was-1162> It's scary--
03:28 < mabshoff> +1
03:28 < was-1162> but *all* that is being done is that the rounding mode is being changed from Z to N in one place.
03:28 < mabshoff> ok
03:28 < was-1162> and some doctests are being changed to reflect this.
03:28 < mabshoff> I thought 1502 was reviewed=
03:28 < mabshoff> ?
03:29 < was-1162> oops -- i mean 1162
03:29 < was-1162> 1162
03:29 < was-1162> not 1502
03:29 < mabshoff> You mentioned that earlier.
03:29 < was-1162> yes
03:29 < mabshoff> So, it has a positive review?
03:29 < was-1162> yes
03:29 < mabshoff> ok
03:31 < was-1162> let me know if you have any trouble on 1162.
03:31 < was-1162> so far i've given positive reviews to 1162, 1502, and 553
03:31 < was-1162> on to 1237
03:31 -!- was-1162 is now known as was-1237
03:31 < mabshoff> ok.
03:31 -!- mallockilx [n=malloc@63.135.231.219] has left #sage-devel []
03:31 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1502 is in
03:32 < was-1237> great
03:32 < mabshoff> on to 1162 - scary
03:32 < was-1237> fortunately what it actually does is easy -- it changes a few Z's to N's, i.e., a rounding mode when coercing.
03:32 < was-1237> Then lots of doctests have to be changed.
03:33 < was-1237> So if you apply and the doctests don't break, you're in good shape.
03:33 < mabshoff> ok, this doesn't sound like fun.
03:34 < was-1237> just close your eyes and do it.
03:34 < was-1237> two hg_sage applies followed by deleting two lines from a file.
03:34 < mabshoff>  Sure
03:38 < cc-rvw-1407> so was-1237 -- i have two questions, and other than that i'm done reviewing this patch
03:38 < was-1237> ok
03:38 < cc-rvw-1407> (1) was it a conscious decision to have relative orders not have a parent?
03:38 < was-1237> orders *are* parents
03:38 < was-1237> they might have a category.
03:38 < was-1237> parents don't have parents.
03:38 < was-1237> ?
03:38 < cc-rvw-1407> ah, ok. 
03:38 < was-1237> or do I misunderstand.
03:38 < cc-rvw-1407> well, that makes perfect sense
03:39 < cc-rvw-1407> i'd just forgotten this distinction was made in sage
03:39 < cc-rvw-1407> because pari(3) has its pari instance as a parent
03:39 < was-1237> mabshoff: #1237 -- with positive review
03:39 < was-1237> ready to merge.
03:39 < mabshoff> ok
03:39 < mabshoff> waiting on 1162, doctesting the rings
03:39 -!- was-1237 is now known as was-1393
03:40 < was-1393> " is_integral_domain may return incorrect answer"
03:40 < cc-rvw-1407> so 2) i've never heard of an "equation order" before. 
03:40 < cc-rvw-1407> hah
03:40 < cc-rvw-1407> So should EquationOrder([f,g], [a,b]) give back the order in the maximal order of QQ[g] defined by a root of f ?
03:41 < was-1393> yes
03:41 < cc-rvw-1407> ok.
03:41 < was-1393> magma uses that terminology a lot.
03:41 < was-1393> it's from magma.
03:42 < cc-rvw-1407> ahh, ok
03:43 < was-1393> #1393 -- positive review.  very very easy to apply.
03:43 < mabshoff> ok
03:43 < was-1393> the following remain: 1401, 1404, 1407, 1425, 1461, 1480, 1502, 1515.
03:44 < was-1393> I wrote 1461 and 1480, so craig or you should look at them.
03:45 -!- was-1393 is now known as was-1401
03:45 < was-1401> OK, On to http://trac.sagemath.org/sage_trac/ticket/1401
03:45 < was-1401> "deprecate A[n]"
03:49 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1237 is in
03:50 < was-1401> excellent.
03:51 < cc-rvw-1407> 1407 is ready to go.
03:51 < mabshoff> cool
03:51 -!- cc-rvw-1407 is now known as cc-rvw-1461
03:56 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1407 is in.
03:56 < mabshoff> merging http://trac.sagemath.org/sage_trac/ticket/1442
03:57 < was-1401> 1401 is a bit heard.
03:57 < mabshoff> ok
03:58 < cc-rvw-1461> man ... 1461 is just weird. is there any rhyme or reason to what it substitutes? ;)
03:58 < was-1401> cc -- 1461 is not for mathematicians.
03:58 < cc-rvw-1461> apparently!
03:59 < was-1401> it is for people that use maple / mathematica / etc.
03:59 < cc-rvw-1461> it's crazy.
03:59 < was-1401> I know.
03:59 < was-1401> But it's totally standard.
03:59 < was-1401> On the other hand, an english major might thing this is insane:
03:59 < was-1401> 'this is an english sentence'.replace('an','the')
03:59 < was-1401> !!
04:00 < was-1401> ets.
04:00 < cc-rvw-1461> hah, true.
04:00 < cc-rvw-1461> not quite related, but close: http://xkcd.com/179/
04:00 < was-1401> :-)
04:01 < mabshoff> was-1401: http://trac.sagemath.org/sage_trac/ticket/1183 is ready to be merged or are we waiting for reviews?
04:02 < cc-rvw-1461> 1461 is good to go
04:02 < was-1401> craig -- have you looked at 1183?
04:02 < was-1401> it is very very important.
04:02 < was-1401> But it is a nontrivial patch.
04:02 < cc-rvw-1461> not yet
04:02 < mabshoff> ok, waiting, doing 1461 first
04:02 < was-1401> David Roe and I wrote it together.
04:02 < cc-rvw-1461> k
04:02 < was-1401> it would be best if cc looks at 1183 next before merging it.
04:02 < cc-rvw-1461> i'll look at it.
04:02 < was-1401> I'm still doing 1401.
04:02 < was-1401> thanks!
04:02 < cc-rvw-1461> it's ... 6 steps to merge?
04:02 < mabshoff> lol
04:03 < mabshoff> But only 5 patches ;)
04:03 < was-1401> :-)
04:03 < was-1401> sorry
04:03 < was-1401> roed and I divided the task up and did it in 4 steps.
04:03 < was-1401> Then it was two more until everything got fixed.
04:03 < was-1401> There are a lot of doctests in residue_field now, by the way. 100% coverage I think.
04:04 < mabshoff> I am just glad we are getting most of the exiting patches merged before rc0
04:04 < mabshoff> Nice
04:04 < was-1401> it's tricky since we had to come up with a new-ish algorithm...
04:04 < cc-rvw-1461> grin awesome.
04:04 < was-1401> not that awesome -- it's sort of obvious -- but it's fun.
04:04 < cc-rvw-1461> oh, i meant about the doctests and getting it working ;)
04:05 < was-1401> yep
04:05 < was-1401> cool.
04:05 < was-1401> it is nice to have
04:06 < cc-rvw-1461> mabshoff: watch out with the patches for 1183; one of them is named 1138
04:06 < mabshoff> ok
04:07 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1461 is merged
04:07 < was-1401> excellent.
04:07 < cc-rvw-1461> was-1401: applying patch 6 failed.
04:08 < was-1401> of which?
04:08 < was-1401> oh, ok.
04:08 < cc-rvw-1461> the last one
04:08 < was-1401> what hunk fails?
04:08 < cc-rvw-1461> "hunk #1 failed"
04:08 < mabshoff> relative to alpha7?
04:08 < was-1401> in which file?
04:09 < was-1401> i.e., what does the .rej file contain?
04:09 < cc-rvw-1461> number_field.py
04:09 < was-1401> that's fine -- ignore.
04:09 < was-1401> That's the same exact diff that carl witty fixed earlier today.
04:09 < was-1401> it's a sage: sage: versus sage: in a docstring.
04:09 < was-1401> it's safe to ignore.
04:09 < cc-rvw-1461> nods ... ok. 
04:10 < cc-rvw-1461> so i've never had it fail -- did it apply everything else okay, or should i edit the patch and re-patch?
04:10 < mabshoff> I can edit that hunk out before applying.
04:11 < was-1401> yes, everything else not listed explicitly in a .rej file is applied.
04:12 < cc-rvw-1461> k.
04:17 < cc-rvw-1461> What's F.p stand for in a residue field?
04:17 < cc-rvw-1461> i would have guessed it was the same as F.characteristic()
04:17 < was-1401> the characteristic.
04:17 < was-1401> or the prime you mod out by?
04:17 < cc-rvw-1461> it gives back the ideal
04:17 < cc-rvw-1461> so it's \frak{p}
04:17 < cc-rvw-1461> i guess
04:17 < cc-rvw-1461> :)
04:17 < was-1401> yep
04:18 < cc-rvw-1461> for some reason, i don't get the docstring for it
04:18 -!- cc-rvw-1461 is now known as cc-rvw-1138
04:18 < was-1401> have you applied my patch for fixing docstrings etc in pyx files in the new version of sage
04:19 < cc-rvw-1138> nope
04:19 < cc-rvw-1138> this is just a 2.9-alpha7
04:19 < was-1401> ok.
04:19 < was-1401> that might be the problem then.
04:20 < was-1401> it in fact is the problem.
04:20 < mabshoff> the number open ticket dropped below 500 just now :)
04:20 < was-1401> http://trac.sagemath.org/sage_trac/ticket/1514
04:20 < was-1401> excellent!
04:20 < cc-rvw-1138> ah, k. mabshoff -- awesome
04:20 < was-1401> I want to kick some doctest ass soon.
04:20 < mabshoff> We should really set up a devel repo where people can pull from.
04:20 < mabshoff> +1
04:21 < mabshoff> What about http://trac.sagemath.org/sage_trac/ticket/1514 ?
04:21 < was-1401> craig needs it.
04:22 < mabshoff> Ah, ok.
04:22 < mabshoff> Because it was already merged 8)
04:24 -!- pdehaye [n=pdehaye@dehaye1.merton.ox.ac.uk] has joined #sage-devel
04:25 < cc-rvw-1138> what rings can we factor ideals over? 
04:26 < was-1401> absolute orders.
04:26 < was-1401> I don't know if malb's warpped anything for comm algebra *yet*.
04:26 < cc-rvw-1138> what about K.ideal(p).factor()
04:26 < cc-rvw-1138> for K a number field?
04:26 < was-1401> yes
04:26 < cc-rvw-1138> ok ... because that command doesn't work as-is
04:27 < was-1401> bug?
04:27 < cc-rvw-1138> I get a NotImplementedError.
04:27 < was-1401> K.factor_integer(p)
04:27 < was-1401> Is K *absolute*
04:27 < cc-rvw-1138> sage: K.<alpha,beta> = NumberField([x^2+3,x^3+9])
04:27 < cc-rvw-1138> sage: K.ideal(3)
04:27 < cc-rvw-1138> Fractional ideal (3)
04:27 < cc-rvw-1138> sage: K.ideal(3).factor()
04:27 < cc-rvw-1138> ---------------------------------------------------------------------------
04:27 < cc-rvw-1138> <type 'exceptions.NotImplementedError'>   Traceback (most recent call last)
04:27 < cc-rvw-1138>     150 
04:27 < cc-rvw-1138>     151     def factor(self):
04:27 < cc-rvw-1138> --> 152         raise NotImplementedError
04:27 < cc-rvw-1138>     153     def integral_basis(self):
04:27 < cc-rvw-1138>     154         raise NotImplementedError
04:27 < cc-rvw-1138> <type 'exceptions.NotImplementedError'>: 
04:27 < cc-rvw-1138> ahh
04:27 < was-1401> RELATIVE!
04:27 < cc-rvw-1138> that's the problem
04:28 < was-1401> that said, it's easy to translate to absolute -- etc...
04:28 < was-1401> so...
04:28 < was-1401> but not for now.
04:28 < cc-rvw-1138> nods
04:39 < mabshoff> Slight doctest failure fallout so far:
04:39 < mabshoff> File "calculus.py", line 3808:
04:39 < mabshoff>     sage: float(f(1))
04:39 < mabshoff> Exception raised:
04:40 < mabshoff>     Traceback (most recent call last):
04:40 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.9/sage-2.9.rc0/local/lib/python2.5/doctest.py", line 1212, in __run
04:40 < mabshoff>         compileflags, 1) in test.globs
04:40 < mabshoff>       File "<doctest __main__.example_96[1]>", line 1, in <module>
04:40 < mabshoff>         float(f(Integer(1)))###line 3808:
04:40 < mabshoff>     sage: float(f(1))
04:40 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.9/sage-2.9.rc0/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 3687, in __call__
04:40 < mabshoff>         raise ValueError, "the number of arguments must be less than or equal to %s"%self.number_of_arguments()
04:40 < mabshoff>     ValueError: the number of arguments must be less than or equal to 0
04:41 < was-1401> which patch?
04:41 < mabshoff> My guess: the number of arguments.
04:42 < was-1401> what is f?
04:42 < was-1401> sorry.
04:42 < was-1401> i'll look at your file
04:42 < mabshoff>     def __float__(self):
04:42 < mabshoff>         """
04:42 < mabshoff>         TESTS:
04:42 < mabshoff>             sage: f=x*sin(0)
04:42 < mabshoff>             sage: float(f(1))
04:43 < mabshoff>             0.0
04:43 < mabshoff>             sage: w = I - I
04:43 < mabshoff>             sage: float(w)
04:43 < mabshoff>             0.0
04:43 < mabshoff> sure
04:43 < was-1401> that's GOOD
04:43 < was-1401> actually.
04:43 < mabshoff> ok
04:43 < mabshoff> I assume it is fallout from http://trac.sagemath.org/sage_trac/ticket/553
04:43 < was-1401> mhansen fixed something...
04:43 < was-1401> yep.
04:43 < mabshoff> :)
04:43 < was-1401> Solution -- put the exception in explicitly.
04:44 < was-1401> But the doctests should be somewhere else than float, e.g., at the top or bottom in a TESTS section.
04:44 < was-1401> or in __cal__ somewhere.
04:44 < mabshoff> ok
04:44 < was-1401> thx
04:44 < mabshoff> So far no other doctest failures, currently at modform
04:45 < mabshoff> on my list I have 11 more tickets to review.
04:46 < was-1401> i'm almost done with 1401
04:46 < was-1401> 1404 will be trivial.
04:46 < mabshoff> ok. I assume you guys are also starting to feel the pain.
04:46 < mabshoff> It is the 20th hour of BD7 :)
04:46 < was-1401> yes!!
04:46 < mabshoff> It might actually be the first Bug *Day* :)
04:47 < was-1401> i can barely stay awke.
04:47 < was-1401> (just the way I like it...)
04:47 < mabshoff> Well, we might as well release rc0 soonish and meet again in a couple hours, i.e. about 10.
04:47 < was-1401> yep
04:48 < was-1401> that's the plan
04:48 < cc-rvw-1138> 1183 is looking pretty good so far ... i've been trying it on pretty sizeable examples, everything seems consistent
04:48 < mabshoff> Should we fix that calculus doctest? Or just fix it later.
04:48 < was-1401> excellent.
04:48 < cc-rvw-1138> (not that i'm checking computations in degree 6 fields by hand :) )
04:48 < was-1401> mabshofff -- go ahead and fix it -- just put in the traceback.
04:48 < mabshoff> Well, we might as well merge 1183 then.
04:48 < was-1401> :-)
04:48 < mabshoff> +1
04:49 < mabshoff> Will do, brewing some more black tea first.
04:52 < was-1401> make me some too
04:52 < cc-rvw-1138> so i've run 1183 through some paces, but i can't say i've thought through every line of code, of course. is it still kosher to give it a positive review?
04:52 < was-1401> yes
04:52 < cc-rvw-1138> k.
04:53 < was-1401> says the one being reviewed...
04:53 < cc-rvw-1138> i mean, it handled some pretty crazy examples with large-ish degree fields
04:53 < cc-rvw-1138> so i'm pretty impressed.
04:53 < was-1401> cool.
04:53 < was-1401> the tricky part is reducing O_K when there is no a such that Z[a] = O_K, or when K = Q(b) with b a lame polynomial.
04:54 < cc-rvw-1138> nod ... that was the essence of the problem mentioned on the trac ticket, right?
04:54 < cc-rvw-1138> it just assumed that was the case, bascially
04:54 < cc-rvw-1138> basically
04:55 < cc-rvw-1138> i have to say, it's pretty snappy
04:56 < was-1401> yes
04:56 < was-1401> I just finished 1401
04:56 < was-1401> I actually implementing mutable / immutable vectors in order to finish refereeing it right.
04:57 < was-1401> But that's actually kind of big itself.
04:57 < mabshoff> Two more issues in piecewise:
04:57 < was-1401> craig, you might want to look at that...
04:57 < mabshoff> File "piecewise.py", line 390:
04:57 < mabshoff>     sage: L = add([line([[pf[0][0],0],[pf[0][0],pf[1](pf[0][0])]],rgbcolor=(0.7,0.6,0.6)) for pf in rsf.list()])
04:57 < was-1401> i hate piecewise.py
04:57 < mabshoff> Exception raised:
04:57 < was-1401> hate it!!!
04:57 < mabshoff>     Traceback (most recent call last):
04:57 < was-1401> sorry
04:57 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.9/sage-2.9.rc0/local/lib/python2.5/doctest.py", line 1212, in __run
04:57 < mabshoff>         compileflags, 1) in test.globs
04:57 < cc-rvw-1138> at 1401?
04:57 < mabshoff>       File "<doctest __main__.example_11[13]>", line 1, in <module>
04:57 < mabshoff>         L = add([line([[pf[Integer(0)][Integer(0)],Integer(0)],[pf[Integer(0)][Integer(0)],pf[Integer(1)](pf[Integer(0)][Integer(0)])]],rgbcolor=(RealNumber('0.7'),RealNumber('0.6'),RealNumber('0.6'))) for pf in rsf.list()])###line 390:
04:57 < mabshoff>     sage: L = add([line([[pf[0][0],0],[pf[0][0],pf[1](pf[0][0])]],rgbcolor=(0.7,0.6,0.6)) for pf in rsf.list()])
04:57 < mabshoff>       File "/tmp/Work-mabshoff/release-cycles-2.9/sage-2.9.rc0/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 3687, in __call__
04:57 < mabshoff>         raise ValueError, "the number of arguments must be less than or equal to %s"%self.number_of_arguments()
04:57 < mabshoff>     ValueError: the number of arguments must be less than or equal to 0
04:57 < mabshoff> The other one eigth above, line 384
04:57 < mabshoff> ;)
04:58 < was-1401> interesting.
04:59 < cc-rvw-1138> sage: [ [ x[0].residue_field().order() for x in F.ideal(p).factor() ] for p in prime_range(2, 100) ]
04:59 < cc-rvw-1138> [[4, 4, 4],
04:59 < cc-rvw-1138>  [3],
04:59 < cc-rvw-1138>  [25],
04:59 < cc-rvw-1138>  [7, 7, 7, 7, 7, 7],
04:59 < cc-rvw-1138>  [121, 121, 121],
04:59 < cc-rvw-1138>  [2197, 2197],
04:59 < cc-rvw-1138>  [289],
04:59 < cc-rvw-1138>  [6859, 6859],
04:59 < cc-rvw-1138>  [529, 529, 529],
04:59 < cc-rvw-1138>  [841, 841, 841],
04:59 < cc-rvw-1138>  [31, 31, 31, 31, 31, 31],
04:59 < cc-rvw-1138>  [37, 37, 37, 37, 37, 37],
04:59 < cc-rvw-1138>  [1681, 1681, 1681],
04:59 < cc-rvw-1138>  [43, 43, 43, 43, 43, 43],
05:00 < cc-rvw-1138>  [2209, 2209, 2209],
05:00 < cc-rvw-1138>  [2809, 2809, 2809],
05:00 < cc-rvw-1138>  [3481, 3481, 3481],
05:00 < cc-rvw-1138>  [61, 61, 61, 61, 61, 61],
05:00 < cc-rvw-1138>  [300763, 300763],
05:00 < cc-rvw-1138>  [5041, 5041, 5041],
05:00 < cc-rvw-1138>  [389017, 389017],
05:00 < cc-rvw-1138>  [493039, 493039],
05:00 < cc-rvw-1138>  [6889, 6889, 6889],
05:00 < cc-rvw-1138>  [7921, 7921, 7921],
05:00 < cc-rvw-1138>  [97, 97, 97, 97, 97, 97]]
05:00 < cc-rvw-1138> given that i picked something galois, that seems awfully reassuring.
05:01 < was-1401> :-)
05:01 < was-1401> mabshoff -- do this:
05:01 < was-1401>    sage: L = add([line([[pf[0][0],0],[pf[0][0],pf[1](x=pf[0][0])]],rgbcolor=(0.7,0.6,0.6)) for pf in rsf.list()])
05:01 < was-1401> for the offending line.
05:02 < was-1401> i.e., put pf[1](x=pf[0][0]) instead of pf[1](pf[0][0]) in line around 391.
05:02 < was-1401> ok?
05:02 -!- was-1401 is now known as was-1404
05:02 < was-1404> on to 1404
05:03 < cc-rvw-1138> so i think i have to sleep instead of reviewing 1401.
05:03 < cc-rvw-1138> i'm pretty exhausted.
05:03 < was-1404> ok.
05:03 < mabshoff> was-1401: will do
05:03 < was-1404> re: 1401 -- I think it can go in, since I reviewed it basically.
05:03 < was-1404> thanks craig!
05:04 < mabshoff> ok
05:04 < cc-rvw-1138> no sweat. i'll talk to you guys again in a few hours, i'm sure. ;)
05:04 < mabshoff> only those two doctests I mentioned above failed.
05:04 < cc-rvw-1138> i'll also make sure to build rc0 on my headache-inducing computers.
05:04 < cc-rvw-1138> back in a while ...
05:04 -!- cc-rvw-1138 is now known as craigcitro
05:04 < was-1404> you mean for piecewise.
05:04 < was-1404> just use the explicit: x=pf[0][0])
05:04 < mabshoff> yep, 2 times in piecewise, once in calculus.
05:05 < was-1404> ok, good.
05:07 < mabshoff> piecewise is fixed.
05:07 < was-1404> #1404 now trivial and ready to go.
05:08 < was-1404> I posted a genuine patch.
05:08 < mabshoff> ok
05:08 < was-1404> and 1401 is also ready to go.
05:08 -!- was-1404 is now known as was-1407
05:08 < mabshoff> What was the final decision on 1183?
05:08 < mabshoff> ok, 1401, 1404
05:09 < was-1407> 1183 is ready to go in.
05:09 < mabshoff> ok
05:09 < was-1407> 1404, 1401, 1183
05:09 < mabshoff> I am fixing the calculus doctest next
05:10 < was-1407> ok
05:10 < mabshoff> just insert the ValueError?
05:10 < was-1407> #1407 is already in and closed?!
05:10 < was-1407> cool.
05:10 -!- was-1407 is now known as was-1425
05:11 < mabshoff> craig reviewed it :)
05:21 < mabshoff> was-1407: I am being dense and can't get the calculus doctest to pass.
05:21 < mabshoff> I tried "... the number of arguments must be less than or equal to 0", but that 
05:21 < mabshoff> doesn't work as I hadhoped.
05:22 < was-1425> You have to do an explicit call with input variable,e.g., f(x=7)
05:22 < was-1425> Just leave it -- I'll fix it in rc1.
05:22 < mabshoff> ok
05:23 < mabshoff> sage: f=x*sin(0)
05:23 < mabshoff> sage: float(f(x=1))
05:23 < mabshoff> 0.0
05:23 < mabshoff> :)
05:23 < was-1425> yep
05:23 < mabshoff> I learned something today :)
05:23 < mabshoff> [about using Sage that is]
05:26 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1404 is in
05:28 < mabshoff> for http://trac.sagemath.org/sage_trac/ticket/1401 : only apply the second patch?
05:29 < was-1425> for 401 -- do *both*
05:29 < was-1425> for 1401 -- do both
05:29 < mabshoff> Jep, just found that out.
05:29 < was-1425> :-)
05:30 < mabshoff> use --dry-run first for testing.
05:31 < mabshoff> Another patch for rc1: http://trac.sagemath.org/sage_trac/ticket/975
05:32 < mabshoff> ok, 1183 now.
05:38 < mabshoff> http://trac.sagemath.org/sage_trac/ticket/1183 is merged.
05:40 < mabshoff> Ok, because of 1183 I am also closing 1242 and 1185 - did I understand that correctly?
05:40 < was-1425> yes
05:40 < mabshoff> Credit for 1183 goes to roed & you?
05:41 < was-1425> yes
05:41 < mabshoff> excellent
05:41 < was-1425> And "Alyson Deines
05:41 < mabshoff> ok
05:41 < was-1425> #1425 is now ready.
05:41 < mabshoff> cool
05:41 < was-1425> you have to apply only the first and *last* patch.  not the middle
05:42 < mabshoff> ok
05:42 -!- was-1425 is now known as was-1515
05:46 < was-1515> http://trac.sagemath.org/sage_trac/ticket/1515  -- done -- positive review.
05:46 < mabshoff> mk
05:46 < mabshoff> Still waiting on the build from 1183
05:46 < was-1515> ok
05:46 < mabshoff> But things are going fairly smooth ;)
05:52 < mabshoff> done, merging 1425, 1515
05:53 < was-1515> i hereby referee 1480
05:53 < was-1515> even though I was the author.
05:53 < mabshoff> :)
05:53 < was-1515> I found some minor problems and fixed them.
05:53 < was-1515> basically my doctest left off # optional.
05:53 < mabshoff> Cool. 1425 is in
05:54 < mabshoff> ok
05:54 < was-1515> ok, everything is refereed now.
05:54 < mabshoff> ok, my list has the following tickets potentially:
05:54 < mabshoff> #975
05:54 < mabshoff> #1137
05:54 < mabshoff> #1139
05:54 < mabshoff> #1155
05:54 < mabshoff> #1258
05:54 < mabshoff> #1363 
05:54 < mabshoff> #1421
05:54 < mabshoff> #1503
05:55 < mabshoff> Not sure about the merit and we can always bump to rc1.
05:55 < was-1515> none of those are on my list.
05:55 < mabshoff> :)
05:55 < mabshoff> They have patches, some of them might need work.
05:55 < was-1515> 1137
05:55 < was-1515> maybe that one would be good to do.
05:56 < mabshoff> Well, as I said there is still rc1.
05:56 < was-1515> it looks trivial.
05:56 < was-1515> can ou put 1425 in.
05:56 < was-1515> i mean 1480
05:56 -!- was-1515 is now known as was-1137
05:56 < was-1137> ?
05:56 < mabshoff> on the list?
05:56 < mabshoff> Or merge?
05:56 < mabshoff> merge!
05:56 < was-1137> merge
05:58 < was-1137> #1137 -- looks good!
05:58 < mabshoff> ok
05:59 < was-1137> so if you merge 1480 and 1137, then make rc we'll be good to go.
05:59 < mabshoff> ok
05:59 < was-1137> I could start it building.
05:59 < was-1137> then sleep!
05:59 < mabshoff> I should be done in minutes
05:59 < was-1137> actually you probably want to do some complete builds, then announce it in time for me to wake up.
05:59 < was-1137> That probably makes more sense
06:00 < was-1137> ?
06:00 < was-1137> usually it makes sense to do a complete test on one machine first...
06:00 < mabshoff> Well, I will do an sdist and then start building vanilla builds + check
06:01 < mabshoff> But we should still tell people that the tarball is available, but might contain some surprises
06:01 < was-1137> ok
06:01 < was-1137> the sooner the better, i guess
06:01 < mabshoff> otherwise next to no one will build in time. rc1 will be out before most people will have done rc0
06:01 < mabshoff> yep
06:02 < was-1137> in the last 6 hours there have been 41 sage downloads from sage.math, sagemath, and modular.fas.  So estimate maybe 70 total.
06:03 < was-1137> So we're at around 250/day at least.
06:03 < mabshoff> :)
06:03 < was-1137> That's way way higher than 2 weeks ago.
06:03 < was-1137> I'm amazed the traffic has sustained for so long.
06:03 < mabshoff> Yep, let's see what happens when 2.9 is relased. I.e. how many people will upgrade.
06:03 < was-1137> ye.
06:03 < was-1137> yep.
06:03 < was-1137> ok, i got to sleep.
06:03 < mabshoff> +AMS should make a huge difference.
06:04 < mabshoff> Well, excellent Bug Day :)
06:04 < was-1137> that's the biggie.
06:04 < mabshoff> Cu in a couple hours.
06:04 < was-1137> indeed.
06:04 < was-1137> many tickets closed!
06:04 < mabshoff> I should be back in about 8 hours.
06:04 < mabshoff> Nothing better to do ;)
06:04 < was-1137> ok
06:04 < mabshoff> I will do the announcement and so on.
06:04 < was-1137> I have to pack for a 1-month trip to Arizona and San Diego tomorrow too...
06:04 < mabshoff> I drank enough black tea to stay up for hours.
06:04 < mabshoff> ack.
06:05 < was-1137> g'night.
06:05 < mabshoff> I don't think that much will pop up.
06:05 < mabshoff> cu
}}}
