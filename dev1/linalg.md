= Dev Days 1: Exact Linear Algebra =

  * Michael Abshoff -> LinBox debianization
  * MartinAlbrecht -> M4RI GF(2)
  * Nick Alexander -> cylcotomic linalg
  * Gregory Bard -> M4RI
  * Rob Beezer
  * Tom Boothby
  * Craig Citro -> cyclotomic linalg, p-adic linalg
  * Burcin Erocal -> nullspace of polynomial matrices
  * Robert Miller (especially sparse GF(2)) -> sparse GF(2)
  * David Roe (p-adic linear algebra?) -> cyclotomic linear algebra
  * Arne Storjohann -> HNF, Sparse GF(2) Linalg
  * William Stein -> Cyclotomic linear algebra, HNF (LLL)
  * Ralf-Philipp Weinmann -> Sparse Elimination, Nullspace

== Dense GF(2) ==
 * implement LQUP decomposition [Clement, MartinAlbrecht]
   * implement LQUP routine [Clement]
   * implement TRSM routine [Clement]
   * --(implement efficient column swaps)-- [MartinAlbrecht]
   * implement efficient column rotations [MartinAlbrecht]
     * SSE2 might help a lot here
   * --(implement memory efficient mzd_addmul_strassen)-- [Martin]
     * See Clement's et al. paper on memory efficient Strassen-Winograd
 * implement Arne's asymptotically fast elimination algorithm [MartinAlbrecht]
 * implement multi-core multiplication with optimal speed-up
   * OpenMP seems to be nice and easy
   * 2 cores probably main target, but think about 4 cores too
 * improve efficiency of M4RM
   * try 7 instead of 8 Gray code tables to leave room for the actual matrix in L1 [MartinAlbrecht]
     * It seems slower to be slower to use 7 tables rather than 8
     * L1 cache doesn't seem to be the main reason for performance then
     * try say 16 tables.
   * try to fit three matrices rather than two into L2 or understand why it works so good for two
   * detect L1/L2 cache sizes at runtime and choose optimal parameters for them
   * implement Bill's [http://groups.google.com/group/sage-devel/msg/6279228095b3d9f7 half table idea] and benchmark it 

== Sparse GF(2) (and other small finite fields) ==
 [Arne, Ralph, Clément, Rob Miller]
 * Sparse Reduced Echelon form (RPW)
   * Sparse Elimination: 
     * improve LinBox gauss-domain
     * eclib sparse elimination
     * ....
 * ....


== Hermite Normal Form ==
 [Arne, Clément, William]
 * new algorithm, based on system solving (Arne Storjohann) -> already an implementation
   * integrate it in IML
   * benchmark it against Sage
 * generalization: block vector system solving
   * implementation
   * benchmark
 * LLL trick for the existing implementation in Sage (William & Clément)

== Polynomial Matrix computations ==
 [Burcin]
 * Nullspace computation (Burcin)

== Cyclotomic linear algebra ==
 [Rob Bradshaw, Craig, William]

== P-adic linear algebra ==
 [David Roe, Craig, David Cohet]

== LinBox debianization and 1.1.6 spkgization ==
 [mabshoff, Clément]
 * get rid of gmp++
 * generate and test linbox-1.1.6rc0.spkg
