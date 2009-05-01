= Sage 3.4.2 Release Tour =

Sage 3.4.2 was released on FIXME. For the official, comprehensive release note, please refer to [[http://www.sagemath.org/src/announce/sage-3.4.2.txt|sage-3.4.2.txt]]. A nicely formatted version of this release tour can be found at FIXME. The following points are some of the foci of this release:

 * 


== Algebra ==


 * FIXME: summarize #5820

 * FIXME: summarize #5921


== Algebraic Geometry ==


== Basic Arithmetic ==


 * Enhancements to symbolic logic (Chris Gorecki) -- This adds a number of utilities for working with symbolic logic:
  1. {{{sage/logic/booleval.py}}} -- For evaluating boolean formulas.
  1. {{{sage/logic/boolformula.py}}} -- For boolean evaluation of boolean formulas.
  1. {{{sage/logic/logicparser.py}}} -- For creating and modifying parse trees of well-formed boolean formulas.
  1. {{{sage/logic/logictable.py}}} -- For creating and printing truth tables associated with logical statements.
  1. {{{sage/logic/propcalc.py}}} -- For propositional calculus.
 Here are some examples for working with the new symbolic logic modules:
 {{{
sage: import sage.logic.propcalc as propcalc
sage: f = propcalc.formula("a&((b|c)^a->c)<->b")
sage: g = propcalc.formula("boolean<->algebra")
sage: (f&~g).ifthen(f)
((a&((b|c)^a->c)<->b)&(~(boolean<->algebra)))->(a&((b|c)^a->c)<->b)
sage: f.truthtable()

a      b      c      value
False  False  False  True   
False  False  True   True   
False  True   False  False  
False  True   True   False  
True   False  False  True   
True   False  True   False  
True   True   False  True   
True   True   True   True
 }}}


 * New function {{{squarefree_divisors()}}} (Robert Miller) -- The new function {{{squarefree_divisors(x)}}} in the module {{{sage/rings/arith.py}}} allows for iterating over the squarefree divisors (up to units) of the element {{{x}}}. Here, we assume that {{{x}}} is an element of any ring for which the function {{{prime_divisors()}}} works.  Below are some examples for working with the new function {{{squarefree_divisors()}}}:
 {{{
sage: list(squarefree_divisors(7))
[1, 7]
sage: list(squarefree_divisors(6))
[1, 2, 3, 6]
sage: list(squarefree_divisors(81))
[1, 3]
 }}}


== Build ==


== Calculus ==


== Coercion ==


== Combinatorics ==


 * FIXME: summarize #5751


== Commutative Algebra ==


 * FIXME: summarize #5795


== Distribution ==


== Doctest ==


== Documentation ==


 * FIXME: summarize #5610


== DSage ==


 * FIXME: summarize #5824


== Factorization ==


 * FIXME: summarize #5928


== Geometry ==


== Graph Theory ==


 * FIXME: summarize #5914


== Graphics ==


== Group Theory ==


== Interfaces ==


 * FIXME: summarize #5111


== Linear Algebra ==


 * FIXME: summarize #5886


== Miscellaneous ==


== Modular Forms ==


 * FIXME: summarize #5876


== Notebook ==


 * FIXME: summarize #5912

 * FIXME: summarize #2740

 * FIXME: summarize #5880


== Number Theory ==


 * FIXME: summarize #5130

 * FIXME: summarize #5822

 * FIXME: summarize #5704

 * FIXME: summarize #4193

 * FIXME: summarize #5890

 * FIXME: summarize #5856


== Numerical ==


== Packages ==


 * FIXME: summarize #5803

 * FIXME: summarize #5849


== P-adics ==


 * FIXME: summarize #5946


== Quadratic Forms ==


== Symbolics ==


== Topology ==


== User Interface ==


== Website / Wiki ==
