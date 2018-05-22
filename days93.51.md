= Sage Days 93.51, May 28 - June 1, 2018, Berlin =

'''''Sage coding sprint on reflection groups and the GAP3 ''chevie'' interface'''''

== Topics ==

This is the follow-up coding sprint of [[days80|SageDays 80]]. The aim of this 5-days coding sprint is to continue the Sage work on '''finite reflection groups''' in Sage, based on the '''GAP3 package chevie'''. The topics (and the related trac tickets) can be found at [[http://trac.sagemath.org/ticket/20394]].

Concrete goals include (see also [[http://trac.sagemath.org/ticket/20394|Trac20394]]):

 * Copy parts of the hard-coded data from chevie to Sage (Jean + Christian)
 * Implement the module of derivations of a hyperplane arrangement and give its generators in the case of reflection arrangements (Tilman)
 * Improve the implementations for permutahedra and associahedra (JP)
 * Implement reduced words in crg's
 * Get the iteration algorithm for Coxeter groups using coset decomposition working
 * cythonize critical components such as {{{has_descent}}}
 * Discuss what else we can learn from the {{{chevie}}} implementation

 * have a look at https://trac.sagemath.org/ticket/13426

== Participants ==

 * [[http://homepage.univie.ac.at/christian.stump|Christian Stump]], Berlin (organizer)
 * [[https://sites.google.com/view/tscrim/home|Travis Scrimshaw]], Queensland
 * [[http://webusers.imj-prg.fr/~jean.michel/gap3/|Jean Michel]], Paris
 * [[http://page.mi.fu-berlin.de/labbe/|Jean-Philippe Labbé]], Berlin
 * [[http://www.ruhr-uni-bochum.de/ffm/Lehrstuehle/Lehrstuhl-VI/moeller.html|Tilman Möller]], Bochum
 * [[http://www-users.math.umn.edu/~douvr001/|Theodosios Douvropoulos]], Paris
 * to be continued...

== Funding ==

The workshop is funded by the German Research Foundation grants STU 563/2 [[http://gepris.dfg.de/gepris/projekt/236343817?language=en|Coxeter-Catalan combinatorics]] and STU 563/4-1 [[http://gepris.dfg.de/gepris/projekt/375076785?language=en|Noncrossing phenomena in Algebra and Geometry]].
