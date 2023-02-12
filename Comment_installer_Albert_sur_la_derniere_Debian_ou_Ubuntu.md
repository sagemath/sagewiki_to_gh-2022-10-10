
Les lignes commençant par un # sont des lignes de commande. 

* télécharger les sources et décompresser l'archive :  

```txt
# mkdir albert
# cd albert
# wget http://www.cs.clemson.edu/~dpj/albertstuff/albertsrc/alberttar.gz
# tar xf alberttar.gz
```
* installer les paquets build-essential et libncurses5-dev :  

```txt
# sudo apt-get install build-essential libncurses5-dev
```
* modifier les occurrences de getline par albert_getline (par exemple) dans le fichier Get_Command.c : 

```txt
# sed -i.old 's/getline/albert_getline/g' Get_Command.c
```
* compiler : 

```txt
# make
```
* rendre le programme exécutable depuis n'importe où :  

```txt
# sudo ln -s $PWD/albert /usr/local/bin/albert
```
* tester 

```txt
# albert
```