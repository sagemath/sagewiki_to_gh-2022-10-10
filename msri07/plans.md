= Parallelization Plans For SAGE ==

The core SAGE library is a collection of Python and sagex files. 

== Basic Principles == 
     1. Parallel methods should always be viewed as a means to an end -- speedups.  Never parallelize any computation except to speed up a calculation beyond what can be done using sequential techniques. 
     2. Parallel methods should never completely replace sequential implementations.  Parallel algorithms are often very complicated to understand and test, so we need to at a ''minimum'' have a randomized test function that compares with that output of purely sequential code. 
