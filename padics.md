

# Larger Projects

These are large projects that will improve the state of p-adics and local rings in Sage.  For each I've tried to estimate the difficulty (which takes into account both the amount of code to be written and any technical challenges I currently forsee), and an opinion on how important the completion of this project is.  Note that some of these projects depend on others; these dependencies can be found on the project pages and are NOT included in the estimated difficulty. 

Each project page should eventually contain the following information, though many are still in progress: 

* _Goal_ -- 1-2 sentence summary of the goal of the project 
* _Type_ -- The kinds of enhancement that this project represents, e.g. basic features, speed improvements, bug fix, precision handling, conceptual coherence... 
* _Priority_ -- An estimate of how important the community as a whole considers this project.  There will of course be disagreements about how important different features are.  If you believe that an estimate someone else has made for priority is different from the community average, please bring it up on <a href="mailto:sage-padics@googlegroups.com">sage-padics@googlegroups.com</a> rather than just changing it.  If your personal priority is higher than the community average, you should work on that project.  :-) 
* _Difficulty_ -- A brief estimate on the difficulty of completing this project.  Mainly for people who're looking through the list of projects to determine which they might want to work on. 
* _Prerequisites_ -- Other projects or tickets that need to be completed before this project (or parts of this project) can be undertaken. 
* _Background_ -- Background knowledge useful or necessary for working on this project.  This could be mathematical knowledge or familiarity with certain parts of Sage. 
* _Contributors_ -- People who are interested in working on or discussing this project. 
* _Progress_ - A brief summary of progress on this project (though this may be hard to keep up to date) 
* _Related Tickets_ -- Links to related tickets on <a class="http" href="http://trac.sagemath.org/sage_trac">Trac</a> 
* **Discussion** -- A section for design discussion 
* **Tasks** -- A breakdown of this project into more manageable pieces.  Ideally, these pieces should be appropriate for an individual patch.  Once implementation has been started on a project, it should be broken down into one or more tickets, and each task should be assigned to a ticket. 


---

 

1. <a href="/padics/GeneralExtensions">General extension rings</a> 
   * _Goal_ -- the ability to create arbitrary absolute extensions of Qp and Zp, given a monic unramified polynomial f over Zp and an Eisenstein polynomial with coefficients in the extension of Zp defined by f. 
   * _Priority_ -- High 
   * _Difficulty_ -- Hard 
1. <a href="/padics/PolynomialPrecision">p-Adic polynomial precision</a> 
   * _Goal_ -- Finally finish incorporating the changes of #6084, which conceptually splits the precision a polynomial is defined up to from an approximation of the coefficients. 
   * _Priority_ -- High 
   * _Difficulty_ -- Hard 
1. <a href="/padics/HenselLifting">Hensel Lifting</a> 
   * _Goal_ -- Define Hensel lifting for roots and factorizations of polynomials over Henselian rings. 
   * _Priority_ -- High 
   * _Difficulty_ -- Medium-Easy 
1. <a href="/padics/QuoDVRs">Linear algebra over quotients of discrete valuation rings</a> 
   * _Goal_ -- Implement specialized algorithms to work with matrices, vectors and modules over quotients of discrete valuation rings. 
   * _Priority_ -- High 
   * _Difficulty_ -- Medium-High 
1. <a href="/padics/MatrixPrecision">Precision for matrices and vectors over local rings</a> 
   * _Goal_ -- Separate the precision for matrices and vectors from the approximation of their entries. 
   * _Priority_ -- High 
   * _Difficulty_ -- Hard 
1. <a href="/padics/PolynomialFactoring">Factoring in Sage for polynomials over local fields</a> 
   * _Goal_ -- Implement algorithms for factoring polynomials over local fields.  Define extensions of local fields using any polynomial. 
   * _Priority_ -- High 
   * _Difficulty_ -- Hard 
