

# Specific Tables/Projects

[[_TOC_]] 

The misc tables are listed here: 

<a href="http://modular.fas.harvard.edu/Tables/">http://modular.fas.harvard.edu/Tables/</a> 

The Harvard URL is the best, since the <a href="http://wstein.org/Tables">http://wstein.org/Tables</a> has none of the cgi-bin script dynamic data. 


## Component Groups of J0(N)(R) and J1(N)(R)

* URL: <a href="http://wstein.org/Tables/real_tamagawa/">http://wstein.org/Tables/real_tamagawa/</a> and <a href="http://wstein.org/Tables/compgrp/">http://wstein.org/Tables/compgrp/</a>.    The second page has much more extensive data and a conjecture.  
* <a class="http" href="http://sage.math.washington.edu/home/wstein/days/17/c_oo.pdf">Page explaining the algorithm</a> 
* New Code: 
This function computes the $J_0(N)$ real component groups.  
```txt
def f(N):
    M = ModularSymbols(N).cuspidal_subspace()
    d = M.dimension()//2
    S = matrix(GF(2),2*d,2*d, M.star_involution().matrix().list()) - 1
    return 2^(S.nullity()-d)
```
For $J_1(N)$ it is: 
```txt
def f(N):
    M = ModularSymbols(Gamma1(N)).cuspidal_subspace()
    d = M.dimension()//2
    S = matrix(GF(2),2*d,2*d, M.star_involution().matrix().list()) - 1
    return 2^(S.nullity()-d)
```
Future extension: one could replace Gamma1(N) by GammaH(N,...).  One could also do the new subspace. 

And note Frank's conjecture: 

