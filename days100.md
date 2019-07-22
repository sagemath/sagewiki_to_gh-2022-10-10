<<TableOfContents()>>

Following a [[https://wiki.sagemath.org/Workshops|long tradition of similar workshops]], the Sage days 100 workshop will take place in Bonn Germany, July 22nd - July 27th. It welcomes anyone who wishes to work with !SageMath, from complete beginners to advanced developers. It will consist of tutorials, participant presentations and mostly free time to let participants work on their mathematical programming projects and get helped from more advanced users. The precise schedule of the workshop will be decided at the begining of the workshop and adapted according to the participant needs.

The afternoon of Wednesday 24th will be dedicated to a [[https://www.mpim-bonn.mpg.de/de/node/9501|SageMath presentation at Max-Planck Institut]] (for students, PhD students, postdocs and professors). If you wish to be involved in this presentation, contact the organizer.

= Practical information =

== Location ==

All week
{{{
Room 0.016 (ground floor, left of the main entrance)
Institut für Informatik
Endenicher Allee 19A
Bonn
}}}

Special Wednesday afternoon event
{{{
Lecture Hall (third floor)
Max-Planck Institut
Vivatsgasse 7
Bonn
}}}

== Links ==

 * [[https://hackmd.io/C11DpDKwTaaB5RkoyuosUw|Euler challenge organization pad]]
 * [[https://hackmd.io/EvP0nhWsTc-1Ja0BY1wbvw|pad to report bugs / error in a worksheet / general question about SageMath]]
 * [[https://trac.sagemath.org/query?keywords=~days100&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&desc=1&order=status|trac tickets with days100 keyword]]

 * [[https://gitlab.com/videlec/python_module_sample|demo about packaging (git repo on gitlab)]]

== Schedule ==

Begining of the workshop Monday 22nd
  *  9:30 - 10:00 welcome coffee
  * 10:00 - 10:30 A !SageMath and sage days panorama (by V. Delecroix)
  * 10:30 - 12:30 Participant presentations + schedule organization + get started with Sage
  * lunch and afternoon: as all other days

For all other days (Tuesday 22nd afternoon - Friday 26th afternoon)
||<#AADAFF> 9:00 - 10:30      ||<#F0F0AA> 10:30 - 11:00 ||<#FACACA> 11:00 - 12:30     ||<#F0F0AA> 12:30 - 14:00 ||<#DAAAFF> 14:00 - 15:30 ||<#F0F0AA> 15:30 - 16:00 ||<#FACACA> 16:00 - 17:30 ||<#AAFFAA> 17:30 - 18:00 ||
||<#AADAFF> morning session ||<#F0F0AA> coffe break   ||<#FACACA> hacking ||<#F0F0AA> lunch break ||<#DAAAFF> afternoon session ||<#F0F0AA> coffe break ||<#FACACA> hacking||<#AAFFAA> status report ||

The hacking session are here to let people work on their own projects while having SageMath experts helping/answering. The tutorial sessions will consist of

||<#EEEEEE> Monday    ||<#AADAFF> welcome                 ||<#DAAAFF> get started + packaging ||
||<#EEEEEE> Tuesday   ||<#AADAFF> package presentations   ||<#DAAAFF> ? ||
||<#EEEEEE> Wednesday ||<#AADAFF> ? ||<#DAAAFF> (optional) [[https://www.mpim-bonn.mpg.de/de/node/9501|Max-Planck afternoon]] ||
||<#EEEEEE> Thursday  ||<#AADAFF> ? ||<#DAAAFF> ? ||
||<#EEEEEE> Friday    ||<#AADAFF> ? ||<#DAAAFF> ?||

Remaining tutorial sessions to be organized:
 * git
 * debugging and profiling
 * SageMath development
 * databases
 * Cython

== Sage packages ==

 * [[https://gitlab.com/jo314schmitt/admcycles|admcycles]]: tautological ring on M_{g,n} (Aaron Pixton, Johannes Schmitt, Jason van Zelm)
 * [[https://bitbucket.org/t3m/snappy|snappy]]: 3-dim hyperbolic manifolds (Marc Culler, Nathan Dunfield, and Matthias Goerner)
 * [[https://gitlab.com/videlec/veerer/|veerer]]: train-tracks and veering triangulations (Vincent Delecroix)
 * [[https://gitlab.com/videlec/surface_dynamics|surface_dynamics]]: translation surfaces (Vincent Delecroix)
 * [[https://github.com/MarkCBell/flipper|flipper]]: mapping class group (via flips in triangulation) (Mark Bell)
 * [[https://github.com/MarkCBell/curver|curver]]: mapping class group (via curve complex) (Mark Bell)
 * [[https://github.com/coulbois/sage-train-track|sage-train-track]]: free group automorphisms (Thierry Coulbois)

We will have 20 min presentations of each package emphasizing:
 * What the package is useful for?
 * What should I do if I want to use the package? ie, installation and first steps tutorials
 * What is currently under active development?
 * Wishlist features / possible research experimentations (with the hope that more people get involved)

== Worksheets ==

  * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=intro.en.ipynb|introduction to Sage]]
  * step-by-step programming (more Pythonic)
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=chap1-first_steps.ipynb|chap1-first_steps.ipynb]]
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=chap2-list_and_for.ipynb|chap2-list_and_for.ipynb]]
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=chap3-if.ipynb|chap3-if.ipynb]]
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=chap4-functions.ipynb|chap4-functions.ipynb]]
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=chap5-while.ipynb|chap5-while.ipynb]]
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=chap6-advanced_exercises.ipynb|chap6-advanced_exercises.ipynb]]
  * Some math oriented worksheets
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=CollatzConjecture.ipynb|Collatz conjecture]]
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=Dictionaries-GraphTheory.ipynb|Graph theory and Python dictionaries]] (don't forget to also downloads [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=euler.png|euler.png]] and [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=graph0.png|graph0.png]]
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=Strings-BWT.ipynb|Strings and the Burrows-Wheeler-Transformation]]
    * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=introduction_polytopes.ipynb|Introduction to Polytopes in Sage]]
  * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=Computing+modular+group+cohomology.ipynb|Computing modular group cohomology.ipynb]]: Computation of modular cohomology rings of finite groups with Sage 
  * [[https://wiki.sagemath.org/days100?action=AttachFile&do=get&target=How_to_implement_new_algebraic_structures.ipynb|How_to_implement_new_algebraic_structures.ipynb]]: A tutorial on parents, elements, categories and coercion

= Organization =

== Participants ==

 * Vincent Delecroix (CNRS, LaBRI Bordeaux, France - MPIM Bonn, Germany)
 * [[https://www.uni-frankfurt.de/50278800/Zachhuber|Jonathan Zachhuber]] (Frankfurt, Deutschland)
 * [[https://users.fmi.uni-jena.de/~king/eindex.html|Simon King]] (Jena, Germany)
 * Mark Bell (UK)
 * Luke Jeffreys (Glasgow, UK)
 * [[https://people.math.ethz.ch/~schmittj/|Johannes Schmitt]] (Zurich, Switzerland)
 * [[https://www.math.u-psud.fr/~lelievre/|Samuel Lelièvre]] (Paris, France)
 * [[https://irma.math.unistra.fr/~chapoton/|Frédéric Chapoton]] (Strasbourg, France)
 * [[https://www.i2m.univ-amu.fr/perso/thierry.coulbois/|Thierry Coulbois]] (Marseille, France)
 * [[http://page.mi.fu-berlin.de/labbe|Jean-Philippe Labbé]] (Berlin, Deutschland)
 * [[https://www.mi.fu-berlin.de/math/groups/ag-diskret-algebra-geom/members/Wimi/sophia_elia.html|Sophia Elia]] (Berlin, Deutschland)
 * Sebastian Oehms (Stuttgart, Germany)
 * [[https://www.mi.fu-berlin.de/math/groups/discgeom/members/rastanawi.html|Laith Rastanawi]] (Berlin, Deutschland)
 * Vanessa Paluch (Bonn University)
 * Shreya Kapoor (Bonn University)
 * Julian Ritter (LIX Paris)
 * Ingrid Irmer (MPIM, Bonn)
 * Hankyung Ko (MPIM, Bonn)
 * Saul Schleimer (Warwick, UK)
 * Brian Winn (Loughborough University, UK)
 * Hisatoshi Kodani (MPIM, Bonn)
 * [[https://sites.google.com/site/tutamnguyenphan/|Tam Nguyen-Phan]] (MPIM, Bonn)
 * [[http://people.mpim-bonn.mpg.de/stavros/| Stavros Garoufalidis]] (MPIM, Bonn)
 * [[http://cg.cs.uni-bonn.de/de/mitarbeiter/dipl-inform-christoph-lueders/|Christoph Lüders]] (Bonn University)
 * Sophia Krix (Bonn University)

== Broad mathematical thematics ==

Combinatorics, geometry and dynamics on real surfaces (complex curves). Here is a non-exhaustive list

 * moduli space of curves, differentials, spin structures
 * enumerative geometry, integral points in polytopes and (quasi-)modular forms
 * geometry and dynamics of flat and hyperbolic surfaces
 * braid groups, mapping class groups

== Funding ==

The workshop is funded by [[http://opendreamkit.org/|OpenDreamKit]] {{attachment:Flag_of_Europe.png|align="middle"|width=100}}

With material help from the Laboratoire Bordelais de Recherche en Informatique (France) and the Computer Science Department at Bonn University (Germany).

== Organizer ==

 * [[http://www.labri.fr/perso/vdelecro/|Vincent Delecroix]] (CNRS, LaBRI Bordeaux, France - MPIM Bonn, Germany)
