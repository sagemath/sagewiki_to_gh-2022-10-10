
1. p-adics 

Lesson: SVN + HG only mix together well if you're only creating new files 

Status:  

   1. Code in place, still unexposed in SAGE, working on more doctests. 
   1. Lazy p-adics currently under development  
   1. Extension fields are next 
Goals: Make (i)-(iii) production ready 

Problems: (a) Extensions may be extremely slow and may require <a href="/FiniteField">FiniteField</a>, <a href="/PolyQuotientRing">PolyQuotientRing</a> optimization to fix. 

People: David Roe (DR), David Harvey (DH), Craig Citro (CC), Genya Zaytman (YZ) 

Timeline:  

      1. Done by AWS: DR/DH/CC/YZ  
      1. Done by AWS: DR 
      1. Unramified by AWS: CC/DR 
      1. All of us will be at AWS 
2. Symbolic manipulation 

Problems:  

            1. Hard to choose when to simplify 
            1. Still dependant on Maxima for some things -- will this limit us in the future? (consensus here seems to be probably not) 
Status:  

            1. Plotting still untouched, esp wrt speed (we think) 
            1. We have equality working! Also, formal inequalities ready to go (in principle) 
Goals:  

            1. More doctests, production ready code 
            1. Explore Mathematica, Maple and Maxima, add functionality.  Go through a calculus textbook and make sure we can do all the problems. 
            1. More user feedback on interface and features 
            1. Rouche's Algorithm 
            1. Turn function objects/symbolic expressions into C/SageX code. 
            1. Make (v) part of a SAGE-wide system 
People: Bobby M, Nathan, Soroosh Yazdam, Robert Bradshaw 

Timeline:  

            1. Before 3/1, Initial Public Release 
            1. Get a fair amount of this done by 3/8 
            1. March/April (Nathan and Mathematica worksheets) 
            1. Soroosh wants to do this when the code base is ready, research other programs by 4/1 
            1. April/May 
            1. Later 
3. Low level optimization of SAGE infrastructure 

Goals:  

            1. Optimize the code that SageX generates: make Pythonesque syntax fast in lieu of ugly, nasty, Python/C API calls (to avoid coredumps, it's hard to read, easy to write bugs and you feel guilty when you write it) 
            1. Speed up SAGE integer construction by changing to handwritten C in SageX 
            1. Integer pool? 
Problem: In (ii) Tying handwritten C into SageX in a few specific places when SageX is nice but slow.  We don't necessarily want to make this easy, and don't know exactly how we should change SageX in order to do this. 

Status:  

               1. Fairly far along in indexing into lists, but goal (i) is more long term.  People can ask why is something slow, look at the generated C code and see if there's a better way to do it.  Make a wiki page. 
               1. Have code written, trying to get it in place.  Understand what's going on.  See Problem. 
               1. Still thinking about it. 
People: Robert Bradshaw, Martin, David Harvey (sick of this project now) 

Timeline:  

               1. List indexing: 48 hours (Robert).  Make a wiki page: more as it comes along. 
               1. Figure out problem and implement solution by 3/1 
               1. After 2. 
               1. Look at schedule for Google summer of code.  Python Software Foundation wiki -- describe this project, by 4/1.   
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
  | Sparse | Dense
GF(2) | (A) | (B)
Numerical | (C) | (D)
Exact | (E) | (F)

A) M4R (Method of Four Russians) 

Remark: Do as dense up to certain size, ie A contained in B up to some size 

Goal: Get M4R into SAGE 

B) Goal: Get M4R into SAGE.  

Example current timings: 
  | SAGE | Linbox | Bard Gaussian Elim | Bard M4R | Magma
6000x6000 |   | 15s | 4s | 1.7s | 2.23s
3000x3000 | 20s | 5s | 0.420s | 0.2s | 0.32s

Status: 

Goal: (i) Get M4R into SAGE 

               * (ii) Figure out where to draw the line 
People: Martin 

Timeline: Once B is done 

B) Goal: Get M4R into SAGE.  

Example current timings: 
  | SAGE | Linbox | Bard Gaussian Elim | Bard M4R | Magma
6000x6000 |   | 15s | 4s | 1.7s | 2.23s
3000x3000 | 20s | 5s | 0.420s | 0.2s | 0.32s

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

      * (Sparse integer matrices) and (Sparse rational matrices): close 
Status: Some benchmarks 

Goal:  

   1. Rational sparse echelon via multi-modular working 
   1. Optimize 
Timeline:  

   1. 72 hours 
   1. By 3/10 
Remark: Still behind Magma because of mod p, but linbox may help. 

F) Status: Lots of benchmarks.  Much faster than two weeks ago.  Linbox integration coming along nicely. 

Remark: Magma may not be producing provably correct answers 

Goal:  

   1. Better prime selection in multi-modular: maybe 4x speedup 
   1. More specialized matrix classes 
   1.  Optimize matrix-vector and vector-matrix for specialized classes 
   1. A lot of optimization (motivated by modular symbols) 
   1. Raw methods, much of this will have to be in specialized matrix classes.  Maybe not do this (William is not currently convinced)? Look into this. 
   1. Examples 
Timeline:  

   1. By 3/10 
   1. Long term 
7. Examples 

They autotest, done by today -- Rishi 

Plan: If you want to put tests in a docstring that the user doesn't see 
