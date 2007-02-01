= (Preliminary) SEP 2: Parallelization Plans For SAGE =

This is a SAGE enhancement proposal. 

AUTHOR: William Stein
COPYRIGHT: GNU Free Documentation License, 2007.

The core SAGE library is a collection of Python and sagex files. 

== Basic Principles ==

  1. Parallel methods should be viewed as a means to an end -- speedups.  Never parallelize any computation except to speed up a calculation beyond what can be done using sequential techniques. 
  2. Parallel methods should never completely replace sequential implementations.  Parallel algorithms are often very complicated to understand and test, so we need to at a ''minimum'' have a randomized test function that compares with the output of purely sequential code. 
  3. Do not write extremely complicated parallel code that nobody can understand or maintain.  Because SAGE is an open source system that is widely developed, it is ''crucial'' that it be readable.
  4. It is *crucial* that implementation of parallel methods in SAGE have the following properties:
      * It can be done incrementally.  One must be able to start with almost any specific operation or algorithm in SAGE and make a parallel version without having to drastically change code all over SAGE.  Any proposed solutions that violate this fails our needs.
      * It doesn't depend on any libraries or tools that are not open source and free, and all dependencies must work on the SAGE target platforms: Linux, OS X, Windows, (and soon Solaris). 
      * All dependencies for parallel algorithms must be included standard with SAGE.  
 
== Architecture ==
 
We propose that parallel optimizations for SAGE are carried out (in parallel!) at three distinct levels: low (multithreaded), medium (mpi), and high (dsage task farming).

=== 1. Low level -- shared memory (mostly multicore desktop/laptop) ===

Proposed tool: the standard POSIX thread library pthread

Justification: 
   * pthread is available on all target platforms, is mature, and is well supported and optimized
   * with some thought I think we can make it more usable for our applications (macros, preparsing whatever).
   

Design issues:
   * Have a global variable nthreads

Problems:
   * That Python is not thread safe means that many natural approaches to optimizing the SAGE libraries is not a good idea. 
   * It's difficult to ''decide'' on how many threads to spawn at any given point.
   * (When) Should one use a thread pool?
   * Self-imposed constraint: pthreads can '''only''' be used as follows:{{{
    ... arbitrary sagex code ...
    # atomic threaded c-level function call that gets no PyObject*'s and makes no Python/C API calls
    # called with explicit input that gives the max number of threads it is allowed to spawn (-1 = any number)
    ... arbitrary sagex code ...
}}}
        * This will be used to speed up mostly arithmetic-type stuff when creating threads doesn't dominate runtime. 
        * Sample problems: matrix addition, vector addition, scalar multiplication, polynomial arithmetic, L-series coefficients, approximation of infinite sums, matrix times vector

=== 2. Middle -- homogeneous trusted cluster ===

Proposed tool: ipython1 with MPI under the hood.

Justification: 
  * This is the hardware that the ipython developers use.
  * It's written in Python, well tested, and will be included in SAGE anyways.

Example problems:
  * multi-modular linear algebra algorithms
  * systems of Hecke eigenvalues
  * speed-up very generic matrix operations in some cases

=== 3. High -- heterogenous task farm (both trusted and untrusted) ===

Proposed tool: dsage

Justification:
  * Written in Python to address specific problems we have.
  
Example problems:
  * integer factorization
  * creation of a wide range of tables (e.g., tables of elliptic curves, modular forms, computing {{{[f(n) for n in range(...)]}}} where f is a function in GAP, PARI, Magma, etc.)
  * computing plots of a collection of functions (especially high quality 3d)
  * search for abc triples :-)
  * 
  
