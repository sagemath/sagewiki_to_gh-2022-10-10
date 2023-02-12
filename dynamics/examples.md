
[[_TOC_]] 


# Flat surfaces


## Interval exchange transformations / Linear involutions

Permutations of interval exchange transformations and generalized permutations of linear involutions are created using 
```txt
sage: iet.Permutation('a b c d','d c b a')
a b c d
d c b a
sage: iet.GeneralizedPermutation('a a b','b c c')
a a b
b c c
```
We can build Rauzy diagrams from permutations 
```txt
sage: p = iet.Permutation('a b c d','d c b a')
sage: p.connected_component()
H_hyp(2)
sage: r = p.rauzy_diagram()
sage: print r
Rauzy diagram with 7 permutations
```
Other Rauzy diagrams (with induction on the left, inversion, ...) are accessible via options 
```txt
sage: p.rauzy_diagram(left_induction=True)
Rauzy diagram with 84 permutations
```
Build a path in the Rauzy diagram (the letter 't' means top induction and the letter 'b' means bottom induction) 
```txt
sage: path = r.path(p,'t','t','b','t','b','b','t','b')
sage: path.is_full()   # all intervals are seen as winner during Rauzy induction
True
sage: path.is_loop()   # startpoint and endpoint are identic
True
```
Build an interval exchange map associated to this path 
```txt
sage: m = path.matrix()
sage: l,v,n = m.eigenvectors_right()[3] # l is the eigenvalue, v the vector and m the multiplicity
sage: n == 1
True
sage: t = iet.IntervalExchangeTransformation(p,v[0])
sage: print t
Interval exchange transformation of [0, 4.390256884515514?[ with permutation
a b c d
d c b a
```
And we now check that the interval exchange map is self-similar under as many iterations as the length of the path 
```txt
sage: tt = t.rauzy_move(iterations=8)
sage: print tt
Interval exchange transformation of [0, 1[ with permutation
a b c d
d c b a
sage: tt.normalize(l) == t
True
```

## Square-tiled surfaces

Let us build the genus 2 origami with three squares 


```txt
sage: o = Origami('(1,2)', '(1,3)')
sage: print o
(1, 2)
(1, 3)
```
We now access to its Veech group and look at the associated invariants 


```txt
sage: G = o.veech_group()
sage: G.index()   # index in SL(2,Z)
3
sage: G.nu2()     # elliptic points of order 2
1
sage: G.nu3()     # elliptic points of order 3
1
sage: G.ncusps()  # number of cusps
2
```
The Veech group of an origami is in fact attached to its Teichmüller curve. In the following we build the Teichmüller curve of o and compute other invariants 
```txt
sage: t = o.teichmueller_curve()
sage: t.sum_of_lyapunov_exponents()
4/3
```
One can access to detailed data of a cusp using the cylinder diagram decomposition of an origami 
```txt
sage: o = Origami('(1,2)(3,4)','(1,3)')
sage: o.stratum()
H(1, 1)
sage: t = o.teichmueller_curve()
sage: for c,width in t.cusp_representative():
...     print c
...     print "width: %d" %width
...     print c.cylinder_diagram().dual_graph(), "\n"
(1,2)(3,4)
(1)(2,3)(4)
width: 2
Looped multi-graph on 1 vertex

(1,2)(3)(4)
(1,3)(2,4)
width: 2
Looped multi-graph on 2 vertices

(1,2,3,4)
(1)(2,4)(3)
width: 2
Looped multi-graph on 1 vertex
```