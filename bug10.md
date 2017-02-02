= SAGE Bug Day 10 =

The event will take place on '''Saturday, February 16th, 2008''' and officially start at 8 am pacific standard time.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''2.10.2.alpha0''', but be sure to apply the patch here:
     * http://trac.sagemath.org/sage_trac/attachment/ticket/1963/Sage-2.10.2.alpha1-fix-import-issue.patch
     * and make sure to apply the fix from [[http://trac.sagemath.org/sage_trac/ticket/2172|#2172]].
 * [[bug10/status|STATUS]]
 * [[bug10/irc|IRC log]]
 * Write to wstein@gmail.com or michael.abshoff@gmail.com for an account on the bug tracker.
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
 1. William Stein (everything)
 2. Michael Abshoff (memory leaks, ports)
 3. David Joyner (minor Bessel function bug, minor tutorial edits, maybe coding theory improvements)
 4. Burcin Erocal (PolyBoRi interface problems - 0.2 package, infinity, special functions) 
 5. Yi Qiang (Getting dsage doctest integration in)
 6. Clément Pernet (linear algebra related bugs, memleaks)
 7. Timothy Clemans (Mathematica interface, notebook, cryptography)
 8. Craig Citro (cool stuff)
 9. Carl Witty (skim the reference manual, fix things that look wrong or badly-LaTeXed)
 10. Alex Ghitza (start with #756)

Many other people will hopefully participate, but didn't yet add themselves here due to the rather tight schedule.

= Ticket status and reviews needed =
= IRC =
{{{
08:07 < wstein> hi
08:08 < kedlaya> hi
08:08 < mabshoff> hi
08:08 < wstein> bug day 10
08:09 < wstein> what patches are *really* needed to start working with alpha0?
08:09 < wstein> Since clearly the instructions on the bug10 page aren't enough.
08:09 < mabshoff> #2172
08:10 < wstein> i.e., there are the missing files from David Roe, right?
08:10 < mabshoff> Nope, those are the files missing due to sdist not picking up the debian files.
08:10 < mabshoff> But you can also do hg update --all
08:10 < mabshoff> There shouldn't be any changes in the repo by the user at that point.
08:11 < wstein> hg revert --all
08:11 < wstein> not update
08:11 < wstein> and you definitely have to do that or can't apply the scripts patch.
08:11 < mabshoff> Yep, you are correct.
08:11 < wstein> I'll fix the bug10 page.
08:11 < mabshoff> I merged the scripts patch in my repo already.
08:11 < mabshoff> It is only needed if one plans to do an sdist ;)
08:12 < wstein> Your suggestion doesn't work.
08:12 < wstein> Even if you revert all, sage still doesn't start because of David Roe's
08:12 < wstein> missing p-adic stuff.
08:12 < wstein> I khow how to fix that by commenting out two lines, but I would rather
08:12 < mabshoff> ok, then we need the patch from #1963
08:12 < wstein> apply something you've already done.
08:12 < mabshoff> http://trac.sagemath.org/sage_trac/attachment/ticket/1963/Sage-2.10.2.alpha1-fix-import-issue.patch
08:13 < mabshoff> It just uncomments the two offending imports.
08:13 -!- ajhager [n=ajhager@cpe-24-166-24-240.indy.res.rr.com] has joined #sage-devel
08:13 < wstein> Yep
08:13 < wstein> comments, not "uncomments".
08:13 < wstein> that works.
08:14 < mabshoff> Yep. it works for me ;)
08:14 < mabshoff> Every time we apply a huge patch that moves stuff around some imports break :(
08:15 < cwitty> wstein, you should send email to sage-newbie with subject line "This list is closed", for the benefit of people who may visit http://groups.google.com/group/sage-newbie/topics
08:16 -!- ajhager [n=ajhager@cpe-24-166-24-240.indy.res.rr.com] has quit [Client Quit]
08:17 < mabshoff> There were still two email stuck in the moderation que in sage-newbie
08:17 -!- ajhager [n=ajhager@cpe-24-166-24-240.indy.res.rr.com] has joined #sage-devel
08:17 < wstein> I really don't like the tone of some of the support emails we've been getting
08:17 < wstein> during the last week.
08:17 < mabshoff> People whining about not getting answers quickly?
08:17 < wstein> Yes.
08:17 < wstein> I think that's bad, since it will make it so people who can give
08:18 < mabshoff> The price of success.
08:18 < wstein> good answers don't want to subscribe to sage-support.
08:18 < mabshoff> Well, when people whine we can still moderate them again, even though I think
08:19 < mabshoff> it is the wrong way to go.
08:19 < wstein> True.
08:19 < cwitty> Somehow Bill Purvis managed to whine in a much more polite way than Jean-Pierre.
08:20 < wstein> Well if they find bugs it is very valuable, I think.
08:20 < wstein> cwitty -- thanks for being patient with them; your answers were excellent.
08:20 < mabshoff> I think Bill Purvis has some screwed up env, he seems to have loads of trouble with his firefox.
08:21 < cwitty> So what do you think about "Odd behavior of parametric plot"?  Is there something there we can fix?
08:22 -!- AlexGhitza [n=ghitza@bb-66-63-98-101.gwi.net] has joined #sage-devel
08:22 < wstein> cwitty -- i haven't looked at the question in detail yet.
08:22 < mabshoff> Hi Alex
08:23 < AlexGhitza> Hi
08:23 -!- wstein is now known as wstein-174
08:23 < mabshoff> Are we officially started?
08:23 < cwitty> Somebody who has a feel for how the symbolic package should act should look at the problem.  (I don't know if that's you, since I get the impression you don't use symbolics any more than I do...)
08:23 < mabshoff> Aren't we doing the introduction bit then?
08:24 -!- mabshoff changed the topic of #sage-devel to: Bug Day 10 in on - base is Sage 2.10.2.alpha0 + patches - check the wiki page
08:28 < cwitty> wstein, I can't build the reference manual any more: Undefined control sequence \@mathbf in ref.toc.  Any suggestions?
08:29 < cwitty> I don't know what might have changed.
08:29 -!- cwitty is now known as cwitty-2178
08:29 -!- cwitty-2178 [n=cwitty@sense-sea-MegaSub-1-205.oz.net] has quit [Read error: 104 (Connection reset by peer)]
08:29 < wstein-174> you could try deleting all .aux, .toc, etc., files that are autogenerated.
08:29 -!- cwitty [n=cwitty@sense-sea-MegaSub-1-205.oz.net] has joined #sage-devel
08:30 -!- cwitty is now known as cwitty-2178
08:35 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has joined #sage-devel
08:36 -!- roed__ [n=roed@c-76-24-27-20.hsd1.ma.comcast.net] has joined #sage-devel
08:36 -!- roed_ [n=roed@c-76-24-27-20.hsd1.ma.comcast.net] has quit [Read error: 104 (Connection reset by peer)]
08:58 -!- saliola|sd7 [n=saliola@CPE00045ad82be2-CM001225e00aaa.cpe.net.cable.rogers.com] has joined #sage-devel
09:02 -!- saliola [n=saliola@CPE00045ad82be2-CM001225e00aaa.cpe.net.cable.rogers.com] has joined #sage-devel
09:02 -!- saliola|sd7 [n=saliola@CPE00045ad82be2-CM001225e00aaa.cpe.net.cable.rogers.com] has quit [Client Quit]
09:04 < mabshoff> Hi Franco
09:05 -!- william_stein [n=was@c66-235-34-166.sea2.cablespeed.com] has joined #sage-devel
09:06 < mabshoff> Did you go home?
09:06 < mabshoff> Ehh, never mind,
09:06 < wstein-174> to whom are you speaking?
09:07 < mabshoff> To you.
09:07 < wstein-174> I am still home.
09:07 < wstein-174> Back issues...
09:07 < wstein-174> Very unusual for me.
09:07 < mabshoff> :(
09:07 < wstein-174> But there is a particular chair in the living room of my house,
09:07 < wstein-174> where I'm quite comfortable.
09:07 < mabshoff> ok.
09:08 < mabshoff> Back issues certainly suck.
09:08 < kedlaya> i misparsed "back issues" at first. ouchie.
09:09 < mabshoff> I am currently working on the windows technical feasability report - I should have 
09:09 < mabshoff> something worth dicussing in a couple hours. 
09:10 < mabshoff> I got sidetracked last night and this morning.
09:10 < wstein-174> thanks.
09:15 < AlexGhitza> I've been looking at #1399.  It's about is_prime() for integers and ideals.  I think the patch's behavior is correct.  There's a distinction one makes between "prime number" and "prime element of an integral domain".  For the first, I agree with William that prime numbers are always positive.  However, a nonzero element of an integral domain is said to be prime if it generates a prime ideal (or equivalently, if it's not a unit and whenever 
09:18 -!- kedlaya [n=kedlaya@c-76-19-128-167.hsd1.ma.comcast.net] has quit ["Leaving."]
09:26 -!- Mathias [n=proflogi@62.206.19.62] has quit ["leaving"]
09:26 -!- cwitty-2178 is now known as cwitty-refman
09:27 -!- ncalexan [n=user@pv109055.reshsg.uci.edu] has joined #sage-devel
09:28 < ncalexan> Hello Sage bug day peoples!
09:28 < mabshoff> hi Nick
09:28 < cwitty-refman> Hello.
09:28 < AlexGhitza> Hello
09:29 < ncalexan> mabshoff: can I 'patch <' an hg patch?
09:29 < mabshoff> Yep, that should work.
09:29 < ncalexan> Interesting.
09:29 < cwitty-refman> You probably need "patch -p1".
09:30 < mabshoff> Yep
09:30 < ncalexan> cwitty-refman: thanks.
09:35 -!- roed_ [n=roed@c-98-216-48-4.hsd1.ma.comcast.net] has joined #sage-devel
09:39 < cwitty-refman> Is this a good or a bad thing?
09:39 < cwitty-refman> sage: a = mod(3, 5)
09:39 < cwitty-refman> sage: a / 2
09:39 < cwitty-refman> 4
09:39 < cwitty-refman> sage: a >> 1
09:39 < cwitty-refman> 1
09:39 < william_stein> good?
09:40 < william_stein> >> is "bit shift"
09:40 < william_stein> It's not "divide by 2".
09:40 < william_stein> It just happens to be "divide by 2 and floor" over int's
09:40 < cwitty-refman> OK.
09:40 < william_stein> You can clarify that in refman
09:41 -!- wstein-174 is now known as sagemath
09:47 < ncalexan> Hmm... it seems that _magma_init_ requires magma.
09:47 < ncalexan> To generate names.
09:47 < ncalexan> Is that okay?
09:51 -!- roed__ [n=roed@c-76-24-27-20.hsd1.ma.comcast.net] has quit [Read error: 110 (Connection timed out)]
09:53 < mabshoff> cwitty-refman: I am curious if you ever figured out why "\mathbb{}" doesn't work.
09:54 < cwitty-refman> I'm guessing it's different versions of LaTeX or something?
09:55 < mabshoff> ok, but we seem to befine \RR and \QQ, so somehow "mathbb" should work.
09:55 < cwitty-refman> Those are mathbf.  (The Sage documentation uses bold, not blackboard bold.)
09:55 < mabshoff> ok
09:56 < mabshoff> Then were probably missing/not including some packages.
09:56 < mabshoff> Either way, we should use consitent notation, so your patch should be good.
09:56 < mabshoff> I will look some more.
09:56 < mabshoff> consitent->consistent ;)
09:58 < william_stein> ncalexan -- it's fine that _magma_init_ requires magma
10:01 < AlexGhitza> mabshoff: \mathbb is part of the amssymb package, so it's an easy fix: put \usepackage{amssymb} in the preamble of the tex files (with the other \usepackage commands).  I've just tried it out with tut.tex and it works.
10:02 < mabshoff> ok, but shouldn't we leave it out for the purpose of consistencey?
10:02 < mabshoff> That way we will catch all of them due to the doc failing to build.
10:06 -!- tclemans [i=tclemans@sage.math.washington.edu] has joined #sage-devel
10:06 < AlexGhitza> I see your point.  Consistency is good.  Another idea would be to redefine \mathbb to do \mathbf (using \renewcommand); that way if someone types \mathbb{Z} there's no latex compile error, yet all our symbols are consistent.
10:06 < mabshoff> :)
10:06 < ncalexan> william_stein: thanks.
10:07 < william_stein> AlexGhitza -- whenver possible all the latex in the reference manual shouldwork with jsmath.
10:07 < william_stein> That is a very serious constraint!
10:07 < william_stein> In particular, do not use amssymb packages.
10:07 < william_stein> Make sure things work with %jsmath
10:07 < mabshoff> Ok, I didn't take that into consideration.
10:08 < mabshoff> Is that already documented anywhere?
10:08 < AlexGhitza> william_stein: yep, that's good to know, thanks!
10:09 < mabshoff> I just added the log of the relevant bit of this conversation to my ToDo list for documentation
10:09 < tclemans> i'm looking at the conversion of sage matrix to mathematica list bug #1282
10:10 -!- mabshoff is now known as mabshoff|merging
10:10 < william_stein> Since one can view the ref manual through the live notebook viewer, it is a good idea.
10:11 < mabshoff|merging> Yep.
10:11 < william_stein> Also, in the near future foo? in the notebook will typeset the resulting popup...
10:11 < tclemans> i just found someone that might be fixable in notebook n = matrix?TAB works but on commandline n = matrix? doesn't
10:13 < william_stein> command line introspection is defined by ipython.
10:13 < william_stein> ipython doesn't do n = matrix?
10:14 < william_stein> you could write t fernando perez to request that and see what he thinks.
10:16 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has joined #sage-devel
10:20 < tclemans> hmmm i found something strange mathematica((1,2)) works and so does mathematica([3,4]) but not mathematica([(1,2), (3,4)])
10:26 -!- ncalexan is now known as ncalexan-1130
10:26 < ncalexan-1130> robertwb: hello.
10:26 < robertwb> hi there
10:26 < mabshoff|merging> hi Robert
10:27 < ncalexan-1130> william_stein, tclemans: ipython is very conservative wrt to ? and ??
10:27 -!- william_stein is now known as wstein-174
10:28 -!- burcin [n=burcin@heim-033-92.raab-heim.uni-linz.ac.at] has joined #sage-devel
10:28 < mabshoff|merging> Hi burcin
10:28 < burcin> hello
10:28 < mabshoff|merging> I have been looking at your ATLAS tuning info.
10:29 < burcin> is it useful at all?
10:29 < mabshoff|merging> If I add some magic to ATLAS's configure mechanism and we can identify Prescott 
10:29 < mabshoff|merging> it is easy to add the tuning info.
10:29 < mabshoff|merging> But you probably have to rerun with the new spkg because ARCH needs to be set 
10:30 < mabshoff|merging> to the new value. It might be possible to fix it in all the places in the tuning info, 
10:30 < mabshoff|merging> but I am hesitant to attempt this.
10:30 < mabshoff|merging> I am just surprised there is no tuning info at all for Prescott.
10:30 < tclemans> my idea for fixing #1382 is to return mathematica([list(i) for i in list(self)])
10:30 < burcin> running the build again is no problem
10:30 < mabshoff|merging> ok, give me a little while, I am sorting some other things out.
10:31 < mabshoff|merging> Are all model 15 Prescotts?
10:31 < burcin> I got that from the gentoo wiki
10:31 < burcin> let me find the page again
10:31 < mabshoff|merging> ok
10:32 < burcin> mabshoff|merging: http://gentoo-wiki.com/Safe_Cflags#Pentium_D_8xx_.2F_9xx
10:32 < mabshoff|merging> thanks
10:33 < mabshoff|merging> Valgrind just added support for SSE3 instriuctions in 3.4svn, so I will update 
10:33 < mabshoff|merging> the optional valgrind spkg in the next couple days, too.
10:33 < burcin> mabshoff|merging: btw, is it possible to make trac send e-mails when a patch was added to a ticket?
10:33 < mabshoff|merging> I am not sure, but I have been wondering about the same issue.
10:33 < mabshoff|merging> Maybe trac 0.11 can :)
10:34 < burcin> we should definitely check, and maybe request it if it can't
10:34 < cwitty-refman> robertwb: I'm looking at rings/integer_mod.pyx, square_root_mod_prime.
10:34 -!- mabshoff|merging is now known as mabshoff
10:34 < robertwb> yeah?
10:34 < mabshoff> burcin: I agree
10:34 < cwitty-refman> It looks like actually it computes square roots for perfect squares, and otherwise returns garbage?
10:35 < ncalexan-1130> tclemans: your soln doesn't look recursive.  What if it is a triply nested structure?
10:35 < robertwb> I don't remember for sure, but there are much cheaper ways to verify a number if a square mod p
10:36 < cwitty-refman> I'm editing the reference manual, so I'm trying to check whether the docstring is correct.
10:36 < robertwb> ah
10:36 < robertwb> that function isn't meant to be used directly by users anyways
10:36 < robertwb> (and shouldn't be exported to the global namespace for instance)
10:36 < cwitty-refman> Should I rename it to start with an underscore?
10:37 < tclemans> ncalexan: can you give me an example of an nested matrix?
10:37 < cwitty-refman> It isn't exported to the global namespace, but it is in the refman.
10:37 < robertwb> Sure, though I think someone else posted faster code to do square roots mod p, so it might even be unused
10:37 < ncalexan-1130> tclemans: mathematica([(1,2), (3,4)]) is not a matrix.
10:37 < ncalexan-1130> tclemans: It's a list of tuples.
10:37 < ncalexan-1130> tclemans: your proposed soln would not handle mathematica([[[[[[5]]]]]])
10:38 < ncalexan-1130> tclemans: you need to recursively call mathematica on the subelements of your structure until you hit atoms.
10:38 < cwitty-refman> robertwb, it does look like it is used.
10:38 < tclemans> ncalexan:it is matrix([1,2],[3,4]) which mathematica(_) fails at oh ok
10:38 < robertwb> ok
10:39 < ncalexan-1130> tclemans: if you make the general recursive structure work, matrix will be an easier special case :)
10:39 < tclemans> ncalexan:oh ok cool
10:39 < robertwb> ah, http://sagetrac.org/sage_trac/ticket/1138 was never applied
10:40 -!- fredrik [i=fredrik@gamma.kvi.sgsnet.se] has quit []
10:41 < mabshoff> Somebody submit a proper patch for #1138 and get it reviewed ;)
10:41 < robertwb> I will work on 1138 right now
10:42 < mabshoff> Was it your code? It is unclear from the ticket ;)
10:43 < AlexGhitza> robertwb: that would be great!  right now taking square roots in GF(p) for huge p (> 2^512) is just plain broken.
10:43 < mabshoff> Is "Martin" in this context malb? That would point at somebody in England. But 
10:44 < robertwb> Does anyone remember whose code this was, or if not I'll just search the sage-devel archives (that's where it was from)
10:44 < mabshoff> william_stein should know - or at least be able to find out ;)
10:44 < mabshoff> It looks like private conversation with William, I have never seen it.
10:44 < AlexGhitza> I couldn't find any trace of this on sage-devel (I searched this morning)
10:44 < mabshoff> conversation->communication
10:45 < robertwb> http://groups.google.com/group/sage-devel/browse_thread/thread/e7910523502a641/62d692cb57caf7ff?lnk=gst&q=tonelli-shanks#62d692cb57caf7ff
10:46 < robertwb> Looks like someone named Steffen
10:47 < mabshoff> ok
10:48 < mabshoff> It is one of malb's office mates, so he should know his name.
10:48 < wstein-174> the code is from somebody named "Steffen".  No clue who he is?
10:48 < wstein-174> Somebody who is on sage-devel...
10:48 < robertwb> I think he's this guy, from his email http://www.sreidt.com/
10:48 < mabshoff> I think he also participated in the random polynomial thread
10:49 < wstein-174> I bet it is Martin Albrecht's office mate...
10:49 < mabshoff> Yep, I think the link from robertwb is the correct one.
10:49 < mabshoff> We should definitely ask malb to give proper credit. :)
10:49 < craigcitro> g'morning all
10:50 < mabshoff> And add him to ack.html
10:50 < mabshoff> Hi craigcitro
10:50 < ncalexan-1130> craigcitro: welcome to the jungle.  Cue screaming guitars.
10:50 < jaap> Steffen sreidt@gmx.de ?
10:50 < craigcitro> ncalexan-1130: +10 for the guns n roses reference
10:50 < mabshoff> guitar hero? I thought you weren't allowed to own it.
10:50 < mabshoff> Hi jaap
10:50 < jaap> Hi
10:51 < ncalexan-1130> robertwb et al: whoever integrates that patch, please factor out all those GF(p) calls to a variable k.
10:51 < craigcitro> so here's a question about number fields: if i've got a number field F with ring of integers O, and i've got an element x of F which i know is integral, what's the "right" way in sage to get the corresponding element of O? O(x)?
10:51 < robertwb> Yes, of course
10:52 -!- ncalexan-1130 is now known as ncalexan-afk
10:52 < craigcitro> hey jaap  -- thanks for posting that number_field.py doctest failure. it is my fault.
10:52 < jaap> Sorry I missed your message!
10:52 < craigcitro> oh, it's all good
10:52 < craigcitro> i'll make a fix as soon as my alpha0 is done building ;)
10:52 < mabshoff> Make sure to apply the import patch and add the missing files.
10:53 < craigcitro> nod ... it's still building
10:53 < mabshoff> alpha0 was of alpha quality this time :(
10:53 < craigcitro> hehehh
10:53 < craigcitro> robertwb: was the "yes, of course" to me or ncalexan? or both?
10:53 < robertwb> ncalexan, but it applies equally well to you :)
10:54 < craigcitro> grin k, just making sure
10:55 < craigcitro> because it's currently failing for cyclotomic field elements, and i'm going to fix it, but i wasn't sure if it was just me doing the wrong thing :P
10:56 < mabshoff> If you haven't added yourself to the list of people participating on the wiki page you 
10:56 < mabshoff> should do that.
10:57 < mabshoff> Not all at once obviously :)
10:57 < tclemans> i think Vector_integer_dense can be given a _mathematica_ method and then simply return mathematica(list(self))
10:57 < tclemans> map(tuple,n)
10:57 < tclemans> opps
10:59 < tclemans> would the mathematica method for Vector_integer_dense be return str(tuple(self))[1:-1]
10:59 < tclemans> return '{' + str(tuple(self))[1:-1] + '}'
11:00 -!- fprimex [n=fprimex@97.82.214.192] has joined #sage-devel
11:10 -!- saliola [n=saliola@CPE00045ad82be2-CM001225e00aaa.cpe.net.cable.rogers.com] has quit ["Leaving"]
11:13 < cwitty-refman> Obscure refman style question: when describing boolean inputs of functions, I am changing True/False to true/false
11:13 < cwitty-refman> (since we don't care about x==True, we care about x.__nonzero__()).
11:13 < wstein-174> True/False
11:13 < cwitty-refman> Does that sound right?
11:13 < wstein-174> In Python it is upper case.
11:13 < wstein-174> I'm confused about the question.
11:14 < wstein-174> 2 == True
11:14 < wstein-174> x.__nonzero__() is the same as == True
11:14 < cwitty-refman> Oh, interesting.
11:15 < cwitty-refman> Sentences like: "If True, return all square roots" read funny to me.
11:15 -!- jaso1 [n=grout@12-210-255-80.client.mchsi.com] has joined #sage-devel
11:15 < tclemans> hi jason
11:15 < jaso1> hi
11:15 -!- jaso1 is now known as jason-
11:16 -!- burcin is now known as burcin-2146
11:16 < cwitty-refman> So I could imagine: leave it the way it is, change it to "If \code{True}", or change it to "If true".
11:18 < craigcitro> +1 for "if \code{True}"
11:21 < mabshoff> burcin: if you upgrade the polybori.spkg later please reset the hg repo.
11:21 < burcin-2146> mabshoff: ok
11:21 < mabshoff> rpw stuck some huge files in the patches directory which is why it did increase in size so 
11:21 < mabshoff> much.
11:22 < burcin-2146> mabshoff: I haven't looked at the package at all yet
11:22 < burcin-2146> I guess those files will go, since I'm using the cvs vesion, which hopefully includes them
11:23 < mabshoff> I thought 0.2 was out?
11:23 -!- tclemans is now known as timothy-1382
11:23 < burcin-2146> no, it's a release candidate
11:23 < mabshoff> ok
11:24 < craigcitro> i need some opinions. currently, you can't coerce from a cyclotomic field to its ring of integers when the cyclotomic field is degree 2, fundamentally because cyclotomic field inherits from NumberField_absolute, not NumberField_quadratic (there's another error you hit first, but that's got an obvious fix)
11:24 < craigcitro> so i can think of a few things to do:
11:24 < craigcitro> (1) create another class NumberField_cyclotomic_quadratic (ICK)
11:25 < craigcitro> (2) when we create the maximal order, if the _element_class is NumberFieldElement_quadratic, just manually set it back to NumberFIeldElement_absolute
11:25 < craigcitro> which seems a little bit like a hack
11:25 < craigcitro> robertwb & wstein-174: what do you think? (you guys wrote all this stuff ...)
11:27 < wstein-174> I don't know.
11:27 < wstein-174> I would want to think about it more.
11:27 < wstein-174> Why are those the only options?
11:28 < craigcitro> oh, they aren't
11:28 < robertwb> I think the element_class of of NumberField_cyclotomic should be a quadratic element if it's degree 2
11:28 < craigcitro> those were just the first two i came up with ;)
11:28 < robertwb> there's nothing forcing element inheritance to follow number field inheritance
11:29 < craigcitro> true
11:30 < wstein-174> robertwb's idea sounds good
11:30 < craigcitro> yeah, and i think it won't be too hard to implement
11:30 < craigcitro> when you're creating the cyclotomic field, if degree is 2, just set _element_class to NumberFieldElement_quadratic instead of _NumberFieldElement_absolute
11:31 < craigcitro> because currently elements of cyclotomic fields of degree 2 over Q aren't NumberFieldElement_quadratics
11:31 < robertwb> BTW, I'm having trouble convincing myself when the code at http://sagetrac.org/sage_trac/ticket/1138 is faster
11:32 < robertwb> (The big slowdown seems to be with sqrt(a), a not a square, which invokes symbolics)
11:33 < robertwb> Can anyone else verify this? 
11:33 -!- rlm [n=rlmill@fe0-nat-62.3.store.onlinecoffeeco.com] has joined #sage-devel
11:34 < mabshoff> Hi rlm, how is the coffee?
11:34 < rlm> thanks for reminding me, brb
11:35 < timothy-1382> what the heck robert you're at the coffee shop dang it i didn't see anything that people were still meeting there
11:36 < rlm> i just got here, and found out that nobody was here
11:37 < rlm> ps the coffee is piping hot
11:37 < timothy-1382> oh
11:37 < timothy-1382> how long are you going to be there
11:37 < rlm> I'd like to do everything I can to get 2085 and 1304 reviewed before 2.10.2
11:37 < rlm> One of them is an important bug fix.
11:38 < rlm> I already explained what was going on in 2085 to Jason (jason-, jason|afk) at SD7
11:39 < rlm> The idea behind 1034 is also pretty easy- there's nothing deep within the hard code going on...
11:40 < rlm> mabshoff - when is 2.10.2 due?
11:40 < mabshoff> Soon - shooting for Monday.
11:40 < mabshoff> But I sad something similar a couple days ago, but this time I am serious. :)
11:41 < rlm> have you heard from jason lately?
11:41 < mabshoff> He is looking at your two patches.
11:41 < mabshoff> Nick also had some comments.
11:43 < rlm> On IRC?
11:43 < mabshoff> off-list.
11:43 < mabshoff> There was some dicussion about some naming choices ;)
11:43 < rlm> ?
11:43 < mabshoff> Some helper function were prefixed with "happy"
11:43 < rlm> happy_nice_non_labeled_graph or something?
11:44 < mabshoff> Something like that. 
11:44 < mabshoff> We were wondering where the choice came from, i.e. paper or lack of sleep ;)
11:45 < rlm> I meant it as an in joke
11:45 < mabshoff> :)
11:45 < mabshoff> It has been strongly suggested to change that.
11:46 < rlm> I'd certainly do it in exchange for integrating the patches...
11:48 < mabshoff> jason- is around, so you need to negotiate with him ;)
11:49 < cwitty-refman> robertwb: what's the difference (in Cython) between isinstance and PY_TYPE_CHECK?
11:49 < robertwb> isinstance is a function call
11:49 < robertwb> and is slower, but may take a tuple
11:50 < cwitty-refman> So changing isinstance to PY_TYPE_CHECK would be good, if the type argument is a single class?
11:50 < robertwb> yes
11:50 -!- fredrik [i=fredrik@gamma.kvi.sgsnet.se] has joined #sage-devel
11:50 < cwitty-refman> I'm trying to make IntegerMod_int and IntegerMod_int64 more similar.
11:51 < robertwb> it used to be a huge deal when isinstance was a python lookup and function call, but PY_TYPE_CKECK is still better
12:03 < rlm> mabshoff - If I have a patch making the helper functions less happy, what ticket should get it?
12:04 < mabshoff> Not sure, I guess the one with the bigger bundle.
12:04 < rlm> ok
12:05 < AlexGhitza> is this supposed to happen?  (and if so, why?):
12:05 < AlexGhitza> sage: R1.<a>=PolynomialRing(QQ)
12:05 < AlexGhitza> sage: var('z')
12:05 < AlexGhitza> z
12:05 < AlexGhitza> sage: R1(z)
12:05 < AlexGhitza> a
12:07 < cwitty-refman> When you explicitly coerce into a polynomial ring, it's willing to change variable names.
12:10 < AlexGhitza> alright; what's the best way to check whether a certain variable does honestly appear in a certain polynomial ring?  should i check whether it's in R1.gens()?
12:12 < cwitty-refman> What should the semantics of mod(a,n)<<s be?
12:13 -!- cpernet_ [n=pernet@c-24-18-247-186.hsd1.wa.comcast.net] has joined #sage-devel
12:13 < wstein-174> I think "bit shift a then reduce it mod n".
12:14 < cwitty-refman> So this probably has to use GMP, even for int-sized modulus?
12:14 < robertwb> I'm not sure mod(a,n) << s should even be defined for n != 2^s
12:15 < rlm> wstein-174: do you have clement's phone #? I'm thinking about tomorrow...
12:15 < cwitty-refman> Do you mean n!=2^k?
12:15 < robertwb> for the p-adics, it's shifting with respect to the p-adic base
12:15 < wstein-174> I don't have his number.
12:15 < robertwb> cwitty: yes
12:15 < wstein-174> You should email him.
12:15 < AlexGhitza> actually, I think I have a problem with the above explanation for the poly rings.  Consider
12:15 < AlexGhitza> sage: R1.<a>=PolynomialRing(QQ)
12:15 < AlexGhitza> sage: R2.<x>=PolynomialRing(R1)
12:15 < AlexGhitza> sage: R2
12:15 < AlexGhitza> Univariate Polynomial Ring in x over Univariate Polynomial Ring in a over Rational Field
12:15 < AlexGhitza> sage: R2(z)
12:15 < AlexGhitza> a
12:15 < cpernet_> Hi, I just joined the irc channel, No need for phone #
12:15 < AlexGhitza> Shouldn't this say 'x' instead?
12:15 < wstein-174> welcome
12:16 < mabshoff> Hi Clement
12:16 < wstein-174> AlexGhitza -- yes
12:16 < rlm> oh hey
12:16 < cpernet_> Yep, I was a bit late, but now ready to work!
12:16 < yi> rlm: hey you're at the coffee shop on pine street right?
12:16 < rlm> yes
12:16 < mabshoff> cpernet_: Did you see my comments on the two LinBox tickets?
12:16 < yi> ok, i'm leaving for it right now, c'ya in a bit
12:16 < rlm> k
12:16 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has quit []
12:17 < cwitty-refman> AlexGhitza: I'm guessing it tries to coerce into the base ring first, then tries to coerce as a polynomial if that fails.
12:17 < cpernet_> Yes, I have seen them, and will address it as my first task today.
12:17 < cwitty-refman> And I'm not sure that's the wrong thing to do...
12:17 < mabshoff> ok, The latest LinBox spkg is not the one in 2.10.1 any more.
12:17 < cpernet_> mabshoff: maybe we can discuss it on lindox-devel, in order not to polute sage-devel?
12:18 < mabshoff> Well, those issues are Sage related, so it would also be in the log ;)
12:18 < mabshoff> http://sage.math.washington.edu/home/mabshoff/release-cycles-2.10.2/alpha0/linbox-20070915.p4.spkg
12:18 < mabshoff> is the latest linbox spkg.
12:19 < mabshoff> If you do not actually update the sources the new name should be 20070915.p5
12:19 < mabshoff>  - that indicates a fix and not a rebase.
12:19 < cpernet_> Yes, sorry for the confusion.
12:19 < mabshoff> Once we update to 1.1.5 or so it should be linbox-1.1.5-svnXXX
12:19 < mabshoff> np
12:19 < mabshoff> I did take a quick look and it seemed clear.
12:20 < mabshoff> And since the "rules" haven't been written down it isn't your fault :)
12:22 < cpernet_> Ok, so, you sqid tickets 2127 and 2107 don't work together.
12:22 < mabshoff> They currently conflict.
12:22 < mabshoff> You cannot apply both patches, and with 2127 the issue from 2107 still segfaults.
12:23 < mabshoff> And it looks like you are using the same construct at 2127 that causes the 
12:23 < mabshoff> segfault in 2107.
12:26 < mabshoff> Is http://www.sagemath.org/lists.html manually created?
12:27 < cpernet_> Ok, I did something wrong with hg. 2127 also does the fix of 2107, so why not forget 2107? 
12:27 < cpernet_> Ok, I'll make a clear patch, test it and resubmit it.
12:27 < mabshoff> I applied 2127 and with the test case from 2107 it still segfaulted.
12:27 < mabshoff> Can you test that?
12:28 < cwitty-refman> wstein-174, robertwb: Currently, on 32-bit x86, for small modulus, mod(a,n)<<s is (a<<(s%32))%(2^32)%n
12:28 < cwitty-refman> If you can agree on what it should be, instead, I'll fix it.
12:28 < cwitty-refman> Didier and wstein wrote the current bit-shifting code.
12:28 < wstein-174> robertwb, what do you think?
12:29 < robertwb> Can you remember why you wrote it (were you using it for something?)
12:29 < robertwb> I don't have strong opinions, except for consistancy
12:30 < cwitty-refman> The module comment says Didier wrote it, and then there's an hg commit that says something like "finish up Didier's bit-shifting"
12:30 < cwitty-refman> (an hg commit from wstein, I mean)
12:31 < wstein-174> The basic question is whether << and >> are "multiply and divide by powers of 2" or are the "bit shift the underlying representation".
12:32 < timothy-1382> why isn't something like Vector_integer_dense a subclass of tuple?
12:32 < wstein-174> Since for C ints << is bitshift and take mod power of 2, I now think they should be the latter.
12:32 < wstein-174> tuples are immutable; vectors aren't.
12:33 < robertwb> timothy-1382: also better to subclass Element than a native python type
12:33 < timothy-1382> oh ok
12:33 < robertwb> wstein-174: I don't like the latter--I don't think the user should care about the underlying representation
12:34 < wstein-174> But with ints that's exactly what happens.
12:34 < wstein-174> And it is called "bit shift", after all.
12:34 < wstein-174> (I mean C ints, not Python ints)
12:34 < timothy-1382> is there a way to get the string that mathematic( ... ) would send to mathematica without sending it
12:34 < robertwb> Yes, but sage uses the Python language, not C
12:34 < cwitty-refman> wstein-174: does it matter whether << is "multiply by a power of 2" or "bit shift the underlying representation"?
12:35 < wstein-174> yes.  Because the answer is different.
12:35 < wstein-174> It is different when a is a number modulo n.
12:35 < jason-> mabshoff: I'm working on the "can't open firefox because of library conflict" post from sage-support.  The issue is that the function is not using any of the builtin sage framework to open the browser, but is hardcoding things.
12:36 < cwitty-refman> Because << truncates at 32 bits (sometimes) or 64 bits (sometimes) or not at all (sometimes), and multilpication never truncates?
12:36 < wstein-174> It is definitely easier to think about the "power of 2" interpretation.
12:36 < wstein-174> cwitty -- yes.
12:36 < robertwb> I would rather have mod(a << s, n) == mod(a, n) << s
12:36 < rlm> jason- you're here!
12:36 < wstein-174> And modulo n, << would truncate then mod.
12:36 < jason-> rlm: sorry, I was here, but I don't have notifications turned on so you guys were talking behind my back (or rather, behind my email reader)
12:36 < rlm> aha
12:36 < robertwb> so the power of seems better (and, I agree, easier to think about)
12:36 < mabshoff> jason-: ok. I haven't looked too closly.
12:36 < mabshoff> +e
12:36 < wstein-174> robertwb -- if a is a C int then you do not have the above with power of 2.
12:37 < wstein-174> But you do with python ints since they are arbitrary precision.
12:37 < robertwb> no, but Sage is not C
12:37 < rlm> jason- have you looked at those graph_isom tickets much since the conference?
12:37 < jason-> I printed out McKay's paper and I was reading the chapter from the book you gave me.
12:37 < wstein-174> I guess it is most natural to think about ints mod n as arbitrary precision ints mod n, in which case << should be multiplication by a power of 2.
12:37 < wstein-174> But then what is >>?
12:37 < cwitty-refman> wstein-174: so you would be happy introducing another 32 vs. 64-bit architecture difference here?
12:38 < mabshoff> jason-: which function is that? Can you open a track ticket and I will  post to sage-support 
12:38 < wstein-174> For C ints it Is divide by 2 and floor.
12:38 < mabshoff> telling the gux.
12:38 < mabshoff> -x+y
12:38 < wstein-174> cwitty-refman -- no, I'm not happy introducing a difference.
12:38 < rlm> jason- I'd like to get those tickets reviewed today, if at all possible
12:38 < robertwb> I'm happy with divide by 2 and floor
12:38 < jason-> rlm: Again, the question is if you want me to thoroughly review the patch in the context of understanding the code of the algorithm, or if you want me to pass off on the idea and that the code looks reasonable from what you showed me.
12:38 < cwitty-refman> I'm fine with having >> be bit-shift; that is plausible to explain mathematically (even if it's a bit strange), and doesn't depend on the size of the modulus.
12:38 < wstein-174> C with ints mod n, you are happy with divide by 2 and floor in all cases?
12:38 < robertwb> and for 2 dividing the modulus, just pick the smaller representative
12:38 < rlm> the only change to the core loop i made was the one i explained to you at the conference, which you did understand
12:38 < wstein-174> It's a bit weird...
12:39 < rlm> the rest are features, like better printing of things, and the edge-labeled case
12:39 < jason-> rlm: well, understand in a general sense.  I wouldn't put my name on a paper containing it yet :).
12:39 < robertwb> Really, bit shifting is a bit weird to talk about for general Z/nZ
12:39 < wstein-174> So << and >> are both bit shifting, but for << we pretend as those the number shifting has infinitely many bits precision.
12:39 < wstein-174> That souds good.
12:39 < rlm> well, you got why i had missed that "+1" right?
12:40 < robertwb> yes, that sounds good
12:40 < cwitty-refman> And we also pretend that for >>, but for >> our pretense comes for free.
12:40 < jason-> rlm: What you explained made sense, but I'm sure other things would have made sense too.
12:41 < cwitty-refman> So if 0<=a<n, then mod(a,n)<<s == mod(a<<s, n); and similarly for >>
12:41 < jason-> rlm: I guess what I'm saying is that I don't understand the nitty-gritty parts of the algorithm, and I haven't looked at your code too much to understand thoroughly if the change you made was actually the change you said it was.  I believe you and I'm willing to pass off on that, as long as it's understood that I'm not guaranteeing that it's correct, just that what you said made sense and your fix seemed in line with that.
12:42 < rlm> jason- anyway, if you wait until you completely understand the algorithm to review these patches, they could be waiting for a month or more (no offense- this is just based on my own experience with it). What I'd rather do is have you start with the patches, and see why I did each thing there. If you can approve of each individual change, then that's a positive review for the patches, and you're closer to understanding the algorithm a
12:42 < rlm> i propose we open a private room or something, and just hash through all the changes...
12:42 < mabshoff> #1987 is finally merged.
12:42 < jason-> rlm: My point of view is that I need to understand the algorithm and your implementation to see the effects of a tweak or change in a variable (which is a code-level detail).
12:43 < jason-> rlm: that sounds okay.  I have no idea how to do open a different room, though.
12:43 < cwitty-refman> wstein-174: I guess you don't remember why Didier wanted bit-shifting for modn?
12:43 < jason-> And let me fix this bug with firefox not opening.  I should be just about finished.
12:43 < mabshoff> jason-: just join another room. If it doesn't exist it will be created.
12:44 < mabshoff> Or you could use private messages, but those would only involve a max of two people.
12:44 < jason-> mabshoff: thanks.
12:44 < rlm> jason- join #sage-devel-graph-isom
12:45 < jason-> hang on, give me about 5 minutes.  I think I'll have this other bug fixed by then.
12:45 < mabshoff> jason-: Can you open the ticket about the libz symbol failure?
12:45 < rlm> take your time
12:45 < jason-> mabshoff: yeah, once I have a patch :)
12:45 < mabshoff> Cool.
12:45 < jason-> it's almost there.
12:45 < mabshoff> rlm: You might want to save the log of the dicsussion and post it to the ticket.
12:45 < rlm> definitely
12:45 -!- timothy-1382 is now known as timothy-swimming
12:45 < mabshoff> Can't hurt if other people try to understand the code.
12:46 < rlm> That is the whole reason we're doing this, right?
12:46 < mabshoff> :)
12:46 < mabshoff> It isn't the Sage way to have "I have to shoot you if I told you" approach to information-
12:46 < mabshoff> :)
12:54 < rlm> mabshoff - did you find anything from that valgrind session we did at the end of SD7?
12:55 < mabshoff> the dsage thing? No, it created zombies. I also think there are some timeouts 
12:55 < mabshoff> involved which caused that. We might need to raise those and try again.
12:55 < rlm> just curious
12:55 < mabshoff> It seemed very odd.
12:56 < jason-> mabshoff: for some reason, $SAGE_ORIG_LD_LIBRARY_PATH is not the original library path when sage-native-execute is run starting the notebook.  Any ideas why not?
12:56 < jason-> rlm: This might take another five minutes...
12:56 < mabshoff> no clue.
12:56 < rlm> no worries, I'm hot on a lead for #1961
12:58 -!- Helios [i=helios@kilo035.server4you.de] has quit [Read error: 110 (Connection timed out)]
12:58 < jason-> my only thought is that the sage notebook is launching a second sage process, which then overwrites $SAGE_ORIG_LD_LIBRARY_PATH with the current one (which is already inside sage).  Can someone familiar with notebook code comment on that?
13:01 < cwitty-refman> jason-: I believe that's true.  notebook() runs another copy of sage to be the web server, and the web server runs a third copy of sage to do computations.
13:01 < jason-> mabshoff: here's something you can answer: how do I test for the existence of an environmental variable?  If SAGE_ORIG_LD_LIBRARY_PATH exists, I don't want to overwrite it.
13:01 < mabshoff> That would explain it. I am surprised we never hit the problem before.
13:01 < mabshoff> python or bash?
13:01 < jason-> sh :)
13:02 < jason-> it's in the sage-env script.
13:02 < mabshoff> [ $SOME_ENV_VARIABLE = "" ]
13:02 < mabshoff> In some if statement. 
13:03 < jason-> if [$SAGE_ORIG_LD_LIBRARY_PATH != ""]; do $SAGE_ORIG_LD_LIBRARY_PATH=blah; fi
13:03 < jason-> like that?
13:03 < mabshoff> do->then
13:04 < mabshoff> I don't think "!=" will work as a comparison operator
13:04 < rlm> maybe -ne?
13:05 < ncalexan-afk> rlm: I think that is for numbers only.
13:05 < rlm> i see
13:06 < jason-> Hmmm, the strategy won't work.  If ORIG_LD is empty, then things will be overwritten.
13:06 < jason-> is there a difference between a variable being set and a variable being ""?
13:06 < mabshoff> "string1 != string2": True if the strings are not equal.
13:07 -!- Helios [i=helios@85.25.10.78] has joined #sage-devel
13:07 < mabshoff> in Sage-env we should check if $SAGE_ORIG_LD_LIBRARY_PATH is set. If it is 
13:07 < mabshoff> use it instead of overwriting it with LD_LIBRARY_PATH
13:07 < jason-> that's what I was going to do.  Your test above seems to indicate that we can't tell if it has been set, only if it is empty or not.
13:08 < jason-> That won't work because it might have been set to the empty string.
13:08 < mabshoff> Because LD_LIBRARY_PATH was empty in the first place?
13:08 < jason-> right
13:08 < mabshoff> Just introduce another env-variable that indicates that sage-env has already 
13:08 < mabshoff> been executed at least once.
13:08 < jason-> We could set a SAGE_RUNNING variable that tells that there already is a sage session running.
13:08 < mabshoff> Then check for that :)
13:09 < mabshoff> Yep, sounds good.
13:09 < cwitty-refman> Actually, SAGE_ROOT should suffice for that, shouldn't it?
13:09 < jason-> would it?
13:09 < jason-> it sounds reasonable.  mabshoff?
13:09 < mabshoff> Yep, thinking of a downside.
13:10 < mabshoff> Can't really find one ...
13:10 < burcin-2146> to check if a variable is set in bash you can use
13:10 < burcin-2146>  if [ "${SAGE_DEBUG+set}" != set ]; then
13:10 < jason-> *that* is what we want.
13:10 < mabshoff> :)
13:10 < jason-> burcin the bash guru :)
13:10 < mabshoff> I read some long article yesterday bitching about autotools and shell in general and 
13:10 < mabshoff> hot it sucks.
13:11 < jason-> wait, doesn't that just see if it is "" or not?
13:11 < mabshoff> This discussion just illustrates how bad shell is.
13:11 < burcin-2146> I just copied that from the first spkg-install in the polybori package.. as you can see from the variable name :)
13:11 < jason-> How does it differentiate between a variable that is set to the empty string and a variable that is not set?
13:11 < mabshoff> For the record: this is the busiest I have ever seen this channel ;)
13:12 < burcin-2146> if it is not set, it executes the then clause
13:12 < mabshoff> export FOO=""
13:12 < mabshoff> env | grep FOO
13:12 < mabshoff> FOO=
13:12 < mabshoff> I.e. no quotes.
13:14 < jason-> grout@little:~/sage/devel/sage/sage$ if [ "${JASON+set}" != set]; then echo hi;  fi
13:14 < jason-> bash: [: missing `]'
13:15 < mabshoff> you need a space between t and ]
13:16 < jason-> huh, burcin's trick worked:
13:16 < jason-> grout@little:~/sage/devel/sage/sage$ export JASON=""
13:16 < jason-> grout@little:~/sage/devel/sage/sage$ env | grep JASONJASON=
13:16 < jason-> grout@little:~/sage/devel/sage/sage$ if [ "${JASON+set}" != set ]; then echo hi;  fi
13:16 < jason-> uh, it really didn't print out "hi"
13:17 -!- yi [n=yi@fe0-nat-62.3.store.onlinecoffeeco.com] has joined #sage-devel
13:19 < cpernet_> mabshoff: there was a bug in linbox_wrap.cpp:93 replace rows by ncols. But now I get different erros when running the Hecke operator test for 2107 which I am not sure are directly linbox-related
13:20 < mabshoff> ok
13:21 < mabshoff> What does happen in that case?
13:21 < mabshoff> segfault?
13:21 < cpernet_> was the test working before? Here is the error message I get:  basis vectors must be linearly independent. but no segfault. However Valgrind detects a bunch of invalid reads, linked with IML
13:22 < ncalexan-afk> mabshoff: http://trac.sagemath.org/sage_trac/ticket/1130 is ready for application.
13:22 -!- ncalexan-afk is now known as ncalexan
13:22 < mabshoff> ok. in that case we might want to check in IML.
13:22 < cpernet_> Oh, Now I remember that this test is supposed to raise an error, so does it means it is fixed?
13:22 < mabshoff> it is supposed to raise an error, the second and third argument are transposed.
13:23 < mabshoff> ncalexan: looking at #1130
13:23 < mabshoff> cpernet_: What are the errors in IML from valgrind?
13:24 < mabshoff> Should we open a ticket for that?
13:24 < jason-> rlm: my family is awake, so I'm out of time today (probably for the rest of the day).  I won't be able to join you over on the other channel. Bummer, I was hoping to.
13:25 < mabshoff> cu jason-
13:25 < jason-> mabshoff: I'm still getting errors, so no patch just yet.  For some reason, SAGE_ORIG_LD_LIBRARY_PATH is still being overwritten, even with a test in sage-env.
13:25 < rlm> jason- when can we work on these patches?
13:25 < mabshoff> np, at least we know what the issue is now.
13:25 < mabshoff> jason-: I will open a ticket shortly.
13:25 < jason-> I hope I can get to this before 2.10.2, but I can't promise.
13:25 < jason-> thanks.
13:26 < mabshoff> :)
13:26 < jason-> rlm: Grr...how about monday (grr because that may push it past 2.10.2 :(
13:26 < rlm> Boothby understands the algorithm enough to review some patches too, maybe I can get him to do it.
13:26 -!- bobmoretti [n=bob@c-24-17-246-15.hsd1.mn.comcast.net] has joined #sage-devel
13:26 < jason-> great.
13:26 < mabshoff> jason-: I might take a look too, this is something I can figure out.
13:26 < rlm> I could do it Monday morning
13:26 < cpernet_> Probably yes, it is not the first time I meet invalid reads with IML. vlagrind says "Invalid read of size 4... by 0x9F48414: nonsingSolvLlhsMM (nonsysolve.c:410) 
13:27 < mabshoff> cpernet_: is it there even in the case which correct input values?
13:28 < jason-> I'm free after about 10AM my time.
13:28 < rlm> is that central?
13:28 < jason-> yes
13:28 < rlm> ok, so noon my time
13:28 < rlm> I might be able to make it.
13:29 < mabshoff> ncalexan-afk: Should I close #1130 after applying the bundle? Do we need to open a leftover ticket?
13:31 < ncalexan> mabshoff: I'm not sure.  Let's close #1130 no matter what, and let's email malb about that earlier patch.  I think it's been superseded.
13:31 < ncalexan> I think cremona's patch addresses additional trac tickets, let me check.
13:31 < mabshoff> thanks
13:32 < ncalexan> mabshoff: I think malb's patch is incorporated into jcremona's.  Close the ticket, but I'll email malb just in case.
13:33 < cpernet_> mabshoff: no more invalid reads with transposed args, It is just fine. I building a clean new patch.
13:34 < ncalexan> mabshoff: I think this closes http://trac.sagemath.org/sage_trac/ticket/29
13:34 < craigcitro> rlm: actually it's 8am your time
13:35 < ncalexan> The actual request, for len(E) where E is an elliptic curve, is a bad idea.  len(E.points()) is implemented.
13:35 < ncalexan> So I think we should close #29.
13:35 < rlm> that makes it more likely that something will get done, since i'm going to be busy later in the day
13:35 < mabshoff> ncalexan: ok
13:35 < rlm> thanks craig
13:35 < craigcitro> grin
13:35 < mabshoff> cpernet_: cool. you should add a changelog entry in SPKG.txt and commit
13:36 < wstein-174> cpernet_ -- I was just doing some final automated testing of our new hnf, and I found what I think
13:36 < wstein-174> is a bug in PARI's mathnf.  Surpise.
13:36 < mabshoff> :)
13:37 < ncalexan> wstein-174: woot!
13:37 < ncalexan> Maybe we can be both fastest and correct!
13:37 < wstein-174> cool.
13:38 < mabshoff> Ironically I get unknown parent with trac_1130-jcremona-ncalexan-final.hg
13:39 < wstein-174> you of all people
13:39 < mabshoff> :)
13:39 < ncalexan> mabshoff: really?
13:39 < cpernet_> nice job william! Also looking forward to see you fast hadamard bound computation.
13:39 < mabshoff> I will check again.
13:39 < ncalexan> mabshoff: I'll cut a patch.
13:40 < ncalexan> mabshoff: I was bundling against my sage-main.  Shouldn't that be right?  I'll do the patch anyway.
13:40 < mabshoff> It should be, unless you committed a bunch of other stuff.
13:41 -!- fredrik [i=fredrik@gamma.kvi.sgsnet.se] has quit []
13:41 < ncalexan> mabshoff: I did not.
13:41 < mabshoff> mmmh
13:41 < mabshoff> Patch it is in that case.
13:42 < ncalexan> mabshoff: patch is posted.  It's probably not the cleanest, but hopefully it all gets straight in the end.
13:42 < wstein-174> cpernet_ -- fast hadamard is really simple -- i just about coding it efficiently and working with logs so we can use double prec.
13:42 < mabshoff> ncalexan: ok, will try.
13:43 < mabshoff> Can you also give it a official positive review in the subject line?
13:43 < mabshoff> To close #29: We should add a doctest if there isn't already in the other patch.
13:43 < ncalexan> mabshoff: done.
13:44 < mabshoff> I mean for len()
13:44 < ncalexan> mabshoff: I don't really think it's necessary.  There are lots of tests of points() in there.
13:44 < cpernet_> was: sur floating pt log are definitely the way to do go. Are you taking the min of rowwise and columnwise norm?
13:46 < rlm> cpernet_ - do you mind if i get your phone number to make tomorrow morning easier?
13:47 < cpernet_> rlm: sorry, but I stil don't have any phone at home. Can we arrange it on IRC or emails? 
13:48 < rlm> so bobby can't get hold of a car
13:48 < rlm> and william's back pain seems pretty persistent
13:48 < wstein-174> I am getting better.
13:48 < wstein-174> I'm still unsure.
13:49 < rlm> well, the other thing is that emily brought this all up in the first place, and she wants to go monday night
13:49 < wstein-174> I bet Monday night I would be good to go.
13:53 -!- RhysU [n=rhys@cpe-70-112-187-78.austin.res.rr.com] has joined #sage-devel
13:53 < RhysU> Dumb question-- any location demonstrating the mercurial commands to run to get bleeding sources?
13:53 < cpernet_> For the car, I have one, and can put 3/4 persons with gears in it. So you would prefer to cancel tomorow?I am not sure I can make it monday night.
13:54 < rlm> I didn't realize you had a car!!
13:54 < yi> alright!
13:54 < wstein-174> I have a car too :-)   With two seats.
13:54 < yi> i think clement and i are the only ones with equipment, i have a snowboard 
13:55 < rlm> I'd be renting my gear at the mountain
13:55 < wstein-174> same here
13:56 < rlm> So we should definitely go tomorrow
13:56 < rlm> cpernet_ - would you like us all to meet you somewhere?
13:56 -!- ncalexan is now known as ncalexan-2050-17
13:57 -!- ncalexan-2050-17 is now known as ncalexan20501706
13:57 < ncalexan20501706> So, different versions of eigenspaces return different output types.  Can I fix that so they're all the same?
13:59 -!- robertwb [n=robert@c-67-171-19-168.hsd1.wa.comcast.net] has quit []
14:01 -!- cwitty-refman is now known as cwitty|lunch
14:03 < cpernet_> If I am driving, then I just can pick every one up at his place. Let me know your addresses and maybe propose a time.
14:03 < wstein-174> ncalexan -- yes, please -- regarding eigenspaces.
14:03 < wstein-174> !!
14:04 < ncalexan20501706> wstein-174: good, I will.
14:05 < ncalexan20501706> wstein-174: is there a dedicated class for matrices over RR and CC?  It doesn't look like it.
14:06 < wstein-174> no
14:06 < wstein-174> only over RDF and CDF
14:06 < ncalexan20501706> Sure, thanks.
14:08 -!- timothy-swimming is now known as timothy-1382
14:09 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has joined #sage-devel
14:09 < ncalexan20501706> Hi David!
14:09 < dmharvey> holy crap I've never seen it so busy in here
14:09 < dmharvey> hi nick
14:09 < ncalexan20501706> dmharvey: you're not the first to remark :)
14:09 < wstein-174> it's intense today.
14:09 < wstein-174> 31 people
14:09 < dmharvey> i can't actually hang around.....
14:09 < dmharvey> thesis is very closed to completion.....
14:10 < dmharvey> must write.....
14:10 < wstein-174> :-)
14:10 < dmharvey> but I'm wondering.....
14:10 < dmharvey> can I run a 24-hour computation on sage.math using 55GB ram?
14:10 -!- jason- is now known as jason2|afk
14:10 < wstein-174> dmharvey -- normally I would say yes.
14:10 < wstein-174> However, there is a big "applied math modeling contest" going on this weekend at UW with several
14:10 < dmharvey> ah.
14:10 < wstein-174> teams using sage.math, so I am reluctant.
14:10 < wstein-174> Tom Boothby is in that contest.
14:10 -!- RhysU [n=rhys@cpe-70-112-187-78.austin.res.rr.com] has quit ["[BX] Tony the Tiger uses BitchX. Its Grrrrrrrrreat!"]
14:11 < wstein-174> I'm not saying yes or no, but that I'm reluctant.
14:11 < wstein-174> Chances are that people won't be using much memory for that contest.
14:11 < wstein-174> But who knows.
14:11 < dmharvey> how about in a few days?
14:11 < wstein-174> Certainly you can on Tuesday morning.
14:11 < dmharvey> ok cool
14:11 < dmharvey> thanks!
14:11 < wstein-174> thanks for asking.
14:12 < dmharvey> no worries -- it's fantastic to have that much memory just lying around.....
14:12 -!- Helios [i=helios@85.25.10.78] has quit [Remote closed the connection]
14:16 < ncalexan20501706> wstein-174: RDF.has_coerce_map_from(RealField(30)) is False.
14:16 < ncalexan20501706> Is that correct?
14:16 < wstein-174> yes
14:16 < wstein-174> since RealField(30) has smaller precision.
14:17 < ncalexan20501706> Hmmm, that's the case I would expect to work.
14:17 < wstein-174> automatic coercion maps go from more precision to less.
14:18 < wstein-174> You only automatically "decrease" how much you know.  You don't automaticaly increase precision.
14:18 < ncalexan20501706> Oh, I see.  That makes more sense.
14:20 -!- Helios [i=helios@kilo035.server4you.de] has joined #sage-devel
14:24 < timothy-1382> oh i just noticed on planet sage that the base sage version to use is 2.10.2.alpha0 i had seen 2.10.1 on the wiki can i still use 2.10.1 for submitting patches?
14:25 < mabshoff> What area are you working in? 
14:25 < timothy-1382> matrix
14:25 < mabshoff> If it is mathematica related the patches should still apply.
14:25 < mabshoff> Which file? 
14:25 < mabshoff> If we end up with rejects you will need to rebase.
14:26 < timothy-1382> matrix/matrix1.pyx and sage.modules.vector_integer_dense.Vector_integer_dense
14:26 < mabshoff> I don't think too much is happening in that area, but no guarantees ;)
14:26 < timothy-1382> i'm using sage from sage.math over ssh is there a binary for sage.math for 2.10.2.alpha
14:26 < mabshoff> nope
14:27 < mabshoff> Don't worry abou it too much.
14:27 < timothy-1382> ok
14:27 < mabshoff> I can always see if the patch applies cleanly once you post it.
14:32 < timothy-1382> when i change a pyx file i do i type sage -br like when editing py files to use the new code?
14:33 < mabshoff> Yep, it will build the changed files
14:34 < ncalexan20501706> timothy-1382: -br might do more than you need.  -b is usually enough for me.
14:36 < cpernet_> mabshoff: I got confused about how to generate a patch for linbox_wrap.cpp. I am uploading the new linbox-2007-09-15.p4.spkg on sage.math.washington.edu:/home/pernet. Do I still need to produce a patch?
14:36 < mabshoff> It would be good if you could attach on to the ticket in question.
14:37 < mabshoff> It should also be called linbox-20070915.p5.spkg  :)
14:38 < timothy-1382> hmmm sage.modules.vector_integer_dense.Vector_integer_dense doesn't seem to be cython code more like a maze of pure c i was planning to add a _mathematica__init__ method
14:39 < timothy-1382> opps i think i'm wrong
14:42 < timothy-1382> in cython does list(self) work
14:42 < ncalexan20501706> timothy-1382: it should, it's just a function.
14:43 < timothy-1382> and i don't have to import anything for that?
14:44 < timothy-1382> and does indexing work like str(tuple(self))[1:-1] work?
14:44 < wstein-174> yes
14:45 < cpernet_> Ok, I thought p4 was still not existing. Still waiting for the upload to complete (my connection to sage.math is really bad). 
14:45 < ncalexan20501706> How do I check if a complex number is small?  abs returns complex numbers!
14:45 < ncalexan20501706> (Which I think is wrong.)
14:46 < ncalexan20501706> More accurately -- vectors in CDF^3.
14:47 -!- rlm is now known as rlm-1961
14:47 < wstein-174> abs(abs(..)))
14:48 < ncalexan20501706> abs(diff)
14:48 < ncalexan20501706> kk.
14:48 < timothy-1382> i'm almost close to fixed 1382 sage: n = matrix([[1,2],[5,6]])
14:48 < timothy-1382> sage: list(n)
14:48 < timothy-1382> [(1, 2), (5, 6)]
14:48 < timothy-1382> sage: map(mathematica, _)
14:48 < timothy-1382> [{1, 2}, {5, 6}]
14:48 < ncalexan20501706> why map?
14:49 < timothy-1382> that shows that the vector type is now sent to mathematica correctly
14:50 < rlm-1961> Is anyone familiar with the "figsize" argument for plotting? What does it actually specify??
14:51 < timothy-1382> in _mathematica_init_ methods is it ok to call mathematica( ... )?
14:51 < timothy-1382> i really just want the string that would be set to mathematica
14:52 -!- dmharvey [n=dmharvey@dhcp-0000100169-2b-56.client.student.harvard.edu] has quit [Read error: 110 (Connection timed out)]
14:52 < wstein-174> figsize -- specifies the figure size
14:52 < wstein-174> Maybe in "inches".
14:52 < wstein-174> ?
14:53 < rlm-1961> so i have a graphics object with its own coordinates, and figsize just sets how it gets saved?
14:53 < wstein-174> Iyes
14:53 < wstein-174> yes
14:53 < wstein-174> it affects only the resolution of the saved image.
14:54 < rlm-1961> what is the relationship to "dpi"?
14:54 < wstein-174> 1 figsize unit is exactly 100 dots.
14:55 < rlm-1961> confusing - are dpi and figsize two independent parameters?
14:59 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has joined #sage-devel
14:59 < wstein-174> I don't know -- I never use dpi.
15:00 < wstein-174> They clearly aren't independent.
15:00 < wstein-174> ahh.
15:00 < wstein-174> they are independent in a sense.
15:00 < wstein-174> The default dpi is 100 on my display device now, so for me 1 figsize unit = 100 dots.
15:01 < wstein-174> if you do  p.show(dpi=300,figsize=[2,2])
15:01 < wstein-174> you get a 600 x 600 dot image.
15:01 < wstein-174> figsize is "number of inches".
15:01 < wstein-174> dpi is number of dots of linear resolution per inch. 
15:01 < rlm-1961> ok, that makes more sense
15:02 < rlm-1961> thanks
15:02 < timothy-1382> odd hg_sage.export('1382a') -> <type 'exceptions.ValueError'>: invalid literal for int() with base 10: '1382a'
15:04 < mabshoff> remove the "a"?
15:06 < cpernet_> mabshoff: I attached a link to the spkg on ticket 2127. But I still can't manage to have hg_sage.diff generate the patch.
15:06 < timothy-1382> http://trac.sagemath.org/sage_trac/attachment/ticket/1382/ticket_1382.hg?changeset=8311
15:06 < mabshoff> cpernet_: There is no hg repo in that directory, so doing a patch manually is the way to go ;)
15:06 < gfurnish> I wish people would stay in sage-support for more then 5 min when they ask a question
15:07 < mabshoff> Well, they are told to come over to sage-devel if no one answers.
15:07 < mabshoff> The idea was to have the possibility to send people over there if they interfer over here.
15:07 < wstein-174> We need "sage-gold-support"
15:08 < mabshoff> #"We will sell you a support contract"
15:08 < rlm-1961> cpernet_ - what is the earliest tomorrow you would like to start tomorrow?
15:08 < rlm-1961> tomorrow?
15:09 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has quit []
15:15 < timothy-1382> could someone review my patch uploaded for #1382?
15:15 < cpernet_> rlm: with backcountry skiing, I am used to as early as 3am, so I really don't care. Probably around 7 would be reasonable I guess (I don't know how far is it)
15:17 < mabshoff> timothy-1382: For single commits (and even for two or three) you should always 
15:17 < mabshoff> attach patch[es] instead of a bundle.
15:18 < gfurnish> Anyone know what the spec-function grant proposal is that was talked about in the bessel function thread?
15:18 < timothy-1382> is that done using hg_sage.export
15:18 < mabshoff> yep
15:19 < timothy-1382> hg_sage.export('ticket_1382')
15:19 < timothy-1382> <type 'exceptions.ValueError'>: invalid literal for int() with base 10: 'ticket_1382'
15:19 < mabshoff> you need to tell it the commit you want to export.
15:19 < mabshoff> If you leave it empty it should be tip
15:23 < timothy-1382> i uploaded the patch
15:26 < mabshoff> I deleted the old bundle and added "[with patch, needs review]" to the subject.
15:27 < cpernet_> I attached the patch to 2127, but it is looking ugly (just generated by diff). I can't recall how to make it in the proper way.
15:27 < mabshoff> That is fine, it is mostly about understanding what changed.
15:27 < mabshoff> Can you also add a patch with the doctest that used to fail?
15:28 < mabshoff> We added something to one of your trees at SD7, I am not sure if you still have it.
15:30 -!- burcin-2146 [n=burcin@heim-033-92.raab-heim.uni-linz.ac.at] has quit ["Leaving"]
15:30 < mabshoff> timothy: You probably need to fix the old doctest:
15:30 < mabshoff> 101	101	           sage: g = mathematica(A); g                                   # optional 
15:30 < mabshoff> 102	102	           {{1}, {2}, {3}, {4/3}, {5/3}, {3/2}, {7}, {8}, {9}} 
15:30 < mabshoff> You might also want to add a couple more doctests.
15:31 < mabshoff> And: 
15:31 < mabshoff> 	280	    def _mathematica_init_(self): 
15:31 < mabshoff>  	281	        return '{' + str(tuple(self))[1:-1] + '}' 
15:31 < mabshoff> is lacking documentation. It is obvious in this context, but there still needs to be a docstring.
15:32 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has joined #sage-devel
15:33 < timothy-1382> thanks because the doctest fails i apparently i was focusing on mathematica(matrix([[1,2],[3,4]])) which now works
15:33 < mabshoff> :)
15:36 -!- dmharvey [n=dmharvey@c-24-61-45-82.hsd1.ma.comcast.net] has quit [Client Quit]
15:39 < rlm-1961> cpernet_ - sorry for the long delay. I think it takes about 2 hours driving to get to Steven's from Seattle. I'd love to start at 7am. I'm at 1808 E. Thomas St, which is between 18th and 19th on Capitol Hill
15:43 < mabshoff> cpernet_: The patch linboxdet.3.patch  from #2127 seems to be broken.
15:46 < mabshoff> looking at linboxdet.3.patch: you should do a unified diff.
15:47 < mabshoff> It is also against the Sage repo, so if you build 2.10.2.alpha0 you need to fix the repo
15:47 < mabshoff> by looking at #2172.
15:59 < timothy-1382> i uploaded task_1832_2.patch then realized i had forgotten to upload a file so uploaded task_1832_3.patch also with that file commited
16:25 -!- AlexGhitza [n=ghitza@bb-66-63-98-101.gwi.net] has left #sage-devel []
16:30 < mabshoff> wstein-174: around?
16:30 < wstein-174> yes
16:31 < mabshoff> Got a minute in google chat?
16:33 < wstein-174> mabshoff -- yes.
16:33 < wstein-174> clement -- what's the status of the det stuff in linbox mod p?
16:33 < wstein-174> Is it fixed now?
16:33 < wstein-174> I implemented fast det in sage based on linbox having a good det.
16:34 < wstein-174> I'm having fun beating magma's speed, but it would be a lot
16:34 < wstein-174> funner if I were computed dets mod each p instead of charpolys!
16:34 < wstein-174> cpernet_
16:34 < mabshoff> I fixed and merged #2107.
16:35 < mabshoff> But it is unclear which patch from #2127 to apply.
16:35 < wstein-174> I think a 1000x1000 det of a matrix with 1-digit entries will take about 10 seconds with your better det code.
16:35 < mabshoff> I took linbox.1.det and it is causing doctest failures.
16:35 < wstein-174> ut oh.
16:35 < mabshoff>         return self.is_square() and self.determinant().is_unit()
16:35 < mabshoff>     AttributeError: 'long' object has no attribute 'is_unit'
16:35 < mabshoff> in File "matrix_modn_dense.pyx", line 61:
16:36 < wstein-174> that is probably easy to fix.
16:36 < mabshoff> ok
16:36 < wstein-174> I'm about to submit my "big HNF patch".
16:36 < mabshoff> Sounds like fun.
16:36 < wstein-174> then I can work on misc little like that.
16:36 < wstein-174> actually, maybe not.  I think my code has a memleak or exposes one.
16:36 < mabshoff> Cool. Make sure to grab the spkg from #2107. Then apply the wrapper 
16:37 < wstein-174> otherwise it works perfectly and has lots of docs
16:37 < mabshoff> patch from #2127
16:37 < mabshoff> Ok, I can help out in the memleak hunt.
16:37 < wstein-174> I want to make sure it isn't just me caching things on purpose first.
16:45 < cpernet_> Sorry, I am back, I was out grabing some food. Sorry mabshoff, I did not realized a p4 was out, and I stupidly udpated p3 to p5!
16:45 < ncalexan20501706> mabshoff: http://trac.sagemath.org/sage_trac/ticket/2050 needs review.
16:45 < cpernet_> Reading trac 2107 and 2127, it sounds like the problem is fixed now?
16:46 < mabshoff> cpernet: #2107 is closed.
16:46 < mabshoff> #2127 causes doctest failures.
16:56 < timothy-1382> any idea when new changes for #1382 will be reviewed?
16:58 < ncalexan20501706> timothy-1382: which patch is correct?  Only the last?
16:58 < timothy-1382> i think last 3 depend on each other
16:58 < timothy-1382> in hg_sage.patch can i include all last three commits?
16:59 < ncalexan20501706> Yes, try something like -r tip-3 or -r -3 or the like.
17:00 < ncalexan20501706> timothy-1382: this patch is no good, anyway.
17:00 < timothy-1382> oh
17:00 < ncalexan20501706> In free_module element, you don't call _mathematica_init_ recursively.
17:00 < ncalexan20501706> What if I have a free_module_element of some non-trivial data type?
17:00 < timothy-1382> can example
17:00 < ncalexan20501706> Like matrices, or polynomials, or anything else that needs conversion to mathematica itself.
17:02 < timothy-1382> i'm confused
17:02 < timothy-1382> mathematica(matrix([[1/3,2+x],[3,4]])
17:02 < timothy-1382> {{1/3, 2 + x}, {3, 4}}
17:02 -!- wstein-174 is now known as wstein
17:02 < timothy-1382> there i convert a martix to a mathematica list
17:02 < ncalexan20501706> timothy-1382: how about a matrix of matrices?
17:03 < ncalexan20501706> You're getting lucky, because str(x) == _mathematica_init_(x)
17:03 < ncalexan20501706> But in general, that's not true.
17:03 < timothy-1382> huh
17:03 < timothy-1382> str(tuple(...)) always has '(' at [0] and ')' at [-1]
17:04 < ncalexan20501706> timothy-1382: that's not the point.
17:04 < timothy-1382> give you give me an example of a matrix of matrices?
17:04 < ncalexan20501706> I am constructing an example, give me a second.
17:04 < timothy-1382> ok thanks
17:05 < rlm-1961> cpernet_ - still around?
17:06 < timothy-1382> hg_sage.log()
17:06 < timothy-1382> opps
17:08 < cpernet_> rlm: yep. sorry for the delay. Ok I can pick you up at 7am at your place tomorow. Who else am I suppose to pick up? was, how is your back doing? Are you coming with us in my car?
17:10 < rlm-1961> I think there's just William and Yi. I'll have a phone, so we can call both of them when we meet at my house. That way we don't need to spend much more time planning today
17:10 < ncalexan20501706> timothy-1382: check the trac, I think that example will break your code.
17:11 < rlm-1961> cpernet_ - I should be outside waiting tomorrow, but you can also recognize my apartment building easily, since it is the only solid red and white building on the block.
17:11 < wstein> I might not go because of my back.
17:11 < wstein> mabshoff -- see the newest comment at http://trac.sagemath.org/sage_trac/ticket/174
17:11 < wstein> it's a memleak.
17:11 < mabshoff> cpernet_: Did you ever apply #2172 to your 2.10.2.alpha0 repo?
17:12 < mabshoff> wstein: will do
17:12 < timothy-1382> it does thanks
17:12 < ncalexan20501706> timothy-1382: essentially every other _mathematica_init_ is recursive; see them for examples.
17:12 < mabshoff> wstein: So you didn't find the memleak yet I assume?
17:13 < wstein> I haven't.
17:13 < wstein> I'm looking around right now.
17:13 < mabshoff> ok.
17:13 < wstein> My first guess was wrong.
17:13 < ncalexan20501706> alright, I'm off.  TTYL all.
17:13 -!- ncalexan20501706 [n=user@pv109055.reshsg.uci.edu] has left #sage-devel ["ERC Version 5.2 (IRC client for Emacs)"]
17:13 < mabshoff> I am back to the Windows technical porting report, Bug Days are way to distractice
17:13 < mabshoff> -c+v+
17:13 < wstein> :-)
17:13 < wstein> that windows thing is very important.
17:13 < mabshoff> I didn't know the HNF ticket was that old.
17:14 < mabshoff> Yep, and we are on a deadline, too, which makes it priority :)
17:14 < wstein> the memory leak is in _add_row_and_maintain_echelon_form
17:14 < wstein> HNF is a venerable problem.
17:14 -!- wstein is now known as wstein-173
17:14 < mabshoff> :)
17:14 -!- wstein-173 is now known as wstein-174
17:15 < mabshoff> Every piece of code and every new doctest exposes potential memleaks.
17:18 < timothy-1382> nick said that there are many _mathematica_init_ examples but search_src('_mathematica_init_')
17:18 < timothy-1382> only turns up ten
17:18 < wstein-174> !
17:21 < cpernet_> I fixed the bug with det, and am about to send the patch, but can't remember which argument to give to hg_sage.export()
17:21 < wstein-174> hg_sage.export('tip')
17:21 < wstein-174> or hg_sage.export(number of patch)
17:23 < wstein-174> mabshoff -- want to valgrind something?
17:24 < mabshoff> Sure, 174 by any chance?
17:24 < wstein-174> yes
17:24 < wstein-174> let me post the code to run
17:24 < mabshoff> I got a alpha0 I can play with ;)
17:24 < cpernet_> thanks, patch attache to #2127
17:24 < mabshoff> Give me 5 minutes to get things properly set up.
17:24 < mabshoff> cpernet: can you run doctests?
17:25 < wstein-174> I've posted code at #174 at the bottom that leaks 18MB in a second
17:25 < mabshoff> :)
17:25 < mabshoff> That sounds like a job for memcheck ;)
17:26 < cpernet_> sage -t devel/sage/sage/matrix/matrix_mdn_dense.pyx worked fine. Do you want me to do sage -t
17:27 < mabshoff> Yep, but you will see some failures, especially on 64 bit.
17:32 < mabshoff> ok, compiling python with magic settings, once that is done I will run the code.
17:32 < wstein-174> thanks.
17:33 < wstein-174> I hope I find the leak before then.  We'll see .
17:33 < mabshoff> So it is a race ;)
17:33 < wstein-174> so far I'm sucking at finding the leak though.
17:33 < mabshoff> Well, if past performance is any indicator I am not too worried that you will 
17:33 < mabshoff> find it before me.
17:33 < wstein-174> oooh
17:34 < mabshoff> Found it? Taunting people works ;9
17:34 < mabshoff> @me: you cannot port Sage to Windows ... nananana
17:36 -!- cwitty|lunch is now known as cwitty-refman
17:42 -!- timothy-1382 is now known as timothy-tired
17:59 < wstein-174> mabshoff -- the leak is in my new function insert_row in matrix_integer_dense.pyx.
17:59 < mabshoff> Ok, I am running something under valgrind at the moment,
17:59 < mabshoff> but I haven't check yet.
17:59 < wstein-174> but I don't know exactly where yet.
17:59 < wstein-174> I just isolated the problem to there.
18:00 < mabshoff> Ehh, maybe I should patch the hnf into the binary? ....
18:00 < mabshoff> Make that sources, writing the Windows document makes my brain hurt!
18:00 < wstein-174> ?
18:01 < mabshoff> I meant to say that I need to apply the HNF bundle to my tree before attempting 
18:01 < mabshoff> to valgrind those functions.
18:01 < cpernet_> Ok, I fixed the doctest failure with det over non prime rings.
18:01 < wstein-174> cool
18:02 < wstein-174> mabshoff -- that would help
18:02 < cpernet_> Oups, I jst realized that I have attached my last 2 patches to 2172 instead of 2127, Sorry about that. I can't move them, can some one do it?
18:03 < cpernet_> or simply delete them from 2172, and I attach them to 2127
18:07 -!- ajhager [n=ajhager@cpe-24-166-24-240.indy.res.rr.com] has quit [Read error: 110 (Connection timed out)]
18:08 < wstein-174> i found the leaks, I think.
18:08 < mabshoff> Cool
18:09 < wstein-174> it was in some of burcin's code and also code style I copied from him.
18:09 < mabshoff> ok
18:11 < rlm-1961> eureka!!! i found another bug!
18:11 < mabshoff> Which oneß?
18:12 < rlm-1961> #1961
18:12 < mabshoff> :)
18:14 < rlm-1961> the patch dependency chain is complicated, but...
18:15 < mabshoff> I saw it one some of the other tickets.
18:15 < mabshoff> But once somebody reviews the big one it should all fall into place.
18:15 < mabshoff> And we might still merge if Jason is convinces it is good and let him 
18:15 < rlm-1961> now i will enjoy skiing even more tomorrow
18:16 < rlm-1961> i might get tom boothby to look at it too
18:16 < mabshoff> do an in depth review later in the week.
18:16 < rlm-1961> i think he understands enough to review these patches
18:16 < mabshoff> Yep, it looks more like he wants to do a general review of the algorithm first.
18:17 < rlm-1961> which is also awesome
18:17 < mabshoff> It can't hurt.
18:18 < mabshoff> Oops, I just saw that I applied #147's bundle to my current alpha1 merge tree.
18:18 < mabshoff> Oh well, it seems like I would have done that anyway ;)
18:18 < mabshoff> I mean in a couple hours.
18:19 < rlm-1961> you mean #174?
18:20 < mabshoff> Yeah
18:28 -!- AlexGhitza [n=ghitza@bb-66-63-98-101.gwi.net] has joined #sage-devel
18:30 < AlexGhitza> mabshoff: I tried to rebase David Harvey's patch for #521 against 2.10.2.alpha0, and I think it worked.  It's on trac as 521_alt.patch.  Can you give it a try?
18:30 < mabshoff> Remind me in a little while.
18:31 < rlm-1961> cpernet_ - so are you set for tomorrow? are my directions good enough?
18:31 < mabshoff> David said he gave it a shot, too. But he seems busy the next couple days ;)
18:31 < AlexGhitza> yeah, it's what I figured.  All *I* have to do is prepare my courses :)
18:32 < mabshoff> :)
18:32 < mabshoff> I just have to show up in IRC and play with patches - much more fun, at least for ,w
18:32 < mabshoff> me
18:33 < cpernet_> rlm: yep, no pb for the address. So let's meet there tomorow at 7am, and we'll figure who when pick up next.
18:42 < cpernet_> I fixed trac915 (easy). Maybe I'll wait to have done #824 (update to 1.1.4) before creating a new spkg
18:46 < rlm-1961> cpernet_ - perfect, I'll see you then!
18:46 -!- rlm-1961 [n=rlmill@fe0-nat-62.3.store.onlinecoffeeco.com] has quit ["VICTORY!"]
18:47 -!- yi [n=yi@fe0-nat-62.3.store.onlinecoffeeco.com] has quit []
18:51 < mabshoff> cpernet_:  #915 will open up the possibility to finally upgrade to the current Linbox svn
18:51 < mabshoff> But that will not happen tonight ;)
18:55 < mabshoff> wstein: the leaks in hnf are huge ones, about 5 per computations
18:58 < jason2|afk> mabshoff: I just had a few more minutes and finished the patch to fix the firefox launching bug.
18:59 < mabshoff> Hi jason - cool
18:59 < mabshoff> back to work? :)
18:59 -!- jason2|afk is now known as jason-
18:59 < jason-> My wife let me have a few minutes to finish this.
18:59 < mabshoff> thank her from us then.
19:00 < jason-> what's the ticket number?
19:00 < jason-> (did you open a ticket for it?)
19:00 < mabshoff> yep, looking
19:01 < mabshoff> #2182
19:01 < jason-> thanks.  I'll post a patch (two: one for sage-scripts and one for sage) momentarily.
19:02 < jason-> I don't think burcin's method can tell between a nonset variable and an empty-string variable, by the way.  I don't think there is a way to tell the difference (other than env | grep )
19:02 < mabshoff> :)
19:06 < jason-> To get the value of a variable in bash, do you do ${variable} or {$variable}?
19:06 < mabshoff> The first one.
19:06 < jason-> thanks.
19:06 < mabshoff> The curly brackes are optional, but they ususally do not hurt.
19:07 < mabshoff> wstein-174: the leak is not in the gmp code - at least not the big ones.
19:07 < wstein-174> thanks for checking.
19:07 < wstein-174> I fixed the major leak
19:07 < wstein-174> Now I'm working on one remaining leak.
19:08 < wstein-174> want a new patch.
19:08 < mabshoff> I just send a 12kb text version of the Windows thingy.
19:08 < mabshoff> it isn't very polished, but covers all the portability issues I could think of.
19:08 < wstein-174> cool.
19:08 < mabshoff> Sure, I am willing to take an incremental patch.
19:09 -!- AlexGhitza [n=ghitza@bb-66-63-98-101.gwi.net] has left #sage-devel []
19:09 < wstein-174> get /home/was/patches/8559.patch
19:10 < mabshoff> ok, got it and merged
19:10 < wstein-174> I'm not sure if there are leaks after that patch.
19:10 < wstein-174> It's not 100% clear.
19:10 < jason-> mabshoff: okay, the patches are up on 2182.  My guess is that you're qualified to review the sage-scripts one, at least.
19:10 < mabshoff> I am rerunning the test
19:10 < mabshoff> :)
19:11 < jason-> wstein is definitely qualified to review the sage notebook patch up on #2182 :)
19:11 < mabshoff> Looks like we need to do a little review spring tomorrow.
19:11 < mabshoff> To merge all the outstanding patches ...
19:16 < wstein-174> cool, I found another memory leak!
19:16 < wstein-174> burcin's _hnf_mod function leaks like a sib
19:16 < mabshoff> Where?
19:16 < wstein-174> sage: get_memory_usage()
19:16 < wstein-174> '248M+'
19:16 < wstein-174> sage: w = a._hnf_mod(10007)
19:16 < wstein-174> sage: get_memory_usage()
19:16 < wstein-174> '253M+'
19:16 < wstein-174> sage: w = a._hnf_mod(10007)
19:16 < wstein-174> sage: get_memory_usage()
19:16 < wstein-174> '255M+'
19:16 < mabshoff> Damn burcin, he should know better ;)
19:17 < wstein-174> it might be my fault -- i incorporated his code in...
19:19 < wstein-174> It's some pretty blatant leakage, actually.
19:19 < wstein-174> mallocs without frees in here, I think:    cdef long long* _hnf_modn_impl(Matrix_integer_dense self, mod_int det,
19:19 < wstein-174> maybe T_ent and T_row
19:19 < mabshoff> D'oh
19:20 < wstein-174> I added freeing T_ent and T_rows, and now that function doesn't seem to leak at all.
19:20 < wstein-174> That might be everything :-)
19:21 < wstein-174> thanks for the windows doc.
19:21 < wstein-174> It's good having Dan Shumow in on this.
19:21 < mabshoff> Did you read it?
19:21 < wstein-174> not yet.
19:21 < wstein-174> just downloading it
19:22 < mabshoff> Even skimming might be enough for some first impression
19:22 < mabshoff> Yep, Dan seems to be the right guy for the job.
19:22 < wstein-174> I'm reading it carefully.
19:22 < mabshoff> I put it under hg on my end.
19:23 < mabshoff> And I plan to stick it in the wiki eventually, on that windows page we already have
19:24 < mabshoff> Got the last patch for the leak?
19:26 < wstein-174> yep, /home/was/patches/8560.patch
19:26 < mabshoff> ok, thanks
19:26 < wstein-174> this might actually not leak.
19:27 < mabshoff> It is fully merged then ...
19:27 < wstein-174> can you check for leaks?
19:27 < wstein-174> this makes me hopefully:
19:27 < wstein-174> sage: get_memory_usage()
19:27 < wstein-174> '224M+'
19:27 < wstein-174> sage: z = hnf(a)
19:27 < wstein-174> sage: get_memory_usage()
19:27 < wstein-174> '224M+'
19:27 < wstein-174> sage: z = hnf(a)
19:27 < wstein-174> sage: get_memory_usage()
19:27 < wstein-174> '224M+'
19:28 < mabshoff> I am waiting for the current run to finish before merging the last patch to check again.
19:28 < wstein-174> (hnf is explicitly imported so the above shouldn't work for you...)
19:28 < mabshoff> but cputime is way down after the last patch, which indicates that most of the leaks are gone.
19:30 < wstein-174> I think it is solid now.
19:30 < wstein-174> If there are any leaks they are very very small.
19:30 < mabshoff> Will check
19:31 < mabshoff> Does that bundle do the non-square case already?
19:31 < wstein-174> yes, it does it all
19:32 < mabshoff> Cool.
19:32 < wstein-174> And it is made automatic.
19:32 < wstein-174> Plus it also greatly greatly speeds up a.det()
19:32 < mabshoff> World Domination here we come 
19:32 < wstein-174> though with clement's patch det can be made much better when proof=True.
19:32 < wstein-174> With proof=False we're in great shape now.
19:32 < mabshoff> ok
19:32 < wstein-174> I can't imagine proof=False ever actually being wrong, too.
19:34 < wstein-174> mabshoff -- it is possible to build python extensions with mingw that work with a msvc built python.
19:34 < wstein-174> But it's kind of stupid to do so.
19:34 < mabshoff> Yes, but C only.
19:34 < wstein-174> ahh
19:35 < mabshoff> I would do it as a last ressort only,
19:35 < cpernet_> Waow, good job. When you say you improved a.det, is it doing something else than my patches?
19:35 < mabshoff> and getting Cygwin to work again in the next months or so is certainly a priority for me.
19:36 < cpernet_> I started to write a linbox routine for computing the remaining part of the det, using crt and only one modular LU decompostion (instead of 2). A reason for it to be in linbox is that you can use larger primes
19:37 < wstein-174> cpernet_ -- by changing the code slightly in matrix_integer_dense, it directly uses linbox for each modn det
19:37 < wstein-174> thus avoiding completely matrix_modn_dense.
19:37 < wstein-174> Then there is no sage-imposed constraint on the prime
19:37 < wstein-174> Plus, i get to use iml's solver for the first part of the algorithm, which is very fast.
19:38 < wstein-174> But each individual det (via charpoly) is way slower than I bet you can do with linbox.
19:38 < wstein-174> Have you got my code?
19:38 < wstein-174> It's ready now.
19:38 < wstein-174> It's done.
19:39 < wstein-174> I'll doctest thematrix directory one more time, then post an hg bundle that should apply cleanly.
19:39 < wstein-174> Maybe you can referee the patch.
19:39 < wstein-174> ?
19:42 < wstein-174> ok, the file at http://sage.math.washington.edu/home/was/patches/hnf.hg has all the HNF stuff all working with no known issues.
19:42 < wstein-174> finally!
19:44 < mabshoff> :)
19:44 < mabshoff> And it has already been merged, due to me picking the wrong build tree *oops*
19:44 < wstein-174> what's the latest on the linbox det mod n stuff?
19:44 < wstein-174> cool.
19:45 < wstein-174> I want to see how much of a speed up I get.
19:45 < mabshoff> Clement posted a new patch, you should review it.
19:45 < wstein-174> And refeee cpernet_'s patches
19:45 < mabshoff> I figure we will merge a while bunch of patches tonight, but alpha1, 
19:46 < mabshoff> hopefully fix all open issues with doctests in the next 24-48 hours and then release.
19:46 < mabshoff> but->cut
19:47 < mabshoff> ==26612== LEAK SUMMARY:
19:47 < mabshoff> ==26612==    definitely lost: 248 bytes in 2 blocks.
19:47 < mabshoff> ==26612==    indirectly lost: 3,468 bytes in 5 blocks.
19:47 < mabshoff> And those leaks are readline related, so clean bill of health.
19:48 < wstein-174> awesome!
19:48 < wstein-174> That was needed since Magma's HNF doesn't leak either.
19:48 < wstein-174> So we're on equal footing.
19:49 < mabshoff> Not leaking shouldn't really be a bonus, but sadly it is.
19:50 < wstein-174> my god #2127 is a mess.
19:50 < wstein-174> Can you tell me quickly what to really do?
19:51 < mabshoff> You need linboxdet.1.patch and the two 83* patches.
19:51 < wstein-174> cpernet_?
19:51 < mabshoff> You also need the linbox.spkg from #2107, no Clement's 
19:52 < wstein-174> ok
19:52 < wstein-174> .p5
19:52 < mabshoff> http://sage.math.washington.edu/home/mabshoff/release-cycles-2.10.2/alpha1/linbox-20070915.p5.spkg
19:52 < wstein-174> got it.
19:52 < mabshoff> to be precise.
19:52 < wstein-174> the windows doc you wrote is pretty interesting so far.
19:53 < mabshoff> thanks, it is still pretty much first draft mode.
19:53 < mabshoff> but I can tell you that I have thought about it a lot.
19:53 -!- wstein-174 is now known as wstein-2127
19:53 -!- jason- [n=grout@12-210-255-80.client.mchsi.com] has left #sage-devel []
19:54 < mabshoff> I should look at #2182
19:54 -!- mabshoff is now known as mabshoff-2182
19:55 < cpernet_> Ok william, did you first applied the fixes to 2107?
19:55 < wstein-2127> I am on it.
19:55 < wstein-2127> I'm glad you're around.
19:55 < wstein-2127> I'm building the new linbox, applying your 3 patches, etc.
19:56 < wstein-2127> 8338.patch fails to apply after applying linboxdet.1.patch...
19:56 < cpernet_> Let me know any issue you have. I was  messed up the patches a lot, sorry
19:56 < wstein-2127> I'll figure it out.
19:56 < mabshoff-2182> #2107 is "just" your linbox spkg back ported in the Debianized version.
19:57 < mabshoff-2182> I also added a doctest for the hecke_operator_on_basis failure
19:58 < wstein-2127> ok, all patches applied.
19:59 < wstein-2127> linbox built fine
19:59 < mabshoff-2182> patches applied to linbox.spkg?
20:01 < wstein-2127> I guess.
20:01 < wstein-2127> I'm applying patches to hg_sage
20:01 < mabshoff-2182>  Sure, that makes sense. You shouldn't need to apply patches to the linbox.spkg itself.
20:02 < wstein-2127> hey, where does the dd below come from:
20:02 < wstein-2127> sage: a.determinant()
20:02 < wstein-2127> dd = 39
20:02 < wstein-2127> 39
20:02 < mabshoff-2182> it might be in the wrapper.
20:02 < wstein-2127> argh
20:02 < mabshoff-2182> I am not sure.
20:02 < mabshoff-2182> cpernet_ should know
20:02 < wstein-2127> cpernet_ -- ?
20:03 < cpernet_> Yes, I fixed it in a patch attached to 2127
20:03 < wstein-2127> which patch?
20:03 < mabshoff-2182> which one? Against which repo?
20:03 < wstein-2127> wrap
20:03 < mabshoff-2182> Ok, I guess we need p6 then.
20:04 < wstein-2127> it' might be linbox.3.patch
20:04 < wstein-2127> yep -- give me a p6 and I'll build it.
20:04 < mabshoff-2182> cpernet_ should take p5 and give us p6 :9
20:04 < wstein-2127> cpernet_ can you?
20:04 < cpernet_> no wait it is not in 2127, but in 2172 (that I accidentally attached to)
20:05 < wstein-2127> oh yep
20:05 < wstein-2127> that's so easy I can make p6
20:05 < cpernet_> Ok I let you do it then
20:05 < mabshoff-2182> hehe, I would suggest moving the relevant patches from #2172 and delete them there.
20:06 < mabshoff-2182> Make sure to add to SPKG.txt and commit
20:06 < cpernet_> Yes I asked for someone to it so, 30 mins ago, but you probably skipped thi. I guess I cannot do that, since I am not admin
20:07 < mabshoff-2182> np, things got a little hectic the last hour due all that Windows stuff.
20:08 < wstein-2127> what's with all this crap in linbox???
20:08 < wstein-2127> linbox-20070916/linbox/tests/._test-field.h
20:08 < wstein-2127> There's tons of ._ files everywhere.
20:08 -!- bobmoretti [n=bob@c-24-17-246-15.hsd1.mn.comcast.net] has quit [Remote closed the connection]
20:08 < cpernet_> ???
20:08 < mabshoff-2182> Really? 
20:08 -!- bobmoretti [n=bob@c-24-17-246-15.hsd1.wa.comcast.net] has joined #sage-devel
20:08 < wstein-2127> I hope I didn't do it.
20:08 < mabshoff-2182> remove that crap then.
20:09 < mabshoff-2182> It has never come up before.
20:09 < wstein-2127> I did.
20:09 < wstein-2127> Stupid frickin' os x
20:09 < wstein-2127> I made a linbox-200802016 and when extracting it has tons of those stupid ._ files.
20:10 < wstein-2127> They are not in 20080215.p5.
20:10 < wstein-2127> argh.
20:10 < wstein-2127> maybe I'm just confused.
20:11 < cpernet_> I can make th p6 i you prefer
20:11 < wstein-2127> it should be 200802016
20:11 < wstein-2127> not p6
20:11 < mabshoff-2182> Why?
20:11 < mabshoff-2182> The code base of LinBox hasn't changed.
20:11 < wstein-2127> since today is 20080216?
20:12 < wstein-2127> good point, though linboxwrap has changed.
20:12 < wstein-2127> that's "upstream".
20:12 < mabshoff-2182> Once we update LinBox itself we should switch to linbox-1.1.5svn-RXXX
20:12 < wstein-2127> It was changed by the lead linbox developer :-)
20:12 < mabshoff-2182> That would make it much clearer.
20:12 < mabshoff-2182> Well, the wrapper is borderline.
20:13 < cpernet_> I thought the date was corresponding to the svn date?
20:13 < wstein-2127> ok, that's fine with me.
20:13 < wstein-2127> make it p6
20:13 < mabshoff-2182> Well, some times it does.
20:13 < mabshoff-2182> But with svn we should use the revision.
20:13 < mabshoff-2182> With cvs the date is fine.
20:14 < mabshoff-2182> Since Clement also fixed the PID_Integer issue we should update to 1.1.5svn soonish.
20:17 < wstein-2127> this is amazing.  I can't make a damn'd tarball on OSX without it embedding meta file crap all over.
20:17 < wstein-2127> That's really annoying.
20:18 < mabshoff-2182> Can I delete the patches from #2172 now or not?
20:18 < cpernet_> yes, I have them anyway
20:18 < wstein-2127> yes, you can delete them.
20:19 < mabshoff-2182> ok, gone
20:20 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has joined #sage-devel
20:20 < wstein-2127> get /home/was/patches/linbox-20070915.p6s.pkg
20:20 < wstein-2127> p6.spkg
20:20 < wstein-2127> hi yi
20:20 < yi> hello
20:20 < mabshoff-2182> hi
20:21 < wstein-2127> cpernet_ -- the first example I tried your new det code is 8 times faster than charply.
20:21 < wstein-2127> and gives the right answer :-)
20:21 < cpernet_> cool
20:21 < mabshoff-2182> w00t
20:21 -!- mabshoff-2182 is now known as mabshoff-merging
20:22 < cpernet_> So I guess you were faster than I for the spkg.
20:22 < mabshoff-merging> Let's take a look first ;)
20:22 < wstein-2127> now I'm going to modify my multimodular / p-adic det to use your new code.
20:22 < cpernet_> I ran into a strange pb when doing spk-install for the first time: some odd include files missing
20:22 < wstein-2127> this will directly help the hnf stuff too, especially when proof = true
20:22 < cpernet_> But they were found at the 2nd pass.
20:22 < cpernet_> I'll investigate it further
20:23 < mabshoff-merging> So, what are we doing about #2127: which patches will be merged?
20:23 < mabshoff-merging> And what is the review status?
20:23 < wstein-2127> I'm refereeing it now.
20:23 < mabshoff-merging> ok, thanks.
20:23 < wstein-2127> I have a single bundle taht you'll be able to cleanly apply.
20:23 < wstein-2127> all tests pass after applying what's there.
20:23 < mabshoff-merging> Excellent
20:23 < wstein-2127> But i had to apply one of the three patches manually (screwing up credit).
20:24 < wstein-2127> but I want to switch a line of my code to use the new patches.
20:24 < wstein-2127> Since it will make a massive difference.
20:24 < wstein-2127> And give way more testing.
20:24 < wstein-2127> Since I now have good automated hnf testing code.
20:24 < cpernet_> no pb for the credit;)
20:24 < wstein-2127> and a det mistake will pop up very quickly (breaking everything else :-)
20:24 < cpernet_> booo
20:24 < wstein-2127> ?
20:25 < cpernet_> did you get the mistake?
20:25 < wstein-2127> No.
20:25 < wstein-2127> Everything is good so far.
20:26 < wstein-2127> I'm just saying that if anything is wrong with det, it's likely hnf might find it, possibly, maybe.
20:27 < mabshoff-merging> Automated, randomized testing is *good*
20:27 < wstein-2127> this is what I'm talkin' bout:
20:27 < wstein-2127> sage: a = random_matrix(ZZ,1000)
20:27 < wstein-2127> sage: time a._linbox_modn_det(10007)
20:27 < wstein-2127> CPU times: user 0.35 s, sys: 0.04 s, total: 0.40 s
20:27 < wstein-2127> it reduces mod 10007 and does the det in 0.40 seconds; on a 1000x1000 matrix.
20:28 < mabshoff-merging> What was the old time?
20:28 < wstein-2127> 2.73 seconds
20:28 < mabshoff-merging> nice
20:28 < wstein-2127> 7 times faster.
20:29 < wstein-2127> cpernet_ -- do you have a 100% linbox implementation of det over ZZ that is fast now?
20:29 < wstein-2127> may iml/sage/linbox hybrid is done.  with proof false it takes 9.84 on random_matrix(ZZ,1000)
20:29 < wstein-2127> (on my laptop)
20:29 < mabshoff-merging> Ok, I committed the linbox.p6 changes and merged it.
20:30 < wstein-2127> with proof=True, it takes 42.76 seconds
20:31 < cpernet_> Whao that's a huge gap
20:32 < wstein-2127> it does it modulo maybe 20 primes around 2^25.
20:32 < cpernet_> So why do you want just a simple det over ZZ?
20:32 < wstein-2127> that takes most of the time.
20:32 < wstein-2127> why not?
20:32 < cpernet_> LinBox has it, but I have to check if it satisfies proof=true
20:32 < wstein-2127> det gives the primes that divide the discriminant of the order generated by the matrix :-)
20:33 < wstein-2127> magma's det with proof=False on a 1000x1000 takes 20 seconds.
20:33 < wstein-2127> Sage's on exactly the same size entries as the magma matrix takes 7.88seconds.
20:33 < wstein-2127> So sage is way better with proof=False.
20:33 < wstein-2127> Oddly, Magma with Proof=True takes 21 seconds.
20:33 < wstein-2127> So there is something mysterious going on with Magma, since proof=True and Proof=False are almost the same time.
20:34 < wstein-2127> Possibility 1 -- they know a way better algorithm than we do; possibility 2 -- they lie.
20:34 < wstein-2127> I really wonder which it is.
20:35 < cpernet_> Hum, interesting
20:37 < wstein-2127> Is there any way you could tell?
20:37 < cpernet_> Linbox can do a n=1000 det over Z (entries with 2 bits) in 19s on my laptop
20:37 < wstein-2127> I'm doing entries in [-20,20]
20:37 < wstein-2127> i'll retry with 2 bits
20:38 < wstein-2127> is that with proof=False?
20:39 < cpernet_> 23 sec with entries in your interval
20:39 < wstein-2127> proof = True or proof = False?
20:39 < cpernet_> I guess proof=false, but let me checlk
20:39 < wstein-2127> ok
20:39 < wstein-2127> 6.26 on my laptop in [-3,3]
20:39 < wstein-2127> with proof=False.  And my laptop is 2.6ghz, etc.
20:39 < cpernet_> but it is spending some time trying another method before, so probably 5s of easy gain
20:42 < wstein-2127> woah - there is a massive difference in speed here:
20:42 < wstein-2127> sage: a = random_matrix(ZZ,500)
20:42 < wstein-2127> sage: time a._linbox_modn_det(next_prime(2^26))
20:42 < wstein-2127> CPU times: user 1.50 s, sys: 0.13 s, total: 1.63 s
20:42 < wstein-2127> Wall time: 1.56
20:42 < wstein-2127> 43842544
20:42 < wstein-2127> sage: time a._linbox_modn_det(next_prime(2^20))
20:42 < wstein-2127> CPU times: user 0.08 s, sys: 0.01 s, total: 0.09 s
20:42 < wstein-2127> what's the optimal prime size to use for modn det in linbox?
20:43 < gfurnish> Does sage have a library of Cython classes for something like a traditional flat memory array?
20:44 < cpernet_> definitely 26 bits are too much (26*2=52 does not leave any space in the 53 bits mantissa)
20:44 < cpernet_> I use the following formula
20:44 < wstein-2127> next_prime(2^23) seems very good.
20:44 < mabshoff-merging> gfurnish: What do you want to do?
20:44 < cpernet_> 26-(int)ceil(log((double)A.rowdim())*0.7213475205);
20:45 < cpernet_> depends on the dimension
20:45 < wstein-2127> interesting
20:45 < cpernet_> k(p-1)^2 < 2^53 is the condition
20:45 < wstein-2127> what is k?
20:45 < gfurnish> mabshoff-merging, I need a list of boolean values with O(1) access to random places and the ability to memset the entire thing beforehand.  
20:45 < cpernet_> sorry, the dimension of the largest matrix that your algorithm will multiply
20:46 < mabshoff-merging> mmmh
20:46 < cpernet_> So with det(n=10000, k=500
20:46 < wstein-2127> ok
20:46 < mabshoff-merging> Nothing comes to mind for that operation.
20:46 < wstein-2127> I'll use sage: 26-math.ceil(math.log(1000)*0.7213475205)
20:47 < cwitty-refman> gfurnish, do you need the space efficiency of one bit per value, or would 1 or 4 bytes per value suffice?
20:48 < wstein-2127> maybe m4ri
20:48 < wstein-2127> if space efficiency is critical
20:48 < cwitty-refman> In any case, a numpy int array might be your best bet.
20:48 < wstein-2127> but if you need space efficiency, use m4ri, which has packed bit arrays.
20:48 < mabshoff-merging> the bit field data structure is also something the graph people want
20:48 < wstein-2127> otherwise use cdef int* a = <int*> malloc(...)
20:49 < mabshoff-merging> But m4ri sounds like the right place to look for something like that,
20:49 < mabshoff-merging> I should mention it to rlm tomorrow - or somebody else who will go skiiing with him tomorrow.
20:49 < gfurnish> I had been trying to avoid rewriting things in cython but maybe thats the best approach.  
20:50 < wstein-2127> You can just do A = matrix(GF(2), 1, 10000)
20:50 < wstein-2127> (or maybe 10000,1)
20:50 < wstein-2127> and see if that is of any use.
20:51 < wstein-2127> It might just be too slow, but if not, maybe it is useful.
20:51 < wstein-2127> Look at the code in sage/matrix/*
20:51 < wstein-2127> then directly use the C library if need be.
20:54 < wstein-2127> 19.92 seconds.
20:54 < wstein-2127> This beats Magma :-)
20:54 < cpernet_> Yes
20:54 < mabshoff-merging> w000t
20:54 < wstein-2127> and with proof=False it takse only 6.45 seconds
20:54 < wstein-2127> Very nice.
20:57 < cpernet_> wstein: do you need help for the patches or whatever? I'll have to leave soon to buy a few things for tomorow.
20:57 < wstein-2127> I think I'm set.
20:57 < wstein-2127> Everything works perfectly for me that you posted.
20:57 < wstein-2127> Thanks!
20:58 < wstein-2127> I'm not going tomorrow unfortunately, because of my stupid back pain.
20:59 < cpernet_> I am glad that this litle contribution helped. Too bad for your back, I guess there's going to be other week-ends
20:59 < wstein-2127> yep.
20:59 < wstein-2127> Thanks again for the det -- that  is critical.
20:59 < mabshoff-merging> :)
20:59 < wstein-2127> I'll have a patch up in a second.
20:59 -!- mabshoff-merging is now known as mabshoff
21:13 < wstein-2127> mabshoff -- I've put the final version of #2127 plus a little touch up by me at /home/was/patches/hnf.hg
21:13 < wstein-2127> I just added it to that bundle.
21:13 < wstein-2127> It's good to go.
21:14 < wstein-2127> sage is now the best program in the world for dets over QQ and ZZ, I think.
21:15 -!- ajhager [n=ajhager@cpe-24-166-24-240.indy.res.rr.com] has joined #sage-devel
21:17 -!- timothy-tired is now known as timothy-1382
21:18 -!- bobmoretti [n=bob@c-24-17-246-15.hsd1.wa.comcast.net] has quit [Read error: 104 (Connection reset by peer)]
21:23 -!- wstein-2127 is now known as wstein-cooking
21:26 -!- ajhager [n=ajhager@cpe-24-166-24-240.indy.res.rr.com] has quit ["A way a lone a last a loved a long the..."]
21:34 < craigcitro> i have a coercion question. when i do a/b, if b coerces into a.parent(), and a doesn't coerce into b.parent(), does it try to do the division in a.parent() first? 
21:36 < cwitty-refman> craigcitro: If I understand your question correctly, then yes.
21:36 < craigcitro> k.
21:36 < craigcitro> if i have a NumberFieldElement, and i do a/0, it gets an error in NumberFieldElement.__div_c_impl__
21:37 < craigcitro> but if i have a NumberFieldElement_quadratic, and i do a/0, it doesn't seem to run the appropriate __div_c_impl__ (i.e. throwing a print in there doesn't show)
21:39 < cwitty-refman> Sorry, can't help you.  (It seems like they should act the same; I don't know why they wouldn't.)
21:40 < craigcitro> well, at least it means i'm not crazy for thinking so, too. ;)
21:40 < craigcitro> thanks
21:43 -!- cwitty-refman is now known as cwitty
21:47 < craigcitro> actually, looking at the traceback explains it -- somewhere the coercion model makes a different decision in those cases
21:48 < craigcitro> in one case, it decides to view it as an action on a ring, and in the other, just a straight division
21:50 < gfurnish> do you need to manually create the .pxd files for doing cimports? 
21:51 < wstein-cooking> yes
21:58 -!- wstein-cooking is now known as wstein-microsoft
22:08 < craigcitro> wstein-microsoft: so while i was messing around with stuff involving dirichlet characters, i went ahead and implemented the "todo" suggestion in that file -- i store the powers of roots of unity and do arithmetic in Z/N instead of in the cyclotomic field
22:08 < craigcitro> could i con you into reviewing the patch/seeing if i missed anything else to help speed it up?
22:08 < wstein-microsoft> I already did that long ago.
22:08 < wstein-microsoft> I'm confused.
22:09 < craigcitro> in modular/dirichlet.py ?
22:09 < craigcitro> or was the code already elsewhere and now i've duplicated work? ;)
22:09 < wstein-microsoft> in modular/dirichlet.py
22:09 < wstein-microsoft> I'm very puzzled.
22:09 < wstein-microsoft> I had to do that or it was way too slow.
22:09 < craigcitro> the code that was there is exactly the code in your book
22:10 < wstein-microsoft> It's aleady that way in dirichlet.py.
22:10 < wstein-microsoft> What did you do?
22:10 < wstein-microsoft> Oh, I see.
22:10 < wstein-microsoft> no i don't see.
22:10 < wstein-microsoft> already self.__element is in a module...
22:11 < craigcitro> i'm looking at the values() method
22:11 < craigcitro> which is what gets looked up when you do __call__
22:11 < wstein-microsoft> ah..
22:11 < wstein-microsoft> I see. 
22:11 < wstein-microsoft> I was thinking of "arithmetic" as eps*chi where eps, chi are characters.
22:11 < craigcitro> oh, right
22:11 < wstein-microsoft> You are thinking ff "arithmetic" in the sense of "what you do to evaluate".
22:11 < wstein-microsoft> Very good.
22:11 < craigcitro> nods
22:12 < wstein-microsoft> great work
22:12 < craigcitro> well, it went from 2.23s to 1.05 s to find all values of all dirichlet characters of level 960, for instance
22:12 < wstein-microsoft> excellent.
22:13 < craigcitro> which isn't bad, but isn't a factor of 20 or anything ;)
22:13 < craigcitro> i'm just running a -t in modular/ ... when that's done, i'll post a patch so you can review it
22:13 < wstein-microsoft> cool
22:13 < craigcitro> also, evaluating the trivial character (i.e. of level 1) was heinously slow
22:13 < craigcitro> which i can't imagine one does too often
22:13 < craigcitro> but regardless, it was trivial to speed up
22:15 < craigcitro> of course, now i'm finding doctest failures because of type conversion issues. i'll ping you again in a little bit. ;)
22:15 < gfurnish> in a cdef class's __init__, why woulld self._name = name fail at runtime saying the object has no _name attribute?  
22:16 < wstein-microsoft> gfurtnish -- it shouldn't.  that is weird
22:17 < gfurnish> do I need to define _name somehow?
22:20 < gfurnish> apperently I did.
22:25 < gfurnish> I'm not clear on when you need to cdef a type that is going to be used in the class.  Sometimes if I try it complains about C attributes can not be added in implementation part of extension and other times they seem to be necessary.
22:36 -!- yi [n=yi@c-67-183-27-214.hsd1.wa.comcast.net] has quit []
22:37 < wstein-microsoft> Put cdef object foo for *ALL* attributes.  Put them in the pxd file.
22:37 < wstein-microsoft> There are _always_ necessary.
22:37 < wstein-microsoft> cdef'd class are all about efficiency, so they don't have a __dict__ by default.
22:37 < gfurnish> right but to fix the _name issue I had to put a cdef object _name in the pyx file.
22:37 < wstein-microsoft> Yes, that's exactly right.
22:38 < wstein-microsoft> If you make an external pxd file you'de have to put it there.
22:38 < wstein-microsoft> If you don't hten you have to put it in pyx.
22:38 < wstein-microsoft> I'm glad you figured it out.
22:39 < gfurnish> wstein-microsoft, well, not exactly.  I don't understand why I have to put it in both the pyx and the pxd 
22:39 -!- wstein-microsoft is now known as wstein-saturate
22:39 < wstein-saturate> just the pxd file
22:39 < wstein-saturate> You should not put it in the pyx file.
22:39 < gfurnish> If I take it out of the pyx I get the runtime error.
22:39 < wstein-saturate> That's weird.
22:40 < wstein-saturate> I don't understand that.
22:40 < gfurnish> neither do I.   
22:40 < wstein-saturate> There must be some sort of path issue or something...
22:40 < wstein-saturate> is the pxd file even being seen?
22:40 < wstein-saturate> what if you put nonsense and syntax errors in it?
22:41 < gfurnish> apperently the pxd file is not getting seen,
22:42 < gfurnish> apparently none of my pxd files are getting seen...
22:42 < gfurnish> but cimport works properly on some of them so I don't understand that at all
22:42 < wstein-saturate> are you using setup.py, etc., or load/attach in sage?
22:43 < gfurnish> setup.py etc
22:43 < wstein-saturate> hmm
22:43 < gfurnish> ok, apperently all of them except the one with the class that behaves badly are being seen, I just didn't have bad enough syntax errors to upset the compiler
22:44 -!- cpernet_ [n=pernet@c-24-18-247-186.hsd1.wa.comcast.net] has quit ["Ex-Chat"]
22:48 < gfurnish> I bet whats going on is that nothing is cimporting that specific pxd so its not working properly for some wierd reason.
22:49 < wstein-saturate> that seems possible
22:50 < gfurnish> no lambda's/maps/etc in cython?  
22:50 < wstein-saturate> no lambda.
22:50 < wstein-saturate> map should be fine, right, it's just a function.
22:50 < wstein-saturate> Cython has list comprehensions also, so why use map at all.
22:50 < wstein-saturate> But yes, there is no lambda.
22:58 < wstein-saturate> craigcitro -- what do you think of http://trac.sagemath.org/sage_trac/ticket/2190
23:00 < gfurnish> are there full docs on PyList_ for cython somewhere?
23:02 < craigcitro> that looks like it'd be nice and doable now that you and clement have the hnf code -- though i can't find the magma documentation for saturation
23:03 < craigcitro> there we go, i was looking at an old version
23:15 < craigcitro> so i'm making sure i understand the definition here: given a matrix M of rank r, the rows of the saturation of M should be a basis for the maximal integral sublattice (i.e. with integer entries) of rank r containing the lattice generated by the rows of M?
23:19 < timothy-1382> why anyone recording irc today?
23:19 < timothy-1382> was
23:20 < gfurnish> what do you need?
23:24 < craigcitro> timothy-1382: mabshoff usually posts it.
23:31 -!- wstein-saturate [n=was@c66-235-34-166.sea2.cablespeed.com] has quit []
23:33 -!- ajhager [n=ajhager@cpe-24-166-24-240.indy.res.rr.com] has joined #sage-devel
23:34 -!- william_stein [n=was@c66-235-34-166.sea2.cablespeed.com] has joined #sage-devel
23:34 -!- william_stein is now known as wstein
23:35 < wstein> craigcitro -- yes, you're right.
23:35 < wstein> The saturation of a matrix M is the intersection of the QQ-span of the rows with ZZ^n.
23:35 < craigcitro> so this somehow tells you the largest integral object you would hope to span with a given module
23:35 < craigcitro> or, better, a basis for that thing
23:35 < wstein> kernels of homomorphisms over ZZ are saturated.
23:36 < wstein> So to compute them you compute kernel over QQ, then saturate.
23:36 < craigcitro> oh, that's cool. so it's like the radical of an ideal, sort of.
23:36 < wstein> If A and B are modular abelian varieties given by pieces of H_1(X_0(N),Z), then
23:36 < wstein> the pieces are both saturated.
23:36 < wstein> And the structure of A \cap B is exactly the same as the quotient M/(L_A + L_B), where M is the
23:37 < wstein> saturation of L_A + L_B.
23:37 < craigcitro> whoa
23:37 < wstein>  My whole "theory of computing with modular abelian varieties" really needs this saturation machinery to get anywhere.
23:38 < wstein> wow, my 100x300 random example is *still* churning away in pari, an hour later...
23:38 < wstein> magma takes < 1 second.
23:38 < craigcitro> which was the impetus for the HNF?
23:38 < craigcitro> hahaha
23:38 < wstein> hnf is the key step in saturation.
23:38 < wstein> it's used all over the place
23:38 < craigcitro> it seems like it, given your code above
23:38 < wstein> The other key thing is that HNF goes from "generators for a lattice" to "basis for lattice".
23:39 < craigcitro> ah, so you want to saturate what you're getting out of the HNF
23:39 < craigcitro> so this lets you take a situation where you know you have enough generators, and pick out a minimal set
23:39 < wstein> not exactly.
23:40 < craigcitro> for some vague definition of "minimal"
23:40 < wstein> the gens are always minimal.
23:40 < wstein> It gives back a *different* lattice that is "pure".
23:40 < wstein> E.g., again returning to modular abelian varieties, where A, B are sitting in J_0(N) with corresponding
23:40 < wstein> lattices L_A and L_B in H_1(X_0(N),Z).
23:40 < wstein> We are very interested in the saturation of L_A + L_B.
23:41 < wstein> We have gens for L_A + L_B easily -- just concatenate the gens for L_A and for L_B.
23:41 < wstein> But there is some mysterious lattice S (the saturation) that contains L_A and L_B and depends on
23:41 < wstein> how L_A, L_B, etc., sit in H_1(X_0(N),Z).
23:42 < wstein> Concrete example: L = span((2,0), (0,2)) has saturation span((1,0), (0,1)).
23:42 < gfurnish> where do you find the include for FAST_SEQ_UNSAFE for cython?
23:42 < wstein> gfurnish -- i absolutely never ever use any of that Python/C API directly if I can avoid it.
23:42 < wstein> Every time I used to use it I regretted it because I created mem leaks, or
23:43 < craigcitro> (switching H_1(X_0(N), Z) for some space of modular forms, that looks symbolically identical to hida's module of congruences.)
23:43 < wstein> Robert Bradshaw just changed Cython to do various type inferences that resulted in my optimizations
23:43 < wstein> not being as good as the original code was.
23:43 < wstein> craigictro -- yep.
23:43 < wstein> E.g., replace H_1 by S_2(Gamma, ZZ)
23:43 < wstein> or S_k(Gamma, ZZ)
23:43 < craigcitro> nod
23:44 < craigcitro> or even S_k(gamma, O_L)
23:44 < wstein> or even TT and submodules of TT (hecke algebra)
23:44 < wstein> Yep.
23:44 < gfurnish> wstein, won't C style array access always be faster then x[2] or what not though?
23:44 < wstein> no
23:44 < craigcitro> so i know what the module of congruences tells me -- its divisors tell me where to look for congruences among different forms. what's the analogous info contained in this S?
23:45 < wstein> Cython generates clever code that ends up doing very fast access anyways, if x happens to be a list or tuple.
23:45 < wstein> It generates code like this:
23:45 < wstein> ...
23:45 < wstein> Actually, it works best in the case when you do things like:
23:45 < wstein>    "for z in x"
23:46 < wstein> since then it does one test to see if x is a list, say, then gets the elements very quickly.
23:46 < wstein> The object I described above using homology *is* literally isomorphic as a TT-module to the intersection A /\ B of abelian varieties taken inside of J_0(N).
23:47 < wstein> Primes in the support of that module are congruence primes.
23:47 < wstein> The converse need not be true.
23:47 < gfurnish> wstein, so Cython is good enough that there is no practical reason to be manually iterating over lists?  
23:47 < wstein> Such "geometric congruences" are very useful though from the point of view of applying geometric results that relate A and B.
23:47 < wstein> gfurnish -- yes.
23:47 < wstein> Pyrex is *NOT*.
23:47 < wstein> But Cython is.
23:47 < wstein> Try some benchmarks.
23:48 < wstein> And if they don't agree with what I'm writing, definitely let me and Robert Bradshaw know, since there might
23:48 < wstein> be some slight change or declaration to make in your code to make sure access is fast.
23:48 < craigcitro> interesting. so they're telling you primes at which A and B are somehow "geometrically indistinguishable"?
23:48 < wstein> They give primes \m so that A[\m] = B[\m] geometrically as they sit in J_0(N)>
23:48 < gfurnish> wstein, I had been following the how to write fast cython list iteration docs in the sage programming documentation.
23:49 < wstein> Under appropriate hypothesis this can tell you, e.g, that H_{fppf}(ZZ,A[\m]) = H_{fppf}(ZZ,B[\m]), which can be very powerful indeed.
23:49 < wstein> And even when they aren't equal, they are closely related.
23:49 < wstein> gfurnish -- ahh, I wrote that.
23:49 < wstein> Then Robert Bradshaw made Cython way better as a response.
23:50 < gfurnish> well, is it still adviseable to use TypeCheck over isinstance or was that fixed too?
23:50 < wstein> I think PY_TYPE_CHECK is very very fast.
23:51 < craigcitro> ah, so it really is like getting a congruence between two elliptic curves, say -- a galois equivariant isomorphism between the p-torsion, so you're going to get the same mod p representation out of both of them, so away from primes dividing the conductor, same values of frobenius ...
23:51 < gfurnish> so that is the preferred way then?
23:51 < wstein> But I think Robert made isinstance way faster, though it does something different.
23:51 < wstein> craigcitro -- exactly.
23:51 < craigcitro> i think robert generally suggests PY_TYPE_CHECK and PY_TYPE_CHECK_EXACT when you can
23:51 < wstein> Except it is a _little_ stronger, since it's taking place inside J_0(N), and you can pass to Neron models, etc., and get a bit more information.
23:51 < wstein> It's an "old Mazur trick".
23:52 < craigcitro> there seem to be a lot of those.
23:52 < wstein> This double conversation is surreal.
23:52 < wstein> My math and programming worlds are colliding.
23:52 < wstein> And you -- craig -- happen to understand both perfectly well
23:52 < craigcitro> it'd be even funnier if gfurnish and i switched what conversation we were in! ;)
23:53 < wstein> gfurnish -- are you a number theorist?
23:53 < wstein> or?
23:53 < gfurnish> wstein, physics undergrad student.
23:53 < wstein> ok.
23:53 < wstein> we're safe.
23:53 < gfurnish> wstein, working on cythonizing and overhauling calculus to support native multidimensional goodies.
23:53 < wstein> cool.
23:53 < craigcitro> i have to say, i kinda regret fixing characters to give values as NumberFieldElement_quadratics, even though it's right in principle.
23:53 < wstein> why?
23:54 < craigcitro> well, mostly because coercion between number fields doesn't really work at all right now.
23:54 < craigcitro> it usually just throws erros.
23:54 < craigcitro> errors.
23:54 < wstein> fix it then :-)
23:54 < craigcitro> pretty soon i'm going to. ;)
23:54 < craigcitro> i think at least a rudimentary fix is the only thing that's going to make this particular doctest pass again ...
23:55 < craigcitro> god, i just don't understand how it'd be possible to have sage work without doctests
23:55 < craigcitro> it's just too intricate to be able to switch something and know you're right
23:56 < wstein> we need way more doctests.
23:56 < wstein> We're at 39.6% coverage.
23:56 < wstein> we need 100% and keep it there!
23:56 < wstein> that will be a good time.
23:56 < craigcitro> yes it will
23:57 < wstein> doctests are also awesome from a usability point of view.
23:57 < craigcitro> it's amazing to think of how many little bugs we'll uncover ...
23:57 < craigcitro> very true.
23:57 < timothy-1382> doc tests on all methods?
23:57 < wstein> I downloaded the computer algebra system "fermat" today
23:57 < wstein> It is freely available right now for some reason.
23:57 < wstein> But I couldn't use the damn thing, since the documentation has essentially no examples.
23:57 < wstein> It's horrid.
23:57 < timothy-1382> i've heard of fermat but why does it exist
23:57 < wstein> no clue
23:57 < wstein> try it out.
23:58 < craigcitro> hahah
23:58 < wstein> it's freely available at the moment and trivial to install.
23:58 < craigcitro> what does it do?
23:58 < wstein> Fermat is a computer algebra system for Macintosh, Windows, Linux, and Unix by me, Robert H. Lewis of Fordham University, that does arithmetic of arbitrarily long integers and fractions, symbolic calculations, matrices over polynomial rings, graphics, and other numerical calculations. It is extremely fast and extremely economical of space.
23:58 < wstein> (from the web page)
23:58 < craigcitro> did you try the "tests"?
23:58 < wstein> no
23:58 < wstein> none seem at all interesting to me.
23:59 < wstein> it's benchmark obsessed, I guess.
23:59 < timothy-1382> lol " Fermat is Overall Best in the World at Polynomial GCD" i thought magma was
23:59 < wstein> see http://home.bway.net/lewis/
--- Day changed Sun Feb 17 2008
00:00 < wstein> they have a section "Why should I use this system"
00:00 < wstein> "If you try to compute the characteristic polynomial of a 400 X 400 matrix over Q, you need Fermat or something like it."
00:00 < craigcitro> *cough* linbox *cough*
00:00 < craigcitro> does linbox crush it?
00:00 < craigcitro> or magma, for that matter?
00:00 < wstein> I don't know.
00:01 < wstein> I wouldn't discount it for speed on some specific problems.
00:01 < wstein> But it is closed source.
00:01 < wstein> The author actually contacted me a while ago and wanted to "join forces" or something with Sage.
00:01 < wstein> I had to explain to him what Open source is.
00:01 < craigcitro> hahahah
00:02 < timothy-1382> yeah it would be like go play with sympy its bsed
00:02 < wstein> oh, I remember the paper they have here: 
00:02 < wstein> http://home.bway.net/lewis/calatex.html
00:03 < timothy-1382> ok fermath is lame ... mathematica has the 5 minute tutorial this has what?
00:04 < timothy-1382> i open it up type help and it does nothing
00:04 < wstein> magma does pretty well in that paper...
00:05 < wstein> goodnight al.
00:05 < timothy-1382> night
00:05 -!- wstein is now known as wstein|asleep
00:07 < craigcitro> g'night.
00:07 < timothy-1382> night
}}}
