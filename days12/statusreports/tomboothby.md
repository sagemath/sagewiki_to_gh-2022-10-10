= Overall =

This has probably been my most productive Sage Days ever.  About 80% of my time awake was used reading / writing / reviewing code that ended up being useful.  I'd say that about 10% of my time was spent working on code was not useful, and the remaining 10% was spent eating, walking, and insulting Dan Shumow.

== Bugs Fixed ==

 1. ~~#4440~~ Automatic Indentation: the notebook now handles Python indentation like a "real IDE".  For the record, nano, my favorite development environment, can do this too.

 1. ~~#3056~~ Disabled Karatsuba polynomial multiplication for inexact rings.  This changed a few doctests; in all but one case, the results were more accurate or simpler if symbolic.  The one remaining case isn't clear-cut.

 1. #3999 Added doctests to MultiplicativeWrapper.  Not all of them work, mostly due to bugs and methods which have not been implemented.  So, Dan didn't like that and gave it a "needs work".  I insulted him for this.

 1. #5061 Steenrod algebras incorrectly reported the additive order for the zero element.  I discovered this working on #3999.  Forgot to add a doctest for this, so Robert Bradshaw marked it "needs work".

 1. ~~#5064~~ Steenrod algebras were non-unique.  Discovered working on #3999, and fixed this.  However, it's not done -- unpickling will result in non-unique algebras.

== Bugs Reviewed ==

 Gotta catch my shuttle, I'll do this when I get home.
