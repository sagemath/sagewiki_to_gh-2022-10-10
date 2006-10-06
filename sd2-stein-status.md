== SAGE Days 2: SAGE: Now and The Future ==

A talk for [:days2:the SAGE Days 2 workshop], by William Stein.

 * The '''purpose''' of this workshop:
     * lots of strategy, planning, brainstorming, etc.

 * Funding ideas:
     * NSF Grants:
          * Computational Math program
          * CSUMS (http://sage.math.washington.edu/grants/stein-csums-06/)

     * The SAGE Mathematics Foundation

     * Parallel SAGE push

 * Mercurial revision control system: why? what? how? -- a very quick tour

 * Python 2.5 (see http://docs.python.org/whatsnew/whatsnew25.html)
     * '''list indices''': {{{__index__}}} method; This means {{{n=2; [1,2,3,4][n]}}} works!! 
           This was implemented by Travis Oliphant (author of NumPy), since NumPy also has specialized integers.
     * '''big lists''' lists with more than $2^{32}$ elements now supported
     * '''speed''' lots speedups
     * '''memory''' -- memory is now freed
     * '''ctypes''' -- ctypes is included standard
     * '''conditional expressions''': x = true_value if condition else false_value
     * '''context managers''': relevant to all the discussion about precision lately: http://docs.python.org/whatsnew/pep-343.html

 * Recently added SAGE components:
     * GSL: GNU Scientific Library
     * Twisted: Networking framework

 * Upcoming events that are relevant to SAGE development:
     * October 23-27: I'm speaking about SAGE at an IMA "Software in Algebraic Geometry" in Minnesota later this month.
     * Nov 5-11: Me at CCR
     * Dec 3-4, 2006: Me at Waterloo
     * Jan 29-Feb 2: MSRI Interactive Parallel Computation ---> SAGE
     * March 10-14, 2007: Arizona Winter School (I'm at co-organizer).  David Savitt (here) is the organizer.
     * June 3-8, 2007: Banff workshop on modular forms computation -- I'm an organizer
     * July 30-Aug 3, 2007: AIM: Workshop on Modular Forms and L-functions -- I'm an organizer
     
  * Plans:
     * SAGE 2.0: fast arithmetic
     * SAGE 3.0: parallel
     * Along the way: modular forms, elliptic curves, groebner basis, quaternion algebras, etc. -- what people want
   
