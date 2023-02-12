

# Sage Days 15 Project Ideas

These are project ideas for <a href="/days15">Sage Days 15</a> 


## MSVC 2008 port of PARI-2.4.2.alpha0

   * Do a port of PARI-2.4.2.alpha0 to MSVC 2008, including MPIR support. 

## Low Level Simplicial Sets, CW Complexes, and Morphisms for Simplicial Complexes and Chain Complexes

PEOPLE: S. Ault, B. Antieau 

   * Rudimentary method to check if input defines a simplicial set. Brainstorming on how to make this accessible to a user. 
   * S. Ault has a CW Complex class up and running (including the chain_complex() method).  The next step is to work on a homology_with_generators method within the <a href="/ChainComplex">ChainComplex</a> (See trac #5882 and #6100). 
         * Constructor of CW complexes from simplicial complexes. 
         * Will include some standard CW complexes for playing around with. Including various projective spaces. 
   * B. Antieau has simplicial complex morphisms, and has the functor to morphisms of chain complexes. (See trac #6099.) 
         * There are simplicial complex morphism and chain complex morphism classes, and there is a method on the former to produce and instance of the latter, including base rings, augmentation, chain v. cochain. 
         * Working on various associated complexes of a map, like graph, mapping_{cone,cylinder,path_space}. 
         * Working on fiber products. 
         * Prepping for induced maps on homology, cohomology, ring structure on cohomology. (See trac #6101 and #6102.) 
         * Milestone for these patches is 4.0.2. 
   * All of this code is going rely heavily on William's #5882 patch for arbitrary finitely generated modules over rings with implemented Smith normal form. As the SAGE code for linear algebra gets faster, we will be able to compute more and more homology and cohomology. 
   * This all provides groundwork for the creation of modules over John Palmieri's SAGE implementation of the Steenrod algebra, which is a long-term goal. 

## Prime Pi

PEOPLE: Fredrik Johansson, William Stein, Robert Bradshaw 

   * Investigate implementing the Meissel, Lehmer, Lagarias, Miller, Odlyzko for computing the number of primes up to x. 

## Steenrod Algebra cohomology (Yacop integration)

PEOPLE: Christian, John Palmieri, S. Ault, Bob Bruner 

   * A first version is already available. Here's a page with installation instructions: <a href="/Yacop">Yacop</a>  
Stuff for the final report: 

   * Installation problems on Mac OS X fixed 
   * Defined SAGE framework for modules over the Steenrod algebra and created a first proof-of-concept implementation of some modules. 

## MinRes - Mininmal resolutions over the Steenrod algebra

PEOPLE:  Bob Bruner, Christian Nassau, John Palmieri, David Roe 

   * Create SAGE interface to Bruner's minimal resolutions package  
   * Package is general for mod 2 connected algebras, but currently only has 
         * support for the mod 2 Steenrod algebra and the subalgebra <$Sq<sup>1$, $Sq</sup>2$, $Sq^4$>  
   * Focus is on multiplicative structure:  $Ext_A(M,M)$ as an algebra w.r.t. Yoneda 
         * product, and $Ext_A(M,N)$ and $Ext_A(N,M)$ as modules over it. 
Accomplished this week: 

   * Crude Steenrod algebra as vector space datatype and interface to module creation and 
         * minimal resolution calculation 
   * Results integrated into Yacop's GUI and database manager. 
Still to do: 

   * Integrate crude datatype into better Steenrod module datatype 
   * Implement <a href="/MinRes">MinRes</a>'s FP module datatype 
   * Implement chain maps (<a href="/MinRes">MinRes</a> can lift an arbitrary cocycle - from this the multiplicative 
         * structure is evident, including Toda brackets) 
   * Create spectral sequence datatype to accept Ext algebras and modules as inputs, and 
         * differentials (calculated using Bruner's thesis in case of $H_\infty$ ring spectra) (lazy evaluation essential here) and use algebra structure to extend and explore consequences. 
   * Use Palmieri's Steenrod algebra routines to minimize effort in describing modules  

## Quaternion Algebras (implement odd power of p dividing level case)

PEOPLE: Alia Hamieh, Jerome Lefebvre, William Stein. 

      * working on it. 

## Sage/Magma Comparison Audit

PEOPLE: William Stein, Bill Hart, Robert Bradshaw, Alia Hamieh, Jerome Lefebvre. 

   * See <a href="/sagebeatsmagma">sagebeatsmagma</a> and <a href="/magma">magma</a> 
   * Alia compared all of the functionality in both quadratic forms package and algebraic geometry package. She also has implemented an algorithm to be included in the binary quadratic form package. 
   * Jerome has done so for representation theory and is working on improving the group algebra in sage.  
And we are both done with comparing. And we have both submitted the changes we wanted to make on this. 


## CANCELLED (already in Sage!) Generalized Bernoulli Numbers

PEOPLE: William Stein    

   * There is a simple 2 or 3 line formula for generalized Bernoulli numbers in terms of non-generalized ones, which could be used to speed up the chi.bernoulli_number(k) command (for a Dirichlet character chi) by a factor of thousands. 
   * <a href="/%3A/bern%3A">more details</a> 

## Cylindrical Algebraic Decomposition

PEOPLE: Carl Witty 

   * Fixed several cases that assumed that polynomial roots were well-separated to instead do interval arithmetic with ever-increasing precision so that the correct answer will eventually be found. 

## Pynac Integration

PEOPLE: Mike Hansen, William Stein, Robert Bradshaw, Carl Witty 


## Sparse Linear Algebra

PEOPLE: Bill Hart, S. Ault 


## Javascript Graph Editor

PEOPLE: Rob Beezer, Mike Hansen, David Roe, Nicolas Thiery 


## eMPIRe Projects

PEOPLE:  Bill Hart 


## Category Patches

PEOPLE: Nicolas Thiery, Robert Bradshaw, Mike Hansen, Craig Citro, Carl Witty 


## Notebook Work

PEOPLE: Mike Hansen, (William Stein), Tom Boothby 


## Latex for (Combinatorial) Graphs

PEOPLE: Rob Beezer, Fidel Barrera, John Palmieri, Emily Kirkman 

   * Palmieri has extended ongoing general improvements to the customized applications of Latex in Sage. 
   * Beezer, with substantial assistance from Kirkman, has provided general support for customizing Latex representations of (combinatorial) graphs, which should be useful in other areas, e.g. graphs depicting simplicial complexes, and other "diagrams" such as perhaps lattices and posets.  Work during SD15 focused on limited initial support for the tkz-graph latex package. 
   * Barrera has provided detailed code for converting graphs, and user-supplied option, into tkz-graph commands.  Once the general setup is reviewed he will begin adding a multitude of options. 
   * Future Work: Palmieri will continue to extend Latex support, Beezer will extend and improve the graph options infrastructure and Barrera will extend support for tkz-graph. 
   * <a href="days15/projects/view-graphs.png">Screenshot</a> 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5975">Details at #5975</a> 

## Wrap mpmath

PEOPLE: Fredrik Johansson 


## p-adic Integration

PEOPLE: Robert Bradshaw, Kiran Kedlaya 

   * Prepared patches to address bugs in tickets 5947, 5948; see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5948">trac 5948</a>. These have been reviewed by Jen Balakrishnan. 
   * Prepared patch to address ticket 5430; see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5430">trac 5430</a>. 

## p-adic Polynomials

PEOPLE: Kiran Kedlaya, David Roe 

   * David is preparing a large patch at <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6048">trac 6048</a> to restructure p-adic polynomials. Besides adding new functionality, this should fix several previously reported bugs; once this is in, we should check <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1210">1210</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2943">2943</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4656">4656</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5075">5075</a>, and maybe some others. 