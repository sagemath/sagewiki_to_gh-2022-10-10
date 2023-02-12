

## SAGE Days 2: SAGE: Status Report

A talk for <a href="/days2">the SAGE Days 2 workshop</a>, by William Stein. 

Here are my slides: <a href="http://modular.math.washington.edu/talks/2006-10-07-sagedays2/">http://modular.math.washington.edu/talks/2006-10-07-sagedays2/</a> 

* The **purpose** of this workshop: 
            * lots of strategy, planning, brainstorming, etc. 
* Funding ideas: 
            * NSF Grants: 
                           * Computational Math program 
                           * CSUMS (<a href="http://sage.math.washington.edu/grants/stein-csums-06/">http://sage.math.washington.edu/grants/stein-csums-06/</a>) 
            * The SAGE Mathematics Foundation 
            * Parallel SAGE push 
* Mercurial revision control system: why? what? how? -- a very quick tour 
* Python 2.5 (see <a href="http://docs.python.org/whatsnew/whatsnew25.html">http://docs.python.org/whatsnew/whatsnew25.html</a>) 
            * **list indices**: `__index__` method; This means `n=2; [1,2,3,4][n]` works!!  
                              * This was implemented by Travis Oliphant (author of <a href="/NumPy">NumPy</a>), since <a href="/NumPy">NumPy</a> also has specialized integers. 
            * **big lists** lists with more than $2^{32}$ elements now supported 
            * **optimizations** -- "Several of the optimizations were developed at the <a href="/NeedForSpeed">NeedForSpeed</a> sprint, an event held in Reykjavik, Iceland, from May 21-28 2006."  E.g., "Exception handling in Python 2.5 is therefore about 30% faster than in 2.4." 
            * **memory** -- memory is now freed 
            * **ctypes** -- ctypes is included standard 
            * **conditional expressions**: x = true_value if condition else false_value 
            * **context managers**: relevant to all the discussion about precision lately: <a href="http://docs.python.org/whatsnew/pep-343.html">http://docs.python.org/whatsnew/pep-343.html</a> 
            * **any and all** -- new mathy builtins:  

```txt
   sage: any(is_prime(x) for x in range(114,125))
   False
   sage: all(is_prime(x) for x in prime_range(50,100))
   True
```
* Recent additions to SAGE: 
            * GSL: GNU Scientific Library 
            * Twisted: Networking framework 
            * Macaulay2: optional package that builds from source 
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
   * Home improvement -- extreme edition --- Let's build the car! 