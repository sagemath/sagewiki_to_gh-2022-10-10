

# Sage-Combinat workshop in Orsay

January 26-30 of 2009 

Purpose: work on the foundations and get former MuPAD-Combinat developers on board. See below for details. 

Sponsored by the Laboratoire de Mathématiques d'Orsay: ![combinat/SageCombinatWorkshopOrsay/logo_UFR.png](combinat/SageCombinatWorkshopOrsay/logo_UFR.png) 


## Accomodation

Like for the previous MuPAD-Combinat days of June 2006, I (<a href="/NicolasThi%C3%A9ry">NicolasThiéry</a>) have rented a 8-person house in Cernay-la-Ville (<a class="http" href="http://www.cernayvacances.com/CFrans.html">la tour</a>). We did the cooking ourselves (bring your favorite recipes!). Altogether this made for a tight budget (around 1200 euros total for 5 days and 8 persons). 

![combinat/SageCombinatWorkshopOrsay/img1.jpg](combinat/SageCombinatWorkshopOrsay/img1.jpg) ![combinat/SageCombinatWorkshopOrsay/img2.jpg](combinat/SageCombinatWorkshopOrsay/img2.jpg) 


## Coming from downtown Paris

* From Gare Montparnasse: 35 minutes train to Rambouillet + 15 minutes bus to Cernay-la-Ville 
* From Chatelet-les-Halles: 45 minutes RER B to Saint-Remy les Chevreuses + 15 minutes bus to Cernay-la-Ville 
* Time tables Saint-Remy <-> Cernay <-> Rambouillet: 
      * <a class="http" href="http://www.savac.fr/fr/transports/pdf/horaires_2008/horaire_039_039_103_2009.pdf">39.103</a> <a class="http" href="http://www.savac.fr/fr/transports/pdf/horaires_2008/horaire_039_039_03_2009.pdf">39.003</a> <a class="http" href="http://www.savac.fr/fr/transports/pdf/horaires_2008/horaire_039_039_303_2009.pdf">39.303 express</a> There are two bus stops at Cernay, the closest is Grand'Place, near the gite. BEWARE: there are no busses between 7:35am and noon! 
* We will do some car shuttles from Saint Rémi. Please contact us in advance to synchronize. <a href="/NicolasThi%C3%A9ry">NicolasThiéry</a>' phone: 06 77 90 32 79 
         * Monday morning 10am on the parking of Saint-Rémi de Chevreuse 
         * ... 
* <a class="http" href="http://maps.google.fr/maps?f=q&amp;source=s_q&amp;hl=fr&amp;geocode=&amp;q=Cernay+la+ville&amp;sll=47.15984,2.988281&amp;sspn=17.161007,44.516602&amp;ie=UTF8&amp;ll=48.675731,1.971735&amp;spn=0.004066,0.010868&amp;z=17">Map and and aerial photo</a> 

## Participants

* <a href="/NicolasBorie">NicolasBorie</a>, doctorant, Orsay 
* Sébastien Labbé, doctorant, Université du Québec à Montréal, Canada 
* Adrien Boussicault, doctorant, Institut Gaspard Monge, Université de Marne-la-Vallée 
* Vincent Delecroix, doctorant, Institut de Mathématiques de Luminy, Marseille 
* Franco Saliola, Post-doc, Institut Gaspard Monge, Université de Marne-la-Vallée 
* <a href="/NicolasThi%C3%A9ry">NicolasThiéry</a>, MdC, Orsay 
* Thomas Fenrique, CR, Laboratoire d'Informatique Fondamentale, Univ. Marseille 
* <a href="/FlorentHivert">FlorentHivert</a>, Prof, LITIS, Université de Rouen 

## Short talks

* **Sage-Combinat History and development** -- (<a href="/NicolasThi%C3%A9ry">NicolasThiéry</a>) 
* **The new category framework** -- Design and usage (<a href="/NicolasThi%C3%A9ry">NicolasThiéry</a>) 
* **Root system plots** -- Demo (<a href="/NicolasBorie">NicolasBorie</a>) 
* **Word paths and/or Equations on words** -- Demo (Sébastien Labbé) 
* **Interval Exchange Transformation and Linear Involution** (Vincent Delecroix)== Suggested Topics == 

## Work done

Altogether, the meeting was really successful, with lots of code written (90 commits), and many many design discussions. Here are some of the points that were worked on: 

**Words**: see the <a class="http" href="http:SageCombinatWorkshopOrsay/WordsSprint">sprint page</a> 

**Interval Exchange Transformation and Linear Involution** (Vincent Delecroix) 

* Patch a first version of code for the combinatoric of interval exchange transformations and their generalizations. It will be a hard task to choose names because standards one are Permutation and <a href="/GeneralizedPermutation">GeneralizedPermutation</a> which are confusing ! Perhaps IETPermutation... but not very beautiful. 
**Documentation** 

* **Patch Server Guide** -- Write a better guide for the patch server. It's currently way too long, and a shorter, concise version would be better. ** [1st version DONE see <a class="http" href="http:/combinat/MercurialStepByStep">step by step instructions</a> ] ** 
* **User's Guide** -- descriptions of and how to use the fundamental sage-combinat data structures: <a href="/CombinatorialClass">CombinatorialClass</a>, <a href="/CombinatorialObject">CombinatorialObject</a>, <a href="/CombinatorialFreeModule">CombinatorialFreeModule</a>, Categories, Family, ... 
**Posets** (<a href="/FrancoSaliola">FrancoSaliola</a>) 

* the posets code in Sage needs to be re-designed to integrate properly with the rest of sage-combinat. 
* design discussions for abstract larger/lazy/infinite posets 
**Categories** (<a href="/NicolasThi%C3%A9ry">NicolasThiéry</a>) 

* Design and naming convention discussions 
* Put it to intensive use: the NCSF and representation theory projects will be perfect for this 
**NCSF** 

* Mike Zabrocki sent me (Franco) an implementation of noncommutative symmetric functions in Sage. I'll have it with me at the meeting to share and discuss. (It's not on the patch server because he finds the instructions complicated, which brings to the patch server point). 
**Representation Theory of Finite Dimensional Algebras and monoids** 

* **Desosseur** -- Computing the Cartan invariant and more generally representation theory of finite dimensional algebras (<a href="/FlorentHivert">FlorentHivert</a>, <a href="/FrancoSaliola">FrancoSaliola</a>). 
* a basic class for the quiver of an algebra 
* core work: subspaces and quotients for combinatorial free modules, and corresponding category framework 
* Finish the basic implementation of representation theory of monoids via J-classes 
* <a href="/DiscreteMonoid">DiscreteMonoid</a> implemented via lists instead of matrices 
**Miscellaneous** 

* deal with more of the <a class="http" href="http://wiki.sagemath.org/combinat/Weirdness">quirks and weirdness issues</a>. 
* **Set Partition (with no s)** -- Implement Set Partition as a child of Set Partitions. Use the code from Disjoint Set which is already in the sage-combinat tree. See trac #5039. (Sébastien Labbé). 
* Fix Anne's bug with Partitions(0) 