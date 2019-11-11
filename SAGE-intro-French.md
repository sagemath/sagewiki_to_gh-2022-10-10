#language fr
== Courte introduction à Sage ==

Sage est un logiciel de calcul formel mathématique, en particulier utile pour la théorie des nombres, l'algèbre, et la géométrie. Il a été initié par William Stein. C'est un logiciel libre, disponible selon les termes de la licence générale GNU (GPL).

Sage est une bibliothèque Python avec un interpréteur adapté aux besoins de l'utilisateur. Du code python, C++, et C (par l'intermédiaire de Pyrex) peut être directement ajouté. Le langage Python est un langage de programmation libre, interprété, orienté objet, avec un grand nombre de bibliothèques, par exemple pour l'analyse numérique, qui sont à la disposition des utilisateurs de Sage. Le langage Python peut également être utilisé en mode bibliothèque par des programmes en C/C++.

Sage fournit une interface unifiée à plusieurs bibliothèques libres importantes, y compris SINGULAR (pour l'algèbre commutative) et GAP (pour la théorie des groupes), à la bibliothèque MWRANK de John Cremona (pour les courbes elliptiques), au logiciel PARI,  à la bibliothèque NTL, à Maxima et SymPy (pour la manipulation symbolique). Il y a également des interfaces à beaucoup de logiciels de calcul formel commerciaux ou fermés tels que Maple, KASH/KANT, MAGMA, Mathematica, Axiom et d'autres. Pour les graphiques, Sage inclut Matplotlib et tachyon (un lanceur de rayons). 

Les buts à long terme principaux et les principes de base de Sage :

 * Libérer et ouvrir les sources : Le code source doit être librement disponible et lisible. Ainsi les utilisateurs peuvent comprendre ce que le système fait vraiment et plus facilement le prolonger. Tout comme les mathématiciens gagnent une compréhension plus profonde d'un théorème en lisant soigneusement ou en survolant au moins la preuve, les gens qui font des calculs devraient pouvoir comprendre comment les calculs fonctionnent en lisant le code source documenté. Tout logiciel inclus dans la distribution de Sage doit être de sources libres et ouvertes, et on doit permettre des modifications et la redistribution arbitraire de chaque ligne de code.

 * Bon environnement de programmation : Sage forme un environnement stable pour commencer à programmer de nouveaux projets mathématiques de logiciel. Nous voulons fournir un modèle pour la communauté mathématique de développement de logiciel avec emphase forte sur la franchise, la communauté, la coopération, et la collaboration.

 * Extensible : Pouvoir définir de nouveaux types de données ou dériver des types intégrés, et faire le code écrit dans une pièce préférée de langue (C/C++ y compris) du système.

 * Facile à utiliser : L'espoir est d'atteindre par la suite un niveau élevé d'assistance aux utilisateurs. (La liste d'email « forum de GAP » est un exemple idéal du soutien que l'on espère que Sage peut atteindre.)
 
 * Facile à compiler : Il devrait être relativement facile de compiler Sage depuis les sources pour Linux et OS X. Ceci fournit plus de flexibilité.

 * Multi-plateformes : Sage fonctionne sous Linux, OS X, Windows (cygwin et colinux binaires).

 * Complet : Mettre en application assez d'algorithmes pour être vraiment utile. Unifier librement les logiciels libres de mathématiques. Être un système logiciel de qualité de mathématiques libres.

 * Efficace : Être très rapide---comparable à ou plus rapide que toute autre logiciel disponible. C'est très difficile, puisque beaucoup de systèmes sont de sources fermées, des algorithmes ne sont pas parfois édités, et la conclusion des algorithmes rapides est souvent extrêmement difficile (des années de travail, des thèses de doctorat, etc.).

 * Outils : Fournir des interfaces robustes à une partie des fonctionnalités de PARI, de GAP, de GMP, de Maxima, de SINGULAR, de MWRANK, et de NTL. Sage fournit une interface unifiée pour leur usage.

 * Bien documenté : Manuel de référence, tutoriels, des exemples pour chaque fonction, et un document "comment construire ça en Sage ?".

Télécharger Sage, un guide d'installation et un tutoriel, sur sa page Web 

https://www.sagemath.org/

Bien que Sage emploie Python et PARI et d'autres paquets, il n'est pas nécessaire d'avoir ces logiciels pré-installés sur l'ordinateur. L'installation de Sage est vraiment conçue pour être relativement facile, mais s'il y a des problèmes, demandez (la page Web a des liens aux listes de diffusion pour le support de Sage). Il y a des instructions d'installation ici : https://www.sagemath.org/doc/installation/index.html. Par ailleurs, si Sage est installée une fois, l'évolution vers une nouvelle version est particulièrement facile avec l'option {{{sage -upgrade}}} de « mise à niveau » (ceci est décrit sur le site Web donné ci-dessus et suppose un raccordement à Internet). 

Une fois que Sage est installé dans un répertoire tel que "sage-x.y.z", entrez dans ce répertoire en utilisant un terminal et tapez au clavier la commande "./sage" pour lancer Sage. Le message d'invite « sage: » s'affiche dans le terminal. Vous pouvez alors utiliser Sage. Une autre manière est de taper ensuite la commande « notebook() » qui 

(a) lance un serveur Sage et 

(b) ouvre un navigateur et montre la page Web du Cahier de Sage. 

Au message d'invite "sage:", tapez « factor(100) » (puis Entrée). Pour quitter Sage, tapez {{{exit}}} ou {{{quit}}}. Pour faire ceci dans le cahier, écrire « factor(100) » dans une « cellule » (une fenêtre blanche vide dans le navigateur) et puis entrer Maj-Entrée. Sage montrera la factorisation dans l'espace juste au-dessous de la cellule. Pour sortir du Cahier de Sage, allez d'abord de nouveau à la ligne de commande et tapez Ctrl-c. Ensuite, sortir du navigateur. Ceci stoppe le Cahier de Sage. 

Il y a d'autres d'exemples, dans les tutoriels et les manuels de référence, disponibles sur la page Web de Sage. Allez-les voir !

Un petit résumé en une page des commandes de base est disponible [[https://wiki.sagemath.org/quickref?action=AttachFile&do=get&target=sage-quickref_fr.pdf|ici]] 


Sage est toujours en développement actif, mais est déjà parfaitement utilisable. Il y a un forum de discussion, un traqueur de bugs et une liste de souhaits. Visitez

https://www.sagemath.org/

pour plus d'information. Surtout, amusez-vous avec Sage !

----

David Joyner
wdjoyner@gmail.com

William Stein
wstein@gmail.com

Dernière mise à jour en 2014.
