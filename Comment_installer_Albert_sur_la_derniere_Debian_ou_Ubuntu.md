#language fr
## page was renamed from Comment installer Albert sur la derniere Debian/Ubuntu
## page was renamed from Comment installer Albert sur la derniere Ubuntu
Les lignes commençant par un # sont des lignes de commande.

 * télécharger les sources et décompresser l'archive : 

{{{
# mkdir albert
# cd albert
# wget http://www.cs.clemson.edu/~dpj/albertstuff/albertsrc/alberttar.gz
# tar xf alberttar.gz
}}}

 * installer les paquets build-essential et libncurses5-dev : 

{{{
# sudo apt-get install build-essential libncurses5-dev
}}}

 * modifier les occurrences de getline par albert_getline (par exemple) dans le fichier Get_Command.c :

{{{
# sed -i.old 's/getline/albert_getline/g' Get_Command.c
}}}

 * compiler :

{{{
# make
}}}

 * rendre le programme exécutable depuis n'importe où : 

{{{
# sudo ln -s $PWD/albert /usr/local/bin/albert
}}}

 * tester

{{{
# albert
}}}
