

# Sage Days 84 : Polytopes (in Sage, Python, polymake and more)

_**February 27th - March 10th 2017**_ _**<a class="http" href="http://www.openstreetmap.org/#map=14/42.1772/2.4901">Olot, Catalunya, Spain</a>**_ 

These (Sage) days will be focused on Polytopes and linear programming. This workshop is dedicated to people already familiar with Sage or being active in some polytope related libraries/software. 

There is a very limited number of places. If you are interested get quickly in contact with Vincent Delecroix (vincentDOTdelecroixATuDASHbordeaux.fr). 

During the workshop participants will have to cook several times for everybody. Bring your favorite recipies! 


## Practical information

The Sage Days will happen at <a class="http" href="http://faberresidency.com/">FABER</a> in <a class="http" href="http://www.openstreetmap.org/#map=14/42.1772/2.4901">Olot</a>. It is a small town close to Girona (55km) and Barcelona (110km). You can find very detailed practical information about how to reach Faber <a class="http" href="http://www.warwick.ac.uk/mmasdeu/files/faber_information.pdf">HERE</a>. 


## Schedule

Every free slot is made of coding sprint 

* Tuesday Feb 28  
      * 09:00 : organization meeting 
      * 14:00 : sage sample:how to make a sage package (Matthias) 
      * 17:00 : group cohomology (Aurel/Marc) 
      * 21:00 : autotools, make, etc (Matthias) 
* Wednesday Mar 1 
      * 10:00 : convex hull howto 
      * 14:00 - 18:00 : hiking the volcanoes 
      * 18:30 : Barvinok (integer points in polytopes) (Matthias) 
* Thursday Mar 2 
      * 10:00 : school activity 
      * 15:00 : Pexpect (Simon) 
* Friday Mar 3 
      * 14:00 : Sage categories (Vincent D/Simon) 
* Saturday Mar 4 
      * 10:00 : Guessing solutions of polynomial systems (Moritz) 
      * PM: Whatever! 
* Sunday Mar 5 
      * 11:00 : combinatorial and geometrical constraints on polytopes (JP) 
      * 17:00 : Math talk, fun with SCIP 
* Monday Mar 6 
      * 11:00 : max plus semigroup (Vincent D) 
      * 17:00 : representations of real numbers in Sage (Thierry) 
      * 18:30 : second-week scedule 
      * 22:30 : speed dating: rst2ipynb (Thierry) 
      * 22:30 : speed dating : sage_input 
* Tuesday Mar 7 
      * 09:00 : school activity  
      * 10:00 : Polymake tutorial (Andreas) 
      * 17:00 : Magma interface (Marc) 
* Wednesday Mar 8 
      * 10:00 : school activity  
      * 14:00 (after lunch): Toric geometry crash course (Andreas) 
      * 17:00 : A max-plus challenge (Vincent) 
* Thursday Mar 9 
      * 10:00 : Hike La Fageda  
      * 14:00 : Rice lunch 
Unscheduled development/softwares topics: 

* sage_input 

```txt
sage: x = polygen(ZZ)
sage: K.<a> = NumberField(x^3-2) ; K
Number Field in a with defining polynomial x^3 - 2
sage: sage_input(K)
ValueError: Can't convert Number Field in a with defining polynomial x^3 - 2 to sage_input form
```

## Projects

You can have a look at our list of <a class="https" href="https://trac.sagemath.org/query?status=closed&amp;status=needs_info&amp;status=needs_review&amp;status=needs_work&amp;status=new&amp;status=positive_review&amp;keywords=~days84&amp;col=id&amp;col=summary&amp;col=status&amp;col=time&amp;col=changetime&amp;col=author&amp;col=reviewer&amp;order=status">Sage tickets with days84 tags</a> 

