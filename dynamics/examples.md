= Flat surfaces examples =

=== Using interval exchange transformations ===

Permutations of interval exchange transformations are created

Build a permutation and its Rauzy diagram
{{{
sage: p = iet.Permutation('a b c d','d c b a')
sage: p.connected_component()
H_hyp(2)
sage: r = p.rauzy_diagram()
sage: print r
Rauzy diagram with 7 permutations
sage: r.path
}}}

Build a path in the Rauzy diagram
{{{
sage: path=r.path(p,'t','t','b','t','b','b','t','b')
sage: path.is_full()  # all intervals are seen during Rauzy induction
True
sage: path.is_loop()
True
}}}

Build an interval exchange map associated to this path
{{{
sage: l,v,m=path.matrix().eigenvectors_right()[3] # l is the eigenvalue, v the vector and m the multiplicity
sage m == 1
sage: t= iet.IntervalExchangeTransformation(p,v[0])
sage: print t
Interval exchange transformation of [0, 4.390256884515514?[ with permutation
a b c d
d c b a
}}}

And we now check that the interval exchange map is self-similar
{{{
sage: tt = sage: t.rauzy_move(iterations=8)
sage: print tt
Interval exchange transformation of [0, 1[ with permutation
a b c d
d c b a
sage: tt.normalize(l) == t
True
}}}

=== Square-tiled surfaces ===

Let us build the genus 2 origami with three squares

{{{
sage: o = Origami('(1,2)', '(1,3)')
sage: print o
(1, 2)
(1, 3)
}}}

And now, we build its Teichmueller curve and compute some of its invariants (rk: it is not clear yet which properties should be attached to the Teichmueller curve and which should be attached to the Veech group)

{{{
sage: t = o.teichmueller_curve()
sage: G = t.veech_group()
sage: G.index()
3
sage: G.nu2()  # elliptic points of order 2
1
sage: G.nu3()  # elliptic points of order3
1
sage: G.ncusps()  # number of cusps
2
sage: t.sum_of_lyapunov_exponents()
4/3
}}}
