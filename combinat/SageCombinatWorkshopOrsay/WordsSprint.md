'''Words Sprint''' (FrancoSaliola, Sébastien Labbé, Vincent Delecroix)

 * New implementation for words:
   * faster
   * space efficient
   * special class for words over an alphabet of at most two letters (each letter takes one bit)
   * consider using Streams and (Lazy)Familys here.

 * bi-infinite words, bi-infinite alphabets, words indexed by other objects besides integers

 * look through the algorithms for finite words, and identify the ones that need improvement (some are really slow, like is_subword_of)

 * words over the an alphabet of elements of a group

 * New classes:
   * Language
   * FixedPointOfMorphism

 * Geometrization:
   * WordMorphism, following the work of G. Rauzy, A. Siegel, P. Arnoux, ...
   * Word Paths, via words as paths in a lattice
   * Dyck Word, discussions about getting Dyck Words inherits from Word Paths. Comparisons of efficiency.


---

Un-organized ideas:

 * ideas for improving to the code (Stream for infinite words?) (Vincent Delecroix)
 * discussions regarding the trac #5002
 * finish and post words_new_fct_sl.patch to trac #5037
 * create a Lyndon word class
 * trac #4954: Words_over_Alphabet should check the type of input alphabet
 * Add Generalized Thue-Morse words to words.[TAB]
 * Add Random Word and Random Testing
 * Add Notes about words library
 * '''Word Morphism''' -- Word Morphism actually herits from SageObject and it should be a more general Morphism class. (Sébastien Labbé). 
 * Discussion about the content-datastructure-as-subobject (anti?)design pattern
 * '''Fixed points of word morphisms''' -- Create of a new class derived from InfinteWord for fixed point of a WordMorphism. It's necessary to consider those words as very special infinite words because most of the 'infinite objects' associated (language, complexity, ...) can be computed. (Vincent Delecroix).
 * Class for biinfinite words, and words indexed by anything (Z^2^, Z^n^, graphs, ...). (Vincent Delecroix)
