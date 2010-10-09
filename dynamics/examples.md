= Falt surfaces examples =

=== Installation ===

You need to install [[http://wiki.sagemath.org/combinat|sage-combinat]] which is done with the following command

{{{
$ sage -combinat install
}}}

The latter installs a modified version of Sage. For more on what this command does or how to reverse it, you can read this [[http://wiki.sagemath.org/combinat/MercurialStepByStep|step by step tutorial]].

=== Link to documentations and tutorials ===

To get introduced to Sage, look at the documentation on [[http://sagemath.org]]

=== Using interval exchange transformations ===

Permutations of interval exchange transformations are created

{{{
sage: p = iet.Permutation('a b c d','d c b a')
sage: p.connected_component()
H_hyp(2)
}}}

=== Square tiled surfaces ===

Let us build the genus 2 origami with three squares

{{{
sage: o = Origami('(1,2)', '(1,3)')
sage: print o
(1, 2)
(1, 3)
}}}

And now, we build its Teichmueller curve and compute some of its invariant (rk: it is not yet clear which property should be attached to the teichmueller curve and which one should be attached to the Veech group)

{{{
sage: t = o.teichmueller_curve()
sage: G = t.veech_group()
sage: G.index()
3
sage: G.nu2()  #elliptic points of order 2
1
sage: G.nu3()  #elliptic points of order3
1
sage: G.ncusps()  # number of cusps
2
sage: t.sum_of_lyapunov_exponents()
4/3
}}}
