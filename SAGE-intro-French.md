== Introduction courte à la SAGE : Logiciel pour l'expérimentation d'algèbre et de géométrie ==

La SAGE est un cadre pour la théorie de nombre, l'algèbre, et le calcul de la géométrie. L'exécution courante est principalement due à William Stein. C'est source ouverte et librement disponible en vertu du permis de grand public de GNU (GPL). 

La SAGE est une bibliothèque de python avec un interprète adapté aux besoins du client. On lui écrit en python, C++, et C (par l'intermédiaire de Pyrex). Le python est une source ouverte orientée objectivement a interprété la langue, avec un grand nombre de bibliothèques, par exemple, pour l'analyse numérique, qui sont à la disposition des utilisateurs de SAGE. Le python peut également être accédé en mode de bibliothèque des programmes de C/C++. 

La SAGE fournira une interface unifiée à plusieurs bibliothèques de source ouvertes importantes, y compris le SINGULIER (pour l'algèbre commutative) et le GAP (pour la théorie de groupe), à bibliothèque de MWRANK de John Crémone (pour les courbes elliptiques), à la bibliothèque de PARI pour la bibliothèque NTL, maximum de théorie de théorie de nombre, et de nombre de Shoup (pour la manipulation symbolique). Il y a également des interfaces à beaucoup de source commerciale ou fermée CAS tels que l'érable, le KASH/KANT, le MAGMA, le Mathematica, l'axiome, et beaucoup d'autres. Pour des graphiques, la SAGE inclut Matplotlib (pour 2 d et quelques graphiques à trois dimensions) et tachyon (un traceur à trois dimensions de rayon). 

La conception de la SAGE est fortement par soigneusement a pensé dehors et structure de classe mûre du MAGMA fermé de programme d'algèbre d'ordinateur de source. Cependant, la SAGE n'est pas censée pour être un clone de MAGMA et d'autres paquets (tels que GAP et Mathematica) ont également joué un rôle influencial. 

Les buts à long terme principaux et les principes de base pour la SAGE :

 * Libérer et ouvrir la source : Le code source doit être librement disponible et lisible, ainsi les utilisateurs peuvent comprendre ce que le système fait vraiment et plus facilement les prolonger. Juste comme les mathématiciens gagnent un arrangement plus profond d'un théorème en lisant soigneusement ou en écrémant au moins la preuve, les gens qui font des calculs devraient pouvoir comprendre comment les calculs fonctionnent à côté de code source documenté de lecture. Tout le logiciel inclus dans la distribution SAGE de noyau doit être source libre et ouverte, et on doit permettre des modifications et la redistribution arbitraires de chaque d'une seule ligne.

 * Bon environnement de programmation : On l'espère que la SAGE formera un environnement stable pour commencer à programmer de nouveaux projets mathématiques de logiciel. Nous devrions fournir un modèle pour la communauté mathématique du développement de logiciel en emphase forte sur la franchise, la communauté, la coopération, et la collaboration.

 * Extensible : Pouvoir définir de nouveaux types de données ou dériver des types intégrés, et faire le code écrit dans une pièce préférée de langue (C/C++ y compris) du système.

 * Facile à utiliser : L'espoir est d'atteindre par la suite un à niveau élevé de l'assistance aux utilisateurs. (La liste d'email « de forum de GAP » est un exemple idéal de l'appui on l'espère que que la SAGE peut atteindre.)
 
 * Facile à compiler : Il devrait être relativement facile compiler SAGE de la source pour Linux et utilisateurs d'OS X. Ceci fournit plus de flexibilité en modifiant le système.

 * Croix-plateforme : La SAGE fonctionne sous Linux, OS X, Windows (cygwin et colinux binaires).

 * Complet : Mettre en application assez d'algorithmes pour être vraiment utile. Unifier librement le logiciel ouvert de mathématiques de source. Être un système logiciel de qualité de mathématiques libres ouvertes traditionnelles complètes de source.

 * Efficace : Être très rapidement---comparable à ou plus rapidement que toute autre chose disponibles. C'est très difficile, puisque beaucoup de systèmes sont source fermée, des algorithmes ne sont pas parfois édités, et la conclusion des algorithmes rapides est souvent extrêmement difficile (des années de travail, de thèses de Ph.D., de chance, etc.).

 * Outils : Fournir les interfaces robustes à une partie de la fonctionnalité de PARI, de GAP, de GMP, de maximum, de SINGULIER, de MWRANK, et de NTL. Ce sont tous sont GPL'd et la SAGE fournit (ou fournira) une interface unifiée pour l'usage de elles.

 * Bien documenté : Manuel de référence, cours d'instruction, référence d'api avec des exemples pour chaque fonction, et un étendu ``comment peut… être construit en SAGE ? « document.

Télécharger la SAGE, un guide d'installation et un cours d'instruction, de sa page Web 

http://sage.scipy.org/. 

Bien que la SAGE emploie le python et le PARI et d'autres paquets, maintenir dans l'esprit qu'il n'est pas nécessaire pour avoir ce logiciel préinstallé sur l'ordinateur. L'installation de la SAGE est vraiment conçue pour être relativement indolore, mais s'il y a des problèmes, demande svp (la page Web a des liens aux listes d'email pour l'appui SAGE). Il y a des instructions d'installation chez http://sage.scipy.org/sage/doc/html/inst/index.html. D'ailleurs, si la SAGE est installée une fois, l'évolution à la plus nouvelle version est particulièrement facile avec l'option de commande de « mise à niveau » (ceci est décrit sur le site Web donné ci-dessus et suppose que le wget est installé et un raccordement d'Internet). 

Une fois que la SAGE est installée sur un annuaire tel que sage-x.y.z, il y aura un sous-répertoire appelé le « casier ». Linux, le Cd à ce sous-répertoire de « casier » et introduisent au clavier le `de commande de "./sage" pour commencer la SAGE et pour montrer la « sauge prompte SAGE :  ». C'est à sens unique pour employer la SAGE. Une autre manière est de dactylographier après dans le « notebook (open_viewer=True) » au message de sollicitation SAGE, qui 
(a) commence le fonctionnement SAGE de serveur (chargeant la feuille de travail précédemment utilisée, si quel) et 
(b) ouvre le navigateur de firefox (ou des débuts une nouvelle étiquette si elle est déjà ouverte) et montre la page Web SAGE de cahier. 

Au message de sollicitation SAGE, le type le « facteur (100) » (retour de coup) et écrivent alors Ctrl-d (tenir le ket de Ctrl et le d en même temps) ou facteur (de retour) « stoppé » 100 de volonté de SAGE premier et sortent alors. Pour faire ceci dans le cahier, écrire le « facteur (100) » dans une « cellule » (une fenêtre blanche vide dans le navigateur de WWW) et puis entrer décaler-pénètrent dans. La SAGE montrera la factorisation dans l'espace juste au-dessous de la cellule. Pour sortir, la version de cahier de la SAGE, vont d'abord de nouveau à la ligne de commande, et entrent dans Ctrl-c. Après, sortir le navigateur. Ceci stoppe le cahier de la SAGE. 

Il y a plus d'exemples, dans le cours d'instruction, constructions, et manuels de référence, disponibles sur la page Web SAGE. Veuillez les juger dehors ! 

La SAGE est à une partie du développement, mais se développe activement, et est déjà utilisable. Il y a un conseil de discussion, un bogue-traqueur, et une liste SAGES de souhait. Svp visite 

http://sage.scipy.org/ 

ou 

http://sage.math.washington.edu/sage/ 

ou 

http://echidna.maths.usyd.edu.au/sage/ 

ou 

email William Stein à wstein@gmail.com 

pour plus d'information. Surtout, avoir l'amusement avec la SAGE !

----

David Joyner
wdjoyner@gmail.com

William Stein
wstein@gmail.com

Dernier 11-19-2006 mis à jour.
