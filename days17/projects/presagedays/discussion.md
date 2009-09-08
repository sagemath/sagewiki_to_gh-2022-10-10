= Specific Tables =

<<TableOfContents>>

== Component Groups of J0(N)(R) and J1(N)(R) ==

 * URL: http://wstein.org/Tables/real_tamagawa/

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

 * URL: http://wstein.org/Tables/cuspgroup/

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
