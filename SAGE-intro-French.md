== Courte introduction à Sage ==

Sage est un cadre pour la théorie des nombres, l'algèbre, et le calcul en géométrie. La version actuelle est principalement l'oeuvre de William Stein. C'est un logiciel libre, disponible selon les termes de la licence générale GNU (GPL).

Sage est une bibliothèque python avec un interpréteur adapté aux besoins de l'utilisateur. Du code python, C++, et C (par l'intermédiaire de Pyrex) peut être directement ajouté. Le langage python est un langage de programmation libre, interprété, orienté objet, avec un grand nombre de bibliothèques, par exemple pour l'analyse numérique, qui sont à la disposition des utilisateurs de Sage. Le langage python peut également être accédé en mode de bibliothèque par des programmes en C/C++.  -trans NPE ends here-

Sage fournit une interface unifiée à plusieurs bibliothèques "open-source" importantes, y compris SINGULAR (pour l'algèbre commutative) et GAP (pour la théorie des groupes), à la bibliothèque MWRANK de John Cremona (pour les courbes elliptiques), à la bibliothèque de PARI pour la bibliothèque NTL, maximum de théorie de théorie de nombre, et de nombre de Shoup (pour la manipulation symbolique). Il y a également des interfaces à beaucoup de logiciels de calcul formel commerciaux ou fermés tels que Maple, KASH/KANT, MAGMA, Mathematica, Axiom, et beaucoup d'autres. Pour les graphiques, Sage inclut Matplotlib (pour 2d et quelques graphiques à trois dimensions) et tachyon (un lanceur de rayons à trois dimensions). 

Les buts à long terme principaux et les principes de base de Sage :

 * Libérer et ouvrir les sources : Le code source doit être librement disponible et lisible. Ainsi les utilisateurs peuvent comprendre ce que le système fait vraiment et plus facilement le prolonger. Juste comme les mathématiciens gagnent une compréhension plus profonde d'un théorème en lisant soigneusement ou en survolant au moins la preuve, les gens qui font des calculs devraient pouvoir comprendre comment les calculs fonctionnent en lisant le code source documenté. Tout logiciel inclus dans la distribution Sage doit être de source libre et ouverte, et on doit permettre des modifications et la redistribution arbitraires de chaque ligne de code.

 * Bon environnement de programmation : Sage forme un environnement stable pour commencer à programmer de nouveaux projets mathématiques de logiciel. Nous devrions fournir un modèle pour la communauté mathématique du développement de logiciel en emphase forte sur la franchise, la communauté, la coopération, et la collaboration.

 * Extensible : Pouvoir définir de nouveaux types de données ou dériver des types intégrés, et faire le code écrit dans une pièce préférée de langue (C/C++ y compris) du système.

 * Facile à utiliser : L'espoir est d'atteindre par la suite un à niveau élevé de l'assistance aux utilisateurs. (La liste d'email « de forum de GAP » est un exemple idéal de l'appui on l'espère que que Sage peut atteindre.)
 
 * Facile à compiler : Il devrait être relativement facile compiler Sage depuis les sources pour Linux et OS X. Ceci fournit plus de flexibilité en modifiant le système.

 * Multi-plateformes : Sage fonctionne sous Linux, OS X, Windows (cygwin et colinux binaires).

 * Complet : Mettre en application assez d'algorithmes pour être vraiment utile. Unifier librement les logiciels libres de mathématiques. Être un système logiciel de qualité de mathématiques libres.

 * Efficace : Être très rapidement---comparable à ou plus rapidement que toute autre chose disponibles. C'est très difficile, puisque beaucoup de systèmes sont source fermée, des algorithmes ne sont pas parfois édités, et la conclusion des algorithmes rapides est souvent extrêmement difficile (des années de travail, de thèses de Ph.D., de chance, etc.).

 * Outils : Fournir les interfaces robustes à une partie de la fonctionnalité de PARI, de GAP, de GMP, de maximum, de SINGULIER, de MWRANK, et de NTL. Ce sont tous sont GPL'd et Sage fournit (ou fournira) une interface unifiée pour l'usage de elles.

 * Bien documenté : Manuel de référence, cours d'instruction, référence d'api avec des exemples pour chaque fonction, et un étendu ``comment peut… être construit en Sage ? « document.

Télécharger Sage, un guide d'installation et un cours d'instruction, de sa page Web 

http://sage.scipy.org/. 

Bien que Sage emploie Python et PARI et d'autres paquets, maintenir dans l'esprit qu'il n'est pas nécessaire pour avoir ce logiciel préinstallé sur l'ordinateur. L'installation de Sage est vraiment conçue pour être relativement indolore, mais s'il y a des problèmes, demande svp (la page Web a des liens aux listes d'email pour l'appui Sage). Il y a des instructions d'installation chez http://sage.scipy.org/sage/doc/html/inst/index.html. D'ailleurs, si Sage est installée une fois, l'évolution à la plus nouvelle version est particulièrement facile avec l'option de commande de « mise à niveau » (ceci est décrit sur le site Web donné ci-dessus et suppose que le wget est installé et un raccordement d'Internet). 

Une fois que Sage est installée dans un répertoire tel que sage-x.y.z. Linux, le Cd à ce répertoire et introduisent au clavier le `de commande de "./sage" pour commencer Sage et pour montrer la « sauge prompte Sage :  ». C'est à sens unique pour employer Sage. Une autre manière est de dactylographier après dans le « notebook (open_viewer=True) » au message de sollicitation Sage, qui 

(a) commence le fonctionnement Sage de serveur (chargeant la feuille de travail précédemment utilisée, si quel) et 

(b) ouvre un navigateur (ou des débuts une nouvelle étiquette si elle est déjà ouverte) et montre la page Web Sage de cahier. 

Au message de sollicitation "sage:", tapez « factor (100) » (puis Entrée) et écrivent alors Ctrl-d (tenir le key de Ctrl et le d en même temps) ou facteur (de retour) « stoppé » 100 de volonté de Sage premier et sortent alors. Pour faire ceci dans le cahier, écrire le « factor (100) » dans une « cellule » (une fenêtre blanche vide dans le navigateur) et puis entrer Maj-Entrée. Sage montrera la factorisation dans l'espace juste au-dessous de la cellule. Pour sortir de la version Cahier de Sage, allez d'abord de nouveau à la ligne de commande et tapez Ctrl-c. Ensuite, sortir du navigateur. Ceci stoppe le Cahier de Sage. 

Il y a plus d'exemples, dans le cours d'instruction, constructions, et manuels de référence, disponibles sur la page Web Sage. Veuillez les juger dehors ! 

Sage est en développement, mais se développe activement, et est déjà utilisable. Il y a un conseil de discussion, un bogue-traqueur, et une liste de souhaits. Visitez

http://sage.scipy.org/ 

ou 

http://sage.math.washington.edu/sage/ 

ou 

http://echidna.maths.usyd.edu.au/sage/ 

pour plus d'information. Surtout, amusez-vous avec Sage !

----

David Joyner
wdjoyner@gmail.com

William Stein
wstein@gmail.com

Dernière mise à jour en 2014.
