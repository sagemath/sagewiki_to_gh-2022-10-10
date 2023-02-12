

# Sage 3.0.2 Release Tour

Sage 3.0.2 was released on May 24th, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see <a class="http" href="http://sagemath.org/src/announce/sage-3.0.2.txt">sage-3.0.2.txt</a>. 


## Portability of Sage to 64 bit OSX and Cygwin (Michael Abshoff, William Stein)

William Stein and Michael Abshoff fixed many issues to build Sage on Cygwin and Michael Abshoff did also fix many 64 bit issues on OSX. Neither one of those ports is "ready for prime time" yet, but we are making steady progress so that hopefully Sage will be fully supported on Cygwin again and also work on OSX in 64 bit mode. 


## Posets and Semi-Lattices (Peter Jipsen and Franco Saliola)

Sage now includes basic support for finite posets and semi-lattices. There are several ways to define a finite poset. 

1. A tuple of elements and cover relations: 


```python
#!python 
sage: Poset(([1,2,3,4,5,6,7],[[1,2],[3,4],[4,5],[2,5]]))
Finite poset containing 7 elements
```
2. Alternatively, using the _cover_relations=False_ keyword, the relations need not be cover relations (and they will be computed). 


```python
#!python 
sage: elms = [1,2,3,4]
sage: rels = [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
sage: P = Poset( (elms,rels) ,cover_relations=False); P
Finite poset containing 4 elements
sage: P.cover_relations()
[[1, 2], [2, 3], [3, 4]]
```
3. A list or dictionary of upper covers: 


```python
#!python 
sage: Poset({'a':['b','c'], 'b':['d'], 'c':['d'], 'd':[]})
Finite poset containing 4 elements
sage: Poset([[1,2],[4],[3],[4],[]])
Finite poset containing 5 elements    
```
4. An acyclic directory graph: 


```python
#!python 
sage: dag = DiGraph({0:[2,3], 1:[3,4], 2:[5], 3:[5], 4:[5]})
sage: Poset(dag)
Finite poset containing 6 elements
```
Once a poset has been created, several methods are available: 


```python
#!python 
sage: dag = DiGraph({0:[2,3], 1:[3,4], 2:[5], 3:[5], 4:[5]})
sage: P = Poset(dag)

sage: P.has_bottom()
False
sage: P.has_top()
True
sage: P.top()
5

sage: P.linear_extension()
[1, 4, 0, 2, 3, 5]

sage: P.is_meet_semilattice()
False
sage: P.is_join_semilattice()
True

sage: P.mobius_function_matrix()
[ 1 -1  0  0 -1  1]
[ 0  1  0  0  0 -1]
[ 0  0  1 -1 -1  1]
[ 0  0  0  1  0 -1]
[ 0  0  0  0  1 -1]
[ 0  0  0  0  0  1]

sage: type(P(5))
<class 'sage.combinat.posets.elements.PosetElement'>
sage: P(5) < P(1)
False
sage: P(1) < P(5)
True

sage: x = P(4)
sage: [v for v in P if v <= x] 
[1, 4]

sage: P.show()
```

## Frobby for monomial ideals (Bjarke Hammersholt Roune)

Frobby is software for computations with monomial ideals, and is included in Sage 3.0.2 as an optional spkg. The current functionality of the Sage interface to Frobby is irreducible decomposition of monomial ideals, while work is on-going to expose more of the capabilities of Frobby, such as Hilbert-Poincare series, primary decomposition and Alexander dual. Frobby is orders of magnitude faster than other programs for many of its computations, primarily owing to an optimized implementation of the Slice Algorithm. See <a href="http://www.broune.com/frobby/">http://www.broune.com/frobby/</a> for more on Frobby. 


## Self-orthogonal Binary Codes (Robert Miller)

Based on a part of the Supersymmetry project described in the SCREMS grant proposal, this is an implementation of the method of canonical augmentation on self-orthogonal binary linear error-correcting codes of length up to 32 (or, with trivial modification, 64). Based on the existing code to do automorphism groups and canonical labels. 


## Notebook Improvements (William Stein, Tom Boothby)

Tom Boothby and William Stein spent a long day just systematically fixing numerous bugs in the Sage notebook.   This should improve the overall quality of the notebook and make future development easier.  
