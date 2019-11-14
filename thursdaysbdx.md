## page was renamed from thursdays_bordeaux
= Les jeudi sages à Bordeaux (autour de Sage, PARI/GP, et plus) =

''les jeudis 10h à 12h en salle 74 VISIO du LaBRI.''

Nous nous réunissons les jeudi au [[http://www.labri.fr/index.php?n=Com.Plan|LaBRI]] pour discuter et programmer autour des logiciels de calculs formels. Les journées restent centrées sur [[http://www.sagemath.org/|Sage]] et [[http://pari.math.u-bordeaux.fr/|PARI/GP]] mais elles sont ouvertes à tous/toutes. Le principe est que si vous avez des questions vous venez les poser et si vous savez des choses vous venez les partager. Certains jeudi seront centrés sur des thématiques sous forme de mini-cours ou démonstration.

Pour être tenu informé vous pouvez vous abonner à la [[https://diff.u-bordeaux.fr/sympa/info/sage-bordeaux|liste de diffusion]].

== Débutants ==

 * Pour apprendre Python, on recommande la lecture de [[http://openbookproject.net/thinkcs/python/english3e/|How to Think Like a Computer Scientist]]
 * Pour apprendre !SageMath, on recommande la lecture de [[http://sagebook.gforge.inria.fr/|Calcul mathématique avec Sage]] (aussi traduit en anglais et allemand) et bien sûr de participer aux séances du jeudi matin

== Développeurs ==

Mot clé pour trac: [[https://trac.sagemath.org/query?status=closed&status=needs_info&status=needs_review&status=needs_work&status=new&status=positive_review&keywords=~thursdaysbdx&col=id&col=summary&col=status&col=time&col=changetime&col=author&col=reviewer&desc=1&order=status|thursdaysbdx]]

Idées et Projets en cours:

 * les nombres réels [[https://trac.sagemath.org/ticket/17713|#17713]]
 * relecture de la [[https://members.loria.fr/PZimmermann/sagebook/english.html|version anglaise du Calcul mathématique avec Sage]]
 * [[https://github.com/videlec/pplpy|pplpy]]: interface Pyton à la librairie [[http://bugseng.com/products/ppl/ppl|Parma Polyhedra Library (PPL)]]
 * algèbre linéaire dans Sage ([[http://flintlib.org/|flint]], [[http://www.linalg.org/|LinBox]], [[https://cs.uwaterloo.ca/~astorjoh/iml.html|IML]]) [[https://trac.sagemath.org/ticket/22872|#22872]]
 * Integration de pplpy comme package Sage [[https://trac.sagemath.org/ticket/23024|#23024]].
 * gmpy2 et Sage [[https://trac.sagemath.org/ticket/22927|#22927]] and [[https://trac.sagemath.org/ticket/22928|#22928]]
 * interfacer des librairies d'automates: Wali (ancien Vaucanson) ou [[http://fado.dcc.fc.up.pt/|Fado]]
 * polyomino dirigé convexes
 * arbres non ambigus [[https://trac.sagemath.org/ticket/16192|#16192]]
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

==== jeudi 14 nov 2019 ====

Présents: Sébastien, Jennifer, Pascal
 
Discussion sur le passage à Python 3. Voir ce [[https://www.artima.com/weblogs/viewpost.jsp?thread=98196|message]] de mars 2005 de Guido van Rossum au sujet de map, filter, lambda, reduce.

==== jeudi 7 nov 2019 ====

Présents: Sébastien, Casey, Jennifer, Sebastian, Pascal, Julien Leroy

Pascal nous a présenté son [[https://www.labri.fr/perso/weil/software/|package stallings_graphs]]

==== 31 octobre au 3 novembre 2019 ====

Conférence PyCON à Bordeaux: https://www.pycon.fr/2019/

==== jeudi 23 mai 2019 ====

Présents: Sébastien, Vincent K, Pascal

Sébastien: création d'un fichier de test (en rst) contenant le code contenu dans l'article http://arxiv.org/abs/1802.03265 pour assurer la reproducibilité des résultats à long terme.

Vincent K: 
 * Complétion de [[https://trac.sagemath.org/ticket/27777|#27777]]
 * Échanges avec Sébastien sur les intégrales monte carlo.

==== jeudi 16 mai 2019 ====

Présents: Sébastien, Vincent K, Pascal, Adrien

==== jeudi 9 mai 2019 ====

Présents: Sébastien, Vincent K, Pascal

Sébastien: 
 * posé une question au sujet des tag build et dochtml sur [[https://groups.google.com/d/msg/sage-devel/h9AzZ4jfSRU/Cl9NTaaIAgAJ|sage-devel]]
 * discuté avec Pascal sur l'utilisation du package traintrack
 * [[https://trac.sagemath.org/ticket/27781|#27781]] needs review et création de #27782 et #27783

==== jeudi 2 mai 2019 ====

Présents: Sébastien, Vincent K, Xavier

Sébastien: amélioration de la documentation et du README de slabbe pour corriger le bug d'affichage sur PyPI. Il y a une nouvelle ligne `long_description_content_type` à mettre dans le fichier setup. Voir ici: [[https://packaging.python.org/guides/making-a-pypi-friendly-readme/|making a PyPI friendly README]].

==== jeudi 11 avril 2019 ====

Présents: Pascal, Vincent K

Vincent K:
 * gmpy2 : Permettre aux objets mpq d'être initialisée avec des entiers sage : [[https://github.com/aleaxit/gmpy/issues/237|issue #237]], [[https://github.com/aleaxit/gmpy/pull/240|PR #240]]
 * gmpy2 : Modifications pour ne pas appeler mpc_cmp_abs pour les anciennes version de mpc : [[https://github.com/aleaxit/gmpy/issues/238|issue #238]], [[https://github.com/aleaxit/gmpy/pull/239|PR #239]]
 * Discussion avec Pascal sur le passage à python3 des packages.

==== jeudi 4 avril 2019 ====

Présents: Adrien, Pascal, Vincent K

==== jeudi 21 mars 2019 ====

Présents: Adrien, Sébastien, Vincent K, Xavier

 * Vincent: gmpy2: [[https://github.com/aleaxit/gmpy/pull/231|PR #231]]: Résolution de compilation warnings, et d'erreurs de doctests, ajout d'un flag de doctests pour les cas ou l'on utilise une version de mpc < 1.0.0.
 * Adrien: split tikz code in polyomino module
 * Sébastien: correction de failing doctests dans le package slabbe


==== jeudi 14 mars 2019 ====

Présents: Sébastien, Vincent K, Pascal, Jean-Philippe Labbé

Pascal et Sébastien:

 * Problème de compilation de la documentation du package stallings_graph de Pascal. Solution: il faut importer tout le cmd_line de sage dans le fichier {{{__init__.py}}} du package pour que Sphinx soit content.

JP:

 * [[https://trac.sagemath.org/ticket/24905|#24905]] Upgrade polymake to version 3.2r4

Vincent:
 * sage/polymake: Problèmes de compilation de polymake avec Jean-Philippe Labbé.
 * gmpy2: Ajout de tests de couverture (opérations binaires).

==== jeudi 7 mars 2019 ====

Présents: Sébastien, Vincent K, Pascal, Adrien

Pascal et Sébastien:

 * Création de la documentation d'un package avec Sphinx (sphinx-quickstart, fichiers rst, {{{conf.py}}}, etc.)

==== jeudi 28 février 2019 ====

Présents: Sébastien, Vincent K

Jeudi sage éclair : Discussion d'une demi-heure environ sur les tickets [[https://trac.sagemath.org/ticket/25614|#25614]] et [[https://trac.sagemath.org/ticket/26592|#26592]]

Sébastien: 

 * [[https://trac.sagemath.org/ticket/25614|#25614]] (needs review)

Vincent K:

 * Review [[https://trac.sagemath.org/ticket/25614|#25614]] (positive review)

==== jeudi 21 février 2019 ====

Pause.

==== jeudi 14 février 2019 ====

Présents: Vincent K, Pascal

CONFERENCE, [[https://opendreamkit.org/2019/02/11/FreeComputationalMathematicsConference/|Free Computational Mathematics]], Calcul mathématique libre, CIRM Luminy, 11 - 15 February 2019

==== jeudi 7 février 2019 ====

Présents: Sébastien, Vincent K

==== jeudi 31 janvier 2019 ====

Présents: Sébastien, Vincent K, Adrien, Pascal

Sébastien: 
 * [[https://trac.sagemath.org/ticket/25535|#25535]] (needs review)

Vincent K: 
 * Review [[https://trac.sagemath.org/ticket/25535|#25535]] (positive review)
 * Echanges avec Adrien sur l'avenir de la class Derangement [[https://trac.sagemath.org/ticket/26886|#26886]]
 * pplpy: suivi et tests de solution sur le sujet de la génération de la doc sphinx par sage. [[https://trac.sagemath.org/ticket/23024|#23024]]

==== jeudi 24 janvier 2019 ====

Présents: Sébastien, Vincent K, Adrien

Comment installer et utiliser RISE, une extension du Jupyter Notebook pour faire des présentations éditables. Il ne suffit pas de l'installer il faut aussi recopier les css au bon endroit. Il suffit de faire:

{{{
sage -pip install rise
sage -sh
jupyter-nbextension install rise --py --sys-prefix
}}}

Après on peut consulter ce  [[https://youtu.be/sXyFa_r1nxA|démo]] sur youtube et la [[https://rise.readthedocs.io/en/docs_hot_fixes/index.html|doc est ici]].

==== jeudi 17 janvier 2019 ====

 * Atelier [[https://pari.math.u-bordeaux.fr/Events/PARI2019/|PARI/GP 2019]]

==== jeudi 10 janvier 2019 ====

Présents: Sébastien, Vincent K, Pascal, Xavier

Sébastien

 * [[https://trac.sagemath.org/ticket/25384|#25384]] sage --jupyter command line (needs review)

Vincent
 * review [[https://trac.sagemath.org/ticket/25535|#25535]]
 * cysignals windows.

==== jeudi 20 décembre 2018 ====

Présents: Sébastien, Vincent K, Pascal, Adrien

Sébastien:

 * [[https://trac.sagemath.org/ticket/26361|#26361]] Glucose SAT solver (needs review)
 * [[https://trac.sagemath.org/ticket/25501|#25501]] Few failing internet doctests in mma_free_integrator (needs review)
 * [[https://trac.sagemath.org/ticket/26920|#26920]] 2 failing doctests in sql_db.py (création du ticket)
 * [[https://trac.sagemath.org/ticket/26921|#26921]] 1 internet doctest failing in combinat/tutorial.py  (création du ticket, needs review)

Vincent:

 * cysignals-windows : Nouvelles évolutions et rebases sur la [[https://github.com/sagemath/cysignals/pull/76|PR-76]]
 * Dans le cadre du ticket [[https://trac.sagemath.org/ticket/26884|#26884]. Discussion avec Adrien sur les notions de morphism 
et parent commun.
==== jeudi 13 décembre 2018 ====

Présents: Sébastien, Vincent K, Pascal, Xavier, Adrien, Florent

10h-10h20: un exposé de Florent Hivert, Expérimentations haute performance en combinatoire algébrique et énumérative 

Sébastien: 
 
 * comparaison des MILP solvers, SAT solvers et dancing links via des pavages par tuiles de Wang, les détails sur ce [[http://www.slabbe.org/blogue/2018/12/comparison-of-wang-tiling-solvers/|blogue]]
 * reviewé le code de Adrien sur les polyomino parallélogrammes (positive review!!)
 * (needs review) correction de l'utilisation de Wolfram Alpha [[https://trac.sagemath.org/ticket/25501|#25501]] grâce au code suggéré par Amaury Pouly

==== jeudi 29 novembre 2018 ====

Présents: Sébastien, Vincent K, Pascal

Sébastien: 
 
 * Review des polyominos paralélogrammes [[https://trac.sagemath.org/ticket/16110|#16110]]
 * Discussion avec Pascal sur la création de son package, des dépendances, et de l'utilisation de git.

==== jeudi 22 novembre 2018 ====

Présents: Adrien, Vincent K.

Vincent K:

 * Complétion du ticket [[https://trac.sagemath.org/ticket/26704|#26704]].
 * Review [[https://trac.sagemath.org/ticket/26737|#26737]]. positive review.

==== jeudi 15 novembre 2018 ====

Présents: Adrien, Vincent K., Sébastien, Pascal, Xavier, Ilya

Avec Ilya, nous avons trouvé trois lignes de code pour que les `.plot()` ouvre des pdf plutôt que des png:

{{{
sage: from sage.repl.rich_output import get_display_manager
sage: dm = get_display_manager()
sage: dm.preferences.graphics = 'vector'  # value must be unset (None) or one of ('disable', 'vector', 'raster')
}}}

All tests passed in the package of Pascal!

Vincent K:

Sortie de la dernière version de gmpy2:

 * Tests de gmpy2
 * Mise à jour pplpy [[https://gitlab.com/videlec/pplpy/merge_requests/3|MR3]], [[https://gitlab.com/videlec/pplpy/merge_requests/2|MR2]].
 * Mise à jour et tests du package sage gmpy2 [[https://trac.sagemath.org/ticket/25519|#25519]]
 * Examen avec Adrien des erreurs sage python3 du module modular/hecke
==== jeudi 8 novembre 2018 ====

Présents: Adrien, Vincent K., Sébastien, Pascal, Xavier

Sébastien, Pascal: création d'un package Python sur les Finitely generated subgroups

Adrien: finalisation des corrections sur les polyominos paralélogrammes [[https://trac.sagemath.org/ticket/16110|#16110]]

Vincent K.: 
 * Review [[https://trac.sagemath.org/ticket/26651|#26651]] (positive review)
 * Examen avec Adrien d'une différence py2 - py3 apparue sous root_lattice_realizations.py.
 * Ouverture [[https://trac.sagemath.org/ticket/26659|#26659]]

Xavier: Coder les piecewise affine function dans Sage

==== jeudi 1 novembre 2018 ====

vacances de la Toussaint

==== jeudi 25 octobre 2018 ====

Présents: Adrien, Vincent K., Sébastien, Andrew.

Sébastien: Création d'un package pour glucose dans Sage: [[https://trac.sagemath.org/ticket/26552|#26552]]

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
