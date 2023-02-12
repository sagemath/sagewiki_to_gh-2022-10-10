
[[_TOC_]] 


## Baratin

   * <a href="/support/reportingbugs">support/ReportingBugs</a> 
   * shoutbox ou e-mail = bouton feu rouge pietons ? 

## Creer un compte sur le serveur trac

<a class="https" href="https://trac.sagemath.org/">https://trac.sagemath.org/</a> (lien Register en haut à droite). 

Remarque: 

   * l'username que vous voulez, habituellement, username = première lettre du prénom + nom (exemple nborie, slabbe, nthiery, vdelecroix, hivert, ncohen, tmonteil (cherchez l'erreur)) 

## Reporter un bug

   * Cliquer sur le lien "New ticket" 
   * Remplir les champs (voir plus bas) 
   * Sauvegarder 
Remarques: 

   * Chacun-e est libre de fixer les bugs qu'il/elle veut, donc si vous voulez qu'une personne prenne en charge votre ticket, pensez à elle. 
   * Soyez précis et lisible. 
   * Essayez d’éviter les doublons. 
   * Un ticket ne doit pas représenter une tache insurmontable (ex: "Please could you implement species"). 
   * Il n'y a pas d’éditeur pour attribuer les relectures, la relecture des patches est libre. 
   * Relisez les patchs des autres. 

## Exemple de workflow

<a class="https" href="https://trac.sagemath.org/ticket/10063">https://trac.sagemath.org/ticket/10063</a> 


## Exercice sans filet

Indication: pour pouvoir lire les liens suivants, **lancez votre notebook** 

Voici une liste numérotée de bugs que vous allez devoir reporter. Notez que ce bug sera fixe par votre voisin-e dans l'expose suivant, donc essayez de lui faire comprendre le problème ! 


