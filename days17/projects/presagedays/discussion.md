= Specific Tables =

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

== Cuspidal Subgroup ==

Computing the structure of the cuspidal subgroup of J0(N) and J1(N) (say). 

 * URL: http://wstein.org/Tables/cuspgroup/  (the displayed formula is backwards at the top)

 * New Sage code:

{{{
def cuspidal_subgroup_J0(N):
    J = J0(N)
    I = C.cuspidal_subgroup().invariants()
    # maybe pickle J
    return I
}}}

{{{
def cuspidal_subgroup_J0(N):
    J = J1(N)
    I = C.cuspidal_subgroup().invariants()
    # maybe pickle J
    return I
}}}

== Discriminants of Hecke Algebra ==

Computation of discriminants of various Hecke algebras.

 URL: 
   * http://wstein.org/Tables/dischecke.html

Amazingly, it seems that there is "discriminants of Hecke algebras" implementation in Sage!
Here is a straightforward algorithm:
 1. The input is the level $N$.
 2. Chose a random vector $v$ in the space $M$ of modular symbols of level $N$.
 3. Compute the sturm bound $B$.
 4. Compute the products $T_1(v), ..., T_B(v)$, and find a basis $b_i$ for the ZZ-module they span.
 5. Find Hecke operators $S_1, ..., S_n$ such that $S_i(v) = b_i$.  (This is linear algebra -- inverting a matrix and a matrix multiply.)
 6. Compute the determinant $det (S_i * S_j)$.  That is the discriminant.  This also gives a basis for the Hecke algebra, which is very useful for lots of things. 

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
     
 
