= Sage Days 84 : Polytopes (in Sage, Python, polymake and more) =

'''''February 27th - March 10th 2017'''''
'''''[[http://www.openstreetmap.org/#map=14/42.1772/2.4901|Olot, Catalunya, Spain]]'''''

These (Sage) days will be focused on Polytopes and linear programming. This workshop is dedicated to people already familiar with Sage or being active in some polytope related libraries/software.

There is a very limited number of places. If you are interested get quickly in contact with Vincent Delecroix (vincentDOTdelecroixATuDASHbordeaux.fr).

During the workshop participants will have to cook several times for everybody. Bring your favorite recipies!

== Practical information ==

The Sage Days will happen at [[http://faberresidency.com/|FABER]] in [[http://www.openstreetmap.org/#map=14/42.1772/2.4901|Olot]]. It is a small town close to Girona (55km) and Barcelona (110km). You can find very detailed practical information about how to reach Faber [[http://www.warwick.ac.uk/mmasdeu/files/faber_information.pdf|HERE]].

== Schedule ==

Every free slot is made of coding sprint

 * Tuesday Feb 28 
   * 09:00 : organization meeting
   * 14:00 : sage sample:how to make a sage package (Matthias)
   * 17:00 : group cohomology (Aurel/Marc)
   * 21:00 : autotools, make, etc (Matthias)
 * Wednesday Mar 1
   * 10:00 : convex hull howto
   * 14:00 - 18:00 : hiking the volcanoes
   * 18:00 : Barvinok (integer points in polytopes) (Matthias)
 * Thursday Mar 2
   * 10:00 : school activity
   * 14:00 : Pexpect (Simon)
   * 17:00 : max plus semigroup (Vincent)
 * Friday Mar 3
   * 14:00 : Sage categories (Vincent/Simon)
   * 17:00 : combinatorial and geometrical constraints on polytopes (JP)
 * Saturday Mar 4

Unscheduled math topics:
 * ?

Unscheduled development/softwares topics:
 * sage_input


== Projects ==

You can have a look at our list of [[https://trac.sagemath.org/query?keywords=~days84|Sage tickets with days84 tags]]

 * develop interfaces to polytope libraries/softwares (ppl, polymake, etc)
 * moving as independent Python packages the Sage interfaces to cdd, ppl, etc (see e.g. [[https://pypi.python.org/pypi/pplpy/|pplpy]])
 * make a generic number field implementation in C/C++ using normaliz
 * add mutable polytopes in Sage
 * Delaunay/Voronoi polytopes of lattices (-> algorithm for norm form equation)
 * [[https://trac.sagemath.org/ticket/22006|#22006: CBC tries to use system's blas at runtime which creates an error]]
 * [[https://trac.sagemath.org/ticket/20875|#20875: Meta-ticket: Polytopes, lattice (integer) point counting / enumeration, and their applications]]
 * [[https://trac.sagemath.org/ticket/20302|#20302: Meta-ticket: Improvements to MixedIntegerLinearProgram etc.]]
 * [[https://trac.sagemath.org/ticket/18703|#18703: oriented matroids]]
 * release the [[https://github.com/videlec/e-antic|real embedded number fields library]] (built on top of antic)
 * [[https://trac.sagemath.org/ticket/21950|#21950: Add pulling_triangulation method to polyhedron class and point configuration]]
 * Uniform random generation of integer points in polytopes
 * Survey existent maintained Python bindings to MILP solvers, and see if we could use them instead of our own, those include pyomo, pulp, numberjack,...
 * [[http://doc.sagemath.org/html/en/reference/geometry/sage/geometry/hasse_diagram.html|Atomic and Coatomic lattice]] Refactor this function so that it returns a lattice and so that you can input only one of the two incidences.
 * [[https://trac.sagemath.org/ticket/22420| #22420:Meta-ticket: Polytopes, polyhedron and their properties]] Increase the functionalities of polyhedron class
 * ... (add your project!)

== Participants ==

 * [[http://www.labri.fr/perso/vdelecro/|Vincent Delecroix (LaBRI - Bordeaux)]] (February 27th - March 11th)
 * [[http://warwick.ac.uk/mmasdeu/|Marc Masdeu (U. Warwick)]] (February 27th - March 10th)
 * [[http://page.mi.fu-berlin.de/labbe/|Jean-Philippe Labbé (Freie Universität Berlin)]] (February 27th - March 10th)
 * [[https://www.math.ucdavis.edu/~mkoeppe/|Matthias Köppe (UC Davis)]] (February 27th - March 11th)
 * [[https://page.mi.fu-berlin.de/moritz/|Moritz Firsching (Freie Universität Berlin)]] (March 3rd - March 8th)
 * [[https://mat.upc.edu/en/people/julian.pfeifle/|Julian Pfeifle (U. Politècnica de Catalunya)]] (March 6th - March 10th)
 * [[http://marcelo-forets.fr/|Marcelo Forets (VERIMAG - U. Grenoble)]] (March 5th - March 11th)
 * [[http://www.normalesup.org/~page/|Aurel Page (U. Warwick)]] (February 27th - March 3rd)
 * [[http://www.mathematik.tu-darmstadt.de/~paffenholz/|Andreas Paffenholz (Technische U. Darmstadt)]] (March 6th - March 11th)
 * Vincent Klein (Bordeaux, March 3rd - March 10th)
 * ThierryMonteil (CNRS, Univ. Paris North, February 27th - March 7th)
 * [[http://users.minet.uni-jena.de/~king/eindex.html|Simon King (FSU Jena)]] (February 27th - March 11th)

== Acknowledgment ==

This workshop is supported by the H2020 European Project [[http://opendreamkit.org/|OpenDreamKit]]