### Aide: quels champs remplir pour ce type de bugs

   * Type: defect 
   * Keywords: beginner, days28, ... (le mot clef beginner est la pour permettre aux nouveaux codeurs de s’entraîner, ces tickets sont listés séparément dans le "View tickets") 
   * Priority: minor 
   * Summary: fix documentation in ... <- boulot 
   * Component: documentation  
   * Description: ..... <- boulot 
   * cc: sage-combinat, tmonteil, toi-meme (et en general les personnes dont on espere qu'elles feront quelque chose (fix ou rewiew)). 
Remarques: 

   * tous ces champs peuvent être modifiés a tout moment, et a chaque changement, les personnes mises en cc recevront un mail. 
   * les champs restants (author, reviewer,...) se rempliront au fil du temps. 

### Liste des bugs a reporter

   1. un point dans le titre en trop en haut : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/calculus/calculus.html">http://doc.sagemath.org/html/en/reference/sage/calculus/calculus.html</a> 
   1. un bloc d'exemple n'est pas interactif : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/combinat/cartesian_product.html">http://doc.sagemath.org/html/en/reference/sage/combinat/cartesian_product.html</a>  
   1. #10643: dans la méthode fatter, mettre les O(size(n)) en expression math : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/combinat/composition.html">http://doc.sagemath.org/html/en/reference/sage/combinat/composition.html</a> 
   1. dans la méthode keys(), l'exemple n'est pas compris comme tel : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/combinat/finite_class.html">http://doc.sagemath.org/html/en/reference/sage/combinat/finite_class.html</a> 
   1. dans la description de la classe sage.combinat.integer_vector.<a href="/IntegerVectors">IntegerVectors</a>_nnondescents les formules c[1]+...+c[k] ne sont pas en mode math: <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/combinat/integer_vector.html">http://doc.sagemath.org/html/en/reference/sage/combinat/integer_vector.html</a> 
   1. #10646: dans la classe sage.misc.abstract_method.<a href="/AbstractMethod">AbstractMethod</a>, ..topic: Discussion et ..topic: Implementation details (il faudra changer topic par rubric) : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/misc/abstract_method.html">http://doc.sagemath.org/html/en/reference/sage/misc/abstract_method.html</a> 
   1. dans Dynamic classes, ..topic: non-interprete : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/structure/dynamic_class.html">http://doc.sagemath.org/html/en/reference/sage/structure/dynamic_class.html</a>  
   1. #10641: dans sage.misc.package.install_all_optional_packages, les arguments et True et False doivent etre mis en mode verbatim, et les examples doivent etre interpretes comme tels : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/misc/package.html">http://doc.sagemath.org/html/en/reference/sage/misc/package.html</a> 
   1. après "This behavior can induce major performance penalties when testing. Note that this issue does not impact the usual assert:", l'exemple n'est pas interprété (il manque probablement un :: ) : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/misc/lazy_format.html">http://doc.sagemath.org/html/en/reference/sage/misc/lazy_format.html</a> 
   1. après "Here are two corner cases:", l'exemple n'est pas interprété : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/misc/functional.html">http://doc.sagemath.org/html/en/reference/sage/misc/functional.html</a>  
   1. dans sage.misc.preparser.reset_load_attach_path, un "SAGE_LOAD_ATTACH_PATH" is compris comme du latex : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/misc/preparser.html">http://doc.sagemath.org/html/en/reference/sage/misc/preparser.html</a> 
   1. cherchez l’énorme erreur ! : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/combinat/combinat.html">http://doc.sagemath.org/html/en/reference/sage/combinat/combinat.html</a>  
   1. dans les méthodes <a href="/FibonacciTree">FibonacciTree</a> et <a href="/HoffmanSingletonGraph">HoffmanSingletonGraph</a>, les exemples ne sont pas interprétés : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/graphs/graph_generators.html">http://doc.sagemath.org/html/en/reference/sage/graphs/graph_generators.html</a> 
   1. il manque : après le mot EXAMPLE : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/combinat/kazhdan_lusztig.html">http://doc.sagemath.org/html/en/reference/sage/combinat/kazhdan_lusztig.html</a>  
   1. dans certaines méthodes (a lister), il manque : après le mot EXAMPLE et aussi certains exemples ne sont pas interprétés : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/algebras/iwahori_hecke_algebra.html">http://doc.sagemath.org/html/en/reference/sage/algebras/iwahori_hecke_algebra.html</a>  
   1. dans la méthode is_interval, les : après AUTHOR devraient être colles : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/graphs/generic_graph.html">http://doc.sagemath.org/html/en/reference/sage/graphs/generic_graph.html</a>  
   1. pas de point dans le titre : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/plot/plot3d/base.html">http://doc.sagemath.org/html/en/reference/sage/plot/plot3d/base.html</a> 
   1. exemple mal formaté : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/calculus/riemann.html">http://doc.sagemath.org/html/en/reference/sage/calculus/riemann.html</a>  
   1. pas de point dans le titre : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/structure/category_object.html">http://doc.sagemath.org/html/en/reference/sage/structure/category_object.html</a>  
   1. pas de point dans le titre : <a class="http" href="http://doc.sagemath.org/html/en/reference/sage/calculus/functional.html">http://doc.sagemath.org/html/en/reference/sage/calculus/functional.html</a> 

### Du rab s'il vous reste du temps

   * Si ça ne vous suffit pas, faites-vous les dents sur <a href="/days28-unreferenced_bugs">days28-unreferenced_bugs</a> et sur ce qui est inscrit au tableau. Vous pouvez aussi rajouter des demandes de nouvelles fonctionnalités, dans ce cas, remplacez "defect" par "enhancement". 
   * Vous pouvez éditer <a class="http" href="http://trac.sagemath.org/sage_trac/">la page d'accueil du trac</a> et vous rajouter dans la liste des contributeurs. 

## Avant le café, gagnez du temps pour le prochain expose


```txt
# sage -clone brouillon
```