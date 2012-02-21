We'll be drawing our projects from the following sources.

 * The wiki page for [[padics|enhancements to p-adics in Sage]].  
 * The list of [[http://trac.sagemath.org/sage_trac/query?status=needs_info&status=needs_review&status=needs_work&status=new&component=padics&order=priority|open p-adic tickets on Trac]].
 * Computational projects proposed by participants on Sunday afternoon.

== Sunday Project Proposals ==

 * [[/PowerSeries|Power Series]] -- separate precision from arithmetic, come up with applications that it will be used for: power series that converge in a particular p-adic disc.  Modules over these rings.
 * [[/Factoring|Factoring]] -- work on factoring of polynomials over local fields.
 * [[/Templates|Templates]] -- templates for elements of p-adic fields.
 * [[/SymbolicIntegration|Symbolic Integration]] -- symbolic integration over p-adics.  p-adic Igusa zeta functions.  Get rational functions in a symbolic p.  Look at Denef's webpage.
 * [[/LogarithmsForExt|Logarithms and Exponentials]] -- logarithms and exponentials for p-adic extension fields.
 * [[/FunctionFields|Function Fields]] -- implementing p-adic function fields
 * [[/WittVectors|Witt Vectors]] -- Witt vectors over general rings.
 * [[/Completions|Completions]] -- Completions of number fields.
 * [[/LinearAlgebra|Linear Algebra]] -- think.  then implement.
 * [[/Inversion|Inversion]] -- Speed up inversion.
 * [[/PadicRootAlgorithm|Panayi's root finding algorithm]] -- Implement Panayi's p-adic root finding algorithm. 
 * [[http://trac.sagemath.org/sage_trac/ticket/12545|Trac 12545: create highly optimized p-adic L-series implementation for various special cases]] (William Stein, Jennifer Balakrishnan)
 * [[http://trac.sagemath.org/sage_trac/ticket/812|Trac 812: p-adic L-series via overconvergent modular symbols]]  (William Stein, Jennifer Balakrishnan)
 * [[/BugSquash|Report and fix bugs in the p-adics]] -- some of our funding comes from this objective. 
 * [[/BruhatTitsTree|Bruhat Tits Tree]] -- Cameron and Marc's code into Sage.
 * [[/FLINT2|FLINT 2]] -- Get FLINT 2 into Sage. See [[http://trac.sagemath.org/sage_trac/ticket/12173|#12173]].
 * [[http://trac.sagemath.org/sage_trac/ticket/8335|Trac 8335: lattices of finite fields]] -- See also [[http://trac.sagemath.org/sage_trac/ticket/12117|Trac 12117]], [[http://trac.sagemath.org/sage_trac/ticket/12125|Trac 12125]], [[http://trac.sagemath.org/sage_trac/ticket/7240|Trac 7240]] and [[http://trac.sagemath.org/sage_trac/ticket/12133|Trac 12133]].
 * [[http://trac.sagemath.org/sage_trac/ticket/8241|Trac 8241: conversion to and from residue fields of p-adic fields]] -- depends on [[http://trac.sagemath.org/sage_trac/ticket/12062|Trac 12062]], [[http://trac.sagemath.org/sage_trac/ticket/12053|Trac 12053]], [[http://trac.sagemath.org/sage_trac/ticket/12064|Trac 12064]], and [[http://trac.sagemath.org/sage_trac/ticket/12077|Trac 12077]], which all need review.

== Miscellaneous ==

Here are my emacs files:

 * [[http://sage.math.washington.edu/home/roed/sage.el|My sage.el file]] -- Download and put somewhere convenient
 * [[http://sage.math.washington.edu/home/roed/pyrex.el|My pyrex.el file]] -- Download and put somewhere convenient
 * [[http://sage.math.washington.edu/home/roed/.emacs|My .emacs file]] -- put in your home directory and edit the following two lines to the appropriate paths for the above files:
   * (load "/Users/Roed/sage/sage-4.0/data/emacs/sage-mode.el")
   * (load "/Users/Roed/sage/sage-4.0/data/emacs/pyrex-mode.el")
