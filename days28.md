= Sage Days 28: Dynamics, geometry, combinatorics... =

This workshop will offer a gentle introduction to the open source mathematical software [[https://www.sagemath.org|Sage]], with an
emphasis on dynamics and geometry. Talks will be in French or English depending on the participants.

== Dates: 17 to 19 January 2011 ==

Some people will stay for the whole week (Jan 17 - 21) to develop.

== Location ==

Laboratoire de Mathématiques d'Orsay (Université Paris-Sud 11), Orsay, France.

All talks and tutorials will be held in building 430. The main lecture room will be salle Lederer (ground floor).
There will be another room available for parallel sessions.

Tea/coffee will be served in the tea room in the first floor of the same building.

[[http://www.math.u-psud.fr/acces.php|How to get to Orsay]]

== Related events ==

 * 18 January 2011, 16h, Orsay: [[http://www.math.u-psud.fr/~geo/sem/archives.php| Séminaire d'Éric Vasserot: Representations des algebres de Hecke affines de type classique et categorification]]
 * 20-21 January 2011, Jussieu, Paris: [[http://www.gdr-im.fr/?q=node/92|Journées du GDR Informatique et mathématiques]]

== Registration ==

Registration is encouraged using this [[https://spreadsheets.google.com/viewform?formkey=dDJxN09tUkRJY0dUWDBHSDhMcUI4Y0E6MQ|registration form]] (this will help plan appropriate amounts of drinks and snacks), but you can still attend if you haven't registered in advance.

== Contact ==

For any additional queries, contact Samuel Lelièvre <samuel.lelievre+days28@gmail.com>. If needed, call 0661749080.


== Bring your laptop ==

Please bring your laptop for the tutorial sessions (we will have a few
spare laptops if you really do not have one). Also, if you do not have
the latest version of Sage (4.6.1) installed on your laptop, please make
sure to come at 9:30 on Monday so that we can guide you through the
process.

== Programme ==

'''Lundi 17'''

  * ''09:30-10:30'' café + aide à l'installation de Sage
  * ''10:30-11:20'' introduction à Sage avec démonstration (NicolasThiéry)
    [[http://combinat.sagemath.org/doc/reference/demos/2011-01-17-SageDays28.html|demo]]
    [[attachment:2011-01-17-SageDays28.pdf|support]]

  * ''11:30-13:00'' repas au restaurant du personnel d'Orsay (CESFO), présentation des participants

  * ''13:00-13:20'' tutoriel: prise en main de Sage (VincentDelecroix)
    [[attachment:tutorial-notebook-and-help-long.sws|Notebook and Help]]
  * ''13:20-14:45'' tutoriel: mathématiques de premier cycle avec Sage (NicolasThiéry?)
  * ''14:45-15:00'' pause café
  * ''15:00-16:00'' les surfaces à petits carreaux : "combinatoire de permutations et connexité d'espaces de revêtements" (VincentDelecroix)
  * ''16:00-18:00'' démos et tutoriels autour de la combinatoire:
    * combinatoire usuelle (FlorentHivert)
      [[attachment:tutorial-basic-combinatorics.sws|Basic Combinatorics]]
    * combinatoire des mots (SébastienLabbé)
      [[attachment:demo-words.txt]]

'''Mardi 18'''

 * ''09:30-10:30'' tutoriel: programmation Python/Sage (FlorentHivert) Voir 

  * [[attachment:tutorial-programming-python.sws]] [[attachment:tutorial-programming-python.txt]]
  * [[attachment:tutorial-objects-and-classes.sws]] [[attachment:tutorial-objects-and-classes.txt]]

 * ''10:30-10:50'' tutoriel: signaler un bogue, suggérer une amélioration (ThierryMonteil)
  * Voir [[days28-bugs_to_report]]
 * ''10:50-11:30'' tutoriel: contribuer à Sage (SébastienLabbé)
  [[http://www.liafa.jussieu.fr/~labbe/Sage/how-to-contribute/|How to contribute to Sage in sixteen easy steps!]]

 * ''11:30-13:00'' repas au restaurant du personnel d'Orsay (CESFO)

 * ''13:00-14:00'' tutoriel: utiliser des structures algébriques: espaces vectoriels, ... (FlorentHivert, NicolasThiéry)
  [[attachment:tutorial-using-free-modules.txt]]

 * ''14:00-15:00'' tutoriel: implanter ses propres structures algébriques (FlorentHivert, NicolasThiéry)
  [[attachment:tutorial-implementing-algebraic-structures.txt]]
 * ''15:00-15:30'' tutoriel: graphes (Nathann Cohen)
  * [[attachment:download_worksheets.zip|tutoriels graphes]]
 * ''15:30-16:30'' tutoriel: échange d'intervalles (VincentDelecroix)
  * [[attachment:Interval exchanges.sws|tutoriel échanges d'intervalles]]

  
'''Mercredi 19'''

 * ''10:00-11:00'' tutoriel: rewiewer un patch (SébastienLabbé)
    [[http://www.liafa.jussieu.fr/~labbe/Sage/how-to-contribute/|How to contribute to Sage, steps 16 to 23 !!!]]

 * ''11:00-11:30'' tutoriel: contribuer à Sage-combinat (ThierryMonteil)
  * [[http://wiki.sagemath.org/combinat/Mercurial?action=AttachFile&do=get&target=patch-server.png]]
  * [[combinat/MercurialStepByStep]]
 * ''11:30-13:00'' repas au restaurant du personnel d'Orsay (CESFO)

 * ''13:00-14:00'' discussion et démo: intégration de [[http://www.gap-system.org/Packages/simpcomp.html|sympcomp]] (complexes simpliciaux en GAP)  (Felix Effenberger, Jonathan Spreer)
 * ''14:00-16:00'' tutoriel: combinatoire analytique, génération aléatoire/exhaustive
 * ''16:00-17:00'' itération, classes...

== Material for the talks, demos, and tutorials ==

[[http://combinat.sagemath.org/doc/reference/demos/2011-01-17-SageDays28.html|Static version]]

All the demos and tutorials (in format .rst and .txt) are in the following archive. Txt files must be uploaded in the notebook.
[[attachment:demos-and-tutorials-version-17-janvier.zip]]

== Bugs found during Sage Days 28 ==

  * List of unreported bugs found [[days28-bugs_to_report]]. Practice yourself to create a ticket.

  * [[http://trac.sagemath.org/sage_trac/query?status=needs_info&status=needs_review&status=needs_work&status=new&status=positive_review&order=id&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&keywords=~days28|Tickets created during Sage Days 28]]

== Projects and topics of discussions ==

 * Clones and fast iterations

   FlorentHivert, MikeHansen, VincentDelecroix, NicolasThiéry, ...

 * Structuration of tutorials in the reference manual, cross links, ...

   FlorentHivert, MikeHansen, VincentDelecroix, NicolasThiéry, ...

 * rst2notebook, rst2sws, sws2rst

   FlorentHivert, VincentDelecroix, NicolasThiéry, SébastienLabbé, PabloAngulo

   [[http://trac.sagemath.org/sage_trac/ticket/10652| #10652]]: Add support for uploading static html doc page as a worksheet in the notebook

   [[http://combinat.sagemath.org/hgwebdir.cgi/misc/file/e3f98d810a12/notebook2rst|notebook2rst]] script repository]] on sage combinat server

   Script sws -> rst of Pablo Angulo using Beautiful Soup

 * Analytic combinatorics

   Many people, leaded by NicolasThiéry.

   ticket [[http://trac.sagemath.org/sage_trac/ticket/10519|#10519]]: analytic combinatorics: new code for computing asymptotics for multivariate generating functions

   See the [[http://trac.sagemath.org/sage_trac/ticket/10519#comment:4|comment #4]] written by SébastienLabbé about how to translate a bunch of functions into oriented-object structure.

== Registered participants ==

  * Pablo Angulo (Universidad Autónoma de Madrid)
  * Pierre Arnoux (Université d'Aix-Marseille 2)
  * Cyril Banderier (LIPN, Paris 13)
  * [[NicolasBorie|Nicolas Borie]] (Orsay)
  * Charles Bouillaguet (Ecole Normale Supérieure, Paris)
  * Binh-Minh Bui-Xuan (LIP6, Paris)
  * Jean-Paul Bultel (Marne-la-Vallée)
  * Maria Christofi (Gemalto/ Université de Versailles)
  * Nathann Cohen (projet MASCOTTE)
  * Sven De Felice (Marne-la-Vallée)
  * [[VincentDelecroix|Vincent Delecroix]] (IML, Marseille)
  * Matthieu Deneufchâtel (LIPN, Université Paris 13)
  * Sette Diop (CNRS)
  * Felix Effenberger (Stuttgart)
  * Nadia El Mrabet (LIASD - Université Paris 8)
  * Jean-Pierre Flori (ENST/Telecom ParisTech)
  * Antoine Genitrini (UPMC)
  * Alain Giorgetti (Université de Franche-Comté)
  * Samuele Giraudo (Université de Marne-la-Vallée Paris-Est)
  * Olivier Guichard (Paris-Sud)
  * [[FlorentHivert|Florent Hivert]] (Université de Rouen)
  * [[SébastienLabbé|Sébastien Labbé]] (LaCIM (Montréal) et LIAFA)
  * Robin Langer
  * Samuel Lelièvre (Orsay)
  * Julien Leroy (Université de Picardie Jules Verne)
  * David Madore (ENST)
  * Paul Mercat (Orsay)
  * Nevena Milojkovic
  * Yves Misiti (Orsay)
  * [[ThierryMonteil|Thierry Monteil]] (LIRMM, Montpellier)
  * Cyril Nicaud (Université Paris-Est)
  * Johan Oudinet (KIT (Karlsruhe))
  * Ekin Ozman (IHES)
  * Viviane Pons (LIGM)
  * Yann Ponty (Polytechnique/CNRS)
  * Dominique Poulalhon (CNRS / LIX)
  * Alban Quadrat (INRIA Saclay - Ile-de-France)
  * Georg Regensburger (INRIA Saclay)
  * Laurent Siebenmann (Orsay)
  * Michele Soria (LIP6, Paris)
  * Jonathan Spreer (University of Stuttgart)
  * Wolfgang Steiner (LIAFA, CNRS)
  * Jean-Yves Thibon (Université Paris-Est)
  * [[NicolasThiéry|Nicolas Thiéry]] (Orsay)
  * Sophie Toulouse (LIPN - Université Paris 13)
