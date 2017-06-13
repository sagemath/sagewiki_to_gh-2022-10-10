## page was renamed from thursdays_bordeaux
= Les jeudi Sage à Bordeaux =
= (autour de Sage, PARI/GP, et plus) =

''Prochaine séance le jeudi 15 juin. Salle 74 (matin) et salle 381 l'après midi ''

Nous nous réunissons les jeudi au [[http://www.labri.fr/index.php?n=Com.Plan|LaBRI]] pour programmer autour du logiciel de calcul formel [[http://www.sagemath.org/|Sage]]. Ces journées ont commencé le 13 avril 2017. Cette page permet de suivre l'activité des rencontres.

== Projets en cours ==

 * [[https://github.com/videlec/pplpy|pplpy]]: interface Pyton à la librairie [[http://bugseng.com/products/ppl/ppl|Parma Polyhedra Library (PPL)]]
 * algèbre linéaire dans Sage ([[http://flintlib.org/|flint]], [[http://www.linalg.org/|LinBox]], [[https://cs.uwaterloo.ca/~astorjoh/iml.html|IML]]) [[https://trac.sagemath.org/ticket/22872|#22872]]
 * gmpy2 et Sage [[https://trac.sagemath.org/ticket/22927|#22927]] and [[https://trac.sagemath.org/ticket/22928|#22928]]
 * (review) integral point overflow [[https://trac.sagemath.org/ticket/21993|#21993]]
 * (review) [[https://trac.sagemath.org/ticket/21295|#21295]]

(mot clé pour trac: [[https://trac.sagemath.org/query?status=closed&status=needs_info&status=needs_review&status=needs_work&status=new&status=positive_review&keywords=~thursdaysbdx&col=id&col=summary&col=status&col=time&col=changetime&col=author&col=reviewer&order=status|thursdaysbdx]])

== Idées ==

 * polyomino dirigé convexes
 * arbres non ambigus
 * tableaux boisés
 * polyomino parallelogramme periodique + les bandes 
 * optimisation non-linéaire (voir [[http://scip.zib.de/|scip]] et le ticket [[https://trac.sagemath.org/ticket/10879||#10879]])
 * systèmes linéaires creux exactes (voir [[http://www.linalg.org/|linbox]] ainsi que [[https://groups.google.com/forum/#!topic/sage-devel/CfWRDIIEKnQ|ce fil sur sage-devel]])
 * amélioration du [[https://github.com/sagemath/sage-patchbot|patchbot]]
 * portage de [[http://perso.ens-lyon.fr/bruno.salvy/software/the-gfun-package/|gfun]]
 * amélioration de AA et QQbar [[https://trac.sagemath.org/ticket/18333|meta-ticket #18333]]
 * implanter [[http://math.stackexchange.com/questions/1798383/integer-partition-refinement-in-sage|ce truc sur les partitions]]
 * implanter des algorithmes pour des calculs de dimension de Hausdorff et exposants de Lyapunov
    * https://matheuscmss.wordpress.com/2017/02/04/soft-bounds-on-the-hausdorff-dimension-of-dynamical-cantor-sets/
    * Hensley "A polynomial time algorithm for the Hausdorff dimension of continued fraction Cantor Sets" (1994)
    * Pollicott "Maximal Lyapunov exponents for random matrix products" (2010)

== Compte-rendus ==

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
