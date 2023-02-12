

```rst
#!rst 
Sage-Combinat days in Cernay, February 2012
===========================================

See also next edition: `Cernay 2014 <http://wiki.sagemath.org/days57>`_.

The third Sage-Combinat days in Cernay will be held at Cernay-la-Ville,
France, February 6-10, 2012, near Orsay, in the south-west of Paris.

Following the \*-Combinat tradition I reserved the `guest house the
tower <http://www.cernayvacances.com/CEngels.html>`_ at
Cernay-la-Ville.  It is very nice and cosy, 35 minutes train + 15
minutes bus away from downtown Paris. For practical information, see
below.

`Project page on Trac <http://trac.sagemath.org/sage_trac/wiki/combinat/DaysCernay2012>`_
=================================================================================================

Tentative list of themes
========================

The main goal of this meeting is to gather Sage/Sage-Combinat
developers for coding sprints on the following themes:

* Refactoring of the combinatorics infrastructure (factories, Cythonizing partitions, compositions...)

* Refactoring of sage.combinat.words and creation of a tiling class (`LanguagesAndTilings <http://wiki.sagemath.org/LanguagesAndTilings>`_)

* Cythonization of many iterators

* Categories (Morphisms, functorial constructions, optimization, coercion ?)

* Integration of more Sage-Combinat thematic tutorials into Sage

* Correct some of the `Weirdness <http://wiki.sagemath.org/combinat/Weirdness>`_

* Please expand!

Jean-Pierre Flori:

* I'd love to have a deeper look into the coercion system and its
  caching mecanism to get a better understanding of it and to solve
  bug #715.
* If anyone is interested, we could also have a look at some symbolic
  issues in pynac (which could be of interest for combinat people).

Vincent Delecroix :

* reviews

   `#10193: Graded enumerated sets <http://trac.sagemath.org/sage_trac/ticket/10193>`_
   
   `#10132: Parametrization of (metric) surfaces in 3D euclidean space <http://trac.sagemath.org/sage_trac/ticket/10132>`_

* integration

   `#10534: Generation of subwords, subsets and set partitions <http://trac.sagemath.org/sage_trac/ticket/10534>`_

   `#9439: Hyperbolic geometry <http://trac.sagemath.org/sage_trac/ticket/9439>`_

* iterators (Gray codes, iterate throu conjugacy class of the symmetric group, ...)

* flat surfaces (quadratic differentials, topolgoy stuff, origamis, Ferenczi-Zamboni induction, ...)

* language and symbolic dynamics (tickets #12224, #12225, #12226, #12227, #12228, #122230, #12231)

* would like to hear about the code in Sage and more generally about algorithms for generating things up to isomorphism (like graphs, Integer vectors and co).


ThierryMonteil:

* flat surfaces via G-maps (in which state are the Permutations currently? or should we use pointers or existing libs like CGAL ?).
* need help to build a class `TileSet` in a good way.
* having OEIS work again (i have working parsers ready for a while, but would like to have them in a class, not as functions like `sloane_search()`, maybe the same as the existing for offline oeis ?).
* word combinatorics : `tangent_words` as `WordPaths` ; `tangent_analytic_words` ; discussion about languages.
* discussion about implementing Bratelli diagrams.
* backtracking framework (e.g. a kind of iterator with next() and cut() methods)
* (svg output)
* (worksheet database shared among public notebooks)
* (graph minors)


Nicolas Borie:

* refactoring of integer vectors using a Cython data structure based on IntClonableArray.
* design discussion about how getting benefits of categories when implementing a Set with a group action.
* finalise the implementation of integer vectors modulo the action of a permutation group.
* Implementation of multivariate polynomials view as a free module over symmetric functions (Harmonic polynomials, Schubert polynomials, Monomials under staircase, Descent monomials ...)

Nicolas M. Thiéry:

* Finalize and merge in as many of my old patches as possible:
  * `#10998: Categories for posets <http://trac.sagemath.org/sage_trac/ticket/10998>`_
  * `#9469: Category membership without arguments <http://trac.sagemath.org/sage_trac/ticket/9469>`_
  * `#7980: multiple realizations <http://trac.sagemath.org/sage_trac/ticket/7980>`_
  * `#10963: more functorial constructions:  <http://trac.sagemath.org/sage_trac/ticket/10963>`_
  * `#6588: categories root system:  <http://trac.sagemath.org/sage_trac/ticket/6588>`_
  * `#11111: finite_dimensional_modules:  <http://trac.sagemath.org/sage_trac/ticket/11111>`_

* Finalize and merge as many of others'old patches as possible:
  * `#11003: Improve support for lazy_import inside classes <http://trac.sagemath.org/sage_trac/ticket/11003>`_
  * `#11118: finite_enumset_list_cache-fh <http://trac.sagemath.org/sage_trac/ticket/11118>`_

We would love to have some hard core Cython and/or Sage developer at hand :-)

Tentative list of participants
==============================

* NicolasBorie, ATER, Orsay
* FlorentHivert, Prof, LRI, Université Paris Sud XI
* NicolasThiéry, MdC, Orsay
* Viviane Pons, graduate student, LIGM, Université Paris-Est
* ThierryMonteil, CR, Montpellier
* VincentDelecroix, Postdoc, IMJ, Paris
* Nathann Cohen, Postdoc, Université Libre de Bruxelles
* Štěpán Starosta, Ph.D. student, Czech Technical University in Prague
* Flavia Stan, Postdoc, INRIA-Microsoft Research Joint Center, Orsay
* Burcin Erocal, Postdoc, TU Kaiserslautern

Practical information
=====================

The lodging for most participants has been covered by the
``Laboratoire de Recherche en Informatique`` d'Orsay and the research network ``Digiteo``. Funding and travel for PHD student and PostDoc was also covered (in conjonction with the Laboratoire de Mathématiques d'Orsay). Food and travel was at the charge of the other participants.


The Tower can accommodate 8-10 people, and if needed there is another
adjacent guest house. Participant can stay from Saturday 4th in the
evening to Saturday 11th in the morning. We will do the cooking
ourselves, so bring along your favorite recipes and dishes!  Also
bring along hiking/climbing shoes and music instruments/scores for the
breaks. There will of course be an open wifi and wired internet
connection.

To register, fill in the following form, and send it by e-mail to
Florent Hivert::

    Name:
    Surname:
    will participate to the Thirds Sage-combinat days in Cernay.
    Date of arrival:
    Date of departure:

Coming from downtown Paris to Cernay
====================================

* From Gare Montparnasse: 35 minutes train to Rambouillet + 15 minutes bus to Cernay-la-Ville
* From Chatelet-les-Halles: 45 minutes RER B to Saint-Remy les Chevreuses + 15 minutes bus to Cernay-la-Ville
* `Time tables Saint-Remy <-> Cernay <-> Rambouillet <attachment:HV3903_1.pdf>`_

   There are two bus stops at Cernay. The closest to the gite is Grand'Place.

   BEWARE: there are no bus to Cernay between 7:25am and 12:54am!

* `Map and and aerial photo <http://maps.google.fr/maps?f=q&source=s_q&hl=fr&geocode=&q=Cernay+la+ville&sll=47.15984,2.988281&sspn=17.161007,44.516602&ie=UTF8&ll=48.675731,1.971735&spn=0.004066,0.010868&z=17>`_

We will do some car shuttles from Saint-Rémy. Please contact us in
advance to synchronize.

```