

# *-combinat Days Project Idea Page


## Implement a generic FactoredElement class

PEOPLE: Burcin Erocal 

   * In many combinatorics applications we work with rational functions whose numerator/denominator factor into nice components where the factorization is also known beforehand. The current representation of rational functions in Sage use the expanded form of the numerator and denominator. The goal is to implement a generic wrapper to store elements in a factored representation. 
   * <a class="http" href="http://groups.google.com/group/sage-devel/browse_thread/thread/d49fee55339515ae">sage-devel thread</a> about working with factored denominators 
   * <a class="http" href="http://groups.google.com/group/sage-devel/browse_thread/thread/ea62acaf89348d9d">another thread</a>  
   * code mentined above is <a class="http" href="http://emis.uhasselt.be/~vdbergh/sage_patches/fraction_field_cache/">here</a> 

## An example of adding a new basis to an algebra

PEOPLE: Franco Saliola, <a href="/CoryBrunson">CoryBrunson</a> 

   * This should be a nice exercise in adding a new basis (the seminormal basis) to an algebra (the group algebra of the symmetric group). We don't even have to introduce any new code to construct the basis since it already exists in Sage, thanks to Mike Hansen. On the other hand, I do have a better implementation based on a method that Alain Lascoux explained to me, so we could use that instead. 

## Try out Nathann Cohen new interface to Mixed Integer Linear Programming software

PEOPLE: Nicolas Thiéry 


## Bug squashing!

PEOPLE: Franco Saliola, Jason Bandlow, Florent Hivert, Peter <a href="/McNamara">McNamara</a> 

   * There are bugs in Sage that need fixin': 
         1. <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6538">Bugs in Partitions</a> 
         1. The wiki page <a href="/combinat/Weirdness">quirks and weirdness in sage-combinat</a> contains a list of quirks and weirdness in sage-combinat. 
         1. The <a class="http" href="http://trac.sagemath.org/sage_trac/query?status=assigned&amp;status=new&amp;status=reopened&amp;group=status&amp;milestone=sage-combinat">sage-combinat milestone</a> lists all tickets labelled sage-combinat.  

## Categories

100% doctest and review for all patches up to sagecombinat 4.1 

Functorial constructions: subquotient, cartesian_product 

<a href="/FlorentHivert">FlorentHivert</a>, <a href="/FrancoSaliola">FrancoSaliola</a>, <a href="/AnneSchilling">AnneSchilling</a>, <a href="/NicolasThi%C3%A9ry">NicolasThiéry</a> 


## Categorification of RootSystems and Crystals

And application to parabolic subroot-systems 

<a href="/NicolasBorie">NicolasBorie</a>, <a href="/AnneSchilling">AnneSchilling</a>, <a href="/NicolasThi%C3%A9ry">NicolasThiéry</a>, <a href="/CoryBrunson">CoryBrunson</a> 


## graph layout using graphviz / dot2tex optional package

<a href="combinat/FPSAC09/projects/dot2tex-0.1.spkg">dot2tex-0.1.spkg</a> 

Anne Schilling, <a href="/FrancoSaliola">FrancoSaliola</a>, <a href="/NicolasThi%C3%A9ry">NicolasThiéry</a> 


## Quickref card for sage.combinat

<a href="/JasonBandlow">JasonBandlow</a>, <a href="/FrancoSaliola">FrancoSaliola</a>, <a href="/NicolasThi%C3%A9ry">NicolasThiéry</a> 


## Refactoring of symmetric functions

* Patch Symmetrica 
* Make LRcalc spkg 
* Bring all symmetric functions under the <a href="/SymmetricFunctions">SymmetricFunctions</a> umbrella 
* Improve documentation 
<a href="/JasonBandlow">JasonBandlow</a>, <a href="/CoryBrunson">CoryBrunson</a> 


## Improve Nonsymmetric Macdonald polynomials

* Add doctests with examples on specifying q, t, and the basement pi 
* Add input checks for pi. Maybe accept a list as input, and make it into an appropriate permutation 

## Setup the framework for multivariate polynomials with several bases

See: <a href="/combinat/MultivariatePolynomials">combinat/MultivariatePolynomials</a> 

People: <a href="/AlainLascoux">AlainLascoux</a> 


## Module for generate integer list up to the action of a permutation group

* Integrate a method in the gap interface to get an element in a gap record : <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6620">#6620</a> 
* Add transversals, orbit and stabilizer methods for permutation groups : <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6647">#6647</a> 
* Implement or port a <a href="/StabilizerChain">StabilizerChain</a> in Sage 
* Finalise the module of generation and submit it 
<a href="/NicolasBorie">NicolasBorie</a> 


## Implement simplify_factorial in Sage

* Use the new symbolics to implement simplification of expressions with binomials, factorials, etc. This is <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6636">#6636</a> on trac. 
People: Flavia Stan, Burcin Erocal 


## Design discussions

* - Standardize <a href="/TransitiveIdeal">TransitiveIdeal</a> <a href="/TransitiveIdealGraded">TransitiveIdealGraded</a>, <a href="/SearchForest">SearchForest</a>, ... 
      * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6637">#6637</a> 
- Choose and implement a syntax to import standard notations from a Parent (from <a href="/SymmetricFunctions">SymmetricFunctions</a>(QQ).shortcuts() import *) == 

      * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6638">#6638</a> - Choose syntax and semantic conventions for permutations and discrete functions 
      * <a href="/combinat/01">combinat/01</a> 
==  