* develop interfaces to polytope libraries/softwares (ppl, polymake, etc) 
* moving as independent Python packages the Sage interfaces to cdd, ppl, etc (see e.g. <a class="https" href="https://pypi.python.org/pypi/pplpy/">pplpy</a>) 
* make a generic number field implementation in C/C++ using <a class="https" href="https://github.com/videlec/e-antic">reantic</a> and <a class="https" href="https://www.normaliz.uni-osnabrueck.de/">libnormaliz</a> 
* add mutable polytopes in Sage 
* Delaunay/Voronoi polytopes of lattices (-> algorithm for norm form equation) 
* <a class="https" href="https://trac.sagemath.org/ticket/22006">#22006: CBC tries to use system's blas at runtime which creates an error</a> 
* <a class="https" href="https://trac.sagemath.org/ticket/20875">#20875: Meta-ticket: Polytopes, lattice (integer) point counting / enumeration, and their applications</a> 
* <a class="https" href="https://trac.sagemath.org/ticket/20302">#20302: Meta-ticket: Improvements to MixedIntegerLinearProgram etc.</a> 
* <a class="https" href="https://trac.sagemath.org/ticket/18703">#18703: oriented matroids</a> 
* <a class="https" href="https://trac.sagemath.org/ticket/22452">#22452: Create a Polymake pexpect interface</a> which depends on <a class="https" href="https://trac.sagemath.org/ticket/22452">#22501: Make it easier to customize pexpect interfaces</a> 
* release the <a class="https" href="https://github.com/videlec/e-antic">real embedded number fields library</a> (built on top of antic) 
* <a class="https" href="https://trac.sagemath.org/ticket/21950">#21950: Add pulling_triangulation method to polyhedron class and point configuration</a> 
* Uniform random generation of integer points in polytopes 
* Survey existent maintained Python bindings to MILP solvers, and see if we could use them instead of our own, those include pyomo, pulp, numberjack,... 
* <a class="http" href="http://doc.sagemath.org/html/en/reference/geometry/sage/geometry/hasse_diagram.html">Atomic and Coatomic lattice</a> Refactor this function so that it returns a lattice and so that you can input only one of the two incidences. 
* <a class="https" href="https://trac.sagemath.org/ticket/22420">#22420:Meta-ticket: Polytopes, polyhedron and their properties</a> Increase the functionalities of polyhedron class 
* ... (add your project!) 

## Participants

* <a class="http" href="http://www.labri.fr/perso/vdelecro/">Vincent Delecroix (LaBRI - Bordeaux)</a> (February 27th - March 11th) 
* <a class="http" href="http://warwick.ac.uk/mmasdeu/">Marc Masdeu (U. Warwick)</a> (February 27th - March 10th) 
* <a class="http" href="http://page.mi.fu-berlin.de/labbe/">Jean-Philippe Labbé (Freie Universität Berlin)</a> (February 27th - March 10th) 
* <a class="https" href="https://www.math.ucdavis.edu/~mkoeppe/">Matthias Köppe (UC Davis)</a> (February 27th - March 11th) 
* <a class="https" href="https://page.mi.fu-berlin.de/moritz/">Moritz Firsching (Freie Universität Berlin)</a> (March 3rd - March 8th) 
* <a class="https" href="https://mat.upc.edu/en/people/julian.pfeifle/">Julian Pfeifle (U. Politècnica de Catalunya)</a> (March 6th - March 10th) 
* <a class="http" href="http://marcelo-forets.fr/">Marcelo Forets (VERIMAG - U. Grenoble)</a> (March 5th - March 11th) 
* <a class="http" href="http://www.normalesup.org/~page/">Aurel Page (U. Warwick)</a> (February 27th - March 3rd) 
* <a class="http" href="http://www.mathematik.tu-darmstadt.de/~paffenholz/">Andreas Paffenholz (Technische U. Darmstadt)</a> (March 6th - March 11th) 
* Vincent Klein (Bordeaux, March 3rd - March 10th) 
* <a href="/ThierryMonteil">ThierryMonteil</a> (CNRS, Univ. Paris North, February 27th - March 7th) 
* <a class="http" href="http://users.minet.uni-jena.de/~king/eindex.html">Simon King (FSU Jena)</a> (February 27th - March 11th) 

## Acknowledgment

This workshop is supported by the H2020 European Project <a class="http" href="http://opendreamkit.org/">OpenDreamKit</a> 
