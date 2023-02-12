

# Overall

This has probably been my most productive Sage Days ever.  About 80% of my time awake was used reading / writing / reviewing code that ended up being useful.  I'd say that about 10% of my time was spent working on code was not useful, and the remaining 10% was spent eating, walking, and insulting Dan Shumow. 

I really enjoyed the triage sessions.  They were a lot of fun, and a very good way of delegating work.  I'd like to see these triage sessions integrated into future Sage Days: for example, at Developer Days, there should be a two day sequence of bug fixing followed by reviews.  At Sage Days devoted to special topics, the first day could include a brainstorming session in which various desired features are discussed, and then delegated.   

In the future, we should make sure to ping people who aren't around but have been assigned bugs. For example, Carl Witty seemed displeased that he'd been assigned tickets and not told about it for nearly 24 hours.  Perhaps we should have somebody transcribe summary info to IRC as it all goes down. 


## Bugs Fixed

1. #4440 Automatic Indentation: the notebook now handles Python indentation like a "real IDE".  For the record, nano, my favorite development environment, can do this too. 
1. #3056 Disabled Karatsuba polynomial multiplication for inexact rings.  This changed a few doctests; in all but one case, the results were more accurate or simpler if symbolic.  The one remaining case isn't clear-cut. 
1. #3999 Added doctests to <a href="/MultiplicativeWrapper">MultiplicativeWrapper</a>.  Not all of them work, mostly due to bugs and methods which have not been implemented.  So, Dan didn't like that and gave it a "needs work".  I insulted him for this. 
1. #5061 Steenrod algebras incorrectly reported the additive order for the zero element.  I discovered this working on #3999.  Forgot to add a doctest for this, so Robert Bradshaw marked it "needs work". 
1. #5064 Steenrod algebras were non-unique.  Discovered working on #3999, and fixed this.  However, it's not done -- unpickling will result in non-unique algebras. 
1. (ish) #5079 Problems in preparsing number literals.  While I'm not directly responsible for fixing this, I did a lot of research into it before punting to Robert Bradshaw.  So, I was able to help him and guide him around various pitfalls, as well as find subtle bugs & workarounds in his implementation.  Also, I suggested pre-emptive compatibility with py3k literals, which Robert liked and implemented. 

## Bugs Reviewed

Thanks to the San Diego Airport free wifi, I'm typing this while I wait for my flight. 

1. #5058 fixes a bug in sage -f and sage -f; when the .spkg path has an extra .spkg in it. 
1. #4048 implements minpoly for GF(p) 
1. #2638 fixes recursion limit problems with QQbar.exactify() 
1. #5073 updates iPython to 0.9.1 
1. #4271 indefinite integration for piecewise functions.  I expected to learn something about the calculus stuff.... but didn't work up the motivation in the end.  I checked doctests, and suggested that somebody more familiar with the code review it as well -- wdj chipped in, and it looks like it still needs some work. 
1. #5052 preparser doesn't respect indentation before "load".  This was fixed. 
1. #5025 fixes tinymce issues.  This seems to have introduced a serious bug, so I gave it a "needs work".  In retrospect, I really wish I'd reviewed this before Jason fell asleep on the chair in the lobby to prepare for his 6:00 AM flight.  We could have gotten it resolved, otherwise.  It's probably an issue with the patch. 
1. #3658 Pari bug results in unreliable prime_pi.  It seems that Pari reports that the number of primes < n is at most the number of primes Pari currently knows about.  If Pari pre-computed all primes, that'd probably be a good way of doing things.  But they don't for some reason.  We should submit a patch to precompute all primes upstream to the Pari group.  They'd love us forever. 