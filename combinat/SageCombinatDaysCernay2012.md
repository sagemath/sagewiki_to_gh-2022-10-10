{{{#!rst
Sage-Combinat days in Orsay
===========================

The third Sage-Combinat days in Cernay will hold at Cernay-la-Ville,
France, February 6-10 2012, near Orsay, in the south-west of Paris.

Following the \*-Combinat tradition I reserved the `guest house the
tower <http://www.cernayvacances.com/CEngels.html>`_ at
Cernay-la-Ville.  It is very nice and cosy, 35 minutes train + 15
minutes bus away from downtown Paris. For practical information, see
below.

Tentative list of themes
========================

The main goal of this meeting is to gather Sage/Sage-Combinat
developers for coding sprints on the following themes:

* Refactoring of the combinatorics infrastructure (factories, Cythonizing partitions, compositions...)

* Cythonization of many iterators

* Categories (Morphisms, functorial constructions, optimization, coercion ?)

* Integration of more Sage-Combinat thematic tutorials into Sage

* Please expand!

Jean-Pierre Flori:

* I'd love to have a deeper look into the coercion system and its
  caching mecanism to get a better understanding of it and to solve
  bug #715.
* If anyone is interested, we could also have a look at some symbolic
  issues in pynac (which could be of interest for combinat people).

Vincent Delecroix :

* implementations of some Gray codes for much faster generation
* iterator for conjugacy class of the symmetric group (the call to Gap takes hours)
* flat surfaces (quadratic differentials, topolgoy stuff, origamis, Ferenczi-Zamboni induction, ...)
* language and symbolic dynamics (tickets #12224, #12225, #12226, #12227, #12228, #122230, #12231)
* would like to hear about the code in Sage and more generally about algorithms for generating things up to isomorphism (like graphs, Integer vectors and co).


ThierryMonteil:

* flat surfaces via G-maps (in which state are the Permutations currently? or should we use pointers or existing libs like CGAL ?).
* need help to build a class `TileSet` in a good way.
* having OEIS work again (i have working parsers ready for a while, but would like to have them in a class, not as functions like `sloane_search()`, maybe the same as the existing for offline oeis ?).
* word combinatorics : `tangent_words` as `WordPaths` ; `tangent_analytic_words` ; discussion about languages.


We would love to have some hard core Cython and/or Sage developer at hand :-)

Tentative list of participants
==============================

* NicolasBorie, ATER, Orsay
* FlorentHivert, Prof, LITIS, Université de Rouen
* NicolasThiéry, MdC, Orsay
* Viviane Pons, graduate student, LIGM, Université Paris-Est

Practical information
=====================

The local expenses (food + lodging) will be covered by the
``Laboratoire de Recherche en Informatique`` d'Orsay.  We also have a
few possibility for funding expensive travel for people far
away. Please contact me and Nicolas if needed.

The Tower can accommodate 8-10 people, and if needed there is another
adjacent guest house. Participant can stay from Saturday 4th in the
evening to Saturday 11th in the morning. We will do the cooking
ourselves, so bring along your favorite recipes and dishes!  Also
bring along hiking/climbing shoes and music instruments/scores for the
breaks. There will of course be an open wifi and wired internet
connection.

To register, fill in the following form, and send it by e-mail to
Florent Hivert:

{{{
Name:
Surname:
will participate to the Thirds Sage-combinat days in Cernay.
Date of arrival:
Date of departure:
}}}

Coming from downtown Paris to Cernay
====================================

* From Gare Montparnasse: 35 minutes train to Rambouillet + 15 minutes bus to Cernay-la-Ville
* From Chatelet-les-Halles: 45 minutes RER B to Saint-Remy les Chevreuses + 15 minutes bus to Cernay-la-Ville
* `Time tables Saint-Remy <-> Cernay <-> Rambouillet <http://www.savac.fr/fr/transports/horaires_content/horaire/25136_B_SAVAC_39_03_COMPLET.pdf|39.03>`_

   There are two bus stops at Cernay. The closest to the gite is Grand'Place.

   BEWARE: there are no bus to Cernay between 7:32am and 12:25am!

 * `Map and and aerial photo <http://maps.google.fr/maps?f=q&source=s_q&hl=fr&geocode=&q=Cernay+la+ville&sll=47.15984,2.988281&sspn=17.161007,44.516602&ie=UTF8&ll=48.675731,1.971735&spn=0.004066,0.010868&z=17>`_

We will do some car shuttles from Saint Rémi. Please contact us in
advance to synchronize.

}}}
