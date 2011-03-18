== Some pointers on writing good doctests and reviewing doctests ==

The following notes are here to help authors create good doctests and to help reviewers review them. 

Although this will not always be practical, if possible there should a few examples of using all new functions where the expected results are either:

 * Intrinsically verifying to an expert. e.g. illustrate constraints or consistencies implied by a well-known theorem/conjecture hold (ideally one unrelated to the implementation). 
 * Reproduced in a reputable book or journal.
 * Can be reproduced with [[http://www.wolframalpha.com/ WolframAlpha]]. We have [[http://groups.google.com/group/sage-devel/msg/4fbd060599faec58 permission]] from [[http://www.wolfram.com/ Wolfram Research]] to use Wolfram|Alpha to make comparisons with Sage. It would be useful if you could provide a link on the trac ticket in this case - e.g http://www.wolframalpha.com/input/?i=10! 
 * Can be reproduced with open or closed software that is not part of Sage. (It would help, if practical, to document on the trac ticket 
   * The name of the software
   * The version
   * The hardware used.
   * The input you provided to the software. 
   * The output produced by that software. 

If a reviewer or author believes it is reasonable, they can justify the tests on the trac ticket and/or provide a reference to a journal or book where the same result is given.

In particular, the "expected value" from doctests would ideally '''not''' just be what you happen to get on your computer. This is especially important to consider with results that are purely numeric, as sometimes the algorithm may not be as stable as you might expect. It may give very different results on different hardware. Sometimes when components of Sage are updated, slightly different numerical results are given. If an exact, or high-precisions answer is known, we are able to determine if the update is beneficial or not. 

In addition to the above, you are also encouraged to provide examples which can only be computed with Sage. To promote Sage, you could add a comment to the documentation something like: ''As of xx/yy/20zz there is no other open and/or closed source software able to do this.'' Not only would this help promote Sage, but a reader of the documentation may suggest a way where the results could be verified.

If a result can be computed by other software, but Sage is significantly faster, it would benefit the Sage project to document this too. Again, it would be helpful to provide details of software. 
