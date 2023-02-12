

## Prospective


### Si on avait de la thune que voudrait-on en faire ?

   * Organisation de rencontres 
         * code 
         * formation, en particulier une semaine de formation pour doctorants en automne à la montagne 
   * Machine(s) ? Pour quel usage ? 
   * Invitations ? 

### Quelles sont les personnes/communautés actives/intéressées par sage en France ?

   * Combinatoire algébrique 
         * Nicolas Borie 
         * Adrien Boussicault 
         * Florent Hivert 
         * Nicolas Thiery 
   * Génération aléatoire et énumération d'objets combinatoires 
         * Cyril Nicaud 
         * Yann Ponty 
   * Systèmes dynamiques, combinatoire des mots, pavages, automates cellulaires 
         * Vincent Delecroix 
         * Timo Jolivet 
         * Sébastien Labbé 
         * Samuel Lelievre 
         * Thierry Monteil 
         * Un thésard de Mathieu Sablik qui aurait fait des trucs la-dessus ? 
   * Arithmétique (informatique) 
         * Paul Zimmermann 
   * Calcul formel 
         * Laurent Fousse 
   * Algèbre linéaire 
         * Clement Pernet 
         * Jean-Guillaume Dumas 
   * Théorie des graphes 
         * Nathann Cohen 
   * <a class="http" href="http://www.loria.fr/~zimmerma/sd10_participants.pdf">participants aux sage days 10 (Nancy)</a> 
   * <a class="http" href="http://www.lirmm.fr/~monteil/participants-week-4.html">participants aux sage days 20 (Marseille)</a> 
   * <a class="http" href="http://wiki.sagemath.org/days10/#line-146">participants aux sage days 28 (Orsay)</a> 

## le peps proprement dit


### trouver un petit nom, acronyme, le truc con des demandes de projet

   * SAGE 
   * ELB (<a href="/EnvoieLeBle">EnvoieLeBle</a>) 
   * PILM (Par Ici La Monnaie) ou (Plateforme Informatique Libre pour les Mathématiques) 
   * ... 

### Qui serait intéressé par être dans le peps ?

   * Nathann Cohen (Laboratoire d'Informatique, Signaux et Systèmes de Sophia-Antipolis - I3S - UMR 6070 - doctorant - théorie des graphes) 
   * Vincent Delecroix (Institut de Mathématiques de Luminy - IML - UMR 6206 - doctorant - échanges d'intervalles) 
   * Florent Hivert (Laboratoire d'Informatique, de Traitement de l'Information et des Systèmes - LITIS - EA 4108 - professeur - combinatoire algébrique) 
   * Sébastien Labbé (Laboratoire d'Informatique Algorithmique: Fondements et Applications - LIAFA - UMR 7089 - doctorant - combinatoire des mots) 
   * Samuel Lelièvre (Laboratoire de Mathématiques d’Orsay - LMO - UMR 8628 - maître de conférences - surfaces à petits carreaux) 
   * Thierry Monteil (Laboratoire d'Informatique, de Robotique et de Microélectronique de Montpellier - LIRMM - UMR 5506 - chargé de recherche - dynamique symbolique) 
   * Cyril Nicaud (Laboratoire d'informatique Gaspard-Monge - LIGM - UMR 8049 - maître de conférences - génération aléatoire) 
   * Yann Ponty (Laboratoire d'Informatique de l'X - LIX - chargé de recherche - génération aléatoire) 
   * Nicolas Thiery (Laboratoire de Mathématiques d’Orsay - LMO - UMR 8628 - maître de conférences - combinatoire algébrique) 
Qui d'autre ? Est-ce qu'on ouvre aux personnes plus "calcul" (Paul Zimmermann, Laurent Fousse,...) 


### Quel argumentaire ? (rédaction du baratin)

(copie d'un mail de Nicolas) Discours général: notre recherche à tous nécessite des développements spécifiques et une plateforme libre pour être assez souple. Or la pratique montre que, même si nous sommes dans des domaines assez différent, une grosse partie des besoins sont communs (mais absents des systèmes existants). Il est donc très profitable de mutualiser nos efforts. Effet de bord: les résultats de nos développements sont aussi utiles pour d'autres chercheurs d'autres domaines et pour l'enseignement. 

La dynamique des billards rationnels [JOLI DESSIN D'ORBITE] est équivalente à celle du flot géodésique d'une surface de translation obtenue par dépliage du billard [JOLI DESSIN D'UNE SURFACE]. Une surface de translation peut-être vue comme un élément de l'espace tangent à l'espace des modules de courbes de genre g. Cette correspondance a permis de répondre à un certain nombre de questions combinatoires et dynamiques (comptage du nombre de diagonales généralisées, complexité des orbites par le codage naturel donné par les côtés, déviation des moyennes ergodiques, ...) dont certaines sont des réponses partielles dû au fait que l'ensemble des billards est de mesure nulle dans l'espace des surface de translation. La théorie ergodique fournit en général des réponses presque partout. 

Les premières conjectures formulées par M. Kontsevich et A. Zorich ont suivi une série intensive d'expérimentations dans les années 1990. Les expérimentations continuent 

Pour les surfaces de translation 

* Propriété "expanders" des groupes de Veech et spectre du laplacien (expérimentation en cours, Delecroix-Monteil-Lelièvre) 
* Classification des orbites des surfaces arithmétiques (expérimentation et travail en cours, Delecroix-Lelièvre-Zmiaikou) 
* Algorithme d'approximation des exposants de Lyapunov pour les mesures géométriques (travail en cours, Delecroix-Zorich) 
* simplicité du spectre de Lyapunov du cocycle KZ 
* dépendance rationnelle des exposants du cocycle KZ. dépendance algébrique. 
Côté s-adique 

* Complexité globale des échanges d'intervalles 
* spectre de Lyapunov des mots d'Arnoux-Rauzy 
Extrait de la demande ANR GeoDyM (p. 29) 


```txt
[...]

The advantage of such a development branch is the possibility to share and improve our code, so that the whole community can concentrate to research-related programming instead of having to reinvent the wheel; this programming becomes in its turn a part of the wheel.

Globally, it is extremely important to have a well-developed open source mathematical research instrument. On the one hand commercial programs are sometimes non reliable (for example, D. Zagier foud certain incoherence in couting prime numbers in like "Mathematica", and A. Zorich encountered mistakes in integral caculations involving dilogarithm in the same program), and, since the code is unavailable, impossible to verify. On the other hand, they are extremly expensive to public research. Thus, though in the nearest future we plan to use commercial software, it is important to develop in parallel a competitive open-source free alternative.
```

### Demande de thunes

A mon avis (Thierry), il vaut mieux avoir peu sur 2 ans que beaucoup sur un an. 
