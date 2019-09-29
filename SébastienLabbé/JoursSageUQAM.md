#language fr
= Jours Sage au LaCIM (UQAM) -- 14, 15 et 16 juillet 2009 =


=== Local : PK-S1570, salle E. ===

On y accède via la porte PK-M500 au niveau métro (près de la rue Jeanne-Mance).
[[http://www.uqam.ca/campus/pavillons/pk.htm|Carte du campus]]

=== Organisé par Sébastien Labbé et le LaCIM ===

Dans le cadre de son École d'été, le [[http://www.lacim.uqam.ca/|Laboratoire de Combinatoire et d'Informatique Mathématique (LaCIM)]] organise les Jours Sage au LaCIM et ceci pour une deuxième année consécutive à l'[[http://www.uqam.ca/|Université du Québec à Montréal (UQAM)]]. En effet, FrancoSaliola alors post doc au LaCIM avait organisé une semaine sur Sage en mai 2008. Cette année, la formation est donnée par SébastienLabbé, étudiant au doctorat en mathématiques. Les professeurs comme les étudiants sont invités. Comme l'an passé, la formation sur Sage se veut accessible à tous, c'est-à-dire que nous n'assumons pas que les participants ont déjà une expérience avec Python ou avec Sage. À l'image des Sage Days, les Jours Sage au LaCIM seront très interactifs et les participants auront beaucoup de temps pour expérimenter la théorie présentée. Les exercices qui seront proposés au cours de la semaine seront basés sur un le cours [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/|Introduzione a Sage]] donné par FrancoSaliola en mai dernier à Sienne, en Italie.

== Connexion aux terminaux ==

Pour vous connecter aux terminaux, veuillez suivre les indications suivantes :

 * À l'écran de SUN, cliquez sur Options > Connexion à distance > Entrer le nom de la machine distante.
 * Ecrire 'chicoree' et ceci ouvrira l'écran de Fedora.
 * Le nom d'utilisateur et le mot de passe vous sera fourni sur place. Vous conserverez le meme toute la semaine.


== Informations sur les répertoires partagés ==

Les participants peuvent accéder aux documents (aliments.py, dossier sagelatex) via le répertoire /homelocal/partage/ . Les participants peuvent partager des fichiers entre eux via le répertoire /homelocal/partage/etudiants/ .

== Liens ==

