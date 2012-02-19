= Larger Projects =

These are large projects that will improve the state of p-adics and local rings in Sage.  For each I've tried to estimate the difficulty (which takes into account both the amount of code to be written and any technical challenges I currently forsee), and an opinion on how important the completion of this project is.  Note that some of these projects depend on others; these dependencies can be found on the project pages and are NOT included in the estimated difficulty.

Each project page should eventually contain the following information, though many are still in progress:
 * ''Goal'' -- 1-2 sentence summary of the goal of the project
 * ''Type'' -- The kinds of enhancement that this project represents, e.g. basic features, speed improvements, bug fix, precision handling, conceptual coherence...
 * ''Priority'' -- An estimate of how important the community as a whole considers this project.  There will of course be disagreements about how important different features are.  If you believe that an estimate someone else has made for priority is different from the community average, please bring it up on sage-padics@googlegroups.com rather than just changing it.  If your personal priority is higher than the community average, you should work on that project.  :-)
 * ''Difficulty'' -- A brief estimate on the difficulty of completing this project.  Mainly for people who're looking through the list of projects to determine which they might want to work on.
 * ''Prerequisites'' -- Other projects or tickets that need to be completed before this project (or parts of this project) can be undertaken.
 * ''Background'' -- Background knowledge useful or necessary for working on this project.  This could be mathematical knowledge or familiarity with certain parts of Sage.
 * ''Contributors'' -- People who are interested in working on or discussing this project.
 * ''Progress'' - A brief summary of progress on this project (though this may be hard to keep up to date)
 * ''Related Tickets'' -- Links to related tickets on [[http://trac.sagemath.org/sage_trac | Trac]]
 * '''Discussion''' -- A section for design discussion
 * '''Tasks''' -- A breakdown of this project into more manageable pieces.  Ideally, these pieces should be appropriate for an individual patch.  Once implementation has been started on a project, it should be broken down into one or more tickets, and each task should be assigned to a ticket.

----

 1. [[/GeneralExtensions | General extension rings]]
  * ''Goal'' -- the ability to create arbitrary absolute extensions of Qp and Zp, given a monic unramified polynomial f over Zp and an Eisenstein polynomial with coefficients in the extension of Zp defined by f.
  * ''Priority'' -- High
  * ''Difficulty'' -- Hard
 1. [[/PolynomialPrecision | p-Adic polynomial precision]]
  * ''Goal'' -- Finally finish incorporating the changes of #6084, which conceptually splits the precision a polynomial is defined up to from an approximation of the coefficients.
  * ''Priority'' -- High
  * ''Difficulty'' -- Hard
 1. [[/HenselLifting | Hensel Lifting]]
  * ''Goal'' -- Define Hensel lifting for roots and factorizations of polynomials over Henselian rings.
  * ''Priority'' -- High
  * ''Difficulty'' -- Medium-Easy
 1. [[/QuoDVRs | Linear algebra over quotients of discrete valuation rings]]
  * ''Goal'' -- Implement specialized algorithms to work with matrices, vectors and modules over quotients of discrete valuation rings.
  * ''Priority'' -- High
  * ''Difficulty'' -- Medium-High
 1. [[/MatrixPrecision | Precision for matrices and vectors over local rings]]
  * ''Goal'' -- Separate the precision for matrices and vectors from the approximation of their entries.
  * ''Priority'' -- High
  * ''Difficulty'' -- Hard
 1. [[/PolynomialFactoring | Factoring in Sage for polynomials over local fields]]
  * ''Goal'' -- Implement algorithms for factoring polynomials over local fields.  Define extensions of local fields using any polynomial.
  * ''Priority'' -- High
  * ''Difficulty'' -- Hard
 1. [[/Completions | Completions of number fields]]
  * ''Goal'' -- Make the command "K.completion(p, absprec=30)" work when K is a number field and p is a prime of K
  * ''Priority'' -- Medium-High
  * ''Difficulty'' -- Medium-Easy
 1. [[/UbiquitousTemplates | More templates]]
  * ''Goal'' -- Implement unramified and Eistenstein extensions of Zp and Qp (the one-step extensions) using templates.  Switch the other finite field classes to using templates.
  * ''Priority'' -- Medium-Low
  * ''Difficulty'' -- Medium
 1. [[/ZpSmallPrecision | Optimized Zp and Qp elements for the case that p^prec fits in a long]]
  * ''Goal'' -- Write new classes of elements, analogous to `IntegerMod_int` and `IntegerMod_int64` for the case that self.unit or self.value fits into machine precision.  
  * ''Priority'' -- Medium-Low
  * ''Difficulty'' -- Medium
 1. [[/GNB | Cyclotomic extensions and Gauss normal basis]] 
  * ''Goal'' -- Design a specialized p-adic extension type for cyclotomic extensions of Qp and Zp.  Design element classes for unramified extensions that take advantage of a Gauss normal basis for faster arithmetic.
  * ''Priority'' -- Medium
  * ''Difficulty'' -- Medium-Hard
 1. [[/UnivariatePowerSeriesExact | Univariate power series over exact rings]]
  * ''Goal'' -- revamp univariate power series rings to hew more closely to the syntax of p-adics (relative and absolute precision; capped-rel, capped-abs and fixed-mod rings types; no more elements of infinite precision (except 0 in a capped-relative ring)
  * ''Priority'' -- Low
  * ''Difficulty'' -- Easy
 1. [[/UnivariatePowerSeriesPadic | Univariate power series over p-adics]]
  * ''Goal'' -- Separate precision from approximation for power series.  Include precision types that give information about the valuations for ALL coefficients (not just the first n).  Write functions for solving p-adic differential equations.
  * ''Priority'' -- Medium-Low
  * ''Difficulty'' -- Medium-Hard
 1. [[/MultivariatePowerSeries | Multivariate power series]]
  * ''Goal'' -- Continue to improve multivariate power series, building on the work in #1956.  Create the ability to work with different precision types for multivariate power series and laurent series.
  * ''Priority'' -- Medium-Low
  * ''Difficulty'' -- Medium-Hard
 1. [[/MatricesModN | New matrix class for Zmod(n)]] 
  * ''Goal'' -- Write a specialized class for matrices over Zmod(n) for n > 46341
  * ''Priority'' -- High
  * ''Difficulty'' -- Medium
 1. [[/RelativeExtensions | Relative extensions of p-adic fields]]
  * ''Goal'' -- Implement relative extensions of p-adic fields
  * ''Priority'' -- High
  * ''Difficulty'' -- Medium
 1. [[/FieldsDatabase | Add the database of p-adic fields to Sage]]
  * ''Goal'' -- Add [[http://math.asu.edu/~jj/localfields/ | this database]] of p-adic fields to Sage
  * ''Priority'' -- Medium
  * ''Difficulty'' -- Easy
 1. [[/WittVectors | Witt vectors over a general ring]]
  * ''Goal'' -- Implement Witt vectors over a general ring
  * ''Priority'' -- Low
  * ''Difficulty'' -- Easy
 1. [[/GaloisGroups | Galois groups of p-adic extensions]]
  * ''Goal'' -- Translate the infrastructure for Galois groups of number field to Galois groups of p-adic fields and implement some native algorithms to compute them. 
  * ''Priority'' -- Low (because it's long term and many of the capabilities already exist in Pari)
  * ''Difficulty'' -- High
 1. [[/SubfieldsAndCompositums | Intersections, subfields and compositums of p-adic extensions]]
  * ''Goal'' -- Create extensions from other extensions using operations such as intersection, compositum and listing subfields.  They should be provided with appropriate coercion maps.
  * ''Priority'' -- High
  * ''Difficulty'' -- High
 1. [[/InfiniteTowers | Infinite towers of extensions]]
  * ''Goal'' -- Create new parent classes for infinite towers (or more generally just infinite extensions) over Qp and Zp, e.g. maximal unramified extension, `p^n` roots of 1 or of p...
  * ''Priority'' -- Low
  * ''Difficulty'' -- High
 1. [[/Wittferentiation | implementing pderivations]]
  * ''Goal'' -- Implement p-derivations http://en.wikipedia.org/wiki/P-derivation
  * ''Priority'' -- Med
  * ''Difficulty'' -- Med
 1. [[/RestrictedPowerSeries | implement restricted power series]]
  * ''Goal'' -- Implement restricted power series and elements of restricted powerseries 
  * ''Priority'' -- Low
  * ''Difficulty'' -- Easy


= Smaller Projects =

These are smaller projects that are hopefully more accessible to someone new to p-adics in Sage or with less time to devote.  The difficulty range for these projects has been rescaled to account for the fact that they're all shorter than the projects above.

 1. [[/OptimizedInversion | Speed up inversion using Hensel lifting]]
  * ''Goal'' -- Optimize inversion in Zp, Qp, and extensions by finding the right choice of precision at which to use extended gcd and then lift with newton's method
  * ''Priority'' -- High
  * ''Difficulty'' -- Medium-Hard
 1. [[/TeichmullerPoly | Teichmuller defining polynomial]]
  * ''Goal'' -- Create an option for Zq and Qq to generate their defining polynomial by lifting from GF(p)[x] to a factor of x^q-1 (as opposed to lifting naively)
  * ''Priority'' -- Medium
  * ''Difficulty'' -- Medium
 1. [[/ExpAndLog | Exponentials and logarithms for elements of extension rings]]
  * ''Goal'' -- Fix implementation of p-adic exponential and logarithm maps for extensions.
  * ''Priority'' -- Medium-High
  * ''Difficulty'' -- Medium
 1. [[/NthRoots | Square and nth roots]]
  * ''Goal'' -- Implementation of nth root for Zp, Qp and extensions
  * ''Priority'' -- High
  * ''Difficulty'' -- Medium
 1. [[/AdditionalFunctions | More functions for Qp and Zp]]
  * ''Goal'' -- implement functions such as Artin-Hasse exponential and p-adic gamma function that exist in Magma.
  * ''Priority'' -- Low
  * ''Difficulty'' -- Medium
 1. [[/KrasnersLemma | Krasner's Lemma]]
  * ''Goal'' -- implement a function to test if totally ramified extensions are isomorphic, and to determine whether a polynomial has enough precision to specify an extension uniquely up to isomorphism
  * ''Priority'' -- Medium
  * ''Difficulty'' -- Medium
 1. [[/PanayiRootFinding | Panayi's Root Finding Algorithm]]
  * ''Goal'' -- implement Panayi's root finding algorithm: http://www.math.tu-berlin.de/%7Ekant/publications/papers/krasner.pdf
  * ''Priority'' -- High
  * ''Difficulty'' -- Medium

= External Projects =

These are external projects that will benefit p-adics and local rings in Sage.

 1. [[/pAdicFLINT | FLINT library for computing with p-adics]]
  * ''Goal'' -- write C code on top of Flint (1 or 2) for optimized computations in p-adic extensions.
