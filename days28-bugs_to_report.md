#language fr
<<TableOfContents()>>

== Baratin ==
  * [[support/ReportingBugs]]
  * shoutbox ou e-mail = bouton feu rouge pietons ?


== Creer un compte sur le serveur trac ==
[[http://trac.sagemath.org/sage_trac/]] (lien Register en haut a droite).

Remarque:
  * l'username que vous voulez, habituellement, username = premiere lettre du prenom + nom (exemple nborie, slabbe, nthiery, vdelecroix, hivert, ncohen, tmonteil (cherchez l'erreur))


== Reporter un bug ==
  * Cliquer sur le lien "New ticket"
  * Remplir les champs (voir plus bas)
  * Sauvegarder


Remarques:
  * Chaqun-e est libre de fixer les bugs qu'il/elle veut, donc si vous voulez qu'une personne prenne en charge votre ticket, pensez a elle.
  * Soyez precis et lisible.
  * Essayez d'eviter les doublons.
  * Un ticket ne doit pas representer une tache insurmontable (ex: "Please could you implement species").
  * Il n'y a pas d'editeur pour attribuer les relectures, la relecture des patches est libre.
  * Relisez de les patchs des autres.



== Exemple de workflow ==
[[http://trac.sagemath.org/sage_trac/ticket/10063]]


== Exercice sans filet ==
Indication: pour pouvoir lire les liens suivants, **lancez votre notebook**

Voici une liste numerotee de bugs que vous allez devoir reporter. Notez que ce bug sera fixe par votre voisin-e dans l'expose suivant, donc essayez de lui faire comprendre le probleme !


=== Aide: quels champs remplir pour ce type de bugs ===
  * Type: defect
  * Keywords: beginner, days28, ... (le mot clef beginner est la pour permettre aux nouveaux codeurs de s'entrainer, ces tickets sont listes separement dans le "View tickets")
  * Priority: minor
  * Summary: fix documentation in ... <- boulot
  * Component: documentation 
  * Description: ..... <- boulot
  * cc: sage-combinat, tmonteil, toi-meme (et en general les personnes dont on espere qu'elles feront quelque chose (fix ou rewiew)).

Remarques:
  * tous ces champs peuvent etre modifies a tout moment, et a chaque changement, les personnes mises en cc recevront un mail.
  * les champs restants (author, reviewer,...) se rempliront au fil du temps.


=== Liste des bugs a reporter ===
  1. un point dans le titre en trop en haut : [[http://localhost:8000/doc/live/reference/sage/calculus/calculus.html]]
  1. un bloc d'exemple n'est pas interactif : [[http://localhost:8000/doc/live/reference/sage/combinat/cartesian_product.html]] 
  1. #10643: dans la methode fatter, mettre les O(size(n)) en expression math : [[http://localhost:8000/doc/live/reference/sage/combinat/composition.html]]
  1. dans la methode keys(), l'exemple n'est pas compris comme tel : [[http://localhost:8000/doc/live/reference/sage/combinat/finite_class.html]]
  1. dans la description de la classe sage.combinat.integer_vector.IntegerVectors_nnondescents les formules c[1]+...+c[k] ne sont pas en mode math: [[http://localhost:8000/doc/live/reference/sage/combinat/integer_vector.html]]
  1. #10646: dans la classe sage.misc.abstract_method.AbstractMethod, ..topic: Discussion et ..topic: Implementation details (il faudra changer topic par rubric) : [[http://localhost:8000/doc/live/reference/sage/misc/abstract_method.html]]
  1. dans Dynamic classes, ..topic: non-interprete : [[http://localhost:8000/doc/live/reference/sage/structure/dynamic_class.html]] 
  1. #10641: dans sage.misc.package.install_all_optional_packages, les arguments et True et False doivent etre mis en mode verbatim, et les examples doivent etre interpretes comme tels : [[http://localhost:8000/doc/live/reference/sage/misc/package.html]]
  1. apres "This behavior can induce major performance penalties when testing. Note that this issue does not impact the usual assert:", l'exemple n'est pas interprete (il manque probablement un :: ) : [[http://localhost:8000/doc/live/reference/sage/misc/lazy_format.html]]
  1. apres "Here are two corner cases:", l'exemple n'est pas interprete : [[http://localhost:8000/doc/live/reference/sage/misc/functional.html]] 
  1. dans sage.misc.preparser.reset_load_attach_path, un "SAGE_LOAD_ATTACH_PATH" is compris comme du latex : [[http://localhost:8000/doc/live/reference/sage/misc/preparser.html]]
  1. cherchez l'enorme erreur ! : [[http://localhost:8000/doc/live/reference/sage/combinat/combinat.html]] 
  1. dans les methodes FibonacciTree et HoffmanSingletonGraph, les exemples ne sont pas interpretes : [[http://localhost:8000/doc/live/reference/sage/graphs/graph_generators.html]]
  1. il manque : apres le mot EXAMPLE : [[http://localhost:8000/doc/live/reference/sage/combinat/kazhdan_lusztig.html]] 
  1. dans certaines methodes (a lister), il manque : apres le mot EXAMPLE et aussi certains exemples ne sont pas interpretes : [[http://localhost:8000/doc/live/reference/sage/algebras/iwahori_hecke_algebra.html]] 
  1. dans la methode is_interval, les : apres AUTHOR devraient etre colles : [[http://localhost:8000/doc/live/reference/sage/graphs/generic_graph.html]] 
  1. pas de point dans le titre : [[http://localhost:8000/doc/live/reference/sage/plot/plot3d/base.html]]
  1. example mal formatte : [[http://localhost:8000/doc/live/reference/sage/calculus/riemann.html]] 
  1. pas de point dans le titre : [[http://localhost:8000/doc/live/reference/sage/structure/category_object.html]] 
  1. pas de point dans le titre : [[http://localhost:8000/doc/live/reference/sage/calculus/functional.html]]


=== Du rab s'il vous reste du temps ===
  * Si ca vous suffit pas, faites-vous les dents sur [[days28-unreferenced_bugs]] et sur ce qui est inscrit au tableau. Vous pouvez aussi rajouter des demandes de nouvelles fonctionalites, dans ce cas, remplacez "defect" par "enhancement".
  * Vous pouvez editer [[http://trac.sagemath.org/sage_trac/|la page d'accueil du trac]] et vous rajouter dans la liste des contibuteurs.



== Avant le café, gagnez du temps pour le prochain expose ==
{{{
# sage -clone brouillon
}}}
