Les lignes commancant par un # sont des lignes de commande.

 * telechager les sources et les decompresser l'archive : 

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

 * rendre le programme executable depuis n'importe ou : 

{{{
# sudo ln -s $PWD/albert /usr/local/bin/albert
}}}

 * tester

{{{
# albert
}}}
