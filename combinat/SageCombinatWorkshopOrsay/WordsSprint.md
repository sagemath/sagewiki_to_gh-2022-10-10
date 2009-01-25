'''Words Sprint''' (FrancoSaliola, Sébastien Labbé, Vincent Delecroix)

 * New implementation for words:
   * faster
   * space efficient
   * special class for words over an alphabet of at most two letters (each letter takes one bit)
   * consider using Streams and (Lazy)Familys here.
   * discussion about the content-datastructure-as-subobject (anti?)design pattern
   * allow for words over arbitrary alphabets? (example, the alphabet of the elements of a group)

 * New classes:
   * Language
   * FixedPointOfMorphism (things like the language, complexity, ..., can be computed).
   * Lyndon word class
   * Dyck Word, discussions about getting DyckWord to inherit from WordPaths, comparisons of efficiency.
   * bi-infinite words, or more generally, words indexed by objects other than integers
   * bi-infinite alphabets (like integers)

 * New words:
   * Generalized Thue-Morse words to words.[TAB]
   * Add Random Word and Random Testing

 * Geometrization:
   * WordMorphism, following the work of G. Rauzy, A. Siegel, P. Arnoux, ...
   * Word Paths, via words as paths in a lattice

 * Miscellaneous:
   * add notes about words library
   * trac #4954: Words_over_Alphabet should check the type of input alphabet
   * finish and post words_new_fct_sl.patch to trac #5037
   * discussions regarding the trac #5002
   * look through the algorithms for finite words, and identify the ones that need improvement (some are really slow, like ''is_subword_of'')
   * WordMorphism, inherits from SageObject and it should be a more general Morphism class.
