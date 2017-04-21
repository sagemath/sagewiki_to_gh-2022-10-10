= Les jeudi Sage à Bordeaux =
= (autour de Sage, PARI/GP, et plus) =

''Prochaine séance le jeudi X en salle Y''

Nous nous réunissons les jeudi au [[http://www.labri.fr/index.php?n=Com.Plan|LaBRI]] pour programmer autour du logiciel Sage. Ces journées ont commencé le 13 avril 2017. Cette page permet de suivre l'activité des rencontres.

== Projets en cours ==

 * [[https://github.com/videlec/pplpy|pplpy]]

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

== Compte-rendus ==

==== jeudi 13 avril ====

Finalement, on a plutôt travaillé dans le grand bureau de Vincent K qui offrait du réseau.

Autour de [[https://github.com/aleaxit/gmpy|gmpy2]] et [[https://github.com/videlec/pplpy|pplpy]]

 * petit test d'utilisation de gmpy2 en cython https://github.com/vinklein/testgmpy2 et début d'intégration dans pplpy
 * pull request pour installer les fichier d'en-tête avec gmpy2 https://github.com/aleaxit/gmpy/pull/130