1. p-adics

Lesson: SVN + HG only mix together well if you're only creating new files
Status: (i) Code in place, still unexposed in SAGE, working on more doctests.
        (ii) Lazy p-adics currently under development
        (iii) Extension fields are next
Goals: Make (i)-(iii) production ready
Problems: (a) Extensions may be extremely slow and may require FiniteField, PolyQuotientRing optimization to fix.
People: David Roe (DR), David Harvey (DH), Craig Citro (CC), Genya Zaytman (YZ)
Timeline: (i) Done by AWS: DR/DH/CC/YZ
          (ii) Done by AWS: DR
          (iii) Unramified by AWS: CC/DR
          (iv) All of us will be at AWS

2. Symbolic manipulation
Problems: (i) Hard to choose when to simplify
          (ii) Still dependant on Maxima for some things -- will this limit us in the future? (consensus here seems to be probably not)
Status: (i) Plotting still untouched, esp wrt speed (we think)
        (ii) We have equality working! Also, formal inequalities ready to go (in principle)
Goals: (i) More doctests, production ready code
       (ii) Explore Mathematica, Maple and Maxima, add functionality.  Go through a calculus textbook and make sure we can do all the problems.
       (iii) More user feedback on interface and features
       (iv) Rouche's Algorithm
       (v) Turn function objects/symbolic expressions into C/SageX code.
       (vi) Make (v) part of a SAGE-wide system
People: Bobby M, Nathan, Soroosh Yazdam, Robert Bradshaw
Timeline: (i) Before 3/1, Initial Public Release
          (ii) Get a fair amount of this done by 3/8
          (iii) March/April (Nathan and Mathematica worksheets)
          (iv) Soroosh wants to do this when the code base is ready, research other programs by 4/1
          (v) April/May
          (vi) Later

3. Low level optimization of SAGE infrastructure
Goals: (i) Optimize the code that SageX generates: make Pythonesque syntax fast in lieu of ugly, nasty, Python/C API calls (to avoid coredumps, it's hard to read, easy to write bugs and you feel guilty when you write it)
       (ii) Speed up SAGE integer construction by changing to handwritten C in SageX
       (iii) Integer pool?
Problem: In (ii) Tying handwritten C into SageX in a few specific places when SageX is nice but slow.  We don't necessarily want to make this easy, and don't know exactly how we should change SageX in order to do this.
Status: (i) Fairly far along in indexing into lists, but goal (i) is more long term.  People can ask why is something slow, look at the generated C code and see if there's a better way to do it.  Make a wiki page.
        (ii) Have code written, trying to get it in place.  Understand what's going on.  See Problem.
        (iii) Still thinking about it.
People: Robert Bradshaw, Martin, David Harvey (sick of this project now)
Timeline: (i) List indexing: 48 hours (Robert).  Make a wiki page: more as it comes along.
          (ii) Figure out problem and implement solution by 3/1
          (iii) After (ii)
          (iv) Look at schedule for Google summer of code.  Python Software Foundation wiki -- describe this project, by 4/1.  

4. 3-D plot embedded Java applet
Goal: Make it work and easy to install, even if your name isn't Robert.
Problem: Notebook server chokes on huge files.  Maybe rewrite notebook backend in twisted.
People: Tom Boothby
Status: Has twisted server working, but it's not tied in to the notebook client.

5. VMWare
Goal: Sage in a VMWare Player.  Compressed VMWare Image should fit on a CD.
People: Marcus, William
Timeline: By AWS

6. Linear Algebra
|| ||Sparse||Dense||
||GF(2)||(A)||(B)||
||Numerical||(C)||(D)||
||Exact||(E)||(F)||

A) M4R (Method of Four Russians)
Remark: Do as dense up to certain size, ie A contained in B up to some size
Goal: Get M4R into SAGE
B) Goal: Get M4R into SAGE. 



Status:
