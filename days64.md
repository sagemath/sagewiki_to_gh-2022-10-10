= Sage Days 64: Algebraic Combinatorics =

== General Information ==

The goal of these Sage Days is to bring together developers in algebraic combinatorics, Lie theory, and representation theory
to discuss needed features and develop code. People who have coded in [[http://www.sagemath.org|Sage]] and would like to get help getting their
code integrated into Sage are also welcome to join.
Any level of Sage experience is welcome, however there will not be basic (python) programming tutorials. We encourage people who wish to participate to have an understanding of basic python (there are [[http://www.sagemath.org/doc/thematic_tutorials/tutorial-programming-python.html|numerous tutorials]] available online and books available if you want to learn) and basic object-oriented programming (OOP for short). A longer list of [[http://thales.math.uqam.ca/~saliola/sage/tutorials/|Sage tutorials]] are available online as well.

We would like to point out that a combinatorics related workshop will be held at AIM the following week for people who would like to combine the two, see [[http://aimath.org/workshops/upcoming/dynalgcomb/|AIM workshop]].

=== When & Where ===

March 17-20, 2015 at [[http://www.ucdavis.edu|UC Davis]].

=== Registration ===

Registration is now closed due to space limitations and funding decisions have been made. If you have questions about registration, e-mail either Anne (anne at math.ucdavis.edu) or Travis (tscrim at ucdavis.edu).

=== Lodging ===

We have the following "official" conference hotels. To get the specified room rates, when making the reservation mention that you are with "Sage Days".
You need to book your room before February 3, 2015 to get the special rates.

 * [[http://www.aggieinn.com/|Aggie Inn]] (530)-756-0352 Conference rate of $114 - 134 a night.
 * [[http://book.bestwestern.com/bestwestern/US/CA/Davis-hotels/BEST-WESTERN-University-Lodge/Hotel-Overview.do?propertyCode=05363|Best Western University Lodge]] $95 a night.

There is also the following recommendation:

 * [[http://www.econolodge.com/bestrate/davis-california-hotels?source=pmfgoell&brand-code=EL&pmf=google&k_clickid=9c601c88-20c4-4417-a9f9-72d8b7e24fa2&chain=E|Econolodge]] (make sure you pick the one in Davis)

If you are receiving funding, please contact Matt Silver (mtsilver at math.ucdavis.edu) to reserve a room.

=== Transportation ===

The nearest airport is Sacramento International (SAC), and are multiple ways to get to UC Davis. There is [[http://www.yolobus.com/news/airportservice.php|bus route 42]]. There is also an [[https://www.davisairporter.com/index2.html|airport shuttle]].

The two other nearby major airports are San Francisco International (SFO) and Oakland International (OAK). From both airports, a combination of [[http://www.bart.gov|BART]] and [[http://www.amtrak.com/home|Amtrak]] can be used to get to UC Davis. In particular, there is the [[http://www.capitolcorridor.org/|Capital Corridor]] line at either the Oakland Coliseum or Richmond BART stations.

See also: https://www.math.ucdavis.edu/about/directions/

== Schedule ==

All talks and coffee breaks will be in [[http://campusmap.ucdavis.edu/|Mathematical Sciences Building (MSB)]] 1147.
Coding sprints will take place in MSB 1147, MSB 3240, MSB 3236, MSB 3106 (after 3pm on Wednesday).


|||||| Tuesday 3/17 ||
|| 9:30 AM |||| Coffee break ||
|| 10 - 11 AM || Nicolas Thiery || Introduction to Sage Development I ||
|| 11 - 12 AM || Franco Saliola || Introduction to Sage Development II ||
|| 12 - 12:30 PM |||| Introductions and discussions of projects ||
|| 12:30 - 1:30 PM |||| Lunch ||
|| 3:30 PM |||| Coffee break ||
|||||| Wednesday 3/18 ||
|| 9:30 AM |||| Coffee break ||
|| 10 - 11 AM || Vivien Ripoll & Jean-Philippe Labbé || Computing and displaying infinite root systems ||
|| 11 - 12 AM || Mark Shimozono || Implementation of double affine Hecke algebra in Sage ||
|| 12 - 1 PM |||| Lunch ||
|| 3:30 PM |||| Coffee break ||
|||||| Thursday 3/19 ||
|| 9:30 AM |||| Coffee break ||
|| 10 - 11 AM || Nathan Williams || Sage Days $dim(V_{\rho}(A_3))$ ||
|| 12 - 1 PM |||| Lunch ||
|| 3:30 PM |||| Coffee break ||
|||||| Friday 3/20 ||
|| 9:30 AM |||| Coffee break ||
|| 12 - 1 PM |||| Lunch ||
|| 3:30 PM |||| Coffee break ||

All other time will be devoted to coding sprints.

== Projects ==

If you have any projects that you'd want to work on, please add them. If you want to work on any project listed, just add your name.

 * Extended affine Weyl groups ([[http://trac.sagemath.org/ticket/15375|#15375]]) - Dan Bump, Anne Schilling, Mark Shimozono, Nicolas Thiery, Mee Seong Im
 * Lie algebras ([[http://trac.sagemath.org/ticket/14901|#14901]]) - Travis Scrimshaw, Mee Seong Im, Darij Grinberg
 * Root multiplicities of Kac-Moody algebras - Kyu-Hwan Lee, Ben Salisbury, Jonathan Judge
 * Hyperbolic Cartan types ([[http://trac.sagemath.org/ticket/15974|#15974]]) - Travis Scrimshaw
   * Related with limit roots in hyperbolic types ([[http://trac.sagemath.org/ticket/16087|#16087]])
   * Might also be useful: http://trac.sagemath.org/ticket/15703
 * Limit roots of Coxeter groups ([[http://trac.sagemath.org/ticket/16087|#16087]] and [[http://trac.sagemath.org/ticket/15703|#15703]]) - Jean-Philippe Labbe and Vivien Ripoll
 * Lie groups (in connection with !SageManifolds [[http://trac.sagemath.org/ticket/14865|#14865]]) - Eric Gourgoulhon, Travis Scrimshaw, Mee Seong Im
 * Generalized toggle groups ([[http://trac.sagemath.org/ticket/17978|#17978]]) and homomesy - Jessica Striker, Emily Gunawan
 * Snake graph perfect matching formula for curves on triangulated surfaces ([[http://trac.sagemath.org/ticket/16310|#16310]]) - Emily Gunawan
 * Implement categories and general framework for representations -
   Travis Scrimshaw, Mee Seong Im, Nicolas Thiéry, Franco Saliola
 * Alternating sign matrices (implement fully packed loops, map to link pattern, fix corner sum matrix ([[http://trac.sagemath.org/ticket/17977|#17977]])) - Jessica Striker, Emily Gunawan
 * Crystal morphisms, subcrystals, and virtual crystals ([[http://trac.sagemath.org/ticket/15463|#15463]]) - Travis Scrimshaw, Anne Schilling
 * Refactoring (skew) tableau(x) classes - Darij Grinberg, Travis Scrimshaw
 * Do something about !IntegerListsLex and the associated Partitions / Compositions bugs [[http://trac.sagemath.org/ticket/17548|#17548]], [[http://trac.sagemath.org/ticket/17956|#17956]], [[http://trac.sagemath.org/ticket/17920|#17920]]

 * Finalize the following stack of tickets:
   * [[http://trac.sagemath.org/ticket/11111|#11111]] (better support for finite dimensional modules and algebras, ...)
   * [[http://trac.sagemath.org/ticket/8678|#8678]] (module morphisms),
   * [[http://trac.sagemath.org/ticket/17160|#17160]] (category for finitely generated magmas/.../groups),
   * [[http://trac.sagemath.org/ticket/16925|#16925]] (symmetric group algebras)

   Nicolas Thiéry, Travis Scrimshaw, Darij Grinberg, Franco Saliola, Aladin Virmaux.

 * work toward integrating [[http://trac.sagemath.org/ticket/16659|#16659]] (decomposition of finite dimensional associative algebras) -    Nicolas Thiéry, Franco Saliola, Aladin Virmaux.



== Speakers ==

 * Vivien Ripoll (Universitaet Wien)
 * Franco Saliola (UQAM)
 * Mark Shimozono (Virginia Tech)
 * Nicolas Thiery (LRI, Universite Paris Sud)
 * Nathan Williams (LaCIM)

== Participants ==

 * P. Akhilesh (Harish-Chandra Research Institute, Allahabad, India)
 * Jonathan Axtell (Iowa State University)
 * Robert Bassett (UC Davis)
 * Michał Bejger (N. Copernicus Astronomical Center) 
 * Dan Bump (Stanford)
 * James Campbell (Cardiff School of Mathematics)
 * Federico Castillo (UC Davis)
 * Tom Denton (Youtube)
 * Kevin Dilks (University of Minnesota)
 * Brendon Dutra (UC Davis)
 * Matt Erbst (Software Engineer)
 * Bryan Gillespie (UC Berkeley)
 * Darij Grinberg (MIT)
 * Eric Gourgoulhon (Observatoire de Paris)
 * Emily Gunawan (University of Minnesota)
 * Mee Seong Im (University of Illinois -- Urbana-Champaign)
 * Jonathan Judge (University of Connecticut)
 * Jan Keitel (Max-Planck-Institut für Physik)
 * Vince Knight (Cardiff School of Mathematics)
 * Jean-Philippe Labbe (Jerusalem)
 * Hyeonmi Lee (Hanyang University/UC Davis)
 * Kyu-Hwan Lee (University of Connecticut)
 * Maria Monks Gillespie (UC Berkeley)
 * Tze-Chun Ou (University of Connecticut)
 * Chris Patton (UC Davis)
 * Oliver Pechenik (University of Illinois -- Urbana-Champaign)
 * Jim Propp (UMass Lowell)
 * Vivien Ripoll (Universitaet Wien)
 * Tom Roby (University of Connecticut)
 * Franco Saliola (UQAM)
 * Ben Salisbury (Central Michigan University)
 * Dmitry Shemetov (UC Davis)
 * Mark Shimozono (Virginia Tech)
 * Jessica Striker (North Dakota State University)
 * Joshua Swanson (University of Washington)
 * Marko Thiel (Universitaet Wien)
 * Nicolas Thiery (LRI, Universite Paris Sud)
 * Peter Tingley (Loyola)
 * Bolor Turmunkh (University of Illinois - Urbana-Champaign)
 * Aladin Virmaux (LRI, Universite Paris Sud)
 * Nathan Williams (LaCIM)
 * Sandi Xhumari (University of Connecticut)

== Organizers ==

 * Dan Bump (Stanford)
 * Anne Schilling (UC Davis)
 * Travis Scrimshaw (UC Davis)
