= Parallelization Plans For SAGE =

The core SAGE library is a collection of Python and sagex files. 

== Basic Principles ==

  1. Parallel methods should always be viewed as a means to an end -- speedups.  Never parallelize any computation except to speed up a calculation beyond what can be done using sequential techniques. 
  2. Parallel methods should never completely replace sequential implementations.  Parallel algorithms are often very complicated to understand and test, so we need to at a ''minimum'' have a randomized test function that compares with that output of purely sequential code. 
  3. Do not write insanely complicated parallel code that nobody can understand or maintain.  Because SAGE is an open source system that is widely developed, it is ''crucial'' that it be readable.
  4. It is *crucial* that implementation of parallel methods in SAGE have the following properties:
      * It can be done incrementally.  One must be able to start with almost any specific operation or algorithm in SAGE and make a parallel version without having to drastically change code all over SAGE.  Any proposed solutions that violate this fail our needs.
      * It doesn't depend on any libraries or tools that are not open source and free, and all dependencies must work on the SAGE target platforms: Linux, OS X, Windows, (and soon Solaris). 
      * For any core tools that are needed must be made part of SAGE.
 
== Architecture ==
 
There are three levels to consider.

=== 1. Low level -- implement using pthreads ===