1. <a href="/padics/Completions">Completions of number fields</a> 
   * _Goal_ -- Make the command "K.completion(p, absprec=30)" work when K is a number field and p is a prime of K 
   * _Priority_ -- Medium-High 
   * _Difficulty_ -- Medium-Easy 
1. <a href="/padics/UbiquitousTemplates">More templates</a> 
   * _Goal_ -- Implement unramified and Eistenstein extensions of Zp and Qp (the one-step extensions) using templates.  Switch the other finite field classes to using templates. 
   * _Priority_ -- Medium-Low 
   * _Difficulty_ -- Medium 
1. <a href="/padics/ZpSmallPrecision">Optimized Zp and Qp elements for the case that p^prec fits in a long</a> 
   * _Goal_ -- Write new classes of elements, analogous to `IntegerMod_int` and `IntegerMod_int64` for the case that self.unit or self.value fits into machine precision.   
   * _Priority_ -- Medium-Low 
   * _Difficulty_ -- Medium 
1. <a href="/padics/GNB">Cyclotomic extensions and Gauss normal basis</a>  
   * _Goal_ -- Design a specialized p-adic extension type for cyclotomic extensions of Qp and Zp.  Design element classes for unramified extensions that take advantage of a Gauss normal basis for faster arithmetic. 
   * _Priority_ -- Medium 
   * _Difficulty_ -- Medium-Hard 
