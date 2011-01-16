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

== whish list ==

  * graphs : implement the [[http://en.wikipedia.org/wiki/Y-%CE%94_transform#Graph_theory|delta-y transformation]].
  * graphs : construction of the [[http://en.wikipedia.org/wiki/Petersen_family|Petersen family]].
  * crypto : implement the [[http://en.wikipedia.org/wiki/Enigma_machine|enigma cryptosystem]].


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
