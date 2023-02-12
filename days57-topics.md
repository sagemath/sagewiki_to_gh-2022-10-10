

# Tentative list of themes

A list of topics for <a href="/days57">Sage days 57</a>. Participants, please edit! 

Use <a class="http" href="http://trac.sagemath.org/query?status=!closed&amp;keywords=~days57">days57</a> as keyword for any ticket worked on during the Sage days. 


## Import the old Sage-Combinat patches as git branch

* Nicolas 

## Review all tickets waiting on trac :-)

There are around <a class="http" href="http://trac.sagemath.org/report/75">250 tickets waiting on trac for a reviewer</a> ... solution: a ticket a day! (18 dev, 5 days we should get 90 tickets) 


## Documentation

* Brainstorm about the refactoring of the index of the combinatorics section of the reference manual <a class="http" href="http://trac.sagemath.org/ticket/16058">#16058</a> 
      * Sam, Florent, Nicolas, Sébastien, Charles 
* Splitting the reference/combinat document in subdocuments 
      * Florent,  
* Finish migrating the collection of Sage-Combinat thematic tutorials as git branches 
      * Nicolas, Vincent, Tomer 
* Proofread and merge more thematic tutorials 
      * Sam, Vincent, Nicolas, Thierry 

## Coxeter groups

Jean-Philippe and Vivien implemented a framework for working with infinite coxeter groups, in particular to explore the geometric representation, limit roots, ... The goal is to start merging this with the existing root system stuff in Sage. 

TODO: create ticket 

* interested 
      * Jean-Philippe Labbé 
      * Nicolas M. Thiéry 
      * Vivien Ripoll 
      * Tomer 
Monday afternoon 


## Automata and rational languages

* Design discussion 
      * Thierry, Vincent, Nicolas, Sébastien, Florent, Jean-Baptiste, Adrien, Matthieu 
* Improving the situation :-) 
      * Thierry, Vincent, Sébastien, Matthieu 

## Languages

By language we simply mean a set of finite words (rational language, D0L-system, ...). The scope ranges from combinatorics and algebra to discrete dynamical systems. Sage capabilities is currently restricted to combinatorics on single word and do not focus on structure of certain subset. We aim to implement an abstract and easy to reuse infrastructure for languages. 

* interested 
      * Vincent 
      * Thierry 
      * Sébastien 
* todo 
      * implement the category of languages (from previous work of Vincent and Stepan, <a class="http" href="http://trac.sagemath.org/ticket/12224">#12224</a>, <a class="http" href="http://trac.sagemath.org/ticket/12225">#12225</a>, <a class="http" href="http://trac.sagemath.org/ticket/12227">#12227</a>) 
      * finish the inclusion of subshifts of finite type and work on sofic shifts (<a class="http" href="http://trac.sagemath.org/ticket/12996">#12996</a>) 
Might be too big a task for this week. But we could discuss the strategy. 


## Translation surfaces

A translation surface is a geometric and dynamical objects that can be defined from gluing polygons by translation. It is interesting from geometric and dynamical point of vue. Many computations are possible ! 

* interested 
      * Vincent 
      * Samuel 
      * Thierry 
      * Charles 
* todo 
      * better datastructure for permutations 
      * include Charles Fougeron's code into Sage (computation of Lyapunov exponents, decomposition of the Hodge bundle) 
      * datastructure for translation surfaces 

## Categories

Finish <a class="http" href="http://trac.sagemath.org/ticket/10963">#10963</a>, brainstorm the follow ups. 

* interested 
      * Nicolas 
      * Volker 
      * Florent 

## Polyhedra over number fields

   * interested 
         * Volker 
         * Vincent 
         * Jean-Philippe 

## Tensors on free modules

   * interested 
         * Eric 
   * todo 
         * implement tensor products of generic free modules and the associated tensor algebra (by _generic_ it is meant _without any privileged basis_) 

## Refactor continued fractions

   * interested 
         * Thierry 
         * Vincent 
         * Luca 
   * todo: see <a class="http" href="http://trac.sagemath.org/ticket/14567">#14567</a> 

## Dynamical systems simulation (statistics of orbits)

   * interested 
         * Thierry 
         * Sébastien 
         * Vincent 
         * Jean-Philippe 

## Wish: symbolic q-analogs

   * Tomer 
Check in Maxima if those q-analogs are there, or could be described there so that Maxima could do symbolic summation with them? 

Anything to be reused from the Ore-Algebra package? 

<a href="http://arxiv.org/abs/1306.4263">http://arxiv.org/abs/1306.4263</a> 


## On-line db for Sage worksheets and other ressources

   * Thierry 
   * Vincent 
   * Luca 
See <a class="http" href="http://trac.sagemath.org/ticket/16114">ticket 16114</a> 


## Checkout Mike's and ... patches about lazy power series

   * <a class="http" href="http://trac.sagemath.org/ticket/15673">#15673</a> <a class="http" href="http://trac.sagemath.org/ticket/10519">#10519</a> 
   * Florent, Matthieu, Nicolas, Vincent,  

## Lazy Multivariate Power Series

TODO: create ticket 

   * Matthieu Dien 
   * Vincent 
   * Nicolas 

## Species, Ore algebras, Boltzman

Get a picture of the current status. 

   * ore_algebra spkg, see <a class="http" href="http://trac.sagemath.org/ticket/16008">#16008</a> 
   * <a href="http://arxiv.org/abs/1306.4263">http://arxiv.org/abs/1306.4263</a> 

## Tree-like tableaux, permutation tableaux, and bijections, Polyomino parallelograms

   * Matthieu 
   * Patxi 
   * Adrien 
   * Jean-Baptiste 
   * Florent 

## Parallel Map-Reduce and Search Forests

   * Florent 
   * Nicolas B. 
   * Vincent 
   * Jean-Baptiste 

## Interface cleanup for SearchForest and Friends

   * Sébastien 
   * Florent 
   * Nicolas B. 

## Real numbers

General discussion about real numbers and recurrent issues with them: 

* Thierry 
* Vincent 
* Volker 
* Sam 
* Matthieu 
There are many ways to represent real numbers: 

* rational numbers 
* algebraic numbers 
* expansions in a given basis 
* continued fractions (and generalizations) 
* symbolic expressions (involving transcendental functions like cos, exp, pi, ...) 
* ... 
But Sage currently has no bridge between them... 


## Refactor Elliptic curves and morphisms

See <a class="http" href="http://trac.sagemath.org/ticket/12880">#12880</a> (and also problem with scheme morphisms <a class="http" href="http://trac.sagemath.org/ticket/15378">#15378</a>, maybe also that SchemeMorphism currently does not inherit from !Morphism, see the description of #14711) 

   * Interested: 
         * Luca 
         * Vincent 
         * Jean-Pierre 
         * Nicolas 
         * Volker 

## Cygwin(64) support

* Easy to review tickets: 
   * #9493 
   * #16112 
   * #15366 
   * #15316 
   * #15678 
   * #15679 
   * #16089 
   * #16099 
   * #16098 
* Not so easy tickets: 
   * #15649 
   * #15339 
   * #10285 
   * #14207 
   * #14390 
   * #14648 
   * #15677 
   * #15015 
   * #13354 
   * #14697 and #10572 
   * #15338 
   * #15323 
   * and others... 

## Introduction to categories

* Nicolas, ... 

## Introduction to git

* by Volker Braun 
* interested 
      * Samuel 
      * Eric 
      * Thierry 
      * Sébastien 
      * Jean-Philippe 
      * Nicolas 
      * Everybody! 
Done Monday Morning! Thanks Volker! 
