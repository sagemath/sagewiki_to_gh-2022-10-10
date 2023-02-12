
This page gathers ideas for refactorization of sage.combinat.words and implementation of tilings. You can subscribe to the associated <a class="https" href="https://lma.metelu.net/mailman/listinfo/sage-words">mailing-list</a> to discuss about this. 

[[_TOC_]] 


# How do I implement my language ? my tiling ?

There are different places to look at for examples: 

* sage.categories.examples.languages: two examples of languages. <a href="/PalindromicLanguages">PalindromicLanguages</a> (the language of palindromes) and <a href="/UniformMonoid">UniformMonoid</a> (the submonoid of the free monoid on {a,b} that contains as many a as b). 
* sage.monoids.free_monoid: implementation of the free monoid. 
* sage.combinat.languages.*: where most implementation of languages should go (currently there is only one_balanced_language and finite_word_language) 
For shifts and tilings, there is (up to now) almost nothing: 

* sage.categories.shifts 
* sage.dynamics.symbolic.full_shift: the full shift 

# Structure

The refactorization of the current code should go in the patch <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12224">#12224</a> which is almost done. Up to now the code is a bit dissaminated everywhere in Sage.. 


## General overview

* sage.categories: Most of the generic code is contained there. 
      * .languages: A language is a subset of A^* where A is a set called alphabet. It is naturally graded by N and the grading is called the length. 
      * .shifts: the category of shift A^G (where G is a semigroup for which the operation x -> gx is injective for any g in G and A is a set called alphabet) 
* sage.combinat.words 
      * data structure for finite and infinite words 
      * backward compatibility with the previous version 
      * morphisms (should we move it to sage.monoids.free_monoid_morphism ?) 
* sage.monoids 
      * .free_monoid: the free monoid (replaces part of sage.combinat.words.words.Words) 
* sage.dynamics.symbolic 
      * .full_shift: an implementation of the full shift (replaces part of sage.combinat.words.words.Words) 
* sage.combinat.languages 
      * implementation of different languages (balanced, language of a finite word, ...) 
      * specific data structure (suffix tree/trie, rauzy graph, return tree, ...) 

## Classes for finite words

The base class for all finite words is currently in sage.combinat.words.finite_word and is called <a href="/FiniteWord">FiniteWord</a>. Some generic algorithms are implemented in the category of languages and factorial languages. The specific classes are 

* sage.combinat.words.word_sequence 
         * Word_char: a word whose underlying datastructure is a C array of unsigned char 
         * Word_python_object: a subclass of the one above dedicated for strings 
      * Those two classes benefit from algorithms implemented in pure C that may be found in sage.combinat.words.algorithms 
* sage.combinat.words.lazy_word: 
         * <a href="/FiniteWord">FiniteWord</a>_iterable: word built from iterators 
         * <a href="/FiniteWord">FiniteWord</a>_callable: word built from a function 
         * <a href="/ConcatenationFiniteFinite">ConcatenationFiniteFinite</a>: word built as the concatenation of two words (this class is intended for concatenation of huge words) 

## Comments

What is bad/nice with categories: 

* inheritance of generic code 
* a bit confusing for the user who want to find the implementation of a method 
* confusing for the person who writes the code and ask "where should I put this ?" 
* ... 
What do we keep? What categories do we create? Do we provide a default _element_constructor_ in the category (if yes, it is highly incompatible with facade)? 

In a next future we should think about mutability/immutability. 


# Algorithmic and naming conventions

== Behavior of algorithms with infinite input data = 

What to do for equality of infinite words ? 

What should do 
```txt
sage: w1 == w2
```
Two possibilities:  

1. test the first XXX letters for finding a difference. If find one then returns False otherwise raise an error, "seems to be equal use .is_equal(force=True) to launch the infinite test". 
1. test all letters and never return True in case of equality 
Other suggestions ? 


## Parikh vector, evaluation, abelianization

The name **abelianization** is the most generic one. **Parikh vector** is standard in word combinatorics. **Evaluation** is mainly used in combinatorics. 

Notice that evaluation is formally a composition, in other words the alphabet should be finite and ordered. 


## Pattern matching

Algorithms for pattern matching may be optimized in subclasses. Hence, we should pay attention for function of low and high level. 

