
Lors d'une rencontre du <a href="/GroupeUtilisateursParis">GroupeUtilisateursParis</a> a été évoqué le fait de mettre en place un serveur permettant le dépôt de feuilles de calcul Sage, notamment en rapport avec l'utilisation de Sage à l’agrégation. Cette page temporaire sert à définir ce qu'on veut un peu plus précisément. Ajoute tes idées/demandes : 


## Fonctionnalités voulues

   * indexation 
         * par langue 
         * par niveau mathématique requis 
         * par niveau informatique requis 
         * par sujet 
   * accès au dépôt 
         * via une interface web 
         * via un gestionnaire de versions (svn, hg, git, ...) plus rapide que de passer par une interface web pour modifier une feuille, mais comment lier les deux ? 
         * recuperation facile depuis un notebook local (coller l'adresse dans un formulaire) pour le rst ou sws 
   * versionnement des feuilles 
         * qui a le droit de faire une nouvelle version par dessus une feuille existante ? (par exemple, mettre en place un système d'utilisateurs commun au gestionnaire de version et a l'interface web. Ensuite pour chaque feuille de travail, associer un certain nombre d'administrateur) 
         * veut-on autoriser/multiplier les forks ? 
   * licence libre des documents (copie/modification/partage) 
         * licence unique ? 
         * choix à la création de la feuille ? 
   * type de document 
         * feuilles de calcul en .rst 
         * sujets de TP (.rst, .tex, .odt), pas de format non-source (.pdf) 
         * une page optionelle web (wiki) de présentation par feuille ? 
         * si envoi de .sws, transformation manuelle vers .rst (problème d'injection de code js malicieux qui a fait fermer le dépôt de sagenb) (problème: ça ne va pas marcher si le .sws contient des fichiers .py... un sws et par nature plus riche) 
   * document exécutable sur place ??? 
         * demande de la ressource 
         * problème d'injection de code 
         * mais permet de se faire une idée de ce que fait la feuille 

## Logiciels existants/propositions à regarder

   * <a href="http://www.geogebratube.org/?lang=fr">http://www.geogebratube.org/?lang=fr</a> 
   * django + svn. Users can be managed through Appache via LDAP (see in particular <a class="http" href="http://pythonhosted.org/django-auth-ldap/">django-ldap</a>) 
   * séparer la partie "dépôt" et la partie "index" (qui peut pointer vers des pages/fichiers situées n'importe ou). 