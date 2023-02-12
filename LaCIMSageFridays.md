

# Les vendredis Sage au LaCIM - LaCIM Sage Fridays

Tous les vendredis après-midi à 13h à compter du 17 septembre 2010. 

_Every Fridays Afternoon 1 pm starting September 17th 2010._ 


## Lieu : PK-4205 ou PK-4323 ou PK-4214 , LaCIM, UQAM, Montréal, Canada

   * <a class="http" href="http://lacim.uqam.ca/">LaCIM - Laboratoire de combinatoire et d'informatique mathématique</a> 

## Contexte

Les étudiants, postdoctorants et plus récemment des professeurs au LaCIM ont utilisé et contribué au développement de Sage depuis 2008. Cette année plusieurs développeurs sont rassemblés au LaCIM et nous profiterons de l'occasion pour terminer chaque semaine en résolvant des bugs de Sage, en y apportant des améliorations et bien sûr en étant là pour répondre aux questions des utilisateurs. Une courte présentation par semaine sera possiblement donnée pour entamer l'après-midi (ex: sagetex, utiliser les queues avec hg, utiliser hg pour partager des répertoire, utiliser trace, utiliser le serveur sage-combinat). 

_Students, postdocs and more recently professors at LaCIM have been using and developing Sage since 2008. This year many developers are gathered at LaCIM and we intend to finish each week by solving bugs, improving code and of course introducing Sage to anyone interested. Quick presentations will possibly be given each week to start the afternoon (ex : sagetex package, using hg, using hg to share repositories, using trace, using sage-combinat server)._ 


## Organisateurs

   * Alexandre Blondin Massé 
   * Sébastien Labbé 
   * Franco Saliola 

## À propos de Sage

Sage est un logiciel libre et gratuit de mathématiques. Sa mission est d'offrir une alternative viable aux logiciels commerciaux comme Maple ou Mathematica, et sa communauté est en pleine croissance dans le monde entier. Vous trouverez plus d'informations sur Sage sur le site: 

   * <a href="https://www.sagemath.org">https://www.sagemath.org</a> 
Un récent vidéo fait par William Stein, l'initiateur de Sage, à l'occasion de Sage Days  25 en Inde (en anglais) : 

   * <a class="https" href="https://vimeo.com/13986940">Introduction to Sage: History, Goals, Demo</a>, 49 min. 
Un livre en français sur les mathématiques et sur Sage, sous la licence Creative Commons, a été publié récemment: 

   * Calcul mathématique avec Sage, livre libre et gratuit, juillet 2010, <a href="http://sagebook.gforge.inria.fr/">http://sagebook.gforge.inria.fr/</a>  
Des liens utiles pour développer Sage et travailler sous UNIX en général: 

   * <a class="http" href="http://wiki.sagemath.org/LaCIMSageFridays/UNIX">Section UNIX</a> -- En construction 

## Vendredi suivant : 1 avril 2011

à venir 


## Vendredi précédents


### 1 avril 2011

   * Sébastien 
               * script pour Tikz externalize qui utilise la vieille méthode beginpgfgraphicnamed ici : <a href="http://tex.stackexchange.com/questions/1460/script-to-automate-externalizing-tikz-graphics">http://tex.stackexchange.com/questions/1460/script-to-automate-externalizing-tikz-graphics</a> 

### 18 mars 2011

   * Franco 
               * Another solution for tiling terminals : conque extension for vim : <a href="http://www.vim.org/scripts/script.php?script_id=2771">http://www.vim.org/scripts/script.php?script_id=2771</a> 
               * pour faire en sorte que le terminal se comporte comme sage pour les flèches HAUT et BAS qui considère les commandes ayant comme préfixe le mot qui précède le curseur ET pour avoir le mode vi en Sage : 

```txt
# This File is : ~/.inputrc
set editing-mode vi
set keymap vi-insert

"\e[A": history-search-backward  # up-arrow
"\e[B": history-search-forward   # down-arrow
```
   * Marco 
               * pour faire des backup : rdiff-backup 
   * Alexandre 
               * configuration de tmux (fichier `~/.tmux.conf`) : 
               * Pour "scroller" dans un panneau, il suffit de passer en mode "copie" en faisant C-b suivi de [. À partir de là, on peut faire défiler avec les flèches, sélectionner du texte en maintenant la touche espace et entrée pour copier (yank) le texte. Pour copier dans une autre fenêtre, on fait C-b suivi de ]. 