Sage

    * [[http://www.sagemath.org/|La page web de Sage]]

Python

    * [[http://www.python.org/|La page web de Python]]
    * [[http://python.ftp-developpez.com/cours/TutoVanRossum/fichiers/TutorielPython.pdf|Tutoriel Python]]: Traduction française du Tutoriel Python.
    * [[http://diveintopython.adrahon.org/|Plongez au coeur de Python]] (en français).
    * [[http://www.poromenos.org/tutorials/python|Learn Python in 10 minutes]]

Autre

    * [[http://www.projecteuler.net/|Project Euler]]: Problèms et défis mathématiques et informatiques. Ils nous serviront d'exercices.
    * [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/|Introduzione a Sage]]: Cours sur Sage donné par Franco Saliola en mai dernier que nous utiliserons beaucoup beaucoup. Merci à Franco!

== Thèmes à aborder au cours de la semaine ne faisant pas encore partie de l'horaire et autres demandes spéciales ==

Calcul symbolique.
Codage des caractères d'un fichier python.
Table de hashage.
Anneau de polynômes non commutatifs.

== Horaire ==

ATTENTION : L'horaire est encore en construction et est sujet à changement.

||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Mardi le 14 juillet 2009||
||<|2> 9:00-9:30 ||'''Arrivée des participants.''' ||
|| Mot de bienvenue. Distribution des mots de passe. ||
||<|2> 9:30-10:30 || '''Introduction à Sage''' ||
|| Ceci sera une présentation générale sur Sage qui expliquera l'histoire et les motivations du projet. Nous montrerons plusieurs exemples d'utilisation de Sage. Nous utiliserons des [[https://wiki.sagemath.org/Talks|présentations sur Sage]] déjà fait par d'autres. [[http://www-irma.u-strasbg.fr/~saliola/maths/talks/slides/SageTalk2/SageTalk2.pdf|Présentation de Franco]]. [[http://sage.math.washington.edu/home/schilly/talks/sage_schilly_university_vienna_20080109.pdf|Présentation de Harald Schilly]]. [[http://wstein.org/talks/20090622-sagedays16-thematic/sage-thematic_day.sws|Présentation de  William Stein (.sws)]]. ||
|| 10:30-11:00 || Pause ||
||<|2> 11:00-12:00 || '''Introduction à Python 1''' ||
|| Nous présenterons les objets de base du langage python : int, float, str, list, tuple, dict. Aussi : map, filter et list-comprehension. Parcours d'une liste avec une boucle. Nous présenterons comment définir une fonction et comment utiliser un fichier pour les définir. Voir l'exemple : [[attachment:sequence.py]] ||
|| 12:00-13:30 || Dîner ||
||<|2> 13:30-14:00 || '''Comment fait-on ceci en Sage?''' ||
|| Obtenir de l'aide dans Sage: La touche TAB et Complétion automatique, [[http://www.sagemath.org/help.html|Help Web Page]], [[http://www.sagemath.org/doc/tutorial/|Tutoriel]], [[https://wiki.sagemath.org/|Sage-Wiki]], ?, ??, *mot*?, [[http://groups.google.com/group/sage-support|sage-support]], search_doc, search_src, search_def, ... ||
||<|2> 14:00-15:00 || '''Exercices''' ||
|| 1. Trouver 3 exemples dans le Tutoriel et tester-les.  2. Trouver 3 exemples dans le Sage-Wiki et tester-les. 3. Feuilles de travail [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/worksheets/sws/Worksheet_1___Getting_Help.sws|Getting Help]],   [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/worksheets/sws/Worksheet_2___Lists.sws|Lists]] et [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/worksheets/sws/Worksheet_3___First_steps_towards_programming.sws|First steps towards programming]] du cours de Franco Saliola. ||
||<|2> 15:00-15:30 || '''Calcul, dessins et interact''' ||
|| Démonstration des fonctionnalités de dessins de Sage (plot, plot3d, etc.). Nous utiliserons la [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/lectures/Siena_Lecture___Calculus__Plotting___Interact.sws|présentation de Franco Saliola]] sur le calcul. ||
||<|2> 15:30-17:00 || '''Exercices''' ||
|| 1. Dessiner le graphe de votre fonction favorite. 2. Trouver un exemple de dessin dans le Sage-Wiki et tester-le. 3. Feuilles de travail [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/worksheets/sws/Worksheet_4___Calculus__Plotting_and_Interact.sws|Calculus, plotting and interact]] du site web de Franco Saliola. ||
||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Mercredi le 15 juillet 2009||
|| 9:00 ||'''Arrivée des participants.''' ||
||<|2> 9:00-12:00 || '''Temps libre et exercices''' ||
|| (Note: Le présentateur sera absent durant cet avant-midi. Le laboratoire sera disponible pour les participants. Je vous demande d'écrire toutes les choses que vous ne réussissez pas à trouver du premier coup ou toutes autres choses que vous n'aimez pas! Je vais utiliser cette information pour améliorer Sage. Merci.) 0. Terminer les exercices de mardi. 1. Feuilles de travail [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/worksheets/sws/Worksheet_5___3n_1_Conjecture.sws|The 3n+1 Conjecture]], [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/worksheets/sws/Worksheet_8___Dictionaries_and_Graph_Theory.sws|Dictionaries and Graph Theory]] et [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/worksheets/sws/Worksheet_7___Strings_and_the_BWT.sws|Strings and the Burrows-Wheeler Transform]] du site de Franco Saliola. 2. Créer un compte sur [[http://projecteuler.net/|Projet Euler]] et résoudre tous les problèmes! 3. Exercices supplémentaires : Répondre aux questions des [[https://wiki.wstein.org/2008/480a/homework|devoirs du cours]] Math 480a Algebraic, Scientiﬁc, and Statistical Computing, an Open Source Approach Using Sage donné par William Stein au printemps 2008. Le [[https://wiki.wstein.org/2008/480a|site du cours]] contient aussi beaucoup d'informations pertinentes tel que les vidéos de tous les cours! ||
||<|2> 13:30-14:00 || '''Introduction à Python 2''' ||
|| Nous présenterons les classes en python. Voir l'exemple : [[attachment:aliments.py]] ||
||<|2> 14:00-14:30 || '''Makefile, Sage et LaTeX''' ||
|| Nous présenterons comment utiliser sage dans des documents LaTeX via le paquetage optionnel sagetex. Le paquetage sagetex s'installe facilement sur une version de Sage grace a la commande sage -i sagetex-2.1.1 ecrite directement dans le terminal. Pour plus d'informations, veuillez vous referer a la documentation [[attachment:sagetexpackage.pdf]] de quelques pages ecrite par Dan Drake, le createur de sagetex. Voir l'exemple : [[attachment:devoir.tex]]. Nous utilisons la commande make pour compiler le fichier latex grace au fichier [[attachment:makefile]]. Les fichiers [[attachment:sagetex.py]] et [[attachment:sagetex.sty]] doivent aussi etre dans le meme repertoire. De plus, avec la configuration de pdflatex ici sur le serveur, nous devons aussi ajouter le fichier [[attachment:makecmds.sty]] dans le repertoire. ||
||<|2> 15:00-15:30 || '''Café du LaCIM''' ||
|| Les participants sont invités au Café du LaCIM au local PK-4214 où Lise, secrétaire du LaCIM, nous accueillera. Café et collations seront servis. ||
||<|2> 15:30-17:00 || '''Exercices''' ||
|| 1. Créer une classe Matrice et implémenter la somme et le produit. 2. Continuer [[http://www-irma.u-strasbg.fr/~saliola/sage/SienaLectures/|les feuilles de travail]] de Franco Saliola. 3. Projet Euler. 4. Devoirs du cours de Stein. ||
||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Jeudi le 16 juillet 2009||
|| 9:00 ||'''Arrivée des participants.''' ||
||<|2> 9:30-10:00 || '''Cython''' ||
|| Démonstration de l'outil Cython qui permet de traduire du code python en code C. Consultez l'exemple presente en classe ici : [[attachment:Huard_cythone.sws]] ||
||<|2> 10:30-11:00 || '''L'outil interact''' ||
|| Démonstration de l'outil interact + exercices. Utilisez interact? pour obtenir la documentation. ||
||<|2> 11:00-12:00 || '''Théorie des groupes''' ||
|| Démo. Nous utiliserons possiblement la feuille de travail du [[https://wiki.wstein.org/2008/480a/schedule/2008-04-16|cours de W. Stein sur les groupes]]. ||
||<|2> 13:30-14:00 || '''Façons d'utiliser Sage efficacement''' ||
|| Nous verrons comment utiliser Sage avec plus d'habiletés avec chacune des façons suivantes : 1. La ligne de commande (utilisation de la commande attach, de la barre de soulignement pour obtenir le dernier calcul, de l'historique, du point d'exclamation (!) pour faire des commandes du terminal et plus encore...) 2. Le notebook (dans ce dernier, cliquez sur Help en haut à droite pour obtenir les conseils). 3. Par internet via [[www.sagenb.org]] (suggéré pour les utilisateurs de Windows). Voir aussi les [[https://wiki.sagemath.org/Tips|conseils]] sur le Sage-Wiki. ||
||<|2> 14:00-14:30 || '''Calcul symbolique avec Sage''' ||
|| [[https://wiki.wstein.org/2008/480a/schedule/2008-05-21b|Présentation sur le Calcul Symbolique]] de William Stein. ||
||<|2> 14:00-17:00 || '''À déterminer... ''' ||
|| Exercices et démonstrations selon les demandes des participants. ||
