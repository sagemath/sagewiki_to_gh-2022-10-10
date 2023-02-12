

# Dev Days 1: Exact Linear Algebra

   * Michael Abshoff -> <a href="/LinBox">LinBox</a> debianization 
   * <a href="/MartinAlbrecht">MartinAlbrecht</a> -> M4RI GF(2) 
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

## Dense GF(2)

* implement LQUP decomposition [<a href="/ClementPernet">ClementPernet</a>, <a href="/MartinAlbrecht">MartinAlbrecht</a>] 
      * ~~implement LQUP routine~~ [Clement] 
      * implement `_mzd_addmul_weird` [Clement] 
      * implement LQUP basecase routine based on M4RI `mzd_lqup_m4ri` [<a href="/MartinAlbrecht">MartinAlbrecht</a>] 
            * dont' zero out in _mzd_gauss_submatrix (!) 
            * don't zero out below 
            * remember rowswaps => P 
            * remember Q[r] = c (translate to Lapack style later :-) ) 
      * ~~implement TRSM routine~~ [Clement] 
      * implement inplace triangular matrix inversion `mzd_trtri` [Clement] 
      * implement triangular triangular matrix multiplication `mzd_trtrm` [Clement] 
      * ~~implement column swaps~~ [<a href="/MartinAlbrecht">MartinAlbrecht</a>] 
      * ~~implement column rotations~~ [<a href="/MartinAlbrecht">MartinAlbrecht</a>] 
      * ~~implement memory efficient mzd_addmul_strassen~~ [Martin] 
            * See Clement's et al. paper on memory efficient Strassen-Winograd 
* ~~implement Arne's asymptotically fast elimination algorithm~~ [<a href="/MartinAlbrecht">MartinAlbrecht</a>] 
      * It was agreed that this is not what we want for M4RI, a toy implementation is available at: <a href="http://www.informatik.uni-bremen.de/cgi-bin/cgiwrap/malb/blosxom.pl/2008/06/13#gauss-jordan-storjohann">http://www.informatik.uni-bremen.de/cgi-bin/cgiwrap/malb/blosxom.pl/2008/06/13#gauss-jordan-storjohann</a> 
* implement multi-core multiplication with optimal speed-up 
      * OpenMP seems to be nice and easy 
      * 2 cores probably main target, but think about 4 cores too 
* improve efficiency of M4RM 
      * ~~try 7 instead of 8 Gray code tables to leave room for the actual matrix in L1~~ [<a href="/MartinAlbrecht">MartinAlbrecht</a>] 
            * It seems slower to be slower to use 7 tables rather than 8 
      * try say 16 tables instead of 8 on the <a href="/Core2Duo">Core2Duo</a> [<a href="/MartinAlbrecht">MartinAlbrecht</a>] 
      * try Bill Hart's idea for L1 cache efficiency on the <a href="/Core2Duo">Core2Duo</a> [<a href="/MartinAlbrecht">MartinAlbrecht</a>] 
            * The idea is: construct 8 gray code tables but use one once it is in L1 a lot to reduce before using the second 
      * ~~try to fit three matrices rather than two into L2 or understand why it works so good for two~~ [<a href="/MartinAlbrecht">MartinAlbrecht</a>] 
            * it works since once we've written the date we can go on computing and let a cache handle the rest 
            * a cache miss for reading on the other hand really prevents us from computing 
      * ~~detect L1/L2 cache sizes at runtime and choose optimal parameters for them~~ [<a href="/MartinAlbrecht">MartinAlbrecht</a>] 
      * Implement memory management s.t. the sys time on Opterons decreases. 
      * implement Bill's <a class="http" href="http://groups.google.com/group/sage-devel/msg/6279228095b3d9f7">half table idea</a> and benchmark it  

## Sparse GF(2) (and other small finite fields)

* [Arne, Ralph, Clément, Rob Miller] 
* Sparse Reduced Echelon form (RPW) 
      * Sparse Elimination:  
            * improve <a href="/LinBox">LinBox</a> gauss-domain 
            * eclib sparse elimination 
            * .... 
* .... 

## Hermite Normal Form

* [Arne, Clément, William] 
* new algorithm, based on system solving (Arne Storjohann) -> already an implementation 
      * integrate it in IML 
      * benchmark it against Sage 
* generalization: block vector system solving 
      * implementation 
      * benchmark 
* LLL trick for the existing implementation in Sage (William & Clément) 

## Polynomial Matrix computations

* [Burcin] 
* Nullspace computation (Burcin) 

## Cyclotomic linear algebra

* [Rob Bradshaw, Craig, William] 

## P-adic linear algebra

* [David Roe, Craig, David Cohet] 

## LinBox debianization and 1.1.6 spkgization

* [mabshoff, Clément] 
* get rid of gmp++ 
* generate and test linbox-1.1.6rc0.spkg 