1. <a href="/padics/UnivariatePowerSeriesExact">Univariate power series over exact rings</a> 
   * _Goal_ -- revamp univariate power series rings to hew more closely to the syntax of p-adics (relative and absolute precision; capped-rel, capped-abs and fixed-mod rings types; no more elements of infinite precision (except 0 in a capped-relative ring) 
   * _Priority_ -- Low 
   * _Difficulty_ -- Easy 
1. <a href="/padics/UnivariatePowerSeriesPadic">Univariate power series over p-adics</a> 
   * _Goal_ -- Separate precision from approximation for power series.  Include precision types that give information about the valuations for ALL coefficients (not just the first n).  Write functions for solving p-adic differential equations. 
   * _Priority_ -- Medium-Low 
   * _Difficulty_ -- Medium-Hard 
1. <a href="/padics/MultivariatePowerSeries">Multivariate power series</a> 
   * _Goal_ -- Continue to improve multivariate power series, building on the work in #1956.  Create the ability to work with different precision types for multivariate power series and laurent series. 
   * _Priority_ -- Medium-Low 
   * _Difficulty_ -- Medium-Hard 
1. <a href="/padics/MatricesModN">New matrix class for Zmod(n)</a>  
   * _Goal_ -- Write a specialized class for matrices over Zmod(n) for n > 46341 
   * _Priority_ -- High 
   * _Difficulty_ -- Medium 
1. <a href="/padics/RelativeExtensions">Relative extensions of p-adic fields</a> 
   * _Goal_ -- Implement relative extensions of p-adic fields 
   * _Priority_ -- High 
   * _Difficulty_ -- Medium 
1. <a href="/padics/FieldsDatabase">Add the database of p-adic fields to Sage</a> 
   * _Goal_ -- Add <a class="http" href="http://math.asu.edu/~jj/localfields/">this database</a> of p-adic fields to Sage 
   * _Priority_ -- Medium 
   * _Difficulty_ -- Easy 
1. <a href="/padics/WittVectors">Witt vectors over a general ring</a> 
   * _Goal_ -- Implement Witt vectors over a general ring 
   * _Priority_ -- Low 
   * _Difficulty_ -- Easy 
1. <a href="/padics/GaloisGroups">Galois groups of p-adic extensions</a> 
   * _Goal_ -- Translate the infrastructure for Galois groups of number field to Galois groups of p-adic fields and implement some native algorithms to compute them.  
   * _Priority_ -- Low (because it's long term and many of the capabilities already exist in Pari) 
   * _Difficulty_ -- High 
1. <a href="/padics/SubfieldsAndCompositums">Intersections, subfields and compositums of p-adic extensions</a> 
   * _Goal_ -- Create extensions from other extensions using operations such as intersection, compositum and listing subfields.  They should be provided with appropriate coercion maps. 
   * _Priority_ -- High 
   * _Difficulty_ -- High 
1. <a href="/padics/InfiniteTowers">Infinite towers of extensions</a> 
   * _Goal_ -- Create new parent classes for infinite towers (or more generally just infinite extensions) over Qp and Zp, e.g. maximal unramified extension, `p^n` roots of 1 or of p... 
   * _Priority_ -- Low 
   * _Difficulty_ -- High 
1. <a href="/padics/Wittferentiation">implementing pderivations</a> 
   * _Goal_ -- Implement p-derivations <a href="http://en.wikipedia.org/wiki/P-derivation">http://en.wikipedia.org/wiki/P-derivation</a> 
   * _Priority_ -- Med 
   * _Difficulty_ -- Med 
1. <a href="/padics/RestrictedPowerSeries">implement restricted power series</a> 
   * _Goal_ -- Implement restricted power series and elements of restricted powerseries  
   * _Priority_ -- Low 
   * _Difficulty_ -- Easy 

# Smaller Projects

These are smaller projects that are hopefully more accessible to someone new to p-adics in Sage or with less time to devote.  The difficulty range for these projects has been rescaled to account for the fact that they're all shorter than the projects above. 

1. <a href="/padics/OptimizedInversion">Speed up inversion using Hensel lifting</a> 
   * _Goal_ -- Optimize inversion in Zp, Qp, and extensions by finding the right choice of precision at which to use extended gcd and then lift with newton's method 
   * _Priority_ -- High 
   * _Difficulty_ -- Medium-Hard 
1. <a href="/padics/TeichmullerPoly">Teichmuller defining polynomial</a> 
   * _Goal_ -- Create an option for Zq and Qq to generate their defining polynomial by lifting from GF(p)[x] to a factor of x^q-1 (as opposed to lifting naively) 
   * _Priority_ -- Medium 
   * _Difficulty_ -- Medium 
1. <a href="/padics/ExpAndLog">Exponentials and logarithms for elements of extension rings</a> 
   * _Goal_ -- Fix implementation of p-adic exponential and logarithm maps for extensions. 
   * _Priority_ -- Medium-High 
   * _Difficulty_ -- Medium 
1. <a href="/padics/NthRoots">Square and nth roots</a> 
   * _Goal_ -- Implementation of nth root for Zp, Qp and extensions 
   * _Priority_ -- High 
   * _Difficulty_ -- Medium 
1. <a href="/padics/AdditionalFunctions">More functions for Qp and Zp</a> 
   * _Goal_ -- implement functions such as Artin-Hasse exponential and p-adic gamma function that exist in Magma. 
   * _Priority_ -- Low 
   * _Difficulty_ -- Medium 
1. <a href="/padics/KrasnersLemma">Krasner's Lemma</a> 
   * _Goal_ -- implement a function to test if totally ramified extensions are isomorphic, and to determine whether a polynomial has enough precision to specify an extension uniquely up to isomorphism 
   * _Priority_ -- Medium 
   * _Difficulty_ -- Medium 
1. <a href="/padics/PanayiRootFinding">Panayi's Root Finding Algorithm</a> 
   * _Goal_ -- implement Panayi's root finding algorithm: <a href="http://www.math.tu-berlin.de/%7Ekant/publications/papers/krasner.pdf">http://www.math.tu-berlin.de/%7Ekant/publications/papers/krasner.pdf</a> 
   * _Priority_ -- High 
   * _Difficulty_ -- Medium 

# External Projects

These are external projects that will benefit p-adics and local rings in Sage. 

1. <a href="/padics/pAdicFLINT">FLINT library for computing with p-adics</a> 
   * _Goal_ -- write C code on top of Flint (1 or 2) for optimized computations in p-adic extensions. 