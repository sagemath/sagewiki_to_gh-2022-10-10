= Sage Days 55: Arithmetic and Complex Dynamics =

== November 7–November 10, 2013, Florida Institute of Technology, FL ==

This is a 4-day workshop that will include a combination of mathematical talks, Sage tutorials, and Sage development. The main goal is to promote and improve the dynamical systems functionality in Sage.  Some base functionality for dynamical systems has been implemented for Sage, beginning at ICERM in Spring 2012. There remains a significant amount of work to be done, ranging from reviewing patches, migrating stand-alone algorithms into Sage, implementing existing algorithms, and many more activities.  Users new to Sage and Sage development are welcome.

See the [[http://wiki.sagemath.org/dynamics/ArithmeticAndComplex | wiki page]] for information on the current status of Arithmetic and Complex Dynamics in Sage.

=== Registration ===

Registration is free. There is limited funding for travel and lodging. Please contact Ben Hutz at BHutz (at) FIT.edu to register. Please indicate if you will be requesting funding.


=== Schedule ===

The workshop will consist of tutorials and talks in the mornings and working groups in the afternoons. Conference activities will begin Thursday morning and conclude Sunday  afternoon.

=== Thursday, November 7 (building Quad 406) ===

||9:00am-10:00am||Welcome and Sage installation help||
||10:00am-11:00am||Tutorial I: Adam Towsley: Installing Sage and Patches||
||11:00am-11:30am||Break||
||11:30am-12:30pm||Tutorial II: Hao Chen: Introduction to Sage and the Notebook||
||12:30pm-2:00pm||Lunch||
||2:00pm-3:00pm||Ben Hutz: The state of arith and compl dyn in Sage [[attachment:State_of_dynamics.pdf | slides]] , [[attachment:state of dynamics.sws| sws]] ||
||3:00pm-3:30pm||Break||
||3:30pm-4:30pm||Project selection||
||4:30pm-6:00pm||Project work time||
||6:00pm||Status updates||

=== Friday, November 8 (building Quad 406) ===

||9:00am-10:00am||Tutorial III: Ben Hutz: Python introduction [[attachment:Python_intro.pdf | slides]]||
||10:00am-11:00am||Tutorial IV: Ben Hutz:  Contributing to Sage [[[[attachment:Contributing_to_sage.pdf | slides]]||
||11:00am-11:30am||Break||
||11:30am-12:30pm||Talk: David Krumm||
||12:30pm-2:00pm||Lunch||
||2:00pm-3:00pm||Tutorial V: Adam Towsley: Reviewing a patch||
||3:00pm-3:30pm||Break||
||3:30pm-6:00pm||Project work time||
||6:00pm||Status updates||

=== Saturday, November 9 (building Quad 405) ===

Coffee break at 11am and 3pm

||9:00am-10:00am||Talk: Vincent Delecroix - how to use C in Sage/Python||
|| || [[attachment:cython_beamer.pdf|beamer]] [[attachment:cython.zip|data]] ||
||10:00am-12:30pm||Project work time||
||12:30pm||Status Updates||
||12:30pm-2:00pm||Lunch||
||2:00pm-3:00pm||Talk: Patrick Ingram||
||3:00pm-6:00pm||Project work time||
||6:00pm||Status updates||

=== Sunday, November 10 (building Quad 405) ===

Coffee break at 11am

||9:00am-10:00am||Talk: Holly Krieger - Arithmetic of forward orbits and recurrence||
||10:00am-12:30pm||Project work time||
||12:30pm||Final Status Updates||


=== Projects ===

 * improve documentation of normalize_coordinates() ([[http://trac.sagemath.org/ticket/15377|#15377]], positive review) - Ben Hutz  

 * MacCaulay Resultant ([[http://trac.sagemath.org/ticket/15382|#15382]]) - Patrick Ingram, Soli Vishkautsan, Hao Chen

 * Krumm-Doyle Small Points Algorithm - needds review [[http://trac.sagemath.org/ticket/15389|#15389]] - David Krumm, John Doyle

 * Bruin-Molnar Algorithm into a patch ([[http://trac.sagemath.org/ticket/15392|#15392]]) - Brian Stout, Ben Hutz

 * Global height for integer fix ([[http://trac.sagemath.org/ticket/15373|#15373]] and [[http://trac.sagemath.org/ticket/15376|#15376]], positively reviewed) and canonical heights for points in number fields - Paul Fili

 * FMV Algorithm into a patch ([[http://trac.sagemath.org/ticket/15393|#15393]]) - Bianca Thompson, Ben Hutz, Joao Faria

 * Review [[http://trac.sagemath.org/ticket/14219|#14219]] - Adam Towsley, Vincent Delecroix, Ben Hutz
 
 * Eigenvalues (see [[http://trac.sagemath.org/ticket/14990|#14990]] and [[http://trac.sagemath.org/ticket/15390|#15390]]) for an implementation of the algebraic closure of finite field) - Vincent Delecroix , Ben Hutz

 * PostCriticallyFiniteMorphisms - Holly Krieger, Adam Towsley, Vincent Delecroix, Ben Hutz

 * Lattes map from an Elliptic Curve ([[http://trac.sagemath.org/ticket/15394|#15394]])- Patrick Ingram

 * Composition of Morphisms ([[http://trac.sagemath.org/ticket/15378|#15378]]) - Vincent Delecroix, Donald Richardson, Soli Vishkautsan

 * Bug fix: log of NaN in RealField and ComplexField results in infinite loop. We have posted a fix here: [[http://trac.sagemath.org/ticket/15388|#15388]] (needs review) - Paul Fili, Adam Towsley

 * Enabled canonical height for maps of P1 over number fields. Here is an early draft worksheet: [[attachment:Canonical height for number fields.sws| sws]] - Adam Towsley, Paul Fili

=== Wishlist ===

 * Check if for a given parameter c the map z -> z^2 + c is hyperbolic... and more generally for rational of P1 existence of attracting cycles

 * is_conjugate() for morphisms (medium)

 * Implement .an_element() for ProjectiveSpace (it currently makes the TestSuite fails) (easy)

 * Ponies (Patrick)

 * cyclegraph() and orbit_structure() to work with Zmod and other finite spaces not just finite fields (medium)

 * primes_of_bad_reduction() and is_morphism() made to work for endomorphisms of subschemes (easy)

 * products of projective space (Ben Hutz)

 * dynamics on Wehler K3 surfaces (Joao de Faria)

 * error_bound computation for canonical height in dimension > 1

 * update affine space to include the appropriate functionality from projective space

 * enumeration of points of small height over number fields for affine and projective spaces

 * fix all the white space issues in the projective and affine folders (easy)

 * PLEASE ADD MORE...

=== Location ===

Florida Institute of Technology, Melbourne, FL.


=== Participants ===

 *Hao Chen - University of Washington
 *Joao de Faria - Florida Institute of Technology
 *Vincent Delecroix - Univ. Paris VII, France
 *John Doyle - University of Georgia
 *Paul Fili - Oklahoma State University
 *Benjamin Hutz - Florida Institute of Technology
 *Patrik Ingram - Colorado State University
 *Holly Krieger - Massachusetts Institute of Technology
 *David Krumm - Claremont McKenna College
 *Donald Richardson - Florida Institute of Technology
 *Brian Stout - US Naval Academy
 *Bianca Thompson - University of Hawaii
 *Adam Towsley - CUNY Graduate Center
 *Soli Vishkautsan - Ben-Gurion University, Israel


==== Organizers ====

 * Benjamin Hutz, Department of Mathematical Sciences, Florida Institute of Technology
 * Adam Towsley, Ph.D. Program in Mathematics, CUNY Graduate Center

=== Lodging ===

Housing will be provided close to campus at the Hilton Melbourne Rialto Place for invited participants. The hotel provides breakfast and transportation to and from the airport and campus.


=== Last Updated ===

8/14/2013
