

# (Preliminary) SEP 2: Optimizing the SAGE library using Parallel Techniques

AUTHOR: William Stein 

COPYRIGHT: GNU Free Documentation License, 2007. 


## Basic Principles

   1. Parallel methods should be viewed as a means to an end -- speedups.  Never parallelize any computation except to speed up a calculation beyond what can be done using sequential techniques.  
   1. Parallel methods should never completely replace sequential implementations.  Parallel algorithms are often very complicated to understand and test, so we need to at a _minimum_ have a randomized test function that compares with the output of purely sequential code.  
   1. Do not write extremely complicated parallel code that nobody can understand or maintain.  Because SAGE is an open source system that is widely developed, it is _crucial_ that it be readable. 
   1. It is *crucial* that implementation of parallel methods in SAGE have the following properties: 
               * It can be done incrementally.  One must be able to start with almost any specific operation or algorithm in SAGE and make a parallel version without having to drastically change code all over SAGE.  Any proposed solutions that violate this fails our needs. 
               * It doesn't depend on any libraries or tools that are not open source and free, and all dependencies must work on the SAGE target platforms: Linux, OS X, Windows, (and soon Solaris).  
               * All dependencies for parallel algorithms must be included standard with SAGE.   

## Architecture

We propose that parallel optimizations for SAGE are carried out (in parallel!) using three complementary approaches: fine (multithreaded), medium (mpi), and coarse (dsage task farming). 

COMMENTS: 

   1. Collapse the two bottom levels (i.e., thread and message passing)! 
   1. Avoid threads if at all possible! 
               * But sometimes use them.  
               * Parallel databases?! 
               * Scheduling of threads is very hard. 
               * Scaling not the same for threads... (something is possible but...) 
   1. MPI -- harder to write, but maybe less subtle. 
   1. Not at all clear how to manage how parallel each component should be. 
   1. Be realistic.  Don't try to solve the general problem... 
   1. If you want up and running soon (I do!); the only choice is MPI.  Duh. 
   1. Definitely want support library to make it easy to use MPI by programmers. 
   1. SAGE -- target audience = working mathematician researcher; quick prototyping; not an industrial applications... 
   1. Resources -- evil malloc; pthreads can very quickly give your application level info.  Need some sort of "how much 'parallel power' is available".   Be single threaded.... 
1. TWO LEVELS:  i.e., collapse the top two. 
               * coarse -- proudly parallel 
               * fine -- maybe use gasnet. 
1. THREE LEVELS OF USERS: 
               1. task farmer 
               1. i do parallel programming, e.g., using SAGE constructs. 
               1. i use a function that happens to be parallel (and maybe don't know) 
1. MPI: 
               * you might think it's static from tutorials... 
               * but it's dynamic (!)   MPI-2.* only though. 
               * parallel programming is hard. 
1. pthreads -- programming model is "simpler", since you can ask for bazillions of threads... and get a speedup. 
1. java is nicely parallel already, so why don't you just write everything in java!!  because: (1) maintenance issues and frustration, (2)  
1. cilk 
1. what will help the target (research mathematicians) the most with their research??  (task farming.)  Enable people to do what they would otherwise not do. 
1. distinguish: ideal versus reality -- KISS. 
1. Task farming is first thing people are interested in.  Step 1.  BUT, then I will want to *parallelize my algorithms* transparently.  Optimize iteratively. 
1. Loosing the intermediate level: 
                  * - low level: - Python people LOOSE something in between - coarse grain: 
1. moving around complicated mathematical objects is interesting and subtle. 
1.  

### 1. Fine level -- shared memory (mostly multicore desktop/laptop)

Proposed tool: the standard POSIX thread library pthread 

Justification:  

      * pthread is available on all target platforms, is mature, and is well supported and optimized 
      * with some thought I think we can make it more usable for our applications (macros, preparsing whatever). 
Design issues: 

      * Have a global variable nthreads 
Problems: 

      * That Python is not thread safe means that many natural approaches to optimizing the SAGE libraries is not a good idea.  
      * It's difficult to _decide_ on how many threads to spawn at any given point. 
      * (When) Should one use a thread pool? 
      * Self-imposed constraint: pthreads can **only** be used as follows:```txt
    ... arbitrary sagex code ...
    # atomic threaded c-level function call that gets no PyObject*'s and makes no Python/C API calls
    # called with explicit input that gives the max number of threads it is allowed to spawn (-1 = any number)
    ... arbitrary sagex code ...
```
                     * Sample problems: non-generic matrix addition, non-generic scalar multiplication, polynomial arithmetic, L-series coefficients, approximation of infinite sums, matrix times vector 

### 2. Medium level -- homogeneous trusted cluster

Proposed tool: ipython1 with MPI under the hood. 

Justification:  

   * This is the hardware that the ipython developers use. 
   * It's written in Python, well tested, and will be included in SAGE anyways. 
Example problems: 

   * multi-modular linear algebra algorithms 
   * systems of Hecke eigenvalues 
   * speed-up very generic matrix operations in some cases 
   * Optimizing interpreted python code with various loops, etc., where individual operations don't take long. 

### 3. Coarse level -- heterogenous task farm (both trusted and untrusted)

Proposed tool: dsage 

Justification: 

   * Written in Python to address specific problems we have. 
Example problems: 

   * proudly parallel problems. 
   * integer factorization 
   * creation of a wide range of tables (e.g., tables of elliptic curves, modular forms, computing `[f(n) for n in range(...)]` where f is a function in GAP, PARI, Magma, etc.) 
   * computing plots of a collection of functions (especially high quality 3d) 
   * search for abc triples :-) 
   * lots of *end user* use of parallelism for their own work. 