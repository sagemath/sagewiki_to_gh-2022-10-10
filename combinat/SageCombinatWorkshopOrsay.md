= Sage-Combinat workshop in Orsay =

{{attachment:logo_UFR.png||width=50}} {{attachment:logo_u-psud.png||width=200}}

January 26-30 of 2009

Purpose: work on the foundations and get former MuPAD-Combinat developers on board. See below for details.

== Accomodation ==

Like for the previous MuPAD-Combinat days of June 2006, I (Nicolas) have rented a 8-person house in Cernay-la-Ville
([[http://www.cernayvacances.com/CFrans.html|la tour]]). Hopefully, this will be paid for by the university of Orsay; otherwise we will split the charges (~600 + food). We will do the cooking ourselves (bring your favorite recipes!).

== Coming from downtown Paris ==

 * From Gare Montparnasse: 35 minutes train to Rambouillet + 15 minutes bus to Cernay-la-Ville
 * From Chatelet-les-Halles: 45 minutes RER B to Saint-Remy les Chevreuses + 15 minutes bus to Cernay-la-Ville

 * Time tables Saint-Remy <-> Cernay <-> Rambouillet:
   [[http://www.savac.fr/fr/transports/pdf/horaires_2008/horaire_039_039_103_2009.pdf|39.103]]
   [[http://www.savac.fr/fr/transports/pdf/horaires_2008/horaire_039_039_03_2009.pdf|39.003]]
   [[http://www.savac.fr/fr/transports/pdf/horaires_2008/horaire_039_039_303_2009.pdf|39.303 express]]

   There are two bus stops at Cernay, the closest is Grand'Place, near the gite.

   BEWARE: there are no busses between 7:35am and noon!

 * We will do some car shuttles from Saint Rémi. Please contact us in advance to synchronize. NicolasThiery' phone: 06 77 90 32 79
    * Monday morning 10am on the parking of Saint-Rémi de Chevreuse (Nicolas Borie: 06 89 29 78 44)
    * ...

 * [[http://maps.google.fr/maps?f=q&source=s_q&hl=fr&geocode=&q=Cernay+la+ville&sll=47.15984,2.988281&sspn=17.161007,44.516602&ie=UTF8&ll=48.675731,1.971735&spn=0.004066,0.010868&z=17|Map and and aerial photo]]

== Schedule ==

We will start on Monday at 10:30 with an introductory talk. The following days, we will start at 10 am, with a short talk. On monday morning, we will setup a more detailed schedule for each topic, and post it here. 

== Participants ==

Please fill in below whether and how long you would like to participate:

 * NicolasThiéry: I'll be there most of the time except Tuesday
 * Sébastien Labbé: between 25th-31st of January
 * Thomas Fenrique
 * Nicolas Borie:
 * FrancoSaliola: I can (and will) participate for the whole week.
 * Florent Hivert:
 * Jean-Christophe Novelli: only 27-28 of January possible
 * Adrien Boussicault
 * Vincent Delecroix: I will participate three days (26-28) and perhaps whole week
 * Michael Abshoff: available online

== Suggested Topics ==

Add topics that you want discuss or work on. Add your name next to anything you'd like to participate with. Your name should at least appear next to the topics you suggest :-)


'''Words''': see the [[http:SageCombinatWorkshopOrsay/WordsSprint|sprint page]]

'''Interval Exchange Transformation and Linear Involution''' (Vincent Delecroix)
 * Patch a first version of code for the combinatoric of interval exchange transformations and their generalizations. It will be a hard task to choose names because standards one are Permutation and GeneralizedPermutation which are confusing ! Perhaps IETPermutation... but not very beautiful.

'''Documentation'''
 * '''Patch Server Guide''' -- Write a better guide for the patch server. It's currently way too long, and a shorter, concise version would be better. ''' [1st version DONE see [[http:/combinat/MercurialStepByStep|step by step instructions]] ] '''
 * '''User's Guide''' -- descriptions of and how to use the fundamental sage-combinat data structures: CombinatorialClass, CombinatorialObject, CombinatorialFreeModule, Categories, Family, ...

'''Posets''' (FrancoSaliola)
 * the posets code in Sage needs to be re-designed to integrate properly with the rest of sage-combinat.
 * design discussions for abstract larger/lazy/infinite posets

'''Categories''' (NicolasThiery)
 * Design and naming convention discussions
 * Put it to intensive use: the NCSF and representation theory projects will be perfect for this

'''NCSF'''
 * Mike Zabrocki sent me (Franco) an implementation of noncommutative symmetric functions in Sage. I'll have it with me at the meeting to share and discuss. (It's not on the patch server because he finds the instructions complicated, which brings to the patch server point).

'''Representation Theory of Finite Dimensional Algebras and monoids'''
 * '''Desosseur''' -- Computing the Cartan invariant and more generally representation theory of finite dimensional algebras (FlorentHivert, FrancoSaliola).
 * a basic class for the quiver of an algebra
 * core work: subspaces and quotients for combinatorial free modules, and corresponding category framework
 * Finish the basic implementation of representation theory of monoids via J-classes
 * DiscreteMonoid implemented via lists instead of matrices

'''Miscellaneous'''
 * deal with more of the [[http://wiki.sagemath.org/combinat/Weirdness|quirks and weirdness issues]].
 * '''Set Partition (with no s)''' -- Implement Set Partition as a child of Set Partitions. Use the code from Disjoint Set which is already in the sage-combinat tree. See trac #5039. (Sébastien Labbé).
 * Fix Anne's bug with Partitions(0)
== Talks ==

If you would like to give a talk, for example, to demonstrate your code, then add your name and topic to the list. These talks should be not more than 20 minutes (since we want a lot of time to code).

 * '''Sage-Combinat Development''' -- how to install sage-combinat; how to update; how to contribute (hg, patch server, trac, ....). (NicolasThiery)
 * '''Cythonize python files''' -- The key points to do when translating a python file already in sage into cython. (Who wants to lead this?)
 * '''The new category framework''' -- Design and usage (NicolasThiery)
 * '''Root system plots''' -- Demo (NicolasBorie)
 * '''Word paths and/or Equations on words''' -- Demo (Sébastien Labbé)
