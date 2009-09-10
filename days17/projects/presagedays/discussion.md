= Specific Tables/Projects =

<<TableOfContents>>

== Component Groups of J0(N)(R) and J1(N)(R) ==

 * URL: http://wstein.org/Tables/real_tamagawa/ and http://wstein.org/Tables/compgrp/.    The second page has much more extensive data and a conjecture. 

 * New Code:

This function computes the $J_0(N)$ real component groups. 
{{{
def f(N):
    M = ModularSymbols(N).cuspidal_subspace()
    d = M.dimension()//2
    S = matrix(GF(2),2*d,2*d, M.star_involution().matrix().list()) - 1
    return 2^(S.nullity()-d)
}}}

For $J_1(N)$ it is:
{{{
def f(N):
    M = ModularSymbols(Gamma1(N)).cuspidal_subspace()
    d = M.dimension()//2
    S = matrix(GF(2),2*d,2*d, M.star_involution().matrix().list()) - 1
    return 2^(S.nullity()-d)
}}}

Future extension: one could replace Gamma1(N) by GammaH(N,...).  One could also do the new subspace.

And note Frank's conjecture:

Conjecture (Frank Calegari):
{{{ 
Let m = #odd prime factors of N +  {1, if N = 0 mod 8
                                   {0, otherwise.
Then the component group is isomorphic to (Z/2Z)^f, where f = 2^m - 1.
}}}

the above conjecture is wrong, but the following matches our data (up to level N<=2723):
{{{
Conjecture (Boothby-Stein):
Let m = #odd prime factors of N -  {1, if N != 0 mod 8
                                   {0, otherwise.

Then the component group is isomorphic to (Z/2Z)^f, where f = 2^m - 1, unless N=1,2,4, in which case the component is
}}}

Soroosh -- the prime level case is known.  See Calegari <insert link> which *just* cites Agashe and Merel (http://wstein.org/home/wstein/days/17/Merel_Laccouplement_de_Weil_entre_le_sous-group.pdf -- page 12).


== Cuspidal Subgroup ==

Computing the structure of the cuspidal subgroup of J0(N) and J1(N) (say). 

 * URL: http://wstein.org/Tables/cuspgroup/  (the displayed formula is backwards at the top)

 * New Sage code:

{{{
def cuspidal_subgroup_J0(N):
    J = J0(N)
    I = J.cuspidal_subgroup().invariants()
    # maybe pickle J
    return I
}}}

{{{
def cuspidal_subgroup_J1(N):
    J = J1(N)
    I = J.cuspidal_subgroup().invariants()
    # maybe pickle J
    return I
}}}

BUT WAIT -- isn't there an ''a priori'' formula for this structure/order?   Yes -- Ligozat, but not really -- that gives only rational cuspidal subgroup, and might be just as hard.

Anyway, I'm computing a few of these here, as a test of the modular symbols code, etc., since this is easy:

http://sage.math.washington.edu/home/was/db/days17/cuspidal_subgroup_J0N/


http://sage.math.washington.edu/home/was/db/days17/cuspidal_subgroup_J1N/



== Discriminants of Hecke Algebra ==

Computation of discriminants of various Hecke algebras.

 URLs: 

   * http://wstein.org/Tables/dischecke.html
   * http://trac.sagemath.org/sage_trac/ticket/6635

Amazingly, it seems that there is "discriminants of Hecke algebras" implementation in Sage!
Here is a straightforward algorithm:
 1. The input is the level $N$.
 2. Chose a random vector $v$ in the space $M$ of cuspidal modular symbols of level $N$.
 3. Compute the sturm bound $B$.
 4. Compute the products $T_1(v), ..., T_B(v)$, and find a basis $b_i$ for the ZZ-module they span.
 5. Find Hecke operators $S_1, ..., S_n$ such that $S_i(v) = b_i$.  (This is linear algebra -- inverting a matrix and a matrix multiply.)
 6. Compute the determinant $det ( Trace(S_i * S_j) )$.  That is the discriminant.  This also gives a basis for the Hecke algebra, which is very useful for lots of things. 

Note: See http://trac.sagemath.org/sage_trac/ticket/6768 for very slow code for computing a basis for the Hecke algebra. 

Here is a more complicated algorithm, but it might suck because of hidden denseness!

 1. The input is the level $N$.
 2. If $N$ is divisible by a prime $p^3$ and $X_0(N/p^3)$ has positive genus, then the discriminant is $0$, as one can see by taking images of forms of level $N/p^3$.
 3. I think the above is an if and only if condition for when the discriminant is $0$.  See I think Coleman-Voloch.
 4. The actual algorithm now.  
     1. Find a random Hecke operator $t$ such that the charpoly of $t$ has nonzero discriminant.
     2. Choose a random vector $v$ in the space of cuspidal modular symbols.
     3. Let $B$ be the Sturm bound.
     4. Compute the images $T_n(v)$ for $n$ up to the Sturm Bound. 
     
 
== Compute a table of semisimplications of reducible representations of elliptic curves ==

Ralph Greenberg asked for a specific example of an elliptic curve with certain representation, and Soroosh and William found it.  In order to do this, we developed a (mostly) efficient algorithm for computing the two characters eps and psi that define the semisimplication of an elliptic curve's Galois representation.  This project is to fully implement the algorithm, then run it on curves in the Cremona database and all primes for which the Galois representation is reducible.   There is relevant code here: http://nt.sagenb.org/home/pub/19/ and http://nt.sagenb.org/home/pub/20/

In fact, one can use the algorithm mentioned above to compute the semisimplication for any modular abelian variety!  It would be good to do this for say every J0 modabvar of level up to say 3200 (since we have an ap table up that far): http://sage.math.washington.edu/home/wstein/db/modsym/

== Dimensions of modular forms spaces ==

Currently http://wstein.org/Tables/dimensions/ has a couple of table with a kludgy and completely broken.   These tables are nicer:
http://wstein.org/Tables/dimensions-all.html.  I think a static table that can do Gamma0, Gamma1, and character for all levels up to 100000 and weight 2 would be good to have.   But its value would only be in having it easily usable, since there is no value in asking for an individual space.   Anyway, compute the data.  It would in fact by a good idea.  Also, for each character, we should compute the dimensions of the modular, eisenstein spaces and the new cuspidal, and p-new cuspidal subspaces for each p dividing the level.  The following session illustrates that in fact that would be quite valuable to have pre-computed in a table:
{{{
sage: G = DirichletGroup(21000)
sage: time C = G.galois_orbits()
Time: CPU 2.21 s, Wall: 2.52 s
sage: time z = [(e[0], dimension_cusp_forms(e[0], 2)) for e in C]
Time: CPU 8.86 s, Wall: 9.79 s
}}}
