

= Problem: Thread Safety =

SAGE includes the C/C++ libraries listed below.  For each library, determine whether or not (or to what extent) it is thread safe.


"Be careful if your application uses libraries or other objects that don't explicitly guarantee thread-safeness. When in doubt, assume that they are not thread-safe until proven otherwise.
Thread-safeness: in a nutshell, refers an application's ability to execute multiple threads simultaneously without "clobbering" shared data or creating "race" conditions. For example, suppose that you use a library routine that accesses/modifies a global structure or location in memory. If two threads both call this routine it is possible that they may try to modify this global structure/memory location at the same time. If the routine does not employ some sort of synchronization constructs to prevent data corruption, then it is not thread-safe. The implication to users of external library routines is that if you aren't 100% certain the routine is thread-safe, then you take your chances with problems that could arise." -- from [http://www.llnl.gov/computing/tutorials/pthreads/ the pthreads tutorial]


== GMP: Arbitrary Precision Arithmetic Library ==
== GSL: Gnu Scientific Library ==
== MPFR: Arbitrary precision real arithmetic ==
== NTL: Number theory C++ library ==

== OpenSSL: Secure networking ==

== PARI: Number theory calculator ==

== Singular: fast commutative and noncommutative algebra ==
Singular doesn't quite have a library mode yet.  But it also includes various libraries.