```txt
# This File is : ~/.tmux.conf

# use "|" and "-" to do vertical/horizontal splits
unbind %                                          
bind | split-window -h                            
bind - split-window -v                            
                                                  
# use the vim motion keys to move between panes   
bind h select-pane -L                             
bind j select-pane -D                             
bind k select-pane -U                             
bind l select-pane -R                             
                                                  
# use vim motion keys while in copy mode          
setw -g mode-keys vi    
```

### 11 mars 2011

   * Samuel 
               * Mailx 
               * MUTT 
               * CRON 
   * Jérôme 
               * Sélection en rectangle sur Mac OS X avec la touche ALT 
               * Aquamacs et Sage Mode 
               * Tikz externalize Ajoutez ces deux lignes au préambule de votre `document.tex` : 

```txt
\usetikzlibrary{external} 
\tikzexternalize[mode=list and make, verbose=false]
```
               * pdflatex va créer un pdf pour chaque figure TikZ, l'inclure en image et générer `document.makefile`. Vous aurez peut-être à faire `pdflatex -shell-escape document.tex` pour compiler correctement et permettre à pdflatex d'accéder à des fichiers externes.  
  
 Notez que les fichiers d'images ne sont pas mis à jour automatiquement lorsque vous modifiez votre document (ou si l'ordre des figures change!). Vous devez appeller make pour forcer la recompilation : 

```txt
make -B -f document.makefile
```
               * Voici le makefile que j'utilise pour recompiler toutes les images lorsque j'effectue une modification à mes illustrations : 

```txt
TIKZ_TMP_FILES = *.spl *.dep *.dpth document-fig*.log document.figlist document.makefile document.spl
LATEX_TMP_FILES = *.aux *.bbl *.blg *.log
GENERATED_FILES = *.pdf

NPROCS = 1
OS = $(shell uname)

ifeq ($(OS),Linux)
  NPROCS := $(shell grep -c ^processor /proc/cpuinfo)
else ifeq ($(OS),Darwin)
  NPROCS := $(shell sysctl hw.ncpu | awk '{print $$2}')
endif

all :
        pdflatex -shell-escape document.tex
        bibtex document
        make -j $(NPROCS) -B -f document.makefile
        pdflatex document.tex
        pdflatex document.tex
        rm -f $(TIKZ_TMP_FILES)

clean :
        rm -f $(TIKZ_TMP_FILES)
        rm -f $(LATEX_TMP_FILES)
        rm -f $(GENERATED_FILES)
```
               * Ainsi, je n'ai qu'à taper `make` et tout est recompilé automatiquement en utilisant tous les processeurs de mon ordinateur. 
   * Sébastien 
               * Review tickets 

### 25 février 2011

   * Samuel 
               * tmux 
               * Dynamic window manager on Mac OS X : <a href="http://harry.vangberg.name/post/470505660/dwm-on-mac-os-x">http://harry.vangberg.name/post/470505660/dwm-on-mac-os-x</a> 
   * Franco 
               * screen 
               * scroogle 
               * surfraw 
               * vmail 
   * Alexandre Blondin Massé 
               * wordpress 

### 18 février 2011

   * Discussion 
               * Utilitaire `screen` 
               * Résolution d'équations sur les mots 
   * Franco Saliola 
               * Arbitrage de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10354">#10354</a> 
   * Sébastien Labbé 
               * Arbitrage de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10517">#10517</a> 
   * Alexandre Blondin Massé 
               * Arbitrage de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8673">#8673</a> 

### 17 décembre 2010

   * Marco Robado: 
               * L'outil rsync pour synchroniser des répertoires. 
   * Sébastien Labbé, Marco Robado, Samuel : 
               * Correction du ticket : <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10463">#10463</a> 
               * Comment corriger un bug, soumettre un patch 
   * Samuel 
               * Création d'un compte sur le sage trac 
   * Marco Robado:  
               * Pour utiliser un pager par défaut pour les sorties Mercurial: 

```txt
[extensions]
pager =

[pager]
pager = LESS='FSRX' less
attend = log, help, version, status, qseries, diff
```

### 10 décembre 2010

Documentation (coverage) de Sage 

   * Alexandre Blondin Massé: 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10461">#10461</a> 
   * Sébastien Labbé et Marco Robado: 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10462">#10462</a> et 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10463">#10463</a> 
   * Franco: 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8670">#8670</a>  
   * Samuel: 
               * Remplacement de Fedora par Ubuntu! 

### 3 décembre 2010

