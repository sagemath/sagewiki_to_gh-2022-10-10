
[[_TOC_]] 

Following a <a class="https" href="https://wiki.sagemath.org/Workshops">long tradition of similar workshops</a>, the Sage days 100 workshop will take place in Bonn Germany, Mon 22 July 2019 - Sat 27 July 2019. It welcomes anyone who wishes to work with SageMath, from complete beginners to advanced developers. It will consist of tutorials, participant presentations and mostly free time to let participants work on their mathematical programming projects and get helped from more advanced users. The precise schedule of the workshop will be decided at the start of the workshop and adapted according to the participants' needs. 

The afternoon of Wednesday 24th will be dedicated to a <a class="https" href="https://www.mpim-bonn.mpg.de/de/node/9501">SageMath presentation at Max-Planck Institut</a> (for students, PhD students, postdocs and professors). If you wish to be involved in this presentation, contact the organizer. 


# Practical information


## Location

All week 
```txt
Room 0.016 (ground floor, left of the main entrance)
Institut für Informatik
Endenicher Allee 19A
Bonn
```
Special Wednesday afternoon event 
```txt
Lecture Hall (third floor)
Max-Planck Institut
Vivatsgasse 7
Bonn
```

## Links

* <a class="http" href="http://www.labri.fr/perso/vdelecro/presentations/presentation_sagemath_mpi_2019.pdf">beamer presentation MPI (presentation_sagemath_mpi_2019.pdf)</a> 
* <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=Introduction-SageMath-MPIM-2019.ipynb">worksheet presentation MPI (Introduction-SageMath-MPIM-2019.ipynb)</a> 
* <a class="https" href="https://hackmd.io/C11DpDKwTaaB5RkoyuosUw">Euler challenge organization pad</a> 
* <a class="https" href="https://hackmd.io/EvP0nhWsTc-1Ja0BY1wbvw">pad to report bugs / error in a worksheet / general question about SageMath</a> 
* <a class="https" href="https://trac.sagemath.org/query?keywords=~days100&amp;col=id&amp;col=summary&amp;col=status&amp;col=type&amp;col=priority&amp;col=milestone&amp;col=component&amp;desc=1&amp;order=status">trac tickets with days100 keyword</a> 
* <a href="/GitLab">GitLab</a> group and repositories (for participants only): 
      * <a class="https" href="https://gitlab.com/sage-days-100">group sage-days-100</a> 
      * <a class="https" href="https://gitlab.com/sage-days-100/python_module_sample">demo about packaging (Vincent presentation on Monday)</a> 
      * <a class="https" href="https://gitlab.com/sage-days-100/git-tutorial-days-100">Git tutorial (Vincent presentation on Tuesday)</a> 
      * <a class="https" href="https://gitlab.com/sage-days-100/testing-project">testing your code (Mark presentation on Wednesday)</a> 

## Schedule

The first morning of the workshop, on Monday 22 July 2019, has a special schedule: 

   * 09:30--10:00 Welcome coffee 
   * 10:00--10:30 A SageMath and sage days panorama (by V. Delecroix) 
   * 10:30--12:30 Participant presentations + schedule organization + get started with Sage 
   * Lunch and afternoon: as all other days 
Monday 22 July 2019 afternoon to Friday 26 July 2019 afternoon share a common schedule: 
 09:00--10:30       |  10:30--11:00  |  11:00--12:30      |  12:30--14:00  |  14:00--15:30  |  15:30--16:00  |  16:00--17:00  |  17:00--17:30 
 morning session  |  coffee break    |  hacking  |  lunch break  |  afternoon session  |  coffe break  |  hacking |  status report 

Hacking sessions aim to let people work on their own projects with experts helping/answering. The tutorial sessions will consist of 
 Monday     |  welcome                  |  get started + packaging 
 Tuesday    |  package presentations (M.,V.,S.,J.)    |  git (Vincent) 
 Wednesday  |  debugging, profiling, testing  |  (optional) <a class="https" href="https://www.mpim-bonn.mpg.de/de/node/9501">Max-Planck afternoon</a> 
 Thursday   |  Cython  |  <a href="/SageMath">SageMath</a> development 
 Friday     |  ?  |  ?

Remaining tutorial sessions to be organized: 

* databases 
Documents 

* <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=cython_demo_days100.ipynb">cython_demo_days100.ipynb</a> 

## Sage packages

* <a class="https" href="https://gitlab.com/jo314schmitt/admcycles">admcycles</a>: tautological ring on M_{g,n} (Aaron Pixton, Johannes Schmitt, Jason van Zelm) 
      * (Tuesday presentation <a class="https" href="https://people.math.ethz.ch/~schmittj/admcycles_Bonn.pdf">admcycles_Bonn.pdf</a>) 