Vincent proposes to use the following conventions for low-level routines. As it is questions to implement them in C in a near future, this question is crucial: 

   * _x.find(y [,start [,end]])_: search the first occurrence of y in x[start:end]. Returns the position of the occurrence or -1 in case of failure. 
   * _x.rfind(y [,start [,end]])_: search backward the first occurrence of y in x[start:end]. Returns the position of the occurrence or -1 in case of failure (not available for infinite word). 
   * _x.find_iter(y, [,start [,end]])_: return an iterator over the position of occurences of y in x[start:end]. 
   * _x.rfind_iter(y, [,start [,end]])_: idem but backward (not available for infinite word). 
   * _x.find_all(y, [,start [,end]])_: return the list of occurrence of y in x[start:end]. 
   * _x.count(y [,start [,end]])_: count how many occurences of y there are in x[start:end]. 
There is also the question of multiple matchings and more generally about regular expressions. 

The actual implementation of pattern matching uses Boyer-Moore algorithm which needs some precomputation for _y_: last_position_dict, prefix_function_table, good_suffix_table. All theses precomputations are cached_method of a word which may be memory consuming and not very efficient as the following code actually calls twice the precomputation: 
```txt
sage: w1 = Word('abbabaabaaababa', alphabet='ab')
sage: w2 = Word('abababaaaa', alphabet='ab')
sage: w1.find('aa')
5
sage: w2.find('aa')
6
```
Vincent proposes to move all precomputation in a module dedicated to pattern matching and to **not** use caching except if the user want to perform many search of _y_ in many different _x_. In which case we should do something like that: 
```txt
sage: w = Word('ab', alphabet='ab')
sage: f = Finder(w)
sage: f.match(Word('abbababaababbbbababab', alphabet='ab'))
...
```

## Repetitions and exponents

see also # 

Actual names 

* minimal_period 
* exponent 
* has_period 
* period([divide_length]) 
* order 
* critical_exponent 
* primitive_length 
* is_primitive 
* primitive 
* is_overlap 

# Subprojects


## Finite languages and factor set

Most of it was implemented by Franco (suffix tree and suffix trie). We would like to enhance it and make a specific data structure (called Rauzy castle) for <a href="/FiniteFactorialLanguages">FiniteFactorialLanguages</a>. See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12225">#12225</a>. 


## Substitutive and adic languages

There are many algorithms for languages described by a sequence of substitutions (called a directive word). The particular case of morphic and purely morphic languages correspond respectively to periodic and purely_periodic directive words. 

* Enumeration of factors, desubstitution (<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12227">#12227</a>) 
* Factor complexity for purely morphic languages (<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12231/">#12231</a>) 
* Equality for purely morphic languages (following J. Honkala, CANT, chapter 10) 

## Eventually periodic languages / words

They will be useful to define eventually periodic directive words for adic languages. See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12228">#12228</a>. 


# TODO list

for #12224: 

* update factorial langages, with doc and tests: task taken by <a href="/ThierryMonteil">ThierryMonteil</a> 
* implement a simple example of factorial languages in sage.categories.example.factorial_languages.py : task taken by <a href="/ThierryMonteil">ThierryMonteil</a> 
* think about naming convention. For example, to get the subset of words of length n of a language L, do you prefer L.subset(n=4) or L.subset(length=4): task taken by <a href="/VincentDelecroix">VincentDelecroix</a> 
* make a dedicated class for palindromic closures 
* be sure that the methods in sage.categories.languages.<a href="/ElementMethods">ElementMethods</a> are as minimal as possible 
* words path (currently in sage.combinat.words.paths) which have to be modified to fit with the new implementation (question: should we do this right now ?) 
* backward compatibility with the previous implementation (in particular with respect to pickling) 
* make difference between finite/infinite/enumerated/ordered alphabet (in particular when the parents are initialized with a specific category) 
for other tickets: 

* specific data structure rauzy graphs and return tree (Thierry) 
* 1-dim subshift of finite type / sofic 
* n-dim finite words and n-dimensional shifts 
* n-dim subshifts of finite type 
* n-dim substitutive subshift 
* cellular automata 
* ... _add your whishes_ 

# Days

* <a href="/sagedays-Marseille-2014">sagedays-Marseille-2014</a> 