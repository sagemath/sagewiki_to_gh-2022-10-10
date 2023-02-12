

# Les jeudi sages à Bordeaux (autour de Sage, PARI/GP, et plus)

_les jeudis 10h à 12h en salle 74 VISIO du LaBRI ou/et sur <a class="https" href="https://gather.town/app/Hb6OqcTlc4zMgu4b/LaBRI">gathertown salle 76</a>._ 

_Prochaines séances: 

* 8 sept 2022 
* 15 sept 2022: présentation Hugo 10h "ma wishlist pour sage" 
* 22 sept 2022 
* 29 sept 2022 
* 6 oct 2022 
* 13 oct 2022: présentation Hugo 11h "algèbre des mots tassés (suite du <a class="https" href="https://ci.labri.fr/pmwiki.php/Groupe/GT">séminaire</a>)"_ 
Nous nous réunissons les jeudi au <a class="http" href="http://www.labri.fr/index.php?n=Com.Plan">LaBRI</a> pour discuter et programmer autour des logiciels de calculs formels. Les journées restent centrées sur <a class="http" href="http://www.sagemath.org/">Sage</a> et <a class="http" href="http://pari.math.u-bordeaux.fr/">PARI/GP</a> mais elles sont ouvertes à tous/toutes. Le principe est que si vous avez des questions vous venez les poser et si vous savez des choses vous venez les partager. Certains jeudi seront centrés sur des thématiques sous forme de mini-cours ou démonstration. 

Pour être tenu informé vous pouvez vous abonner à la <a class="https" href="https://diff.u-bordeaux.fr/sympa/info/sage-bordeaux">liste de diffusion</a>. 


## Débutants

* Pour apprendre Python, on recommande la lecture de <a class="http" href="http://openbookproject.net/thinkcs/python/english3e/">How to Think Like a Computer Scientist</a> 
* Pour installer SageMath, <a href="https://doc.sagemath.org/html/en/installation/">https://doc.sagemath.org/html/en/installation/</a> 
* Pour apprendre SageMath, on recommande la lecture de <a class="http" href="http://sagebook.gforge.inria.fr/">Calcul mathématique avec Sage</a> (aussi traduit en anglais et allemand) et bien sûr de participer aux séances du jeudi matin 

## Développeurs

Mot clé pour trac: <a class="https" href="https://trac.sagemath.org/query?status=closed&amp;status=needs_info&amp;status=needs_review&amp;status=needs_work&amp;status=new&amp;status=positive_review&amp;keywords=~thursdaysbdx&amp;col=id&amp;col=summary&amp;col=status&amp;col=time&amp;col=changetime&amp;col=author&amp;col=reviewer&amp;desc=1&amp;order=status">thursdaysbdx</a> 

Idées et Projets en cours: 

