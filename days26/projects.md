= PROJECT GROUPS =

<<TableOfContents>>

== Computing the Cartier operator acting on 1-forms ==

PEOPLE: Rachel P., Aly, Gagan, Anja, Sarah, Marina, Kate

  * See [[days26/Pries Project|this page]].

  * sage worksheet that is slow and just implements algorithm (correctly!)
    - this appears to be done here: [[attachment:Computing N for Hyperelliptic curve.sws]]

    - need data to check that this is correct.

  * make it really, really fast. 

  * get included in sage itself

  * make a big table or something?   Rachel: "I would love to find a curve with p-rank 0 and a-number 1.   I did genus 4 and p=3."


== Making Drew Sutherland's smalljac code usable in Sage and extending Kate's data ==

PEOPLE: Kate, William S., Lola, Aly, Erin, Bianca

  * smalljac

      * make smalljac code usable from Python  (involves Cython); see [[http://code.google.com/p/purplesage/issues/detail?id=13|this psage issue]].

      * use code:
 
          - replicate and extend data in Kate's talk
 
          - maybe try genus 2 analogue?

  * cubic and sextic residue symbol

      * there's a [[http://trac.sagemath.org/sage_trac/attachment/ticket/8485/trac_8485.patch|ticket]] that has only partial implementation (cubic residue of rational prime and element of Q(sqrt(-3))) -- not at all a general implementation

      * there are artin symbols etc. -- big machinery

      * we think a fast independent implementation of the cubic (and sextic) residue symbol is worthwhile

      * what does SAGE do to compute quadratic residue symbols?

  * explicit calculation of Grossencharacters (aka Hecke characters). 


== Computing L-series of Jacobians of Certain Hyperelliptic Curves ==

PEOPLE: Jennifer B., Jennifer P., Jennifer J.

  * Decide if curve is attached to a modular form, and if so find it, then use that to compute L-series.

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
    
  * Quasisymmetric function bases
  
  * hyperplane arrangements
  
  * wikipedia and Sage pages linked to each other
