This page aims to have a list some unreferenced bugs that people will have to report on the trac server during the "how to report a bug" session. We need to find about 20 bugs, to be found among the sage documentation. You should mention which version of sage (4.6 or 4.6.1) is used.


== documentation bugs ==
  * english error:  ':' should not be preceded by a space.
    * by file
      * combinat/words/paths.py
      * combinat/words/word.py
      * combinat/skew_partition.py
      * crypto/mq/mpolynomialsystem.py
      * crypto/mq/sr.py
    * by method or class
      * method is_interval() for graphs (AUTHOR)
      * KazhdanLusztigPolynomial class (EXAMPLES)
      * IwahoriHeckeAlgebraT class (EXAMPLES)
  * Reference manual
    * in the index some of the titles have an ending point some not...
    * MISSING TITLE for Combinatorial Functions (first item in combinatorics)
  * INPUT or OUTPUT non-provided
    *  w = Word('12112') and 
      * w.conjugate? ("pos can be any integer")
      *  w = Word('12112') and w.is_cadence? 
      *  w = Word('12112') and w.return_words?
      *  w = Word('12112') and w.complete_return_words?
      *  w = Word('12112') and w.return_words_derivate?
    * delta_derivate, delta_derivate_left, delta_derivate_right : the W input is not explained.
    * graphs generators without intput:
      * sage: graphs.CircularLadderGraph?
      * sage: graphs.CycleGraph?
      * sage: graphs.ToroidalGrid2dGraph?
      * sage: graphs.Grid2dGraph?
      * sage: graphs.LadderGraph?
      * sage: graphs.LollipopGraph?
      * sage: graphs.PathGraph?
      * sage: graphs.StarGraph?
      * sage: graphs.WheelGraph?
      * sage: graphs.KneserGraph?
      * sage: graphs.OddGraph?
      * sage: graphs.MycielskiStep?
      * sage: graphs.CompleteGraph?
      * sage: graphs.CompleteBipartiteGraph?
      * sage: graphs.CubeGraph? [this could also be nice to replace 'n' by 'dimension']
      * sage: graphs.FuzzyBallGraph?
      * sage: graphs.DorogovtsevGoltsevMendesGraph?
      * sage: graphs.RandomGNP?
    * words generator without input:
      * sage: words.CodingOfRotationWord?
  * "Developer guide": "Conventions for Coding in Sage" - "Documentation strings", the Note at the end of "Docstring markup with ReST and Sphinx" has a lot of misprinted characters (SAGE_ROOT appears with subscript R)
  * "Developer guide": http://sagemath.org/doc/developer/conventions.html#documentation-strings '.. link::' should be '.. link'










== wish list ==

  * graphs : implement the [[http://en.wikipedia.org/wiki/Y-%CE%94_transform#Graph_theory|delta-y transformation]].
  * graphs : construction of the [[http://en.wikipedia.org/wiki/Petersen_family|Petersen family]].
  * crypto : implement the [[http://en.wikipedia.org/wiki/Enigma_machine|enigma cryptosystem]].
  * Subsets : implement subsets of an infinite set. 


== other bugs ==
  * fix indentation in the 
    * combinat/sf/schur.py
    * combinat/sf/macdonald.py
    * combinat/sf/powersum.py
    * combinat/sf/elementary.py

 * add definitions, references and examples
   * combinat/composition.py: in particular Composition_class.conjugate see http://en.wikipedia.org/wiki/Composition_(number_theory)
   * combinat/composition_signed.py
   * combinat/dyck_word.py: see http://en.wikipedia.org/wiki/Catalan_number
   * combinat/yamanouchi.py: unintelligible definition (see Wikipedia http://en.wikipedia.org/wiki/Yamanouchi_word or Fulton, William (1997), Young tableaux, London Mathematical Society Student Texts, 35, Cambridge University Press, MR1464693, or M. Lothaire, Algebraic combinatorics on words, Encyclopedia of Mathematics 
   * combinat/lyndon_word.py: no definition of Lyndon word, no reference... see Lothaire, Algebraic combinatorics on words, p. 5, and http://en.wikipedia.org/wiki/Lyndon_word
   * algebras/quatalg/quaternion_algebra.py : more examples in the ramified_primes method

== bugs listed during the talks and tutorials on Monday ==

 * problèmes lors de l'effacement d'espaces initiaux d'une cellule unique dans une worksheet du notebook
  * situation: nouvelle worksheet, la worksheet contient une seule cellule, on tape un ou plusieurs espaces dans la cellule
  * action: on appuie sur la touche backspace
  * effet (on attendrait l'effacement des espaces un par un):
   * utilisateur 1: backspace ne produit aucun effet
   * utilisateur 2: backspace efface la cellule
 * KleinFourGroup first example bad rest syntax
 * fonctionnement du notebook pas assez intuitif pour nouvel utilisateur
 * petite croix pour fermer la doc dans le notebook (à côté de pop-out)
 * appuyer 2 fois ou plus sur tab dans le notebook avec une chaîne du type "Graph("
 * matrix(NN,[[..],..,[..]]) n'aime probablement que les anneaux mais ne le dit pas clairement
 * docbuild: les cellules vides ne sont pas construites
 * Partition: pp() -> pretty_print()
  * note: similar functionality is offered by ferrers_diagram()
 * Permutations(4).random_element? réécrire la doc
 * ticket CartesianProduct().random_element
 * la doc de IntegerVector devrait renvoyer à la doc de IntegerListsLex pour la liste des options
 * a worksheet saved as a .txt can't be uploaded using an url from the notebook main page