* les nombres réels <a class="https" href="https://trac.sagemath.org/ticket/17713">#17713</a> 
* relecture de la <a class="https" href="https://members.loria.fr/PZimmermann/sagebook/english.html">version anglaise du Calcul mathématique avec Sage</a> 
* <a class="https" href="https://github.com/videlec/pplpy">pplpy</a>: interface Pyton à la librairie <a class="http" href="http://bugseng.com/products/ppl/ppl">Parma Polyhedra Library (PPL)</a> 
* algèbre linéaire dans Sage (<a class="http" href="http://flintlib.org/">flint</a>, <a class="http" href="http://www.linalg.org/">LinBox</a>, <a class="https" href="https://cs.uwaterloo.ca/~astorjoh/iml.html">IML</a>) <a class="https" href="https://trac.sagemath.org/ticket/22872">#22872</a> 
* Integration de pplpy comme package Sage <a class="https" href="https://trac.sagemath.org/ticket/23024">#23024</a>. 
* gmpy2 et Sage <a class="https" href="https://trac.sagemath.org/ticket/22927">#22927</a> and <a class="https" href="https://trac.sagemath.org/ticket/22928">#22928</a> 
* interfacer des librairies d'automates: Wali (ancien Vaucanson) ou <a class="http" href="http://fado.dcc.fc.up.pt/">Fado</a> 
* polyomino dirigé convexes 
* arbres non ambigus <a class="https" href="https://trac.sagemath.org/ticket/16192">#16192</a> 
* tableaux boisés 
* polyomino parallelogramme periodique + les bandes  
* optimisation non-linéaire (voir <a class="http" href="http://scip.zib.de/">scip</a> et le ticket <a class="https" href="https://trac.sagemath.org/ticket/10879">https://trac.sagemath.org/ticket/10879</a>) 
* amélioration du <a class="https" href="https://github.com/sagemath/sage-patchbot">patchbot</a> 
* portage de <a class="http" href="http://perso.ens-lyon.fr/bruno.salvy/software/the-gfun-package/">gfun</a> (voir le paquet <a class="http" href="http://marc.mezzarobba.net/code/ore_algebra-analytic/">ore_algebra-analytic</a> développé par Marc Mezzarobba) 
* amélioration de AA et QQbar <a class="https" href="https://trac.sagemath.org/ticket/18333">meta-ticket #18333</a> 
* implanter <a class="http" href="http://math.stackexchange.com/questions/1798383/integer-partition-refinement-in-sage">ce truc sur les partitions</a> 
* implanter des algorithmes pour des calculs de dimension de Hausdorff et exposants de Lyapunov 
         * <a href="https://matheuscmss.wordpress.com/2017/02/04/soft-bounds-on-the-hausdorff-dimension-of-dynamical-cantor-sets/">https://matheuscmss.wordpress.com/2017/02/04/soft-bounds-on-the-hausdorff-dimension-of-dynamical-cantor-sets/</a> 
         * Hensley "A polynomial time algorithm for the Hausdorff dimension of continued fraction Cantor Sets" (1994) 
         * Pollicott "Maximal Lyapunov exponents for random matrix products" (2010) 
* corriger et améliorer les dessins hyperboliques (dim 2) 
         * <a class="https" href="https://trac.sagemath.org/ticket/23427">#23427</a> 
         * supports pour les horocycles et les polygones fait de bords géodésiques et horocycliques 
* nettoyer le code de Milton sur les substitutions géométriques (Ek star) 

## Compte-rendus


#### jeudi 10 février 2022

Jana, Pascal, Xavier, Sébastien 


#### jeudi 3 février 2022

Une dizaine de participants aujourd'hui. 


#### jeudi 27 janvier 2022

Projets pour Steffania qui a fait un cours sur les elliptic curves avec Xavier Caruso: 

* Des tickets à reviewer pour plus tard sur les elliptic curves suggérés par Vincent: <a href="https://trac.sagemath.org/ticket/33223">https://trac.sagemath.org/ticket/33223</a> 
* Improve the Installation Guide : <a href="https://doc.sagemath.org/html/en/installation/">https://doc.sagemath.org/html/en/installation/</a> 
* Improve the documentation on elliptic curves: <a href="https://doc.sagemath.org/html/en/reference/arithmetic_curves/index.html">https://doc.sagemath.org/html/en/reference/arithmetic_curves/index.html</a> 
Installation de Sage sur MacOSX avec l'aide de Samuel Lelièvre: 


```txt
​​​----- Mail transféré -----
​​​​De: "Samuel Lelièvre"

​​​​​Pascal,

Ça marcherait pareil quel que soit l'endroit où on l'installe,
à mon avis. Voici une version avec ce choix en plus.

```
INSTALL_LOCATION=$HOME  # or your choice of location
SITE='https://github.com'
DIRS='isuruf/sagemath-forge/releases/latest/download'
FILE="sagemath-forge-$(uname)-$(uname -m).sh"
cd $INSTALL_LOCATION
curl -L -O $SITE/$DIRS/$FILE
bash $FILE
```

Pour ce qui est de trouver Sage, j'ai oublié une indication.

Une fois sagemath-forge installé, on a en fait installé une
distribution Conda. On peut activer ou désactiver Conda.
Lorsqu'il est activé, le PATH est modifié pour que tout ce
qui a été installé via Conda soit accessible.

Donc pour utiliser la version de Sage installée via Conda:
```
$ conda activate  # on active Conda

$ which sage
/chemin/vers/sagemath-forge/bin/sage

$ sage
┌────────────────────────────────────────────────────────────────────┐
│ SageMath version 9.4, Release Date: 2021-08-22                     │
│ Using Python 3.8.12. Type "help()" for help.                       │
└────────────────────────────────────────────────────────────────────┘
sage: %colors Linux
sage: quit
Exiting Sage (CPU time 0m0.12s, Wall time 0m16.08s).

$ conda deactivate  # pour désactiver Conda
```

Si on veut que Conda soit toujours activé, ajouter dans un fichier
exécuté au lancement du shell (dans `$HOME/.bash_profile` par
exemple, si on utilise bash) une commande qui l'active:
```
conda activate
```

Amitiés,  --Samuel
```
Voir aussi: <a href="https://doc.sagemath.org/html/en/installation/conda.html">https://doc.sagemath.org/html/en/installation/conda.html</a> 


#### juillet 2021 à janvier 2022

On a eu plusieurs réunions dont on a pas parlé ici. 


#### Séance introduction 10 juin 2021

* <a class="https" href="https://www.labri.fr/perso/vdelecro/presentations/presentation-Sage-2021-Bordeaux.pdf">pdf de présentation (Vincent Delecroix)</a> 


#### jeudi 8 avril 2021

Suggestion de Vincent Delecroix à Pascal Weil: 

Inversion of a group homomorphism on the free group: 

Free group in <a href="/SageMath">SageMath</a>: 


```txt
sage: F = FreeGroup(["a", "b"])
sage: a, b = F.gens()
sage: phi = libgap.GroupHomomorphismByImages(F, F, [a*b, b])
sage: phi.Inverse()
[ a*b, b ] -> [ a, b ]
sage: libgap.Inverse(phi)  # alternative for the above (what is actually called in GAP)
[ a*b, b ] -> [ a, b ]
sage: phi.Inverse().Image(a)
a*b^-1
sage: libgap.Image(phi.Inverse(), a)  # alternative for the above
a*b^-1
sage: libgap.Image(phi.Inverse(), b)
b
```
Or to get the inverse image in their “<a href="/SageMath">SageMath</a> version”: 


```txt
sage: F(libgap.Image(phi.Inverse(), a))
a*b^-1
sage: F(libgap.Image(phi.Inverse(), b))
b
```
Conversion to and from words: 


```txt
sage: F(a*a*b*a**-1*b*b*b).Tietze()
(1, 1, 2, -1, 2, 2, 2)
sage: F((1,2,-1,-1))
a*b*a^-2
```

#### janvier 2020 à mars 2021

Nous avons continué les séances sans en faire de résumé ici. 


#### jeudi 16 janvier 2020

Présents: Sébastien, Jennifer, Pascal, Casey 

Aujourd'hui, on a revu les différences en Python2 et Python3. On trouvera ici un résumé des changements dans le passage à Python 3: 

<a href="https://docs.python.org/3.0/whatsnew/3.0.html">https://docs.python.org/3.0/whatsnew/3.0.html</a> 

<a href="https://stackoverflow.com/questions/5031625/python-3-syntax-changes">https://stackoverflow.com/questions/5031625/python-3-syntax-changes</a> 

On a aidé Pascal à faire fonctionner sage-9.0 sur OSX. Les nouvelles versions de OSX ont des contraintes de sécurité contraignantes empêchant d'ouvrir Sage comme répondu ici par Sylvain: 

<a href="https://ask.sagemath.org/question/49572/sage-90-installation-issues-on-macos-10152-catalina/">https://ask.sagemath.org/question/49572/sage-90-installation-issues-on-macos-10152-catalina/</a> 

Finalement, Casey et Jennifer ont testé la nouvelle interface jupyterlab que l'on peut installer comme suit: 


```txt
sage –pip install jupyterlab
```
et ouvrir comme suit: 


```txt
sage –n jupyterlab
```
Tel que rappelé ici sur <a class="https" href="https://ask.sagemath.org/question/42876/other-than-jupyter-notebook-is-there-any-other-way-to-use-sage/">ask</a>, rappelons que quelques commandes sont nécessaires après l'installation d'une version brute de SageMath avant de pouvoir utiliser pip et installer un package comme jupyterlab: 


```txt
cd $SAGE_ROOT
./sage -i openssl && ./sage -f python3 && make ssl
sage –pip install jupyterlab
```

#### jeudi 9 janvier 2020

<a href="/SageMath">SageMath</a> vient de passer à Python 3, version 3.7.3: 


```txt
┌────────────────────────────────────────────────────────────────────┐
│ SageMath version 9.0, Release Date: 2020-01-01                     │
│ Using Python 3.7.3. Type "help()" for help.                        │
└────────────────────────────────────────────────────────────────────┘
sage:
```

#### jeudi 14 nov 2019

Présents: Sébastien, Jennifer, Pascal 

On a parlé de mutabilité, de fonctions de hash et structures de données en Python. 

Passage à Python 3: voir ce <a class="https" href="https://www.artima.com/weblogs/viewpost.jsp?thread=98196">message</a> de mars 2005 de Guido van Rossum au sujet de map, filter, lambda, reduce. 

Sébastien corrige les problèmes associé à la méthode hash dans son package slabbe. En effet, le nouveau comportement de hash en Python 3 est expliqué ci-bas: 


```txt
fichier.py content:
r"""
New Hash behavior in Python 3

This works in python2::

    $ python2 fichier.py
    8743430846773
    20
    25

But it does not work in Python3::

    $ python3 fichier.py
    8759442356870
    20
    Traceback (most recent call last):
    File "fichier.py", line 16, in <module>
        print(hash(Fraise(25)))
    TypeError: unhashable type: 'Fraise'

The reason is to keep the principle "if A = B implies hash(A) == hash(B)"
valid. In Python 3, the default is that objects are hashable by their id
(class Vegetable in the example below).  But as soon as the equality
`__eq__` is defined (class Fruit in the example below), one must define the
`__hash__` method. And this is the case even if it is defined in the parent
(class Fruit in the example below).

"""

class Vegetable(object):
    def __init__(self, a):
        self._a = a

class Fruit(object):
    def __init__(self, a):
        self._a = a
    def __hash__(self):
        return hash(self._a)

class Fraise(Fruit):
    def __eq__(self, other):
        return self._a == other._a

print(hash(Vegetable(10)))

print(hash(Fruit(20)))

print(hash(Fraise(25)))
```

#### jeudi 7 nov 2019

Présents: Sébastien, Casey, Jennifer, Sebastian, Pascal, Julien Leroy 

Pascal nous a présenté son <a class="https" href="https://www.labri.fr/perso/weil/software/">package stallings_graphs</a> 


#### 31 octobre au 3 novembre 2019

Conférence PyCON à Bordeaux: <a href="https://www.pycon.fr/2019/">https://www.pycon.fr/2019/</a> 


#### jeudi 23 mai 2019

Présents: Sébastien, Vincent K, Pascal 

Sébastien: création d'un fichier de test (en rst) contenant le code contenu dans l'article <a href="http://arxiv.org/abs/1802.03265">http://arxiv.org/abs/1802.03265</a> pour assurer la reproducibilité des résultats à long terme. 

Vincent K:  

* Complétion de <a class="https" href="https://trac.sagemath.org/ticket/27777">#27777</a> 
* Échanges avec Sébastien sur les intégrales monte carlo. 

#### jeudi 16 mai 2019

Présents: Sébastien, Vincent K, Pascal, Adrien 


#### jeudi 9 mai 2019

Présents: Sébastien, Vincent K, Pascal 

Sébastien:  

* posé une question au sujet des tag build et dochtml sur <a class="https" href="https://groups.google.com/d/msg/sage-devel/h9AzZ4jfSRU/Cl9NTaaIAgAJ">sage-devel</a> 
* discuté avec Pascal sur l'utilisation du package traintrack 
* <a class="https" href="https://trac.sagemath.org/ticket/27781">#27781</a> needs review et création de #27782 et #27783 

#### jeudi 2 mai 2019

Présents: Sébastien, Vincent K, Xavier 

Sébastien: amélioration de la documentation et du README de slabbe pour corriger le bug d'affichage sur PyPI. Il y a une nouvelle ligne `long_description_content_type` à mettre dans le fichier setup. Voir ici: <a class="https" href="https://packaging.python.org/guides/making-a-pypi-friendly-readme/">making a PyPI friendly README</a>. 


#### jeudi 11 avril 2019

Présents: Pascal, Vincent K 

Vincent K: 

* gmpy2 : Permettre aux objets mpq d'être initialisée avec des entiers sage : <a class="https" href="https://github.com/aleaxit/gmpy/issues/237">issue #237</a>, <a class="https" href="https://github.com/aleaxit/gmpy/pull/240">PR #240</a> 
* gmpy2 : Modifications pour ne pas appeler mpc_cmp_abs pour les anciennes version de mpc : <a class="https" href="https://github.com/aleaxit/gmpy/issues/238">issue #238</a>, <a class="https" href="https://github.com/aleaxit/gmpy/pull/239">PR #239</a> 
* Discussion avec Pascal sur le passage à python3 des packages. 

#### jeudi 4 avril 2019

Présents: Adrien, Pascal, Vincent K 


#### jeudi 21 mars 2019

Présents: Adrien, Sébastien, Vincent K, Xavier 

* Vincent: gmpy2: <a class="https" href="https://github.com/aleaxit/gmpy/pull/231">PR #231</a>: Résolution de compilation warnings, et d'erreurs de doctests, ajout d'un flag de doctests pour les cas ou l'on utilise une version de mpc < 1.0.0. 
* Adrien: split tikz code in polyomino module 
* Sébastien: correction de failing doctests dans le package slabbe 

#### jeudi 14 mars 2019

Présents: Sébastien, Vincent K, Pascal, Jean-Philippe Labbé 

Pascal et Sébastien: 

* Problème de compilation de la documentation du package stallings_graph de Pascal. Solution: il faut importer tout le cmd_line de sage dans le fichier `__init__.py` du package pour que Sphinx soit content. 
JP: 

* <a class="https" href="https://trac.sagemath.org/ticket/24905">#24905</a> Upgrade polymake to version 3.2r4 
Vincent: 

* sage/polymake: Problèmes de compilation de polymake avec Jean-Philippe Labbé. 
* gmpy2: Ajout de tests de couverture (opérations binaires). 

#### jeudi 7 mars 2019

Présents: Sébastien, Vincent K, Pascal, Adrien 

Pascal et Sébastien: 

* Création de la documentation d'un package avec Sphinx (sphinx-quickstart, fichiers rst, `conf.py`, etc.) 

#### jeudi 28 février 2019

Présents: Sébastien, Vincent K 

Jeudi sage éclair : Discussion d'une demi-heure environ sur les tickets <a class="https" href="https://trac.sagemath.org/ticket/25614">#25614</a> et <a class="https" href="https://trac.sagemath.org/ticket/26592">#26592</a> 

Sébastien:  

* <a class="https" href="https://trac.sagemath.org/ticket/25614">#25614</a> (needs review) 
Vincent K: 

* Review <a class="https" href="https://trac.sagemath.org/ticket/25614">#25614</a> (positive review) 

#### jeudi 21 février 2019

Pause. 


#### jeudi 14 février 2019

Présents: Vincent K, Pascal 

CONFERENCE, <a class="https" href="https://opendreamkit.org/2019/02/11/FreeComputationalMathematicsConference/">Free Computational Mathematics</a>, Calcul mathématique libre, CIRM Luminy, 11 - 15 February 2019 


#### jeudi 7 février 2019

Présents: Sébastien, Vincent K 


#### jeudi 31 janvier 2019

Présents: Sébastien, Vincent K, Adrien, Pascal 

Sébastien:  

* <a class="https" href="https://trac.sagemath.org/ticket/25535">#25535</a> (needs review) 
Vincent K:  

* Review <a class="https" href="https://trac.sagemath.org/ticket/25535">#25535</a> (positive review) 
* Echanges avec Adrien sur l'avenir de la class Derangement <a class="https" href="https://trac.sagemath.org/ticket/26886">#26886</a> 
* pplpy: suivi et tests de solution sur le sujet de la génération de la doc sphinx par sage. <a class="https" href="https://trac.sagemath.org/ticket/23024">#23024</a> 

#### jeudi 24 janvier 2019

Présents: Sébastien, Vincent K, Adrien 

Comment installer et utiliser RISE, une extension du Jupyter Notebook pour faire des présentations éditables. Il ne suffit pas de l'installer il faut aussi recopier les css au bon endroit. Il suffit de faire: 


```txt
sage -pip install rise
sage -sh
jupyter-nbextension install rise --py --sys-prefix
```
Après on peut consulter ce  <a class="https" href="https://youtu.be/sXyFa_r1nxA">démo</a> sur youtube et la <a class="https" href="https://rise.readthedocs.io/en/docs_hot_fixes/index.html">doc est ici</a>. 


#### jeudi 17 janvier 2019

* Atelier <a class="https" href="https://pari.math.u-bordeaux.fr/Events/PARI2019/">PARI/GP 2019</a> 

#### jeudi 10 janvier 2019

Présents: Sébastien, Vincent K, Pascal, Xavier 

Sébastien 

* <a class="https" href="https://trac.sagemath.org/ticket/25384">#25384</a> sage --jupyter command line (needs review) 
Vincent 

* review <a class="https" href="https://trac.sagemath.org/ticket/25535">#25535</a> 
* cysignals windows. 

#### jeudi 20 décembre 2018

Présents: Sébastien, Vincent K, Pascal, Adrien 

Sébastien: 

* <a class="https" href="https://trac.sagemath.org/ticket/26361">#26361</a> Glucose SAT solver (needs review) 
* <a class="https" href="https://trac.sagemath.org/ticket/25501">#25501</a> Few failing internet doctests in mma_free_integrator (needs review) 
* <a class="https" href="https://trac.sagemath.org/ticket/26920">#26920</a> 2 failing doctests in sql_db.py (création du ticket) 
* <a class="https" href="https://trac.sagemath.org/ticket/26921">#26921</a> 1 internet doctest failing in combinat/tutorial.py  (création du ticket, needs review) 
Vincent: 

* cysignals-windows : Nouvelles évolutions et rebases sur la <a class="https" href="https://github.com/sagemath/cysignals/pull/76">PR-76</a> 
* Dans le cadre du ticket [[<a href="https://trac.sagemath.org/ticket/26884|#26884">https://trac.sagemath.org/ticket/26884|#26884</a>]. Discussion avec Adrien sur les notions de morphism  
et parent commun. 
#### jeudi 13 décembre 2018

Présents: Sébastien, Vincent K, Pascal, Xavier, Adrien, Florent 

10h-10h20: un exposé de Florent Hivert, Expérimentations haute performance en combinatoire algébrique et énumérative  

Sébastien:  

* comparaison des MILP solvers, SAT solvers et dancing links via des pavages par tuiles de Wang, les détails sur ce <a class="http" href="http://www.slabbe.org/blogue/2018/12/comparison-of-wang-tiling-solvers/">blogue</a> 
* reviewé le code de Adrien sur les polyomino parallélogrammes (positive review!!) 
* (needs review) correction de l'utilisation de Wolfram Alpha <a class="https" href="https://trac.sagemath.org/ticket/25501">#25501</a> grâce au code suggéré par Amaury Pouly 

#### jeudi 29 novembre 2018

Présents: Sébastien, Vincent K, Pascal 

Sébastien:  

* Review des polyominos paralélogrammes <a class="https" href="https://trac.sagemath.org/ticket/16110">#16110</a> 
* Discussion avec Pascal sur la création de son package, des dépendances, et de l'utilisation de git. 

#### jeudi 22 novembre 2018

Présents: Adrien, Vincent K. 

Vincent K: 

* Complétion du ticket <a class="https" href="https://trac.sagemath.org/ticket/26704">#26704</a>. 
* Review <a class="https" href="https://trac.sagemath.org/ticket/26737">#26737</a>. positive review. 

#### jeudi 15 novembre 2018

Présents: Adrien, Vincent K., Sébastien, Pascal, Xavier, Ilya 

Avec Ilya, nous avons trouvé trois lignes de code pour que les `.plot()` ouvre des pdf plutôt que des png: 


```txt
sage: from sage.repl.rich_output import get_display_manager
sage: dm = get_display_manager()
sage: dm.preferences.graphics = 'vector'  # value must be unset (None) or one of ('disable', 'vector', 'raster')
```
All tests passed in the package of Pascal! 

Vincent K: 

Sortie de la dernière version de gmpy2: 

* Tests de gmpy2 
* Mise à jour pplpy <a class="https" href="https://gitlab.com/videlec/pplpy/merge_requests/3">MR3</a>, <a class="https" href="https://gitlab.com/videlec/pplpy/merge_requests/2">MR2</a>. 
* Mise à jour et tests du package sage gmpy2 <a class="https" href="https://trac.sagemath.org/ticket/25519">#25519</a> 
* Examen avec Adrien des erreurs sage python3 du module modular/hecke 

#### jeudi 8 novembre 2018

Présents: Adrien, Vincent K., Sébastien, Pascal, Xavier 

Sébastien, Pascal: création d'un package Python sur les Finitely generated subgroups 

Adrien: finalisation des corrections sur les polyominos paralélogrammes <a class="https" href="https://trac.sagemath.org/ticket/16110">#16110</a> 

Vincent K.:  

* Review <a class="https" href="https://trac.sagemath.org/ticket/26651">#26651</a> (positive review) 
* Examen avec Adrien d'une différence py2 - py3 apparue sous root_lattice_realizations.py. 
* Ouverture <a class="https" href="https://trac.sagemath.org/ticket/26659">#26659</a> 
Xavier: Coder les piecewise affine function dans Sage 


#### jeudi 1 novembre 2018

vacances de la Toussaint 


#### jeudi 25 octobre 2018

Présents: Adrien, Vincent K., Sébastien, Andrew. 

Sébastien: Création d'un package pour glucose dans Sage: <a class="https" href="https://trac.sagemath.org/ticket/26552">#26552</a> 


#### jeudi 18 octobre 2018

Présents: Pascal, Adrien, Vincent K., Sébastien. 

Sébastien: Discussion avec Pascal sur son projet de Stallings graphs. Création de <a class="https" href="https://trac.sagemath.org/ticket/26502">#26502</a> 


#### jeudi 11 octobre 2018

Présents: Pascal, Adrien, Vincent K. 

Sébastien (au Québec) a fait la revue de <a class="https" href="https://trac.sagemath.org/ticket/26486">#26486</a> (clean distances_all_pairs.pyx) et <a class="https" href="https://trac.sagemath.org/ticket/26348">#26348</a> (3 other internet doctests failing in findstat.py) et a bossé sur: <a class="https" href="https://trac.sagemath.org/ticket/26473">#26473</a> (py3: fix doctests failures of sage/combinat/words/word_*datatype*) 


#### jeudi 4 octobre 2018

Présents: Pascal, Adrien, Vincent K. 

Sébastien (au Québec): <a class="https" href="https://trac.sagemath.org/ticket/25378">#25378</a> (I/O operation on closed file when sage -t --optional=sage,external --logfile is_provided.log) 


#### Jeudi 5 juillet 2018

Présents: Sébastien, Vincent K. 

Sébastien: 

* <a class="https" href="https://trac.sagemath.org/ticket/25537">#25537</a>: needs review 
* reviewed: <a class="https" href="https://trac.sagemath.org/ticket/23416">#23416</a> 

#### Jeudi 28 juin 2018

Présents: Pascal, Milton, Vincent K. 

Milton nous as présenté ses travaux sur les fractions continues multidimensionnelles. 

Vincent K. : 

* <a class="https" href="https://trac.sagemath.org/ticket/25661">#25661</a>: Implémentation et tests. 
* cysignals-windows: Rebase sur la prochaine version cysignals. 

#### Jeudi 21 juin 2018

Présents: Vincent K, Sébastien, Nicolas, Mélodie, Milton 

Sébastien: 

* reviewed <a class="https" href="https://trac.sagemath.org/ticket/25525">#25525</a>, <a class="https" href="https://trac.sagemath.org/ticket/25526">#25526</a> 

#### Jeudi 14 juin 2018

Présents: Pascal, Vincent K. 


#### Jeudi 7 juin 2018

Présents: Pascal, Sebastien, Vincent D., Vincent K., Elise Vandomme ... (à compléter) 


#### Jeudi 31 mai 2018

Présents : Pascal, Milton, Vincent K 


#### Jeudi 24 mai 2018

Présents : Sébastien, Pascal, Milton, Vincent K, Andrew 

* 10h à 10h10: Andrew, C code to solve system of functional equations for series 
Sébastien: 

* fixed issues in <a class="https" href="https://trac.sagemath.org/ticket/25125">#25125</a> which needs review 
* reviewed <a class="https" href="https://trac.sagemath.org/ticket/10091">#10091</a> 

#### Jeudi 17 mai 2018

Présents : Sébastien, Pascal, Milton, Vincent K, Vincent D, Mélodie, Nadia, David, Yvan, Michael 

* 10h à 10h10: Yvan Le Borgne, utilisation de Jupyter pour faire des présentations <a href="https://www.labri.fr/perso/borgne/Jupyter/">https://www.labri.fr/perso/borgne/Jupyter/</a> 
* 10h15 à 10h25: Michael Wallner, utilisation de gfun dans maple, <a href="http://perso.ens-lyon.fr/bruno.salvy/software/the-gfun-package/">http://perso.ens-lyon.fr/bruno.salvy/software/the-gfun-package/</a> 
* 10h30 à 10h40: S. Labbé, démo de code C, Cython et Python dans <a href="/SageMath">SageMath</a>. Voir les fichiers dancing_links.pyx et dancing_links.h dans le <a class="https" href="https://github.com/sagemath/sage/tree/master/src/sage/combinat/matrices">github de SageMath</a> qui interfacent en Cython une implémentation C++ de l'algorithme <a class="https" href="https://en.wikipedia.org/wiki/Dancing_Links">Dancing Links</a> de <a class="https" href="https://arxiv.org/abs/cs/0011047">Donald Knuth</a>. 
**Utilisation de code C dans un fichier externe dans une cellule Jupyter grâce à Cython** 

Contenu du fichier test.c: 
```txt
int my_function(int x)
{
    return x*x;
}
```
Contenu du fichier test.h: 
```txt
int my_function(int x);
```
Contenu d'une cellule Jupyter dans le même répertoire que les fichiers test.h et test.c: 
```txt
%%cython
# distutils: sources = test.c
cdef extern from "test.h":
    int my_function(int)
def my_function_wrapper(int a):
    return my_function(a)
```
Contenu d'une autre cellule normale: 
```txt
my_function_wrapper(10)
```
Vincent D: 

* new ticket <a class="https" href="https://trac.sagemath.org/ticket/25379">#25379</a>, <a class="https" href="https://trac.sagemath.org/ticket/25385">#25385</a> 
* review <a class="https" href="https://trac.sagemath.org/ticket/25209">#25209</a>, <a class="https" href="https://trac.sagemath.org/ticket/24783">#24783</a>, <a class="https" href="https://trac.sagemath.org/ticket/25379">#25379</a>, <a class="https" href="https://trac.sagemath.org/ticket/25305">#25305</a>, <a class="https" href="https://trac.sagemath.org/ticket/20181">#20181</a>, <a class="https" href="https://trac.sagemath.org/ticket/25377">#25362</a>, <a class="https" href="https://trac.sagemath.org/ticket/25377">#25362</a>, <a class="https" href="https://trac.sagemath.org/ticket/25370">#25370</a>. 
Sébastien: 

* new ticket <a class="https" href="https://trac.sagemath.org/ticket/25378">#25378</a> 
Mélodie: 

* new ticket <a class="https" href="https://trac.sagemath.org/ticket/25384">#25384</a> 

#### Jeudi 10 mai 2018

Congé. 


#### Jeudi 3 mai 2018

Présents : Sébastien, Pascal, Milton 

* Discussion sur l'égalité et la décomposition en cycles pour les sous-groupes finiment engendrés du groupe libre 
* Discussion sur les Tree Patch et substitutions d'arbres 

#### Jeudi 26 avril 2018

Présents : Vincent K, Sébastien, Pascal 

* Sébastien a fait la relecture de <a class="https" href="https://trac.sagemath.org/ticket/25218">#25218</a> 
* Discussion sur la création de classes pour les sous-groupes finiment engendrés du groupe libre 

#### Jeudi 19 avril 2018

Présents : Vincent K, Vincent D, Milton, Pascal 

* Pascal a présenté son projet sur les Stallings graphs 

#### Jeudi 12 avril 2018

Présents : Sebastien Labbé et Vincent Klein 

* Sébastien a fait la relecture de <a class="https" href="https://trac.sagemath.org/ticket/25120">#25120</a> et <a class="https" href="https://trac.sagemath.org/ticket/25121">#25121</a> 
* Vincent : (cysignals-windows). Dev et test sur le monkey patch des distutils pour cysignals.  

#### Jeudi 5 avril 2018

Présents : Sebastien Labbé, Milton et Vincent Klein 

* Sébastien a fait la relecture de <a class="https" href="https://trac.sagemath.org/ticket/24880">#24880</a> 
* Milton et Sébastien ont finalisé l'utilisation du Minkowski embedding coder la projection des k-faces dans les substitutions géométriques : <a href="https://github.com/miltminz/EkEkstar">https://github.com/miltminz/EkEkstar</a> 
* Vincent K. : 
         * #24880: Gestion retours et passage en need_review. 
         * #24966: Test sous High Sierra. 

#### Jeudi 29 Mars 2018

Pause, trop d'absent. 


#### Jeudi 22 Mars 2018

Présents : Sebastien Labbé, Pascal Weil, Milton et Vincent Klein 

* Milton nous a fait une démo de son code sur les substitutions géométriques : <a href="https://github.com/miltminz/EkEkstar">https://github.com/miltminz/EkEkstar</a> 
* Pascal : Random Stallings graphs 
* Vincent K : cysignals-windows : Rebase et tests. 
* Sébastien : Aide et écriture de la démo de Milton en <a class="https" href="https://github.com/seblabbe/EkEkstar/blob/master/demos/2018-03-22-demo.rst">demo.rst</a> et <a class="https" href="https://github.com/seblabbe/EkEkstar/blob/master/demos/2018-03-22-demo.ipynb">demo.ipynb</a> 

#### Jeudi 15 Mars 2018

* Pascal : Random Stallings graphs 
* Vincent K : Ouverture <a href="https://github.com/sagemath/cysignals/issues/75">https://github.com/sagemath/cysignals/issues/75</a> et merge de branches. 
* Sébastien : Aide et travail sur Wang tilings 

#### Jeudi 8 Mars 2018

* Vincent D 
         * review <a class="https" href="https://trac.sagemath.org/ticket/24828">#24828 (length-checking iterator)</a> 
         * creating <a class="https" href="https://trac.sagemath.org/ticket/24927">#24927 (arb upgrade)</a> 
         * improving <a class="https" href="https://trac.sagemath.org/ticket/24575">#24575 (make and LD_LIBRARY_PATH mess)</a> (voir aussi <a class="https" href="https://trac.sagemath.org/ticket/24902">#24902</a>) 
* Vincent K 
      * Passage en need review <a class="https" href="https://trac.sagemath.org/ticket/23852">#23852 (length-checking iterator)</a>.  
      * cysignals-windows: Fix patch distutils pour python3.4 64 bits.  

#### Jeudi 8 Février 2018

9 participants! 


#### Jeudi 1er Février 2018

* démo par Vincent Delecroix et Bill Allombert du calcul de groupes de Galois 
* tentative de reproduire les calculs de Shigeki Akiyama sur les polytopes qui minimise l'aire de surface 

#### Jeudi 25 janvier 2018

Présents : Sebastien Labbé, Milton et Vincent Klein 

Vincent K. 

* cysignals : Etude d'une implémentation sous windows. 
* Suivi sur <a class="https" href="https://trac.sagemath.org/ticket/22928">#22928</a> 

#### Jeudi 18 janvier 2018

Présents : Pascal Weil, Sebastien Labbé et Vincent Klein 

Vincent K. 

* Echanges avec Pascal Weil 
* cypari2 : Retours sur la proposition des unittest. 
* Point d'avancement odk avec Seb. 

#### Jeudi 21 décembre 2017

* .. todo ... 

#### Jeudi 14 décembre 2017

Sébastien Labbé et Pascal Weil: 

* Génération aléatoire de graphes de Stallings, le code est ici: <a class="https" href="https://github.com/seblabbe/slabbe/blob/develop/slabbe/partial_injection.py">partial_injection.py</a> 

#### Jeudi 30 Novembre 2017

Vincent D 

* discussion sur la parentalité et les catégories <a class="https" href="https://trac.sagemath.org/ticket/21380">https://trac.sagemath.org/ticket/21380</a> 
Sébastien et Vincent D: 

* Génération aléatoire et uniforme d'injections partielles (question de Pascal Weil) <a class="https" href="https://github.com/seblabbe/slabbe/blob/develop/slabbe/partial_injection.py">partial_injection.py</a> 
Vincent K 

* Syntax higlihting sur le kernel jupyter de singular <a class="https" href="https://github.com/OpenDreamKit/OpenDreamKit/issues/175">OpenDreamKit #175</a>, <a class="https" href="https://github.com/sebasguts/jupyter_kernel_singular/pull/7">PR #7</a>. 

#### Jeudi 16 Novembre 2017

Vincent K : 

* gmpy2 résolution <a class="https" href="https://github.com/aleaxit/gmpy/issues/170">issue #170</a>. 
* <a class="https" href="https://trac.sagemath.org/ticket/22928">#22928</a> conversion entre nombres complexes sage et type gmpy2. 

#### Jeudi 19 octobre 2017

* Sebastien nous as présenté son package slabbe 
      * Auditeurs : Philippe, José, Vincent K. 

#### Jeudi 12 octobre 2017

* (Vincent D) présentation du logiciel Sage (auditeurs: Philippe, Lamine). L'objectif était de montrer comment manipuler des équations (algébriques ou symboliques) 

#### Jeudi 21 septembre 2017

* Présentation de Vincent Klein 
* Présentation d'Aurel Page 

#### Jeudi 14 septembre 2017

Sébastien: 

* Review du ticket <a class="https" href="https://trac.sagemath.org/ticket/23779">#23779</a> (positive_review): dev_tools is wrongly using globals() 
* Review du ticket <a class="https" href="https://trac.sagemath.org/ticket/23849">#23849</a> (positive_review): Remove deprecation from optional_packages documentation and friends 
* Review du ticket <a class="https" href="https://trac.sagemath.org/ticket/23851">#23851</a> (positive_review): Fix memoryleak introduced in #11670 
* Review du ticket <a class="https" href="https://trac.sagemath.org/ticket/23860">#23860</a> (positive_review): C++ clean up in dancing_links.pyx 
Vincent D: 

* s'est battu bat avec GAP <a class="https" href="https://trac.sagemath.org/ticket/23844">#23844</a>, <a class="https" href="https://trac.sagemath.org/ticket/23853">#23853</a>, <a class="https" href="https://trac.sagemath.org/ticket/23854">#23854</a>, les graphes (<a class="http" href="http://pallini.di.uniroma1.it/">nauty</a> est génial!) et les polynômes de Laurent <a class="https" href="https://trac.sagemath.org/ticket/23864">#23864</a> 
Vincent K: 

* Travail sur la generation de tests pour <a class="https" href="https://github.com/defeo/cypari2">cypari2</a> 
* Syntax Highlightning de pari-jupyter : Tentative d'installation du kernel de gap <a class="https" href="https://github.com/gap-packages/jupyter-kernel-gap/issues/43">issue #43</a>  

#### Jeudi 29 juin 2017

Vincent K. 

* Review du ticket <a class="https" href="https://trac.sagemath.org/ticket/22889">#22889</a> (positive_review) 

#### Jeudi 22 juin 2017

Sylvain L. est venu nous présenter Wali (la suite de Vaucanson)! Intégration dans Sage en prévision... à suivre! 

Vincent D. 

* demande d'intégration (traduction approximative de "pull request") à gmpy2 <a class="https" href="https://github.com/aleaxit/gmpy/pull/148">DI #148</a> et <a class="https" href="https://github.com/aleaxit/gmpy/pull/149">DI #149</a> 
* <a class="https" href="https://github.com/aleaxit/gmpy/issues/150">issue #150</a> dans gmpy2 
* <a class="https" href="https://github.com/sympy/sympy/pull/12784">DI #12784</a> dans sympy pour régler <a class="https" href="https://github.com/sympy/sympy/issues/12753">issue #12753</a>. Et portage dans Sage avec le <a class="https" href="https://trac.sagemath.org/ticket/23248">ticket #23248</a> 
* travail dans pypolymake autour de <a class="https" href="https://github.com/videlec/pypolymake/issues/12">issue #12</a> 
* nouveau <a class="https" href="https://trac.sagemath.org/ticket/23309">ticket #23309</a> pour rendre gmpy2 standard 
Vincent K. 

* Travail sur <a class="https" href="https://trac.sagemath.org/ticket/22928">#22928</a> et <a class="https" href="https://trac.sagemath.org/ticket/22927">#22927</a>, integration du type gmpy.mpfr avec les nombres sage. 
* Ouverture du ticket <a class="https" href="https://trac.sagemath.org/ticket/23308">#23308</a> 

#### Jeudi 15 juin 2017

Sébastien L is reviewing: 

* <a class="https" href="https://trac.sagemath.org/ticket/23162">#23162</a> (positive_review) Give a warning when using citation.get_systems() without Cython profiling  
* <a class="https" href="https://trac.sagemath.org/ticket/16110">#16110</a> (needs work with 21 comments:) Parallelogram Polyomino  
Vincent K 

* Travail sur pplpy 
* Travail sur les tickets <a class="https" href="https://trac.sagemath.org/ticket/23024">#23024</a> et <a class="https" href="https://trac.sagemath.org/ticket/22928">#22928</a> 
* Ouverture du ticket <a class="https" href="https://trac.sagemath.org/ticket/23246">#23246</a> 
Vincent D 

* Travil sur pplpy (problème de pickling) 
* Ouverture du ticket <a class="https" href="https://trac.sagemath.org/ticket/23248">#23248</a> 

#### Mardi 13 juin 2017

Vincent K  

* Travail sur pplpy. Notamment <a class="https" href="https://github.com/videlec/pplpy/issues/22">issue #22</a> 

#### jeudi 1 juin 2017

Adrien is working on ticket <a class="https" href="https://trac.sagemath.org/ticket/16110">#16110</a> of Parallelogram polyominoes.  

Vincent K 

* Travail sur l'intégration de pplpy dans sage (<a class="https" href="https://trac.sagemath.org/ticket/23024">#23024</a>) 

#### jeudi 18 mai 2017

Sébastien is reviewing the following tickets and making sure they work on OSX: 

* <a class="https" href="https://trac.sagemath.org/ticket/22999">#22999</a>: update cmake to version 3.8.1 
* <a class="https" href="https://trac.sagemath.org/ticket/22817">#22817</a>: Package cryptominisat 5 
* <a class="https" href="https://trac.sagemath.org/ticket/22818">#22818</a>: Interface cryptominisat 5 
Vincent D & K 

* <a class="https" href="https://github.com/aleaxit/gmpy/pull/137">PR #137 pour gmpy2</a> 
* travail sur <a class="https" href="https://github.com/videlec/pplpy/">pplpy</a> 
* Ouverture et travail sur le ticket <a class="https" href="https://trac.sagemath.org/ticket/23024">#23024</a> 

#### jeudi 11 mai 2017

Sébastien a reviewé: 

* (positive review) <a class="https" href="https://trac.sagemath.org/ticket/21993">#21993</a>: Polyhedron.integral_points(): Overflow Error: value too large to convert to int 
* (needs work) <a class="https" href="https://trac.sagemath.org/ticket/21295">#21295</a>: recognizable series (a base for k-regular sequences) 
Vincent D a finalisé (needs review) <a class="https" href="https://trac.sagemath.org/ticket/22970">#22970</a>:  use flint fmpq_mat for rational dense matrices 

Vincent K a travaillé sur <a class="https" href="https://trac.sagemath.org/ticket/22928">#22928</a>: Conversions/coercions between gmpy2 and Sage 


#### jeudi 13 avril 2017

Finalement, on a plutôt travaillé dans le grand bureau de Vincent K qui offrait du réseau. 

Autour de <a class="https" href="https://github.com/aleaxit/gmpy">gmpy2</a> et <a class="https" href="https://github.com/videlec/pplpy">pplpy</a> 

* petit test d'utilisation de gmpy2 en cython <a href="https://github.com/vinklein/testgmpy2">https://github.com/vinklein/testgmpy2</a> et début d'intégration dans pplpy 
* pull request pour installer les fichier d'en-tête avec gmpy2 <a href="https://github.com/aleaxit/gmpy/pull/130">https://github.com/aleaxit/gmpy/pull/130</a> 