= Sage Days 71: Explicit p-adic methods in number theory (March 20-24, 2016) =

'''Organizers''': Jennifer Balakrishnan, David Roe

Location: Oxford, UK

Funding: Clay Mathematics Institute and the Beatrice Yormark Fund for Women in Mathematics

== Participants ==


 * Jennifer Balakrishnan
 * David Roe
 * Francesca Balestrieri
 * Jamie Beacom
 * Francesca Bianchi
 * Xavier Caruso
 * Wouter Castryck
 * Mirela Ciperiani
 * Raf Cluckers
 * Edgar Costa
 * Clifton Cunningham
 * Alyson Deines
 * Jeroen Demeyer
 * Netan Dogra
 * Victor Flynn
 * Immanuel Halupczok
 * Kiran Kedlaya
 * Celine Maistret
 * Marc Masdeu
 * Maurizio Monge
 * Jan Steffen Mueller
 * Christopher Nicholls
 * Joaquin Rodrigues Jacinto
 * Fernando Rodriguez-Villegas
 * Sandra Rozensztajn
 * Julian Rueth
 * Ander Steele
 * Jan Tuitman
 * Tristan Vaccon
 * Jeanine Van Order
 * Chris Wuthrich







== Schedule ==

[[days71schedule |Workshop schedule]]

== Topics ==

We'll have morning talks on the following topics, with afternoons and evenings dedicated to related projects.

=== p-adic methods for zeta functions ===

Beginning with Kedlaya's algorithm in 2001, ''p''-adic methods have seen practical use in counting points on curves and varieties over finite fields.  This information is traditionally packaged into a generating function, known as a zeta function, which satisfies a functional equation analogous to the classical zeta function.  Recently, Harvey has given an algorithm to compute zeta functions of hyperelliptic curves in average polynomial time.

=== Explicit computations in Iwasawa theory ===

In 2006, Mazur, Stein, and Tate gave an algorithm for the fast computation of ''p''-adic heights on elliptic curves. This has since inspired a flurry of activity on computations related to the ''p''-adic Birch and Swinnerton-Dyer Conjecture and conjectures in Iwasawa theory: in particular, on ''p''-adic heights, ''p''-adic regulators, ''p''-adic ''L''-functions, and ''p''-primary components of the Shafarevich-Tate group.

=== Overconvergent modular symbols and p-adic L-functions ===

One can situate classical modular forms in an infinite dimensional ''p''-adic Banach space of overconvergent modular forms, where the classical forms' integral weights sit densely within a ''p''-adic analytic weight space.  Similarly, overconvergent modular symbols interpolate classical modular symbols and ''p''-adic ''L''-functions interpolate classical ''L''-functions.  Recently, Pollack and Harron have led a group working on Sage code for computing with these objects using a paper of Pollack and Stevens.  The code is [[http://trac.sagemath.org/ticket/812|functional]] and is currently being extended to families of overconvergent modular symbols.

=== Motivic integration and orbital integrals ===

Orbital integrals play a fundamental role in trace formulas and their applications to the Langlands program.  Hales has been pursuing a program to practically compute these integrals using motivic integration.  The methods used in these computations differ from the other projects in that ''p'' is not fixed at the beginning of the computation.  Instead, the end result is motivic, and can be evaluated for a particular prime using algorithms for computing zeta functions as in the first project.

=== p-adic Hodge theory ===
 
Inspired by Hodge theory for complex varieties, ''p''-adic Hodge theory seeks to describe various categories of ''p''-adic Galois representations using linear algebraic data.  Using period rings described by Fontaine, the theory gives isomorphisms between categories of Galois representations and categories of vector spaces equipped with Frobenius actions, filtrations, etc.  Recently, the [[http://cethop.math.cnrs.fr/|CETHop project]] has led an effort to find practical algorithms for computing examples in this area.

=== Variations on the Chabauty-Coleman method and rational points on curves ===

By Faltings' Theorem, curves of genus at least 2 over number fields ''K'' have finitely many ''K''-rational points; however, the proof is not effective and thus does not yield an algorithm. Nevertheless, under certain hypotheses on the Jacobian of the curve, the method of Chabauty-Coleman can produce these points. Recently, Kim has proposed a nonabelian analogue.  In the last few years, explicit examples of Kim's program have been studied for elliptic and hyperelliptic curves, using ''p''-adic Hodge theory and local ''p''-adic heights.

== Getting started ==


== Relevant trac tickets ==

[[days71tickets |Open tickets ]]
