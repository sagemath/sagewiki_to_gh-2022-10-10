'''Words Sprint''' (FrancoSaliola, Sébastien Labbé, Vincent Delecroix)

 * New implementation for words:
   * faster [some caching will be implemented]
   * space efficient
   * special class for words over an alphabet of at most two letters (each letter takes one bit)
   * '''[DONE: Franco added two new classes for caching for words from iterators and functions; caching can be turned off through WordOptions]''': consider using Streams and (Lazy)Familys here. [Streams doesn't exactly do what we need, but the ideas are interesting (caching)]
   * discussion about the content-datastructure-as-subobject (anti?)design pattern
   * '''[DONE: Franco implemented any CombinatorialClass as an alphabet]''' : allow for words over arbitrary alphabets? (example, the alphabet of the elements of a group) 

 * New classes:
   * '''Sebastien, Vincent''': Language
   * '''Vincent''': FixedPointOfMorphism (things like the language, iterator with logarithmic storage, complexity, ..., can be computed).
   * Lyndon word class
   * Dyck Word, discussions about getting DyckWord to inherit from Language, comparisons of efficiency.
   * bi-infinite words, or more generally, words indexed by objects other than integers
   * bi-infinite alphabets (like integers)

 * New words:
   * '''[DONE: Sebastien]''' Generalized Thue-Morse words to words.[TAB]
   * [needs fixing] Add Random Word (combine arguments m and alphabet)
   * fix random_element for Words 
   * Random Testing (how do we do this?)

 * Geometrization:
   * '''Vincent, Sebasiten, Franco''': WordMorphism, following the work of G. Rauzy, A. Siegel, P. Arnoux, ...
   * '''Sebastien''': Word Paths, via words as paths in a lattice

 * Miscellaneous:
   * add notes about words library
   * trac #4954: Words_over_Alphabet should check the type of input alphabet (related to allowing CombinatorialClass as alphabets)
   * finish and post words_new_fct_sl.patch to trac #5037
   * '''[DONE: Franco implemented an alphabet of integers, ordered naturally]''' discussions regarding the trac #5002
   * look through the algorithms for finite words, and identify the ones that need improvement (some are really slow, like ''is_subword_of'')
   * WordMorphism, inherits from SageObject and it should be a more general Morphism class.
