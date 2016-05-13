= Sage Days 73 in Oaxaca, Mexico May 04-07 2016 =

[[http://sagemath.org|Sage]] is an open source software for mathematics. This is the webpage for the Sage workshop prior to the conference [[http://www.birs.ca/events/2016/5-day-workshops/16w5010|Flat Surfaces and Dynamics of Moduli Space]] to be held in Oaxaca May 08-13. The aim is to:

 * introduce Sage to people from Oaxaca or assisting to the conference

 * have program and code presentations about geometry and dynamics of surfaces

 * help people to implement their own projects

The workshop was started on wednesday 04 morning and ended on saturday 07. It took place at [[http://www.pmc.gob.mx/|Punto Mexico Conectado @ Oaxaca]] in [[https://www.google.com.mx/maps/place/Punto+M%C3%A9xico+Conectado+Oaxaca/@17.0630565,-96.7325754,19z/data=!4m2!3m1!1s0x85c722148d9070eb:0x431c6d96d211d5b5|calzada Madero numero 101]].

== Schedule ==

||<5%>                    ||<15% #FFFFAA:> Wednesday 4 May ||<15%  #FFFFAA:> Thursday 5 May ||<15%  #FFFFAA:> Friday 6 May ||<15%  #FFFFAA:> Saturday 7 May ||
||<#FFFFAA> 09:00 - 10:00 || registro y instalación        || coding sprint                 || coding sprint               || ?                             ||
||<#FFFFAA> 10:00 - 11:00 || presentación de Sage          || coding sprint                 || coding sprint               || ?                             ||
||<#F8F8FF> 11:00 - 11:30 ||<#F8F8FF> té y café            ||<#F8F8FF> coffe break          ||<#F8F8FF> coffe break        ||<#F8F8FF> coffe break          ||
||<#FFFFAA> 11:30 - 13:00 || actividades practicas         || coding sprint                 || sharing code howto          || status report                 ||
||<#CCCCFF> 13:00 - 14:30 ||<#CCCCFF> lunch break          ||<#CCCCFF> lunch break          ||<#CCCCFF> lunch break        ||<#CCCCFF> lunch break          ||
||<#FFFFAA> 14:30 - 15:30 || presentation / discussion     || coding sprint                 || coding sprint               || FREE                          ||
||<#FFFFAA> 15:30 - 17:00 || tutorial: symbolic vs numeric || coding sprint                 || coding sprint               || FREE                          ||
||<#F8F8FF> 17:00 - 17:30 ||<#F8F8FF> coffe break          ||<#F8F8FF> coffe break          ||<#F8F8FF> coffe break        || FREE                          ||
||<#FFFFAA> 17:30 - 18:00 || Pat Hooper's demo             || Vincent's demo                || Charles's demo              || FREE                          ||
||<#FFFFAA> 18:00 - 19:00 || coding spring                 || status report                 || coding sprint               || FREE                          ||

== Talks ==

 * Presentación de Sage, (jupyter notebook [[attachment:Sage presentation.ipynb]])

 During the elaboration of the talk it appeared that many things differ between the jupyter and Sage notebook. It was reported on the mailing list [[https://groups.google.com/forum/#!topic/sage-devel/OO64qyj65oo|sage-devel]]. Some of the problem are already fixed (see e.g. [[http://trac.sagemath.org/ticket/20562|#20562]])!

 * '''symbolic vs numerics in Sage''' (tutorial, wednesday 15:30 - 17:00, Vincent Delecroix)
   There are many ways to deal with numbers within Sage (algebraic numbers, floating points, intervals, ...). We will present and illustrate pros and cons of all of them on some concrete problems: root finding, integration, solving ordinary differential equations.  [[attachment:symbolic_vs_numeric.rst]]

 * [[https://github.com/videlec/sage-flatsurf|Flatsurf]] Pat's demo: PAT'S WORKSHEET TO COME

 * [[http://www.labri.fr/perso/vdelecro/flatsurf.html|the flatsurf package]] (demo, thursday 17:30 - 18:00, Vincent Delecroix)

 * '''computing Lyapunov exponents of the Teichmueller flow''' (demo, friday, 17:30 - 18:00, Charles Fougeron): CHARLES WORKHSEET TO COME

== Projects ==

=== Teichmûller polynomials ===

people: Ferrán

 * need train-tracks automata with decorations. Then compute effectively dilatations in a given fibered face, Thurston norm, etc

 * Explore Thierry's Coulbois [[https://github.com/coulbois/sage-train-track|train-track code]]

The algorithm that given the (decorated) train-track algorithm produces the Teichmueller polynomial is ready!! Remains to produce automatically these graphs.

{{attachment:teichpol0-small.png}}  {{attachment:teichpol1-small.png}}

=== flatsurf Package(s) ===

people: Charles, Pat, Vincent

Build a nice Sage module for all translation surface related stuff. The aim is to

 * merge four distinct projects

   * Pat and Vincent [[https://github.com/videlec/sage-flatsurf|sage-flatsurf]]

   * Vincent [[http://www.labri.fr/perso/vdelecro/flatsurf.html|flatsurf]]

   * Charles code about Lyapunov exponents [[http://trac.sagemath.org/ticket/16102|trac ticket #16102]]

   * [[http://math.rice.edu/~rm51/|programs by Ronen Mukamel]]

 * add more stuff

   * Teichmueller flow for genus 1 quadratic differentials with Riemann theta functions

   * More for infinite translation surfaces

   * Thurston-Veech construction

=== visualize Teichmueller spaces ===

people: Maxime, Kasra

 * geodesics, balls, triangles, ... Needs computing Teichmueller maps, i.e. solving PDE

 * nice 3d plots to make animations of geodesic in Teichmueller space

A nice animation of a Teichmueller geodesic embedded in R3 (four time punctured sphere): 

{{attachment:twist-small.gif}}  {{attachment:P2A-small.gif}}

Given two complex structures on the pentagon, the first plot represents the graph of (half the logarithm of)
the ratio of extremal lengths with respect to these structures, as a function on measured foliations. The next two
plots are the derivative and second derivative respectively.

{{attachment:graph3.png}}  {{attachment:graph4.png}}  {{attachment:graph5.png}}

=== visualize the translation structure induced by a not so nice differential ===

people: Anja

{{attachment:flat_picture_of_z-quared-dz.png}} {{attachment:other_flat_picture_of_z-quared-dz.png}}


===  Generating saddle connections in a given surface and study their statistics *efficiently* ===

people: Grace

Distribution of gap of saddle connection for a surface defined on a cubic field!

{{attachment:sd.png}}

=== Computing quadratic differentials on tori ===

people: Charles

Using Weirstrass function one can find explicit formulas for quadratic differentials on tori1: CHARLES PICTURES TO COME!

{{attachment:Charles-gen_meromorphic_p0_z0.87_0.72I.png}}

=== other projects ===

 * Compute properties of Coxeter or Artin groups (normal forms, ...)

 * Incidence relations for vector space over Z/2Z (done!)

 * Subgroups of SL(2,R) given from generators. Design an algorithm that given a finite set of matrices in SL(2,R) answers whether the group generated by these is

    1. not discrete
    2. has finite covolume
    3. has infinite covolume

 In case 2. and 3. the algorithm should also output a fundamental domain and generators in canonical forms. (Charles, Vincent)

 * Affine interval exchange transformations: rotation number for affine circle homeos, generalized Rauzy induction, hyperbolicity, periodic points, ... (Charles)

== Existing programs about translation surfaces ==

 * Alex Eskin code (saddle connection exploration + decomposition in cylinders)

 * various [[http://math.rice.edu/~rm51/|programs by Ronen Mukamel]] (Delaunay triangulations, Teichmueller curves especially in genus 2)

 * Vincent Delecroix [[http://www.labri.fr/perso/vdelecro/flatsurf.html|flatsurf package]] (mostly interval exchanges and square tiled surfaces, but a bit of topology)

 * Vincent Delecroix and Pat Hooper [[https://github.com/videlec/sage-flatsurf|drawing program]]

 * Charles Fougeron code for Lyapunov exponents of strata coverings (see [[http://trac.sagemath.org/ticket/16102|trac ticket #16102]])

 * Chris Swierczewski [[https://github.com/abelfunctions/abelfunctions|Riemann surfaces package]]

 * [[http://www.math.udel.edu/~driscoll/SC/|Schwarz-Christoffel Toolbox in Matlab]]

== Organizers ==

 * [[http://www.labri.fr/perso/vdelecro/|Vincent Delecroix]]
 * [[http://www.matmor.unam.mx/~ferran/|Ferrán Valdez]]

== Participants ==

 * [[http://www.labri.fr/perso/vdelecro/|Vincent Delecroix]]
 * [[https://www.math.toronto.edu/cms/fortier-bourque-maxime/|Maxime Fortier-Bourque]]
 * [[https://webusers.imj-prg.fr/~charles.fougeron/|Charles Fougeron]]
 * [[http://wphooper.com/|Pat Hooper]]
 * [[http://www.math.u-psud.fr/~lelievre/|Samuel Lelièvre]]
 * [[http://monteil.perso.math.cnrs.fr/|Thierry Monteil]] (might attend remotely)
 * --([[https://sites.google.com/site/yulanqing/|Yulan Qing]])--
 * [[http://www.math.toronto.edu/~rafi/|Kasra Rafi]]
 * [[http://www.math.kit.edu/iag3/~randecker/|Anja Randecker]]
 * [[http://www.cswiercz.info/|Chris Swierczewski]] (might attend remotely)
 * [[http://www.matmor.unam.mx/~ferran/|Ferrán Valdez]]
 * [[http://www.math.uiuc.edu/~work2/|Grace Work]]

== Support ==

This workshop is supported by the ERC H2020 project [[http://opendreamkit.org/|OpenDreamKit]] and [[http://www.pmc.gob.mx/|Punto Mexico Conectado @ Oaxaca]].
