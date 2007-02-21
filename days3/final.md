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

---- /!\ '''Edit conflict - other version:''' ----
Goal: Get M4R into SAGE
B) Goal: Get M4R into SAGE. 
Example current timings:
|| ||SAGE||Linbox||Bard Gaussian Elim||Bard M4R||Magma||
||6000x6000|| ||15s||4s||1.7s||2.23s||
||3000x3000||20s||5s||0.420s||0.2s||0.32s||


Status:

---- /!\ '''Edit conflict - your version:''' ----
Goal: (i) Get M4R into SAGE
      (ii) Figure out where to draw the line
People: Martin
Timeline: Once B is done

B) Goal: Get M4R into SAGE. 
Example current timings:
|| ||SAGE||Linbox||Bard Gaussian Elim||Bard M4R||Magma||
||6000x6000|| ||15s||4s||1.7s||2.23s||
||3000x3000||20s||5s||0.420s||0.2s||0.32s||
People: Martin
Status: Now understand M4R
Timeline: Soon.  3/15

C) Waiting on Suvrit Sra, otherwise clueless.  Could do using Suvrit's (or other) libraries if this stalls.
Goal: Implement something to compare to Suvrit
People: Josh
Status: Have a little bit, but it's not very good.
Timeline: Incremental

D) Matrix-vector now BLAS (like everyone)
Using numpy for everything else seems to be the best plan
Goal: Convert
People: Josh
Timeline: 2 weeks

E) (Sparse integer vectors) and (Sparse rational vectors): working, not optimized.  Both in progress
   (Sparse integer matrices) and (Sparse rational matrices): close
Status: Some benchmarks
Goal: (i) Rational sparse echelon via multi-modular working
      (ii) Optimize
Timeline: (i) 72 hours
          (ii) By 3/10
Remark: Still behind Magma because of mod p, but linbox may help.

F) Status: Lots of benchmarks.  Much faster than two weeks ago.  Linbox integration coming along nicely.
Remark: Magma may not be producing provably correct answers
Goal: (i) Better prime selection in multi-modular: maybe 4x speedup
      (ii) More specialized matrix classes
      (iii) Optimize matrix-vector and vector-matrix for specialized classes
      (iv) A lot of optimization (motivated by modular symbols)
      (v) Raw methods, much of this will have to be in specialized matrix classes.  Maybe not do this (William is not currently convinced)? Look into this.
      (vi) Examples
Timeline: (i) By 3/10
          (ii) Long term
          (iii) 

7. Examples
They autotest, done by today -- Rishi

Plan: If you want to put tests in a docstring that the user doesn't see
