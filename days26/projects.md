= PROJECT GROUPS =

<<TableOfContents>>

== Computing the Cartier operator acting on 1-forms ==

PEOPLE: Rachel P., Aly, Gagan, Anja, Sarah, Marina, Kate

  * See [[days26/Pries Project|this page]].

  * sage worksheet that is slow and just implements algorithm (correctly!)
    * this appears to be done here: [[attachment:Computing N for Hyperelliptic curve.sws]]
    * need data to check that this is correct.
    * for what range of primes is this code reasonable?

  * make it really, really fast (cython). 

  * get included in sage itself

  * make a big table or something?   Rachel: "I would love to find a curve with p-rank 0 and a-number 1.   I did genus 4 and p=3."


== Making Drew Sutherland's smalljac code usable in Sage and extending Kate's data ==

PEOPLE: Kate, William S., Lola, Aly, Erin, Bianca

See the [[days26/Stange Project|Project Page]].  Subprojects are:

  * make smalljac code usable from Python (involves Cython)

  * cubic and sextic residue symbol

  * explicit calculation of Grossencharacters (aka Hecke characters). 


== Computing L-series of Jacobians of Certain Hyperelliptic Curves ==

PEOPLE: Jennifer B., Jennifer P., Jennifer J., Bianca

  * Decide if curve is attached to a modular form, and if so find it, then use that to compute L-series (use Sturm bound -- see paper of Ribet with appendix by Agashe/Stein)

  * Need the analogue of Tate's algorithm to get from the Namikawa-Ueno classification to the Euler factor at the bad primes

  * Plug L-series into Dokchitser and get numbers.

  * Make a table.  Starting with [[https://www.math.lsu.edu/~wamelen/CMcurves.txt|"van Wamelen"'s table]].  See also [[http://echidna.maths.usyd.edu.au/kohel/dbs/index.html|Kohel's tables]].

  * Incorporate Robert Bradshaw's code into Purple Sage.  http://code.google.com/p/purplesage/issues/detail?id=14


== Computing in the class group of non-maximal orders of quadratic imaginary fields ==

PEOPLE: William S., Bianca, 

  * Make a list of what you want to be able to do:
      - Such computations come up for Stein in http://wstein.org/papers/kolyconj2/

  * List why Magma/PARI aren't good enough (bugs, issues, speed, etc.)

  * Write really really fast code to implement some of this. 

  
== Sara's (mostly Combinatorics) wishlist ==

PEOPLE:  Needs people!

  * Better index of software
   
  * sbcl in Sage
    
  * Quasisymmetric function bases (Jason Bandlow has preliminary implementations on sage-combinat)
  
  * hyperplane arrangements
  
  * wikipedia and Sage pages linked to each other


== Some combinatorics projects from Anne's talk ==

  * LaTeX support for tableaux, compatible with jsmath/mathjax for visualization in the notebook, see trac#4355

  * Implementation of cyclage graph

  * Implementation of the Schuetzenberger involution Omega_2 on tableaux and words

  * Faster implementation of crystal graph isomorphisms (would have implications for the energy function and R-matrix)

  * make the k-Schur function and their duals live in the right subspace/quotient of the ring of symmetric functions
