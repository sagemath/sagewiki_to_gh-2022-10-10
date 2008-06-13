= Dev Days 1: Exact Linear Algebra =

  * Michael Abshoff
  * Martin Albrecht
  * Nick Alexander
  * Gregory Bard
  * Rob Beezer
  * Tom Boothby
  * Craig Citro
  * Burcin Erocal
  * Robert Miller (especially sparse GF(2))
  * David Roe (p-adic linear algebra?)
  * Arne Storjohann
  * William Stein
  * Ralf-Philipp Weinmann

== GF(2) ==
 * implement LQUP decomposition [Clement]
   * implement LQUP routine
   * implement TRSM routine
   * implement efficient column swaps/rotations [Martin]
     * SSE2 might help a lot here
   * implement memory efficient mzd_addmul_strassen [Martin]
     * See Clement's et al. paper on memory efficient Strassen-Winograd
 * implement Arne's asymptotically fast reduction algorithm [Martin]
 * implement multi-core multiplication with optimal speed-up
   * OpenMP seems to be nice and easy
   * 2 cores probably main target, but think about 4 cores too
 * improve efficiency of M4RM
   * try 7 instead of 8 Gray code tables to leave room for the actual matrix in L1
   * try to fit three matrices rather than two into L2 or understand why it works so good for two
   * detect L1/L2 cache sizes at runtime and choose optimal parameters for them
   * implement Bill's half table idea and benchmark it
