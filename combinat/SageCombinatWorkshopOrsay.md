= Sage-Combinat workshop in Orsay =

January 26-30 of 2009

Purpose: work on the foundations and get former MuPAD-Combinat developers on board. See below for details.

== Accomodation ==

Like for the previous MuPAD-Combinat days of June 2006, I (Nicolas) have rented a 8-person house  in Cernay-la-Ville
([[http://www.cernayvacances.com/CFrans.html | la tour]]). Hopefully, this will be paid for by the university of Orsay; otherwise we will split the charges (~600 euros total). We will do the cooking ourselves.

== How to come ==

 I'll post shortly details on how to come (in short RER B to Saint-Rémi de Chevreuse + 10 minutes of bus


Coming to the meeting from downtown Paris:

 - From Gare Montparnasse: 35 minutes train to Rambouillet + 15 minutes bus to Cernay-la-Ville
 - From Chatelet-les-Halles: 45 minutes RER B to Saint-Remy les Chevreuses + 15 minutes bus to Cernay-la-Ville

There are two bus stops at Cernay, the Place one is on the map : Grand'Place, near the gite.

 - [ [http://www.savac.fr/fr/transports/pdf/horaires_06_07/H039003.pdf|Time tables Saint-Remy <-> Cernay <-> Rambouillet]]
   BEWARE: there are very few busses between 8am and 12 am!
   In case of trouble, we should have a car, and probably can do some shuttles. Nicolas' phone: 06 77 90 32 79
- [http://www26.mappy.com/sid1CyvhfyNPKXMn21w/cFGM?recherche=0&posl=poi&show_poi=1&show_iti=0&poix=0&poiy=0&poi_rr=0.5&poi_rx=0.6&poi_ry=0.5&csl=poi&fsl=m2&gsl=m2&msl=m2&temp_no_prop=0&comment=&xsl=plan&out=2&lr=0.5&wcm2=&nom2=&tcm2=&a10m2=&xm2=&ym2=&wnm2=+37+Rue+de+la+Ferme+&tnm2=Cernay-la-Ville&pcm2=78720&scm2=&ccm2=250&com2=EU&x=38&y=3 |Map and and aerial photo]


== Participants ==

Please fill in below whether and how long you would like to participate:

 * NicolasThiéry: I'll be there most of the time
 * Sébastien Labbé: between 25th-31st of January
 * Nicolas Borie : not 5-9 of January.
 * FrancoSaliola: I can (and will) participate for the whole week.
 * Florent Hivert: not 29th of January
 * Jean-Christophe Novelli: only 27-28 of January possible
 * Adrien Boussicault
 * Vincent Delecroix: "I have three days free (26-28) during which I will come to Orsay"
 * Michael Abshoff: available online

== Suggested Topics ==

Add topics that you want discuss or work on. Add your name next to anything you'd like to participate with. Your name should at least appear next to the topics you suggest :-)

'''Words''' (FrancoSaliola, Sébastien Labbé)
 * ideas for improving to the code (Stream for infinite words?)
 * discussions regarding the trac #5002
 * finish and post words_new_fct_sl.patch to trac #5037
 * create a Lyndon word class
 * trac #4954: Words_over_Alphabet should check the type of input alphabet
 * Add Generalized Thue-Morse words to words.[TAB]
 * Add Random Word and Random Testing
 * Add Notes about words library
 * '''Word Paths''' -- Final improvements to word paths, get the patch posted to trac #5038 and reviewed. Discussion about getting Christoffel Words inherits from Word Paths. (Sébastien Labbé).
 * '''Dyck Word''' -- Discussions about getting Dyck Words inherits from Word Paths. Comparisons of efficiency. (Sébastien Labbé).
 * '''Word Morphism''' -- Word Morphism actually herits from SageObject and it should be a more general Morphism class. (Sébastien Labbé). 
 * '''Language''' -- Create a Language class. (Sébastien Labbé). 

'''NCSF'''
 * Mike Zabrocki sent me (Franco) an implementation of noncommutative symmetric functions in Sage. I'll have it with me at the meeting to share and discuss. (It's not on the patch server because he finds the instructions complicated, which brings me to another point below.)

'''Documentation'''
 * '''Patch Server Guide''' -- Write a better guide for the patch server. It's currently way too long, and a shorter, concise version would be better.
 * '''User's Guide''' -- descriptions of and how to use the fundamental sage-combinat data structures: CombinatorialClass, CombinatorialObject, CombinatorialAlgebra, LazyFamily, ...

'''Posets''' (FrancoSaliola)
 * the posets code in Sage needs to be re-designed to integrated properly with the rest of sage-combinat.
 * design discussions for abstract larger/infinite posets

'''Representation Theory of Finite Dimensional Algebras'''
 * '''Desosseur''' -- Computing the Cartan invariant and more generally representation theory of finite dimensional algebras (FlorentHivert, FrancoSaliola).
 * a basic class for the quiver of an algebra

'''Miscellaneous'''
 * deal with more of the [[http://wiki.sagemath.org/combinat/Weirdness|quirks and weirdness issues]].
 * '''Set Partition (with no s)''' -- Implement Set Partition as a child of Set Partitions. Use the code from Disjoint Set which is already in the sage-combinat tree. See trac #5039. (Sébastien Labbé).

== Talks ==

If you would like to give a talk, for example, to demonstrate your code, then add your name and topic to the list. These talks should be not more than 20 minutes (since we want a lot of time to code).

 * '''Sage-Combinat Development''' -- how to install sage-combinat; how to update; how to contribute (hg, patch server, trac, ....). (Who wants to lead this?)
 * '''Cythonize python files''' -- The key points to do when translating a python file already in sage into cython. (Who wants to lead this?)
