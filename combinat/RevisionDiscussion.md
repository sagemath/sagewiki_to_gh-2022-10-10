

```txt
<jbandlow> mhansen: second question... suppose i have a patch 'doc.patch' in my local combinat queue. how do i get it to 2144?
<mhansen> gfurnish: In Python there is staticmethod, but since you want it in Cython, I'm not sure.
<mhansen> search_src() says rings/real_mpfr.pyx
<jbandlow> mhansen: just so i understand... 2144 should be a mirror of the patches directory.  the command hg qrefresh  updates the current patch;
<jbandlow> mhansen: hg qcommit updates all the current queue information (which is in .hg/patches) and then the pull and the push will synch that with 2144
<mhansen> Yep, qcommit, commits the state of the patches to the repository in .hg/patches/.hg.
<mabshoff> mhansen, jbandlow: Since those patches are against "vanilla" 3.0.1 should 
<mabshoff> those tickets not go directly into trac?
<mhansen> mabshoff: I'm not sure what what you mean.
<mabshoff> All the combinat oddities that jbandlow seems to have listed and is working on.
<jbandlow> mabshoff:  my doc.patch probably will.  however, the idea is that several of us will be working on one problem and 2144 is a way to
<mabshoff> sure.
<jbandlow> synch with each other in a more convinient way then trac
<mabshoff> And in any case you should open tickets for each area, i.e. "Dyck Words"
<jbandlow> ok, will do
<mhansen> jbandlow: I still haven't decided if the queue repository is the best way to do things, but it is worth trying out.  We'll see how many complications come up.
<mabshoff> That makes review easier and once that patch is pushed down from 2144
<mabshoff> we can close it.
<jbandlow> mhansen: nicolas and anne seem to really prefer something similar to svn, so if this
<jbandlow> helps them be productive i think it will be worth it'
<mhansen> The main thing would be just being disciplined about getting things moved to the main branch.
<mhansen> Are you with Nicolas now?
<jbandlow> no, but i will be after lunch (around 2 or so)
<mhansen> I see.  Well, could you tell him that I'll have a starting point for free modules done this evening.  I have all the module stuff separated from the algebra, and everything passes tests.  I just need to finish implementing the rest of the interface.
<mhansen> I got a bit distracted doing some work with the new coercion stuff since I had to use a bit of a hack to get things working with the old system.
<mhansen> The new coercion/parent/category code is really nice.
<jbandlow> mhansen: I will.  Also fwiw i just did a push of 'dyckwords.patch' to 2144
<mhansen> I'll try merging it with mine.
<mhansen> jbandlow: I did a qcommit, qpop -a, hg pull from .hg/patches, hg merge, merged the series files, qpush -a, and everything worked.
<jbandlow> mhansen: excellent.  when you say 'merged the series files' what did that involve?
<mhansen> My series file looked like, ABD (since I was working on D), 2144 looked like ABC (since you just pushed that), so now my series looks like ABCD.
<jbandlow> so that requires editing by hand?   :(    of course, it is really easy to edit by hand, but it still seems annoying
<mhansen> Yeah, it was Ctrl-3, Ctrl-2, Ctrl-S, Ctrl-Q .
<jbandlow> for those who have kdiff3....  for the mac and vmware people in the crowd it might be trickier
<jbandlow> but i agree that it's by no means difficult.  just an annoyance
<mhansen> My biggest concern with the svn-type approach is that stuff that is ready to go in will have to "wait" on stuff that is not ready.
<jbandlow> why?  is your thought that, for example, if i  am making an easy to change to tableau.py while nicolas, anne, et al are making big changes, that my patch will
<jbandlow> be against their 'half-done' patch and so mine will be in limbo until they finish?
<mhansen> Things like that although you could just export that changset from the repository, post it to trac, and things would work fine.
<jbandlow> so i guess i don't understand what you meant
<mhansen> Yeah, that what I was thinking of.  There are other drawbacks in that you don't get a single patch as a "self-contained" work that someone else could review.
<jbandlow> my thought was that when a project is complete, all changes related to that project are folded into a single patch which is posted to trac
<mhansen> If you do that as a single patch, then it is more difficult to merge the main branch with the combinat branch since they would conflict in those patches.  I guess if the single patch were only for review and not for inclusion.
```