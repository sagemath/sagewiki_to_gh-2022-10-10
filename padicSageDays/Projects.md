
We'll be drawing our projects from the following sources. 

* The wiki page for <a href="/padics">enhancements to p-adics in Sage</a>.   
* The list of <a class="http" href="http://trac.sagemath.org/sage_trac/query?status=needs_info&amp;status=needs_review&amp;status=needs_work&amp;status=new&amp;component=padics&amp;order=priority">open p-adic tickets on Trac</a>. 
* Computational projects proposed by participants on Sunday afternoon. 

## Projects

* <a href="/padicSageDays/Projects/PowerSeries">Power Series</a> -- separate precision from arithmetic, come up with applications that it will be used for: power series that converge in a particular p-adic disc.  Modules over these rings. 
* <a href="/padicSageDays/Projects/Factoring">Factoring</a> -- work on factoring of polynomials over local fields. 
* <a href="/padicSageDays/Projects/Templates">Templates</a> -- templates for elements of p-adic fields. 
* <a href="/padicSageDays/Projects/SymbolicIntegration">Symbolic Integration</a> -- symbolic integration over p-adics.  p-adic Igusa zeta functions.  Get rational functions in a symbolic p.  Look at Denef's webpage. 
* <a href="/padicSageDays/Projects/LogarithmsForExt">Logarithms and Exponentials</a> -- logarithms and exponentials for p-adic extension fields. 
* <a href="/padicSageDays/Projects/FunctionFields">Function Fields</a> -- implementing p-adic function fields 
* <a href="/padicSageDays/Projects/WittVectors">Witt Vectors</a> -- Witt vectors over general rings. 
* <a href="/padicSageDays/Projects/Completions">Completions</a> -- Completions of number fields. 
* <a href="/padicSageDays/Projects/LinearAlgebra">Linear Algebra</a> -- think.  then implement. 
* <a href="/padicSageDays/Projects/Inversion">Inversion</a> -- Speed up inversion. 
* <a href="/padicSageDays/Projects/nthRoots">nth roots</a> -- Implement nth roots for p-adic elements. 
* <a href="/padicSageDays/Projects/PadicRootAlgorithm">Panayi's root finding algorithm</a> -- Implement Panayi's p-adic root finding algorithm. (Simon Spicer; on hold)  
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12545">Trac 12545: create highly optimized p-adic L-series implementation for various special cases</a> (William Stein, Jennifer Balakrishnan, Simon Spicer) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/812">Trac 812: p-adic L-series via overconvergent modular symbols</a>  (William Stein, Jennifer Balakrishnan, Simon Spicer) 
* <a href="/padicSageDays/Projects/BugSquash">Report and fix bugs in the p-adics</a> -- some of our funding comes from this objective.  
* <a href="/padicSageDays/Projects/BruhatTitsTree">Bruhat Tits Tree</a> -- Cameron and Marc's code into Sage. 
* <a href="/padicSageDays/Projects/FLINT2">FLINT 2</a> -- Get FLINT 2 into Sage. See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12173">#12173</a>. 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8335">Trac 8335: lattices of finite fields</a> -- See also <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12117">Trac 12117</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12125">Trac 12125</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7240">Trac 7240</a> and <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12133">Trac 12133</a>. 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8240">Trac 8240: conversion to and from residue fields of p-adic fields</a> -- depends on <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12062">Trac 12062</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12053">Trac 12053</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12064">Trac 12064</a>, and <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12077">Trac 12077</a>, which all need review. 
* <a href="/padicSageDays/Projects/AdditionalFunctions">Additional Functions</a> -- Implement the Artin-Hasse Exponential and the p-adic gamma function 
Not directly related to $p$-adics but: 

* <a href="/padicSageDays/Projects/SkewPolynomials">/SkewPolynomials</a> -- Ring of skew polynomials over a finite field 

## Miscellaneous

Here are my emacs files: 

* <a class="http" href="http://sage.math.washington.edu/home/roed/sage.el">My sage.el file</a> -- Download and put somewhere convenient 
* <a class="http" href="http://sage.math.washington.edu/home/roed/pyrex.el">My pyrex.el file</a> -- Download and put somewhere convenient 
* <a class="http" href="http://sage.math.washington.edu/home/roed/.emacs">My .emacs file</a> -- put in your home directory and edit the following two lines to the appropriate paths for the above files: 
      * (load "/Users/Roed/sage/sage-4.0/data/emacs/sage-mode.el") 
      * (load "/Users/Roed/sage/sage-4.0/data/emacs/pyrex-mode.el") 