Quelques présentations : 

   * Alexandre Blondin Massé: 
               * Syntaxe cython pour vim 
   * Sébastien Labbé: 
               * Utilisation de docutils et <a href="/ReStructuredText">ReStructuredText</a> pour générer des démos. 
               * rst2html, rst2latex, rst2odt, rst2s5, etc. 
               * Objectif : sage -rst2html 
               * Objectif : sage -rst2sws 
               * Un exemple de présentation faite avec rst2s5 : <a href="http://groups.google.com/group/cython-users/browse_thread/thread/ef615c8d2fc0ff78">http://groups.google.com/group/cython-users/browse_thread/thread/ef615c8d2fc0ff78</a> 
   * Franco: 
               * Syntaxe sage + ReST pour vim 
Il faudrait ajouter des liens vers ce qu'on a fait. 


### 26 novembre 2010

   * Alexandre Blondin Massé: 
               * Arbitrage de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10266">#10266</a> et de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10265">#10265</a>. 
               * Arbre suffixe 
   * Sébastien Labbé: 
               * Terminer les corrections de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10266">#10266</a> : Needs Review again. 
               * Travail sur layout_graphviz 
               * Préparation de la présentation sur Sage à Montréal Python (avec Franco) 

### 19 novembre 2010

   * Sébastien Labbé: 
               * Terminer les corrections de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10266">#10266</a> : Needs Review again. 
               * Wrote <a href="/SharingYourBranch">SharingYourBranch</a> page. 

### 12 novembre 2010

   * Alexandre Blondin Massé et Sébastien Labbé ont travaillé sur  
               * L'implémentation d'un arbre suffixe en Cython. 
               * #8739: Addition of Kolakoski word 
               * #8431: Substitutions over unit cube faces (Rauzy fractals) 
               * #10266: Add sum of digits of a sequence to the word constructor 
               * #10267: Add a method that returns the balance level of a finite word 
               * #10265: Add palindrome defect word to the word constructor 
               * #8674: Comparison of combinatorial class of words with word paths is broken 
               * #10134: Provide the enumeration of word morphisms from a range of integers 
               * #10261: Improve documentation for word (over str vs over integer) 

### 5 novembre 2010

   * Franco Saliola a expliqué comment utiliser le Python Debugger. Il a fait une page HTML avec du code ReST. Il faudrait ajouter le lien ici. 

### 29 octobre 2010

   * Alexandre Blondin Massé, Sébastien Labbé et Franco Saliola ont travaillé sur l'implémentation d'un arbre suffixe en Cython. 

### 22 octobre 2010

   * Marco Robado a expliqué comment utiliser le protocole RSA pour les connexion SSH. 
   * Sébastien Labbé et Franco Saliola ont travaillé sur les permutations codées par des chemins. 

### 15 octobre 2010

   * Sébastien Labbé : 
               * Terminer les corrections de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8670">#8670</a> : Needs Review again. 
               * Création de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10134">#10134</a> : Needs Review. 
               * Implémentation de is_pisot and is_unimodular for word morphisms. 
   * Franco Saliola and Christian Stump: 
               * Innefficient work on Poset code <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6641">#6641</a>. 

### 8 octobre 2010

   * Sébastien Labbé : 
               * Arbitrage de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10063">#10063</a>. 
               * Travailler sur <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8670">#8670</a>. 
   * Alexandre Blondin Massé et Marco Robado : 
               * Discussions à propos de Git. 
               * Écriture d'un manuel sur Git. 

### 1er octobre 2010

   * Alexandre Blondin Massé 
               * Arbitrage de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8431">#8431</a> et <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9877">#9877</a> 
   * Sébastien Labbé : 
               * Arbitrage de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8431">#8431</a>. 

### 24 septembre 2010

   * Marco Robado : 
               * Discussions sur vim, en particulier à propos des plugins `autoclose` et `surround`. 
   * Sébastien Labbé : 
               * Arbitrage de <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8431">#8431</a>. 
   * Alexandre Blondin Massé et Marco Robado : 
               * Discussions à propos de Git. 

### 17 septembre 2010

   * Sébastien Labbé :  
               * Démo de la librairie sage/combinat/words à Alessandro. 
               * Démo de l'outil sagetex à Nicolas et Louis-François. 
               * Démo de l'utilisation du serveur sage-combinat à Christian Stump.       
   * Franco Saliola :  
               * Résolution du problème d'utilisation de Gap sur les ordinateurs du PK-4205 : <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9938">#9938</a> 