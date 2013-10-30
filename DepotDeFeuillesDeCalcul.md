Lors d'une rencontre du GroupeUtilisateursParis a ete evoque le fait de mettre en place un serveur permettant le depot de feuilles de calcul Sage, notamment en rapport avec l'utilisation de Sage a l'agreg. Cette page temporaire sert a definir ce qu'on veut un peu plus precisement. Ajoute tes idees/demandes :


== Fonctionalites voulues ==

  * indexation
    * par langue
    * par niveau mathematique requis
    * par niveau informatique requis
    * par sujet

  * acces au depot
    * via une interface web
    * via un gestionnaire de versions (svn, hg, git, ...) plus rapide que de passer par une interface web pour modifier une feuille, mais comment lier les deux ?
    * recuperation facile depuis un en notebook local (coller l'adresse dans un formulaire) pour le rst ou sws

  * versionnement des feuilles
    * qui a le droit de faire une nouvelle version par dessus une feuille existante ? (par exemple, mettre en place un systeme d'utilisateurs commun au gestionnaire de version et a l'interface web. Ensuite pour chaque feuille de travail, associer un certain nombre d'aministrateur)
    * veut-on autoriser/multiplier les forks ?

  * license libre des documents (copie/modification/partage)
    * license unique ?
    * choix a la creation de la feuille ?

  * type de document
    * feuilles de calcul en .rst
    * sujets de TP (.rst, .tex, .odt), pas de format non-source (.pdf)
    * une page optionelle web (wiki) de presentation par feuille ?
    * si envoi de .sws, transformation manuelle vers .rst (probleme d'injection de code js malicieux qui a fait fermer le depot de sagenb) (probleme: ca ne va pas marcher si le .sws contient des fichiers .py... un sws et par nature plus riche)

  * document executable sur place ???
    * demande de la ressource
    * probleme d'injection de code
    * mais permet de se faire une idee de ce que fait la feuille

== Logiciels exitants a regarder ==

  * http://www.geogebratube.org/?lang=fr