* <a class="https" href="https://bitbucket.org/t3m/snappy">snappy</a>: 3-dim hyperbolic manifolds (Marc Culler, Nathan Dunfield, and Matthias Goerner) 
      * (presentation by S. Schleimer: <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=snappy_intro.ipynb">snappy_intro.ipynb</a>) 
* <a class="https" href="https://gitlab.com/videlec/veerer/">veerer</a>: train-tracks and veering triangulations (Vincent Delecroix) 
* <a class="https" href="https://gitlab.com/videlec/surface_dynamics">surface_dynamics</a>: translation surfaces (Vincent Delecroix) 
* <a class="https" href="https://github.com/MarkCBell/flipper">flipper</a>: mapping class group (via flips in triangulation) (Mark Bell) 
* <a class="https" href="https://github.com/MarkCBell/curver">curver</a>: mapping class group (via curve complex) (Mark Bell) 
* <a class="https" href="https://github.com/coulbois/sage-train-track">sage-train-track</a>: free group automorphisms (Thierry Coulbois) 
      * (Tuesday presentation <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=Sage+Train-track+presentation+%28Bonn%2C+july+2019%29.ipynb">Sage Train-track presentation (Bonn, july 2019).ipynb</a>) 
We will have 20 min presentations of each package emphasizing: 

* What the package is useful for? 
* What should I do if I want to use the package? ie, installation and first steps tutorials 
* What is currently under active development? 
* Wishlist features / possible research experimentations (with the hope that more people get involved) 

## Worksheets

   * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=intro.en.ipynb">introduction to Sage</a> 
   * step-by-step programming (more Pythonic) 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=chap1-first_steps.ipynb">chap1-first_steps.ipynb</a> 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=chap2-list_and_for.ipynb">chap2-list_and_for.ipynb</a> 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=chap3-if.ipynb">chap3-if.ipynb</a> 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=chap4-functions.ipynb">chap4-functions.ipynb</a> 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=chap5-while.ipynb">chap5-while.ipynb</a> 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=chap6-advanced_exercises.ipynb">chap6-advanced_exercises.ipynb</a> 
   * Some math oriented worksheets 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=CollatzConjecture.ipynb">Collatz conjecture</a> 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=Dictionaries-GraphTheory.ipynb">Graph theory and Python dictionaries</a> (don't forget to also downloads <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=euler.png">euler.png</a> and <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=graph0.png">graph0.png</a> 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=Strings-BWT.ipynb">Strings and the Burrows-Wheeler-Transformation</a> 
         * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=introduction_polytopes.ipynb">Introduction to Polytopes in Sage</a> 
   * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=Computing+modular+group+cohomology.ipynb">Computing modular group cohomology.ipynb</a>: Computation of modular cohomology rings of finite groups with Sage; <a href="days100/ModularCohomology.pdf">ModularCohomology.pdf</a> Slides for presentation at MPI. 
   * <a class="https" href="https://wiki.sagemath.org/days100?action=AttachFile&amp;do=get&amp;target=How_to_implement_new_algebraic_structures.ipynb">How_to_implement_new_algebraic_structures.ipynb</a>: A tutorial on parents, elements, categories and coercion 

# Organization


## Participants

* Vincent Delecroix (CNRS, LaBRI Bordeaux, France - MPIM Bonn, Germany) 
* <a class="https" href="https://www.uni-frankfurt.de/50278800/Zachhuber">Jonathan Zachhuber</a> (Frankfurt, Deutschland) 
* <a class="https" href="https://users.fmi.uni-jena.de/~king/eindex.html">Simon King</a> (Jena, Germany) 
* <a class="https" href="https://markcbell.github.io">Mark Bell</a> (UK) 
* Luke Jeffreys (Glasgow, UK) 
* <a class="https" href="https://people.math.ethz.ch/~schmittj/">Johannes Schmitt</a> (Zurich, Switzerland) 
* <a class="https" href="https://www.math.u-psud.fr/~lelievre/">Samuel Lelièvre</a> (Paris, France) 
* <a class="https" href="https://irma.math.unistra.fr/~chapoton/">Frédéric Chapoton</a> (Strasbourg, France) 
* <a class="https" href="https://www.i2m.univ-amu.fr/perso/thierry.coulbois/">Thierry Coulbois</a> (Marseille, France) 
* <a class="http" href="http://page.mi.fu-berlin.de/labbe">Jean-Philippe Labbé</a> (Berlin, Deutschland) 
* <a class="https" href="https://www.mi.fu-berlin.de/math/groups/ag-diskret-algebra-geom/members/Wimi/sophia_elia.html">Sophia Elia</a> (Berlin, Deutschland) 
* Sebastian Oehms (Stuttgart, Germany) 
* <a class="https" href="https://www.mi.fu-berlin.de/math/groups/discgeom/members/rastanawi.html">Laith Rastanawi</a> (Berlin, Deutschland) 
* Vanessa Paluch (Bonn University) 
* Shreya Kapoor (Bonn University) 
* Julian Ritter (LIX Paris) 
* Ingrid Irmer (MPIM, Bonn) 
* Hankyung Ko (MPIM, Bonn) 
* Saul Schleimer (Warwick, UK) 
* Brian Winn (Loughborough University, UK) 
* Hisatoshi Kodani (MPIM, Bonn) 
* <a class="https" href="https://sites.google.com/site/tutamnguyenphan/">Tam Nguyen-Phan</a> (MPIM, Bonn) 
* <a class="http" href="http://people.mpim-bonn.mpg.de/stavros/">Stavros Garoufalidis</a> (MPIM, Bonn) 
* <a class="http" href="http://cg.cs.uni-bonn.de/de/mitarbeiter/dipl-inform-christoph-lueders/">Christoph Lüders</a> (Bonn University) 
* Sophia Krix (Bonn University) 

## Broad mathematical thematics

Combinatorics, geometry and dynamics on real surfaces (complex curves). Here is a non-exhaustive list 

* moduli space of curves, differentials, spin structures 
* enumerative geometry, integral points in polytopes and (quasi-)modular forms 
* geometry and dynamics of flat and hyperbolic surfaces 
* braid groups, mapping class groups 

## Funding

The workshop is funded by <a class="http" href="http://opendreamkit.org/">OpenDreamKit</a> ![days100/Flag_of_Europe.png](days100/Flag_of_Europe.png) 

With material help from the Laboratoire Bordelais de Recherche en Informatique (France) and the Computer Science Department at Bonn University (Germany). 


## Organizer

* <a class="http" href="http://www.labri.fr/perso/vdelecro/">Vincent Delecroix</a> (CNRS, LaBRI Bordeaux, France - MPIM Bonn, Germany) 