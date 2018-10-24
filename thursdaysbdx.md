## page was renamed from thursdays_bordeaux
= Les jeudi sages à Bordeaux =
= (autour de Sage, PARI/GP, et plus) =

''Prochaine(s) séance(s): le jeudi 26 octobre de 9h00 à 13h00 en salle visio (num 74) au LaBRI.''

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
 * nettoyer le code de Milton sur les substitutions géométriques (Ek star)

== Compte-rendus ==

==== jeudi 18 octobre 2018 ====

Présents: Pascal, Adrien, Vincent K., Sébastien.

Sébastien: Discussion avec Pascal sur son projet de Stallings graphs. Création de [[https://trac.sagemath.org/ticket/26502|#26502]]

==== jeudi 11 octobre 2018 ====

Présents: Pascal, Adrien, Vincent K.

Sébastien (au Québec) a fait la revue de [[https://trac.sagemath.org/ticket/26486|#26486]] (clean distances_all_pairs.pyx) et [[https://trac.sagemath.org/ticket/26348|#26348]] (3 other internet doctests failing in findstat.py) et a bossé sur: [[https://trac.sagemath.org/ticket/26473|#26473]] (py3: fix doctests failures of sage/combinat/words/word_*datatype*)


==== jeudi 4 octobre 2018 ====

Présents: Pascal, Adrien, Vincent K.

Sébastien (au Québec): [[https://trac.sagemath.org/ticket/25378|#25378]] (I/O operation on closed file when sage -t --optional=sage,external --logfile is_provided.log)

==== Jeudi 5 juillet 2018 ====

Présents: Sébastien, Vincent K.

Sébastien:
 * [[https://trac.sagemath.org/ticket/25537|#25537]]: needs review
 * reviewed: [[https://trac.sagemath.org/ticket/23416|#23416]]

==== Jeudi 28 juin 2018 ====

Présents: Pascal, Milton, Vincent K.

Milton nous as présenté ses travaux sur les fractions continues multidimensionnelles.

Vincent K. :
 * [[https://trac.sagemath.org/ticket/25661|#25661]]: Implémentation et tests.
 * cysignals-windows: Rebase sur la prochaine version cysignals.

==== Jeudi 21 juin 2018 ====

Présents: Vincent K, Sébastien, Nicolas, Mélodie, Milton

Sébastien:

 * reviewed [[https://trac.sagemath.org/ticket/25525|#25525]], [[https://trac.sagemath.org/ticket/25526|#25526]]

==== Jeudi 14 juin 2018 ====

Présents: Pascal, Vincent K.

==== Jeudi 7 juin 2018 ====

Présents: Pascal, Sebastien, Vincent D., Vincent K., Elise Vandomme ... (à compléter)

==== Jeudi 31 mai 2018 ====

Présents : Pascal, Milton, Vincent K

==== Jeudi 24 mai 2018 ====

Présents : Sébastien, Pascal, Milton, Vincent K, Andrew

 * 10h à 10h10: Andrew, C code to solve system of functional equations for series

Sébastien:

 * fixed issues in [[https://trac.sagemath.org/ticket/25125|#25125]] which needs review
 * reviewed [[https://trac.sagemath.org/ticket/10091|#10091]]

==== Jeudi 17 mai 2018 ====

Présents : Sébastien, Pascal, Milton, Vincent K, Vincent D, Mélodie, Nadia, David, Yvan, Michael

 * 10h à 10h10: Yvan Le Borgne, utilisation de Jupyter pour faire des présentations https://www.labri.fr/perso/borgne/Jupyter/
 * 10h15 à 10h25: Michael Wallner, utilisation de gfun dans maple, http://perso.ens-lyon.fr/bruno.salvy/software/the-gfun-package/
 * 10h30 à 10h40: S. Labbé, démo de code C, Cython et Python dans SageMath. Voir les fichiers dancing_links.pyx et dancing_links.h dans le [[https://github.com/sagemath/sage/tree/master/src/sage/combinat/matrices|github de SageMath]] qui interfacent en Cython une implémentation C++ de l'algorithme [[https://en.wikipedia.org/wiki/Dancing_Links|Dancing Links]] de [[https://arxiv.org/abs/cs/0011047|Donald Knuth]].

'''Utilisation de code C dans un fichier externe dans une cellule Jupyter grâce à Cython'''

Contenu du fichier test.c:
{{{
int my_function(int x)
{
    return x*x;
}
}}}
Contenu du fichier test.h:
{{{
int my_function(int x);
}}}
Contenu d'une cellule Jupyter dans le même répertoire que les fichiers test.h et test.c:
{{{
%%cython
# distutils: sources = test.c
cdef extern from "test.h":
    int my_function(int)
def my_function_wrapper(int a):
    return my_function(a)
}}}
Contenu d'une autre cellule normale:
{{{
my_function_wrapper(10)
}}}

Vincent D:

 * new ticket [[https://trac.sagemath.org/ticket/25379|#25379]], [[https://trac.sagemath.org/ticket/25385|#25385]]
 * review [[https://trac.sagemath.org/ticket/25209|#25209]], [[https://trac.sagemath.org/ticket/24783|#24783]], [[https://trac.sagemath.org/ticket/25379|#25379]], [[https://trac.sagemath.org/ticket/25305|#25305]], [[https://trac.sagemath.org/ticket/20181|#20181]], [[https://trac.sagemath.org/ticket/25377|#25362]], [[https://trac.sagemath.org/ticket/25377|#25362]], [[https://trac.sagemath.org/ticket/25370|#25370]].

Sébastien:

 * new ticket [[https://trac.sagemath.org/ticket/25378|#25378]]

Mélodie:

 * new ticket [[https://trac.sagemath.org/ticket/25384|#25384]]
==== Jeudi 10 mai 2018 ====

Congé.

==== Jeudi 3 mai 2018 ====

Présents : Sébastien, Pascal, Milton

 * Discussion sur l'égalité et la décomposition en cycles pour les sous-groupes finiment engendrés du groupe libre
 * Discussion sur les Tree Patch et substitutions d'arbres

==== Jeudi 26 avril 2018 ====

Présents : Vincent K, Sébastien, Pascal

 * Sébastien a fait la relecture de [[https://trac.sagemath.org/ticket/25218|#25218]]
 * Discussion sur la création de classes pour les sous-groupes finiment engendrés du groupe libre

==== Jeudi 19 avril 2018 ====

Présents : Vincent K, Vincent D, Milton, Pascal

 * Pascal a présenté son projet sur les Stallings graphs

==== Jeudi 12 avril 2018 ====

Présents : Sebastien Labbé et Vincent Klein

 * Sébastien a fait la relecture de [[https://trac.sagemath.org/ticket/25120|#25120]] et [[https://trac.sagemath.org/ticket/25121|#25121]]
 * Vincent : (cysignals-windows). Dev et test sur le monkey patch des distutils pour cysignals. 


==== Jeudi 5 avril 2018 ====

Présents : Sebastien Labbé, Milton et Vincent Klein

 * Sébastien a fait la relecture de [[https://trac.sagemath.org/ticket/24880|#24880]]
 * Milton et Sébastien ont finalisé l'utilisation du Minkowski embedding coder la projection des k-faces dans les substitutions géométriques : https://github.com/miltminz/EkEkstar
 * Vincent K. :
    * #24880: Gestion retours et passage en need_review.
    * #24966: Test sous High Sierra.

==== Jeudi 29 Mars 2018 ====

Pause, trop d'absent.

==== Jeudi 22 Mars 2018 ====

Présents : Sebastien Labbé, Pascal Weil, Milton et Vincent Klein

 * Milton nous a fait une démo de son code sur les substitutions géométriques : https://github.com/miltminz/EkEkstar
 * Pascal : Random Stallings graphs
 * Vincent K : cysignals-windows : Rebase et tests.
 * Sébastien : Aide et écriture de la démo de Milton en [[https://github.com/seblabbe/EkEkstar/blob/master/demos/2018-03-22-demo.rst|demo.rst]] et [[https://github.com/seblabbe/EkEkstar/blob/master/demos/2018-03-22-demo.ipynb|demo.ipynb]]

==== Jeudi 15 Mars 2018 ====

 * Pascal : Random Stallings graphs
 * Vincent K : Ouverture https://github.com/sagemath/cysignals/issues/75 et merge de branches.
 * Sébastien : Aide et travail sur Wang tilings

==== Jeudi 8 Mars 2018 ====

 * Vincent D

    * review [[https://trac.sagemath.org/ticket/24828|#24828 (length-checking iterator)]]
    * creating [[https://trac.sagemath.org/ticket/24927|#24927 (arb upgrade)]]
    * improving [[https://trac.sagemath.org/ticket/24575|#24575 (make and LD_LIBRARY_PATH mess)]] (voir aussi [[https://trac.sagemath.org/ticket/24902|#24902]])

 * Vincent K

   * Passage en need review [[https://trac.sagemath.org/ticket/23852|#23852 (length-checking iterator)]]. 
   * cysignals-windows: Fix patch distutils pour python3.4 64 bits. 

==== Jeudi 8 Février 2018 ====

9 participants!

==== Jeudi 1er Février 2018 ====

 * démo par Vincent Delecroix et Bill Allombert du calcul de groupes de Galois
 * tentative de reproduire les calculs de Shigeki Akiyama sur les polytopes qui minimise l'aire de surface

==== Jeudi 25 janvier 2018 ====
Présents : Sebastien Labbé, Milton et Vincent Klein

Vincent K.
 * cysignals : Etude d'une implémentation sous windows.
 * Suivi sur [[https://trac.sagemath.org/ticket/22928|#22928]]

==== Jeudi 18 janvier 2018 ====

Présents : Pascal Weil, Sebastien Labbé et Vincent Klein

Vincent K.
 * Echanges avec Pascal Weil
 * cypari2 : Retours sur la proposition des unittest.
 * Point d'avancement odk avec Seb.

==== Jeudi 21 décembre 2017 ====

 ... todo ...

==== Jeudi 14 décembre 2017 ====

Sébastien Labbé et Pascal Weil:
 * Génération aléatoire de graphes de Stallings, le code est ici: [[https://github.com/seblabbe/slabbe/blob/develop/slabbe/partial_injection.py|partial_injection.py]]

==== Jeudi 30 Novembre 2017 ====

Vincent D
 * discussion sur la parentalité et les catégories [[https://trac.sagemath.org/ticket/21380]]

Sébastien et Vincent D:
 * Génération aléatoire et uniforme d'injections partielles (question de Pascal Weil) [[https://github.com/seblabbe/slabbe/blob/develop/slabbe/partial_injection.py|partial_injection.py]]

Vincent K
 * Syntax higlihting sur le kernel jupyter de singular [[https://github.com/OpenDreamKit/OpenDreamKit/issues/175|OpenDreamKit #175]], [[https://github.com/sebasguts/jupyter_kernel_singular/pull/7| PR #7]].

==== Jeudi 16 Novembre 2017 ====
Vincent K :
 * gmpy2 résolution [[https://github.com/aleaxit/gmpy/issues/170|issue #170]].
 * [[https://trac.sagemath.org/ticket/22928|#22928]] conversion entre nombres complexes sage et type gmpy2.

==== Jeudi 19 octobre 2017 ====

 * Sebastien nous as présenté son package slabbe
   Auditeurs : Philippe, José, Vincent K.

==== Jeudi 12 octobre 2017 ====

 * (Vincent D) présentation du logiciel Sage (auditeurs: Philippe, Lamine). L'objectif était de montrer comment manipuler des équations (algébriques ou symboliques)

==== Jeudi 21 septembre 2017 ====

 * Présentation de Vincent Klein
 * Présentation d'Aurel Page

==== Jeudi 14 septembre 2017 ====

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

==== Jeudi 29 juin 2017 ====

Vincent K.

 * Review du ticket [[https://trac.sagemath.org/ticket/22889|#22889]] (positive_review)

==== Jeudi 22 juin 2017 ====

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

==== Jeudi 15 juin 2017 ====

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

==== Mardi 13 juin 2017 ====

Vincent K 

 * Travail sur pplpy. Notamment [[https://github.com/videlec/pplpy/issues/22|issue #22]]

==== jeudi 1 juin 2017 ====

Adrien is working on ticket [[https://trac.sagemath.org/ticket/16110|#16110]] of Parallelogram polyominoes. 

Vincent K

 * Travail sur l'intégration de pplpy dans sage ([[https://trac.sagemath.org/ticket/23024|#23024]])
==== jeudi 18 mai 2017 ====

Sébastien is reviewing the following tickets and making sure they work on OSX:

 * [[https://trac.sagemath.org/ticket/22999|#22999]]: update cmake to version 3.8.1
 * [[https://trac.sagemath.org/ticket/22817|#22817]]: Package cryptominisat 5
 * [[https://trac.sagemath.org/ticket/22818|#22818]]: Interface cryptominisat 5

Vincent D & K

 * [[https://github.com/aleaxit/gmpy/pull/137|PR #137 pour gmpy2]]
 * travail sur [[https://github.com/videlec/pplpy/|pplpy]]
 * Ouverture et travail sur le ticket [[https://trac.sagemath.org/ticket/23024|#23024]]

==== jeudi 11 mai 2017 ====

Sébastien a reviewé:

 * (positive review) [[https://trac.sagemath.org/ticket/21993|#21993]]: Polyhedron.integral_points(): Overflow Error: value too large to convert to int
 * (needs work) [[https://trac.sagemath.org/ticket/21295|#21295]]: recognizable series (a base for k-regular sequences)

Vincent D a finalisé (needs review) [[https://trac.sagemath.org/ticket/22970|#22970]]:  use flint fmpq_mat for rational dense matrices

Vincent K a travaillé sur [[https://trac.sagemath.org/ticket/22928|#22928]]: Conversions/coercions between gmpy2 and Sage

==== jeudi 13 avril 2017 ====

Finalement, on a plutôt travaillé dans le grand bureau de Vincent K qui offrait du réseau.

Autour de [[https://github.com/aleaxit/gmpy|gmpy2]] et [[https://github.com/videlec/pplpy|pplpy]]

 * petit test d'utilisation de gmpy2 en cython https://github.com/vinklein/testgmpy2 et début d'intégration dans pplpy
 * pull request pour installer les fichier d'en-tête avec gmpy2 https://github.com/aleaxit/gmpy/pull/130