Conjecture: 
```txt
Let m = #odd prime factors of N +  {1, if N = 0 mod 8
                                   {0, otherwise.
Then the component group is isomorphic to (Z/2Z)^f, where f = 2^m - 1.
```
the above conjecture is wrong, but the following matches our data (up to level N<=2723): 
```txt
Conjecture (Boothby-Stein):
Let m = #odd prime factors of N -  {1, if N != 0 mod 8
                                   {0, otherwise.

Then the component group is isomorphic to (Z/2Z)^f, where f = 2^m - 1, unless N=1,2,4, in which case the component is
```
Soroosh -- the prime level case is known.  See Calegari and Emerton (<a href="http://www.math.northwestern.edu/~fcale/papers/moddeg2.pdf">http://www.math.northwestern.edu/~fcale/papers/moddeg2.pdf</a>) which *just* cites Agashe and Merel (<a href="http://wstein.org/home/wstein/days/17/Merel_Laccouplement_de_Weil_entre_le_sous-group.pdf">http://wstein.org/home/wstein/days/17/Merel_Laccouplement_de_Weil_entre_le_sous-group.pdf</a> -- page 12). 

The following worksheet has code for computing the action of Atkin-Lehner on the component group: 

* <a href="days17/projects/presagedays/discussion/days17____atkin_lehner_on_real_component_group.sws">days17____atkin_lehner_on_real_component_group.sws</a> (see also <a href="http://nt.sagenb.org/home/pub/22/">http://nt.sagenb.org/home/pub/22/</a>) 
_IDEA!_ Page 174 of Ling-Oesterle has a corollary 1 with a 'very similar formula'!  It's about the number of rational 2-torsion points on J0(N) in the Shimura subgroup and analyzes this using Atkin-Lehner operators.  Since the real component group has to do with real torsion this formula actually gives maybe a lower bound too.  Here's the paper: <a href="http://sage.math.washington.edu/home/wstein/days/17/Ling-Oesterle-The_Shimura_Subgroup_of_J0N.pdf">http://sage.math.washington.edu/home/wstein/days/17/Ling-Oesterle-The_Shimura_Subgroup_of_J0N.pdf</a> 


## Cuspidal Subgroup

Computing the structure of the cuspidal subgroup of J0(N) and J1(N) (say).  

* URL: <a href="http://wstein.org/Tables/cuspgroup/">http://wstein.org/Tables/cuspgroup/</a>  (the displayed formula is backwards at the top) 
* New Sage code: 

```txt
def cuspidal_subgroup_J0(N):
    J = J0(N)
    I = J.cuspidal_subgroup().invariants()
    # maybe pickle J
    return I
```

```txt
def cuspidal_subgroup_J1(N):
    J = J1(N)
    I = J.cuspidal_subgroup().invariants()
    # maybe pickle J
    return I
```
BUT WAIT -- isn't there an _a priori_ formula for this structure/order?   Yes -- Ligozat, but not really -- that gives only rational cuspidal subgroup. The algorithm is explained in cuspidal subgroup section of <a href="http://www.math.mcmaster.ca/~syazdani/papers/paper1.pdf">http://www.math.mcmaster.ca/~syazdani/papers/paper1.pdf</a>. Preliminary implementation of this algorithm is now ticket #6925 

Anyway, I'm computing a few of these here, as a test of the modular symbols code, etc., since this is easy: 

<a href="http://sage.math.washington.edu/home/was/db/days17/cuspidal_subgroup_J0N/">http://sage.math.washington.edu/home/was/db/days17/cuspidal_subgroup_J0N/</a> 

<a href="http://sage.math.washington.edu/home/was/db/days17/cuspidal_subgroup_J1N/">http://sage.math.washington.edu/home/was/db/days17/cuspidal_subgroup_J1N/</a> 

Soroosh and I also thought about cuspidal torsion and had some ideas which we recorded here:   <a href="http://sage.math.washington.edu/home/wstein/days/17/cusptor-ideas.pdf">http://sage.math.washington.edu/home/wstein/days/17/cusptor-ideas.pdf</a> 

They reference this not-finished-paper: <a href="http://sage.math.washington.edu/home/wstein/days/17/calegari-stein-tor.pdf">http://sage.math.washington.edu/home/wstein/days/17/calegari-stein-tor.pdf</a> 


## Discriminants of Hecke Algebra

Computation of discriminants of various Hecke algebras. 

* URLs:  
      * <a href="http://wstein.org/Tables/dischecke.html">http://wstein.org/Tables/dischecke.html</a> 
      * <a href="http://trac.sagemath.org/sage_trac/ticket/6635">http://trac.sagemath.org/sage_trac/ticket/6635</a> 
Amazingly, it seems that there is "discriminants of Hecke algebras" implementation in Sage! Here is a straightforward algorithm: 

1. The input is the level $N$. 
1. Chose a random vector $v$ in the space $M$ of cuspidal modular symbols of level $N$. 
1. Compute the sturm bound $B$. 
1. Compute the products $T_1(v), ..., T_B(v)$, and find a basis $b_i$ for the ZZ-module they span. 
1. Find Hecke operators $S_1, ..., S_n$ such that $S_i(v) = b_i$.  (This is linear algebra -- inverting a matrix and a matrix multiply.) 
1. Compute the determinant $det ( Trace(S_i * S_j) )$.  That is the discriminant.  This also gives a basis for the Hecke algebra, which is very useful for lots of things.  
Note: See <a href="http://trac.sagemath.org/sage_trac/ticket/6768">http://trac.sagemath.org/sage_trac/ticket/6768</a> for very slow code for computing a basis for the Hecke algebra.  

Faster code up at <a href="http://trac.sagemath.org/sage_trac/ticket/6911">http://trac.sagemath.org/sage_trac/ticket/6911</a> 

Here is a more complicated algorithm, but it might suck because of hidden denseness! 

1. The input is the level $N$. 
1. If $N$ is divisible by a prime $p<sup>3$ and $X_0(N/p</sup>3)$ has positive genus, then the discriminant is $0$, as one can see by taking images of forms of level $N/p^3$. 
1. I think the above is an if and only if condition for when the discriminant is $0$.  See I think Coleman-Voloch. 
1. The actual algorithm now.   
            1. Find a random Hecke operator $t$ such that the charpoly of $t$ has nonzero discriminant. 
            1. Choose a random vector $v$ in the space of cuspidal modular symbols. 
            1. Let $B$ be the Sturm bound. 
            1. Compute the images $T_n(v)$ for $n$ up to the Sturm Bound.  

## Compute a table of semisimplications of reducible representations of elliptic curves

Ralph Greenberg asked for a specific example of an elliptic curve with certain representation, and Soroosh and William found it.  In order to do this, we developed a (mostly) efficient algorithm for computing the two characters eps and psi that define the semisimplication of an elliptic curve's Galois representation.  This project is to fully implement the algorithm, then run it on curves in the Cremona database and all primes for which the Galois representation is reducible.   There is relevant code here: <a href="http://nt.sagenb.org/home/pub/19/">http://nt.sagenb.org/home/pub/19/</a> and <a href="http://nt.sagenb.org/home/pub/20/">http://nt.sagenb.org/home/pub/20/</a> 

In fact, one can use the algorithm mentioned above to compute the semisimplication for any modular abelian variety!  It would be good to do this for say every J0 modabvar of level up to say 3200 (since we have an ap table up that far): <a href="http://sage.math.washington.edu/home/wstein/db/modsym/">http://sage.math.washington.edu/home/wstein/db/modsym/</a> 


## Dimensions of modular forms spaces

Currently <a href="http://wstein.org/Tables/dimensions/">http://wstein.org/Tables/dimensions/</a> has a couple of table with a kludgy and completely broken.   These tables are nicer: <a href="http://wstein.org/Tables/dimensions-all.html">http://wstein.org/Tables/dimensions-all.html</a>.  I think a static table that can do Gamma0, Gamma1, and character for all levels up to 100000 and weight 2 would be good to have.   But its value would only be in having it easily usable, since there is no value in asking for an individual space.   Anyway, compute the data.  It would in fact by a good idea.  Also, for each character, we should compute the dimensions of the modular, eisenstein spaces and the new cuspidal, and p-new cuspidal subspaces for each p dividing the level.  The following session illustrates that in fact that would be quite valuable to have pre-computed in a table: 
```txt
sage: G = DirichletGroup(21000)
sage: time C = G.galois_orbits()
Time: CPU 2.21 s, Wall: 2.52 s
sage: time z = [(e[0], dimension_cusp_forms(e[0], 2)) for e in C]
Time: CPU 8.86 s, Wall: 9.79 s
```
I (=William) started a small calculation going of dimensions of spaces with character for weights <= 16 and for each space computing the dimension of the cuspidal, eisenstein, new, and p-new for each p parts.  It's here: <a href="http://sage.math.washington.edu/home/wstein/db/days17/dimension_character/">http://sage.math.washington.edu/home/wstein/db/days17/dimension_character/</a> 


## Compute the exact torsion subgroup of J0(N) for as many N as possible

See <a href="http://nt.sagenb.org/home/pub/21/">http://nt.sagenb.org/home/pub/21/</a> for some work in this direction by Stein and Yazdani. 


## Characteristic polynomial of T2 on level 1 modular forms

See this table: <a href="http://modular.fas.harvard.edu/Tables/charpoly_level1/t2/">http://modular.fas.harvard.edu/Tables/charpoly_level1/t2/</a> 

I have a straightforward algorithm to recompute these, which I'm running here: 

<a href="http://sage.math.washington.edu/home/wstein/db/days17/level1/">http://sage.math.washington.edu/home/wstein/db/days17/level1/</a> 


## Characteristic polys of many Tp on level 1

Next, see this table, which gives "Characteristic polynomials of T2, T3, ..., T997 for k<=128" 

<a href="http://modular.fas.harvard.edu/Tables/charpoly_level1/upto997/">http://modular.fas.harvard.edu/Tables/charpoly_level1/upto997/</a> 

That exact range can likely be easily done using modular symbols. 

There is another algorithm, that uses the matrix of $T_2$ (which I'm computing and caching above!), which can compute the charpolys of many other $T_p$.  It's described here: <a href="http://sage.math.washington.edu/home/wstein/days/17/highweight/">http://sage.math.washington.edu/home/wstein/days/17/highweight/</a>, along with a magma implementation (need to port to Sage).    Thus it might be nice to implement this and run it, and get say all $T_{p,k}$ for $p,k \leq 1000$. 


## Arithmetic data about every weight 2 newform on Gamma0(N) for all N<5135 (and many more up to 7248)

<a href="http://modular.fas.harvard.edu/Tables/arith_of_factors/">http://modular.fas.harvard.edu/Tables/arith_of_factors/</a> 

This table is challenging to replicate/extend, but easy to move over.  It would likely be better to continue our aplist computations, etc. up to 10000 (they only went to 3200 so far), and also take our saved decompositions and compute other data.   Anyway, this table is more of a challenge.  


## Systems of Hecke Eigenvalues: q-expansions of Newforms

<a href="http://modular.fas.harvard.edu/Tables/aplist/">http://modular.fas.harvard.edu/Tables/aplist/</a> 

This is the point of these tables from last summer, which are much more comprehensive. 

   * <a href="http://sage.math.washington.edu/home/wstein/db/modsym/">http://sage.math.washington.edu/home/wstein/db/modsym/</a> 
Also, Tom Boothby has made some tables of traces of these.  


## Eigenforms on the Supersingular Basis

I made  

<a href="http://modular.fas.harvard.edu/Tables/supersingular.html">http://modular.fas.harvard.edu/Tables/supersingular.html</a> 

I think for a paper with Merel.  

A close analogue of the above table could likely be extended/recomputed using the <a href="/SupersingularModule">SupersingularModule</a> code.  However, the first problem is: 
```txt
sage: X = SupersingularModule(97)
sage: X.decomposition()
Traceback (most recent call last):
...
NotImplementedError
```
So some love and care would be needed to compute these decompositions.  But this should be done.  And then would be pretty similar data to that table.  It would be straightfoward (I think) to get the same data is in <a href="http://modular.fas.harvard.edu/Tables/supersingular.html">http://modular.fas.harvard.edu/Tables/supersingular.html</a> once the decompositions are computed.     


## Elliptic curve tables

I think the following can be safely ignored since they are already easily available from Cremona now-a-days: 
```txt
# [NEW] PARI Tables of Cremona Elliptic Curves
# [NEW] Isogeny class matrices for elliptic curves of conductor <= 40000
# [NEW] Lratios L(E,1)/Omega_E for elliptic curves of conductor <= 40000 
```
This can be ignored: 
```txt
# Armand Brumer and Oisin McGuinness's table of elliptic curves of prime conductor less than 108 (or try the local mirror)
```
This should be made officially part of our database in some way, possibly including better wrapping in Sage: 
```txt
# The Stein-Watkins database of elliptic curves of conductor up to 108 and of prime conductor up to 1010. 
```
The following table was "fun", but I don't think anybody ever used it, so maybe forget it: <a href="http://wstein.org/Tables/e_over_k/">http://wstein.org/Tables/e_over_k/</a> 


## Congruence modulus and modular degree for elliptic curves

It would be very valuable and possibly challenging to recompute and extend to level 1000 the data here: <a href="http://wstein.org/Tables/degphi_table/">http://wstein.org/Tables/degphi_table/</a>.  

There's an interesting conjecture there as well, which could possibly be refined.  

Here's how to do the computation: 
```txt
sage: E = EllipticCurve('54a')
sage: E.modular_degree()         # trivial
6
sage: E.congruence_number()      # hard in general
6
```
I actually started a computation of the same data that goes a bit further than the old table here: <a href="http://sage.math.washington.edu/home/wstein/db/congnum/">http://sage.math.washington.edu/home/wstein/db/congnum/</a> 

However quite a few levels up to 1000 remain: [558, 592, 594, 624, 650, 657, 672, 702, 704, 720, 738, 744, 756, 758, 759, 760, 762, 763, 765, 766, 768, 770, 774, 775, 776, 777, 780, 781, 782, 784, 786, 790, 791, 792, 793, 794, 795, 797, 798, 799, 800, 801, 802, 804, 805, 806, 807, 808, 810, 811, 812, 813, 814, 815, 816, 817, 819, 822, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 836, 840, 842, 843, 845, 846, 847, 848, 849, 850, 851, 854, 855, 856, 858, 861, 862, 864, 866, 867, 869, 870, 871, 872, 873, 874, 876, 880, 882, 885, 886, 888, 890, 891, 892, 894, 895, 896, 897, 898, 899, 900, 901, 902, 903, 904, 905, 906, 909, 910, 912, 913, 914, 915, 916, 918, 920, 921, 922, 923, 924, 925, 926, 927, 928, 930, 931, 933, 934, 935, 936, 938, 939, 940, 942, 943, 944, 946, 948, 950, 954, 955, 956, 957, 960, 962, 964, 965, 966, 968, 969, 970, 972, 973, 974, 975, 976, 978, 979, 980, 981, 982, 984, 985, 986, 987, 988, 989, 990, 994, 995, 996, 997, 999] 

It would also be very valuable if we compute the congruence modulus and modular degree modulus (I don't know what the good term for this is) for elliptic curves. This data might provide some insight on the discrepency between the two invariants. 


## j-invariants of CM elliptic curves

The table as is here is silly: <a href="http://wstein.org/Tables/cmj.html">http://wstein.org/Tables/cmj.html</a> 

However, a generalization of it to give CM j-invariants over various number fields would be nice.  It would probably easy to collate such data if one could find it.  I think David Kohel might have such data on his site (?).  


## Pari table of Optimal elliptic curves

Pointless -- get rid of -- was only useful when I used PARI a lot.  


## Optimal quotients whose torsion isn't generated by (0)-(oo)

<a href="http://wstein.org/Tables/non_zeroinf_tor.txt">http://wstein.org/Tables/non_zeroinf_tor.txt</a> 

This should be redone, but in more generality and systematically.  To do this calculation basically all that is needed that is nontrivial is a way to compute the order of the image of 0-oo efficiently.   That is best done numerically.  The idea of the algorithm: 

   1. Compute $L(E,1)$ and $\Omega_E$ as floating point real numbers.   
   1. If the period lattice is rectangular let $\omega = \Omega_E / 2$; otherwise, let $\omega = \Omega_E$. 
   1. The order of the image of $(0)-(\infty)$ is equal to the denominator of the rational number $L(E,1)/\omega$. 
(The reason is because the image of $(0)-(\infty)$ can be interpreted as a period integral and so can $L(E,1)$, and they're the same, basically.) 

Here's code: 


```txt
def order_of_zero_inf(E):
    R =  E.lseries().L_ratio()
    if E.period_lattice().is_rectangular():
        R /= 2
    return R.denominator()
```
note that this algorithm is far better than the one I ran to make the above table ( <a href="http://wstein.org/Tables/non_zeroinf_tor.txt">http://wstein.org/Tables/non_zeroinf_tor.txt</a>), which I think was a modular symbols algorithm.   

I'm running the above for Cremona's tables here: 

<a href="http://sage.math.washington.edu/home/wstein/db/days17/elliptic_zero_inf/">http://sage.math.washington.edu/home/wstein/db/days17/elliptic_zero_inf/</a> 


## Data About Abelian Varieties Af Attached to Modular Forms

<a href="http://modular.fas.harvard.edu/Tables/newform_weight2.html">http://modular.fas.harvard.edu/Tables/newform_weight2.html</a> 

This has a bunch of data about abelian varieties $A_f$.  Some is easy and some is hard to compute.  This table took a long time to compute, I think.   It will be important to recompute this data and much more.  

The following data should go in the same table: <a href="http://modular.fas.harvard.edu/Tables/odd_analytic_sha_lower_bound.html">http://modular.fas.harvard.edu/Tables/odd_analytic_sha_lower_bound.html</a> 

This is another similar table: <a href="http://modular.fas.harvard.edu/Tables/MotiveDecomp_N1-125_k2">http://modular.fas.harvard.edu/Tables/MotiveDecomp_N1-125_k2</a> 

And of course this entire table is similar: <a href="http://modular.fas.harvard.edu:8080/mfd">http://modular.fas.harvard.edu:8080/mfd</a> (broken usually!)  data available...; it's in a ZODB. 

This is also something for the same table = higher dimensional gen. of Cremona: <a href="http://modular.fas.harvard.edu/Tables/odd_lratios.html">http://modular.fas.harvard.edu/Tables/odd_lratios.html</a> 


## The odd part of the intersection matrix of J0(N)

<a href="http://modular.fas.harvard.edu/Tables/odd_intersection_matrix_gamma0.html">http://modular.fas.harvard.edu/Tables/odd_intersection_matrix_gamma0.html</a> 

The above data would be very good to have to high levels.  It gives the combinatorial "graph structure" of $J_0(N)$.  (Sourav San Gupta's final project in my course was related.) 

Here is code to compute the (odd part of) the intersection matrix: 


```txt
def f(N,k=2):
    S = ModularSymbols(N,k,sign=1).cuspidal_subspace().new_subspace()
    D = S.decomposition()
    n = len(D)
    A = matrix(ZZ,n)
    for i in range(n): 
        for j in range(i,n):
            A[i,j] = odd_part(ZZ(D[i].intersection_number(D[j]).numerator()))
            A[j,i] = A[i,j]
    return A
```
(To get the exact value, not just the odd part, get rid of sign=1, and odd_part above, at the least.) It would be nice to run the above for $N\leq 1000$ and $k=2$.  It would also be nice to gather some data for higher weight.  


## Weierstrass point data

<a href="http://modular.fas.harvard.edu/Tables/weierstrass_point_plus">http://modular.fas.harvard.edu/Tables/weierstrass_point_plus</a> and <a href="http://modular.fas.harvard.edu/Tables/weierstrass_point_bound.html">http://modular.fas.harvard.edu/Tables/weierstrass_point_bound.html</a> 

The data could be just copied over, but it would be good to compute it.  I think the algorithm just involves computing a basis of $q$ expansions and looking at it.  


## Rationals part of the special values of the L-functions

Level 1: <a href="http://modular.fas.harvard.edu/Tables/lratios_level1.html">http://modular.fas.harvard.edu/Tables/lratios_level1.html</a> 

Higher level: <a href="http://modular.fas.harvard.edu/Tables/bsd.html">http://modular.fas.harvard.edu/Tables/bsd.html</a> 

This would likely be very good to recompute and extend, but it requires implementing an L-ratio method of on modular symbols spaces A (for speed), which for some reason I still haven't done.   This involves: 

      1. Compute the modular symbols $e_i=X<sup>iY</sup>{k-2-i}\{0,\infty\}$ as an element of the ambient space, for each $i=0,1,\ldots,k-2$. 
      1. Define a function that computes the sparse action of $T_n$ on a sparse vector, and apply it to $e$, which will be very sparse.  This function will be built on the function `_hecke_image_of_ith_basis_element`. 
      1. Use to compute $T_n(e)$ for $n\leq B$, where $B$ is the Sturm bound. 
      1. Compute the image of the $T_n(e)$ under the `rational_period_mapping()` associated to our modular symbols factor $A$ (this is the first time $A$ actually appears). 
      1. Compute the $ZZ$-module $V$ spanned by the $T_n(e)$.   
      1. Compute the integral structure on $A$, take the subspace that is the $+1$ eigenspace for the $*$ involution, and take the image $W$ of that subspace under the rational period mapping.  
      1. The $L$-ratio is the lattice index of $[W:V]$. 
As a shortcut, first compute image of $e$ under rational period mapping -- if it is $0$, we know all $T_n(e)$ map to $0$, so the $L$-ratio is $0$.  
