= (Preliminary) SEP 2: Parallelization Plans For SAGE =

This is a SAGE enhancement proposal. 

AUTHOR: William Stein
COPYRIGHT: GNU Free Documentation License, 2007.

The core SAGE library is a collection of Python and sagex files. 

== Basic Principles ==

Many of these are motivated by my (Stein's) perspective as the '''maintainer''' and integrated of SAGE, and recruiter of new developers...

  1. Parallel methods should always be viewed as a means to an end -- speedups.  Never parallelize any computation except to speed up a calculation beyond what can be done using sequential techniques. 
  2. Parallel methods should never completely replace sequential implementations.  Parallel algorithms are often very complicated to understand and test, so we need to at a ''minimum'' have a randomized test function that compares with that output of purely sequential code. 
  3. Do not write insanely complicated parallel code that nobody can understand or maintain.  Because SAGE is an open source system that is widely developed, it is ''crucial'' that it be readable.
  4. It is *crucial* that implementation of parallel methods in SAGE have the following properties:
      * It can be done incrementally.  One must be able to start with almost any specific operation or algorithm in SAGE and make a parallel version without having to drastically change code all over SAGE.  Any proposed solutions that violate this fail our needs.
      * It doesn't depend on any libraries or tools that are not open source and free, and all dependencies must work on the SAGE target platforms: Linux, OS X, Windows, (and soon Solaris). 
      * For any core tools that are needed must be made part of SAGE.
 
== Architecture ==
 
There are three levels to consider.

=== 1. Low -- shared memory (mostly multicore desktop/laptop) ===

Proposed tool: pthread

Justification: 
   * pthread is available on all target platforms and is well supported
   * mature
   * with some thought I think we can make it more usable for our applications (macros, preparsing whatever).
   

Design issues:
   * Have a global variable nthreads

Problems:
   * That Python is not thread safe is a '''major source of misery'''.
   * It's difficult to ''decide'' on how many threads to spawn at any given point.
   * (When) Should one use a thread pool?
   * If we try to do too much, this will be really hard.
   * If we make a couple of very clear constraints and rules, this will be doable, but maybe frustrating.  Possibilities:
        * pthreads can '''only''' be used as follows:{{{
    ... arbitrary sagex code ...
    # atomic threaded c-level function call that gets no PyObject*'s and makes no Python/C API calls
    # called with explicit input that gives the max number of threads it can spawn.
    ... arbitrary sagex code ...
}}}
        * This will be used to speed up mostly arithmetic-type stuff when creating threads doesn't dominate runtime. 

Alternative tool: multiple processes and a shared memory segment
   * via UPC -- heavy and hard to build (??)  maybe not right for us, because it's mainly for rather uniform computations.
   * via shared pages -- might not be fast enough.




=== 2. Middle -- homogeneous trusted cluster ===

Proposed tool: ipython1 (with mpi)

Justification: 
  * This is the hardware that the ipython developers use.
  * It's written in Python, well tested, and will be included in SAGE anyways.

=== 3. High -- heterogenous task farm (both trusted and untrusted) ===

Proposed tool: dsage

Justification:
  * Written in Python to address specific problems we have.
  
  
