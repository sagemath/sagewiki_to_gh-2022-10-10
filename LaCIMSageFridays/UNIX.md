Describe LaCIMSageFridays/UNIX here.
 

Le but de la page est de garder les idées, les fichiers de configurations  des logiciels présenter qui ont rapport avec UNIX




Vendredi le 11 


Samuel a présenté la configuration minimal pour les logiciels suivant, Mutt,mailx-heirloom, cron ainsi que leur fonctionnement. 
pour envoyé des courriel via mutt/mailx  

$ mail -s "Sujet" -a /chemin/attachement -- destinataire1 destinataire2 < message.txt 
ou mail = mutt  ou mailx   voir le fichier mailrc ou muttrc pour avoir une idée de comment configurer le smtp
 
pour cron utiliser crontab -e pour éditer les logiciels que l'utilisateur va rouler de manière automatisé
la structure d'une tab est : *_1 *_2 *_3 *_4 *_5 <logiciel>  où   en position 1 à 5 on a les minutes_1 (0-59), l'heures_2 (0-23), jours_3(0-6), semaines_4, année_5.  on met 
