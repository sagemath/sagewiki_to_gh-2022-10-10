
This page aims to have a list some unreferenced bugs that people will have to report on the trac server during the "how to report a bug" session. We need to find about 20 bugs, to be found among the sage documentation. You should mention which version of sage (4.6 or 4.6.1) is used. 


## documentation bugs

   * english error:  ':' should not be preceded by a space. 
         * by file 
               * combinat/words/paths.py 
               * combinat/words/word.py 
               * combinat/skew_partition.py 
               * crypto/mq/mpolynomialsystem.py 
               * crypto/mq/sr.py 
   * Reference manual 
         * in the index some of the titles have an ending point some not... 
   * INPUT or OUTPUT non-provided 
         * w = Word('12112') and  
               * w.conjugate? ("pos can be any integer") 
               * w = Word('12112') and w.is_cadence?  
               * w = Word('12112') and w.return_words? 
               * w = Word('12112') and w.complete_return_words? 
               * w = Word('12112') and w.return_words_derivate? 
         * delta_derivate, delta_derivate_left, delta_derivate_right : the W input is not explained. 
         * graphs generators without intput: 
               * sage: graphs.<a href="/CircularLadderGraph">CircularLadderGraph</a>? 
               * sage: graphs.<a href="/CycleGraph">CycleGraph</a>? 
               * sage: graphs.<a href="/ToroidalGrid2dGraph">ToroidalGrid2dGraph</a>? 
               * sage: graphs.<a href="/Grid2dGraph">Grid2dGraph</a>? 
               * sage: graphs.<a href="/LadderGraph">LadderGraph</a>? 
               * sage: graphs.<a href="/LollipopGraph">LollipopGraph</a>? 
               * sage: graphs.<a href="/PathGraph">PathGraph</a>? 
               * sage: graphs.<a href="/StarGraph">StarGraph</a>? 
               * sage: graphs.<a href="/WheelGraph">WheelGraph</a>? 
               * sage: graphs.<a href="/KneserGraph">KneserGraph</a>? 
               * sage: graphs.<a href="/OddGraph">OddGraph</a>? 
               * sage: graphs.<a href="/MycielskiStep">MycielskiStep</a>? 
               * sage: graphs.<a href="/CompleteGraph">CompleteGraph</a>? 
               * sage: graphs.<a href="/CompleteBipartiteGraph">CompleteBipartiteGraph</a>? 
               * sage: graphs.<a href="/CubeGraph">CubeGraph</a>? [this could also be nice to replace 'n' by 'dimension'] 
               * sage: graphs.<a href="/FuzzyBallGraph">FuzzyBallGraph</a>? 
               * sage: graphs.<a href="/DorogovtsevGoltsevMendesGraph">DorogovtsevGoltsevMendesGraph</a>? 
               * sage: graphs.RandomGNP? 
         * words generator without input: 
               * sage: words.<a href="/CodingOfRotationWord">CodingOfRotationWord</a>? 
   * "Developer guide": "Conventions for Coding in Sage" - "Documentation strings", the Note at the end of "Docstring markup with ReST and Sphinx" has a lot of misprinted characters (SAGE_ROOT appears with subscript R) 
   * "Developer guide": <a href="http://sagemath.org/doc/developer/conventions.html#documentation-strings">http://sagemath.org/doc/developer/conventions.html#documentation-strings</a> '.. link::' should be '.. link' 

## wish list

   * graphs : implement the <a class="http" href="http://en.wikipedia.org/wiki/Y-%CE%94_transform#Graph_theory">delta-y transformation</a>. 
   * graphs : construction of the <a class="http" href="http://en.wikipedia.org/wiki/Petersen_family">Petersen family</a>. 
   * crypto : implement the <a class="http" href="http://en.wikipedia.org/wiki/Enigma_machine">enigma cryptosystem</a>. 
   * Subsets : implement subsets of an infinite set.  

## other bugs

   * fix indentation in the  
         * combinat/sf/schur.py 
         * combinat/sf/macdonald.py 
         * combinat/sf/powersum.py 
         * combinat/sf/elementary.py 
* add definitions, references and examples 
      * combinat/composition.py: in particular Composition_class.conjugate see <a href="http://en.wikipedia.org/wiki/Composition_(number_theory">http://en.wikipedia.org/wiki/Composition_(number_theory</a>) 
      * combinat/composition_signed.py 
      * combinat/dyck_word.py: see <a href="http://en.wikipedia.org/wiki/Catalan_number">http://en.wikipedia.org/wiki/Catalan_number</a> 
      * combinat/yamanouchi.py: unintelligible definition (see Wikipedia <a href="http://en.wikipedia.org/wiki/Yamanouchi_word">http://en.wikipedia.org/wiki/Yamanouchi_word</a> or Fulton, William (1997), Young tableaux, London Mathematical Society Student Texts, 35, Cambridge University Press, MR1464693, or M. Lothaire, Algebraic combinatorics on words, Encyclopedia of Mathematics  
      * combinat/lyndon_word.py: no definition of Lyndon word, no reference... see Lothaire, Algebraic combinatorics on words, p. 5, and <a href="http://en.wikipedia.org/wiki/Lyndon_word">http://en.wikipedia.org/wiki/Lyndon_word</a> 
      * algebras/quatalg/quaternion_algebra.py : more examples in the ramified_primes method 

## bugs listed during the talks and tutorials on Monday

* problèmes lors de l'effacement d'espaces initiaux d'une cellule unique dans une worksheet du notebook 
   * situation: nouvelle worksheet, la worksheet contient une seule cellule, on tape un ou plusieurs espaces dans la cellule 
   * action: on appuie sur la touche backspace 
   * effet (on attendrait l'effacement des espaces un par un): 
      * utilisateur 1: backspace ne produit aucun effet 
      * utilisateur 2: backspace efface la cellule 
* <a href="/KleinFourGroup">KleinFourGroup</a> first example bad rest syntax 
* fonctionnement du notebook pas assez intuitif pour nouvel utilisateur 
* petite croix pour fermer la doc dans le notebook (à côté de pop-out) 
* appuyer 2 fois ou plus sur tab dans le notebook avec une chaîne du type "Graph(" 
* matrix(NN,<a href="/..%5D%2C..%2C%5B..">..],..,[..</a>) n'aime probablement que les anneaux mais ne le dit pas clairement 
* docbuild: les cellules vides ne sont pas construites 
* Partition: pp() -> pretty_print() 
   * note: similar functionality is offered by ferrers_diagram() 
* Permutations(4).random_element? réécrire la doc 
* ticket <a href="/CartesianProduct">CartesianProduct</a>().random_element 
* la doc de <a href="/IntegerVector">IntegerVector</a> devrait renvoyer à la doc de <a href="/IntegerListsLex">IntegerListsLex</a> pour la liste des options 
* a worksheet saved as a .txt can't be uploaded using an url from the notebook main page 