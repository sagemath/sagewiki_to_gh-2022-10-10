## page was renamed from thursdays_bordeaux
= Les jeudi sages à Bordeaux =
= (autour de Sage, PARI/GP, et plus) =

''Prochaine(s) séance(s): le jeudi 25 janvier de 9h00 à 12h30 en salle 73 (LaBRI).''

Nous nous réunissons les jeudi au [[http://www.labri.fr/index.php?n=Com.Plan|LaBRI]] pour discuter et programmer autour des logiciels de calculs formels. Les journées restent centrées sur [[http://www.sagemath.org/|Sage]] et [[http://pari.math.u-bordeaux.fr/|PARI/GP]] mais elles sont ouvertes à tous/toutes. Le principe est que si vous avez des questions vous venez les poser et si vous savez des choses vous venez les partager. Certains jeudi seront centrés sur des thématiques sous forme de mini-cours ou démonstration.

Pour être tenu informé vous pouvez vous abonner à la [[https://diff.u-bordeaux.fr/sympa/info/sage-bordeaux|liste de diffusion]].

Mot clé pour trac: [[https://trac.sagemath.org/query?status=closed&status=needs_info&status=needs_review&status=needs_work&status=new&status=positive_review&keywords=~thursdaysbdx&col=id&col=summary&col=status&col=time&col=changetime&col=author&col=reviewer&desc=1&order=status|thursdaysbdx]]

== Idées et Projets en cours ==

 * les nombres réels [[https://trac.sagemath.org/ticket/17713|#17713]]
 * relecture de la [[https://members.loria.fr/PZimmermann/sagebook/english.html|version anglaise du Calcul mathématique avec Sage]]
 * [[https://github.com/videlec/pplpy|pplpy]]: interface Pyton à la librairie [[http://bugseng.com/products/ppl/ppl|Parma Polyhedra Library (PPL)]]
 * algèbre linéaire dans Sage ([[http://flintlib.org/|flint]], [[http://www.linalg.org/|LinBox]], [[https://cs.uwaterloo.ca/~astorjoh/iml.html|IML]]) [[https://trac.sagemath.org/ticket/22872|#22872]]
 * Integration de pplpy comme package Sage [[https://trac.sagemath.org/ticket/23024|#23024]].
 * gmpy2 et Sage [[https://trac.sagemath.org/ticket/22927|#22927]] and [[https://trac.sagemath.org/ticket/22928|#22928]]
 * interfacer des librairies d'automates: Wali (ancien Vaucanson) ou [[http://fado.dcc.fc.up.pt/|Fado]]
 * polyomino dirigé convexes
 * arbres non ambigus
 * tableaux boisés
 * polyomino parallelogramme periodique + les bandes 
 * optimisation non-linéaire (voir [[http://scip.zib.de/|scip]] et le ticket [[https://trac.sagemath.org/ticket/10879||#10879]])
 * amélioration du [[https://github.com/sagemath/sage-patchbot|patchbot]]
 * portage de [[http://perso.ens-lyon.fr/bruno.salvy/software/the-gfun-package/|gfun]] (voir le paquet [[http://marc.mezzarobba.net/code/ore_algebra-analytic/|ore_algebra-analytic]] développé par Marc Mezzarobba)
 * amélioration de AA et QQbar [[https://trac.sagemath.org/ticket/18333|meta-ticket #18333]]
 * implanter [[http://math.stackexchange.com/questions/1798383/integer-partition-refinement-in-sage|ce truc sur les partitions]]
 * implanter des algorithmes pour des calculs de dimension de Hausdorff et exposants de Lyapunov
    * https://matheuscmss.wordpress.com/2017/02/04/soft-bounds-on-the-hausdorff-dimension-of-dynamical-cantor-sets/
    * Hensley "A polynomial time algorithm for the Hausdorff dimension of continued fraction Cantor Sets" (1994)
    * Pollicott "Maximal Lyapunov exponents for random matrix products" (2010)
 * corriger et améliorer les dessins hyperboliques (dim 2)
    * [[https://trac.sagemath.org/ticket/23427|#23427]]
    * supports pour les horocycles et les polygones fait de bords géodésiques et horocycliques

== Compte-rendus ==

==== Jeudi 18 janvier ====

Présents : Pascal Weil, Sebastien Labbé et Vincent Klein

Vincent K.
 * Echanges avec Pascal Weil
 * cypari2 : Retours sur la proposition des unittest.
 * Point d'avancement odk avec Seb.

==== Jeudi 21 décembre ====

 ... todo ...

==== Jeudi 14 décembre ====

Sébastien Labbé et Pascal Weil:
 * Génération aléatoire de graphes de Stallings, le code est ici: [[https://github.com/seblabbe/slabbe/blob/develop/slabbe/partial_injection.py|partial_injection.py]]

==== Jeudi 30 Novembre ====

Vincent D
 * discussion sur la parentalité et les catégories [[https://trac.sagemath.org/ticket/21380]]

Sébastien et Vincent D:
 * Génération aléatoire et uniforme d'injections partielles (question de Pascal Weil) [[https://github.com/seblabbe/slabbe/blob/develop/slabbe/partial_injection.py|partial_injection.py]]

Vincent K
 * Syntax higlihting sur le kernel jupyter de singular [[https://github.com/OpenDreamKit/OpenDreamKit/issues/175|OpenDreamKit #175]], [[https://github.com/sebasguts/jupyter_kernel_singular/pull/7| PR #7]].

==== Jeudi 16 Novembre ====
Vincent K :
 * gmpy2 résolution [[https://github.com/aleaxit/gmpy/issues/170|issue #170]].
 * [[https://trac.sagemath.org/ticket/22928|#22928]] conversion entre nombres complexes sage et type gmpy2.

==== Jeudi 19 octobre ====

 * Sebastien nous as présenté son package slabbe
   Auditeurs : Philippe, José, Vincent K.

==== Jeudi 12 octobre ====

 * (Vincent D) présentation du logiciel Sage (auditeurs: Philippe, Lamine). L'objectif était de montrer comment manipuler des équations (algébriques ou symboliques)

==== Jeudi 21 septembre ====

 * Présentation de Vincent Klein
 * Présentation d'Aurel Page

==== Jeudi 14 septembre ====

Sébastien:

 * Review du ticket [[https://trac.sagemath.org/ticket/23779|#23779]] (positive_review): dev_tools is wrongly using globals()
 * Review du ticket [[https://trac.sagemath.org/ticket/23849|#23849]] (positive_review): Remove deprecation from optional_packages documentation and friends
 * Review du ticket [[https://trac.sagemath.org/ticket/23851|#23851]] (positive_review): Fix memoryleak introduced in #11670
 * Review du ticket [[https://trac.sagemath.org/ticket/23860|#23860]] (positive_review): C++ clean up in dancing_links.pyx

Vincent D:

 * s'est battu bat avec GAP [[https://trac.sagemath.org/ticket/23844|#23844]], [[https://trac.sagemath.org/ticket/23853|#23853]], [[https://trac.sagemath.org/ticket/23854|#23854]], les graphes ([[http://pallini.di.uniroma1.it/|nauty]] est génial!) et les polynômes de Laurent [[https://trac.sagemath.org/ticket/23864|#23864]]

Vincent K:

 * Travail sur la generation de tests pour [[https://github.com/defeo/cypari2|cypari2]]
 * Syntax Highlightning de pari-jupyter : Tentative d'installation du kernel de gap [[https://github.com/gap-packages/jupyter-kernel-gap/issues/43|issue #43]] 

==== Jeudi 29 juin ====

Vincent K.

 * Review du ticket [[https://trac.sagemath.org/ticket/22889|#22889]] (positive_review)

==== Jeudi 22 juin ====

Sylvain L. est venu nous présenter Wali (la suite de Vaucanson)! Intégration dans Sage en prévision... à suivre!

Vincent D.

 * demande d'intégration (traduction approximative de "pull request") à gmpy2 [[https://github.com/aleaxit/gmpy/pull/148|DI #148]] et [[https://github.com/aleaxit/gmpy/pull/149|DI #149]]
 * [[https://github.com/aleaxit/gmpy/issues/150|issue #150]] dans gmpy2
 * [[https://github.com/sympy/sympy/pull/12784|DI #12784]] dans sympy pour régler [[https://github.com/sympy/sympy/issues/12753|issue #12753]]. Et portage dans Sage avec le [[https://trac.sagemath.org/ticket/23248|ticket #23248]]
 * travail dans pypolymake autour de [[https://github.com/videlec/pypolymake/issues/12|issue #12]]
 * nouveau [[https://trac.sagemath.org/ticket/23309|ticket #23309]] pour rendre gmpy2 standard

Vincent K.
 * Travail sur [[https://trac.sagemath.org/ticket/22928|#22928]] et [[https://trac.sagemath.org/ticket/22927|#22927]], integration du type gmpy.mpfr avec les nombres sage.
 * Ouverture du ticket [[https://trac.sagemath.org/ticket/23308| #23308]]

==== Jeudi 15 juin ====

Sébastien L is reviewing:

 * [[https://trac.sagemath.org/ticket/23162|#23162]] (positive_review) Give a warning when using citation.get_systems() without Cython profiling 
 * [[https://trac.sagemath.org/ticket/16110|#16110]] (needs work with 21 comments:) Parallelogram Polyomino 

Vincent K

 * Travail sur pplpy
 * Travail sur les tickets [[https://trac.sagemath.org/ticket/23024|#23024]] et [[https://trac.sagemath.org/ticket/22928|#22928]]
 * Ouverture du ticket [[https://trac.sagemath.org/ticket/23246|#23246]]

Vincent D

 * Travil sur pplpy (problème de pickling)
 * Ouverture du ticket [[https://trac.sagemath.org/ticket/23248|#23248]]

==== Mardi 13 juin ====

Vincent K 

 * Travail sur pplpy. Notamment [[https://github.com/videlec/pplpy/issues/22|issue #22]]

==== jeudi 1 juin ====

Adrien is working on ticket [[https://trac.sagemath.org/ticket/16110|#16110]] of Parallelogram polyominoes. 

Vincent K

 * Travail sur l'intégration de pplpy dans sage ([[https://trac.sagemath.org/ticket/23024|#23024]])
==== jeudi 18 mai ====

Sébastien is reviewing the following tickets and making sure they work on OSX:

 * [[https://trac.sagemath.org/ticket/22999|#22999]]: update cmake to version 3.8.1
 * [[https://trac.sagemath.org/ticket/22817|#22817]]: Package cryptominisat 5
 * [[https://trac.sagemath.org/ticket/22818|#22818]]: Interface cryptominisat 5

Vincent D & K

 * [[https://github.com/aleaxit/gmpy/pull/137|PR #137 pour gmpy2]]
 * travail sur [[https://github.com/videlec/pplpy/|pplpy]]
 * Ouverture et travail sur le ticket [[https://trac.sagemath.org/ticket/23024|#23024]]

==== jeudi 11 mai ====

Sébastien a reviewé:

 * (positive review) [[https://trac.sagemath.org/ticket/21993|#21993]]: Polyhedron.integral_points(): Overflow Error: value too large to convert to int
 * (needs work) [[https://trac.sagemath.org/ticket/21295|#21295]]: recognizable series (a base for k-regular sequences)

Vincent D a finalisé (needs review) [[https://trac.sagemath.org/ticket/22970|#22970]]:  use flint fmpq_mat for rational dense matrices

Vincent K a travaillé sur [[https://trac.sagemath.org/ticket/22928|#22928]]: Conversions/coercions between gmpy2 and Sage

==== jeudi 13 avril ====

Finalement, on a plutôt travaillé dans le grand bureau de Vincent K qui offrait du réseau.

Autour de [[https://github.com/aleaxit/gmpy|gmpy2]] et [[https://github.com/videlec/pplpy|pplpy]]

 * petit test d'utilisation de gmpy2 en cython https://github.com/vinklein/testgmpy2 et début d'intégration dans pplpy
 * pull request pour installer les fichier d'en-tête avec gmpy2 https://github.com/aleaxit/gmpy/pull/130
