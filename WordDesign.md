= Word Design =

Since Sage-combinat days in Orsay last January, Franco Saliola, Vincent Delecroix and Sébastien Labbé have been rethinking the design of the sage-words library. We call this new design the {{{words_next_generation}}} or simply {{{words_ng}}}. We did a lot of work during the Sage-combinat days but did not finished it. So, quickly the new code got rotten because of the spinxification that got in Sage in February. On June 9th, the ReST documentation was finished in all the files of {{{words_ng}}}. We hope to finish this big work really soon.

== GOAL ==

The goal of the new design of the words library is to separate the data structures from the mathematical objects which will improve greatly the effectiveness of what is actually in sage.

Mathematical Objects :
    *  Classes of words :
        * Combinatorial class of all words
        * Combinatorial class of all words over a given alphabet
    * Words :
        * Finite words
        * Infinite words
Data Structures :
    * Python lists
    * Python string
    * Python tuple
    * Python functions
    * Python iterators
    * C++ vector (by Vincent Delecroix, Marseille)

== TO BE DONE ==

=== 1. Concatenation (almost done) ===

Create a class for concatenating words; we want to at least be able to do what the old code could do.

DONE by Franco :

"I implemented a class called CallableFromListOfWords, which creates a callable object from a list/tuple of words (it is just a tuple with the __call__ method define). This is an improved version of what was there before. Take a look at the patch called words_ng_concatenation-fs.patch."


But the following is still a problem. If X and Y are two words, the parent of X*Y seems to be the one of X:

{{{
sage: W=Words('ab')
sage: Y=Words('a')
sage: y=Y('aaa')
sage: w=W('aaa')
sage: y*w
word: aaaaaa
sage: w*y
word: aaaaaa
sage: (y*w).parent()
Words over Ordered Alphabet ['a']
sage: (w*y).parent()
Words over Ordered Alphabet ['a', 'b']
sage: w2=W('aaab')
sage: w2*y
word: aaabaaa
sage: y*w2
Traceback (most recent call last):
...
ValueError: b not in alphabet!
}}}

Franco says :
"The behaviour is from the old code: it tries
to create a word from Y in X.parent(); if that fails, then it tries to
create a word from X in Y.parent(); and if that fails, then it raises an
error. We don't have to raise an error: we could always return a word with
parent Words_all."

I say it migth return a word in the union of the parents.


=== 2. Add doctests ===

A bunch of stuff is missing doctests.

Here is the coverage in date of June 11th:

{{{
~/sage-4.0/devel/sage-combinat/sage/combinat/words$ sage -coverage .
alphabet.py: 100% (27 of 27)
morphism.py: 100% (35 of 35)
shuffle_product.py: 100% (14 of 14)
suffix_trees.py: 97% (46 of 47)
word.py: 97% (146 of 150)
word_datatypes.pyx: 0% (0 of 61)
word_generators.py: 95% (19 of 20)
word_infinite_datatypes.py: 81% (18 of 22)
word_options.py: 100% (1 of 1)
words.py: 100% (38 of 38)

Overall weighted coverage score:  82.6%
Total number of functions:  415
We need    9 more function to get to 85% coverage.
We need   30 more function to get to 90% coverage.
We need   51 more function to get to 95% coverage.
}}}

There are already many doctest inside of word_datatypes.pyx but they are not seen by the coverage script. I think that this problem is related to http://trac.sagemath.org/sage_trac/ticket/1795 which has a patch but still needs work.

=== 3. ReST the documentation (done) ===

Convert the documentation to the ReST format.

DONE (finished June 9th 2009)

=== 4. Run the old doctests (done) ===

Run all the old doctests against with the new code and see what breaks.  This is mainly to test for backwards compatibility; and to test to see if we deleted some methods (then we have to deprecate them).

DONE by Franco :

"Today I re-ran the old doctests, and posted a small patch (called words_ng_small_fix-fs.patch) that dealt with one issue that I found.  There is nothing left to do with the old doctests.

[Note that if you run the old tests, then you will see lots of errors. What I did was to go through each error and decide whether it was really an error. If it was, then it got fixed. Some of the old tests break because the new representation is different than the old one. Some doctests that test internal functions break as well, but that is okay since they are internal functions that are not available to the user.]"

=== 5. Performance testing ===

We should compare the timing between the new and old code. Note that the old code has been moved to {{{sage/combinat/words_old}}} while the new is in {{{sage/combinat/words}}}. This allow to make comparison testing by using the old code by adding {{{wold.}}} in front of functions.

Creation of small words:

{{{
    Empty word

        sage: %timeit Word()
        100000 loops, best of 3: 7.94 µs per loop
        sage: %timeit wold.Word()
        10000 loops, best of 3: 52.4 µs per loop

    from string

        sage: %timeit Word("abbabaab")
        100000 loops, best of 3: 13.4 µs per loop
        sage: %timeit wold.Word("abbabaab")
        10000 loops, best of 3: 72 µs per loop

    from list

        sage: %timeit Word([0,1,1,0,1,0,0,1])
        100000 loops, best of 3: 11.9 µs per loop
        sage: %timeit wold.Word([0,1,1,0,1,0,0,1])
        10000 loops, best of 3: 68.6 µs per loop

    converted to list

        sage: %timeit Word("01101001", datatype="list")
        100000 loops, best of 3: 14.4 µs per loop
        sage: %timeit wold.Word("01101001") # already converts to a 'list'
        10000 loops, best of 3: 70.9 µs per loop

    from tuple

        sage: %timeit Word((0,1,1,0,1,0,0,1)))
        100000 loops, best of 3: 12.2 µs per loop
        sage: %timeit wold.Word((0,1,1,0,1,0,0,1), alphabet=(0,1))
        10000 loops, best of 3: 65.8 µs per loop

    from iterator

        sage: from itertools import count
        sage: %timeit Words(alphabet='natural numbers')(count())  # includes checks
        10000 loops, best of 3: 147 µs per loop
        sage: %timeit wold.Words(alphabet='natural numbers')(count()) # no checks
        10000 loops, best of 3: 60.9 µs per loop

    from callable

        sage: f = lambda n : add(Integer(n).digits(2)) % 2

        sage: %timeit Word(f) # includes checks
        1000 loops, best of 3: 587 µs per loop
        sage: %timeit wold.Word(f, alphabet=[0,1]) # no checks
        10000 loops, best of 3: 62.1 µs per loop

        sage: %timeit Word(f, length=8) # includes checks
        10000 loops, best of 3: 128 µs per loop
        sage: %timeit wold.Word(f, alphabet=[0,1])[:8] # no checks
        10000 loops, best of 3: 103 µs per loop

    from a string and with a parent

        sage: %timeit Word("abbabaab", alphabet="abc")
        10000 loops, best of 3: 27.9 µs per loop
        sage: %timeit wold.Word("abbabaab", alphabet="abc")
        10000 loops, best of 3: 66.7 µs per loop
}}}

Creation of large words:

{{{
    from a list

        sage: t = words.ThueMorseWord()
        sage: w = list(t[:1000000])

        sage: %timeit Word(w)
        10000 loops, best of 3: 23.4 µs per loop
        sage: %timeit wold.Word(w)
        10 loops, best of 3: 819 ms per loop

        sage: %timeit Words([0,1])(w)
        10000 loops, best of 3: 86.6 µs per loop
        sage: %timeit wold.Words([0,1])(w)
        10 loops, best of 3: 836 ms per loop

    from a string

        sage: t = words.ThueMorseWord()
        sage: u = ''.join(map,(str,list(t[:1000000])))

        sage: %timeit Word(u)
        10000 loops, best of 3: 25 µs per loop
        sage: %timeit wold.Word(u)
        10 loops, best of 3: 840 ms per loop

        sage: %timeit Words('01')(u)
        10000 loops, best of 3: 87.5 µs per loop
        sage: %timeit wold.Words('01')(u)
        10 loops, best of 3: 861 ms per loop

    from list, converted to string datatype

        sage: %timeit Word(w, datatype="str")
        10 loops, best of 3: 298 ms per loop

    from list, converted to new cpp datatype

        sage: %timeit Word(w, datatype="cpp_basic_string") # new feature
        10 loops, best of 3: 81.3 ms per loop
}}}

Accessing letters

{{{
        sage: tm = words.ThueMorseWord()
        sage: l = list(tm[:1000000])
        sage: t = tuple(l)
        sage: s = ''.join(map(str,w))

    from list

        sage: w = Word(l)
        sage: u = wold.Word(l)
        sage: %timeit w[95827]
        1000000 loops, best of 3: 238 ns per loop
        sage: %timeit u[95827]
        100000 loops, best of 3: 8.37 µs per loop

    from tuple

        sage: w = Word(t)
        sage: u = wold.Word(t, alphabet=(0,1))
        sage: %timeit w[95827]
        1000000 loops, best of 3: 232 ns per loop
        sage: %timeit u[95827]
        100000 loops, best of 3: 8.66 µs per loop

    from string

        sage: w = Word(s)
        sage: u = wold.Word(s)
        sage: %timeit w[95827]
        1000000 loops, best of 3: 233 ns per loop
        sage: %timeit u[95827]
        100000 loops, best of 3: 8.33 µs per loop
}}}

Counting occurrences of letters

{{{
    from string

        sage: w = Word(s)
        sage: u = wold.Word(s)
        sage: %timeit w.count('0')
        1000 loops, best of 3: 1.41 ms per loop
        sage: time u.count('0')
        CPU times: user 59.69 s, sys: 0.03 s, total: 59.72 s
        Wall time: 59.97 s

    from list

        sage: w = Word(l)
        sage: u = wold.Word(l)
        sage: %timeit w.count(0)
        100 loops, best of 3: 16.9 ms per loop
        sage: time u.count(0)
        CPU times: user 59.45 s, sys: 0.28 s, total: 59.73 s
        Wall time: 60.51 s
}}}

Without alphabet is better:

{{{
sage: wa=Word('aabababa'*100,alphabet='ab')
sage: w=Word('aabababa'*100)
sage: %timeit w == w
1000 loops, best of 3: 340 µs per loop
sage: %timeit wa == wa
100 loops, best of 3: 2.59 ms per loop
}}}

Critical exponent...

{{{
sage: s = [0,1,2,3,0,1,2,3]*10
sage: w1 = wold.Word(s)
sage: time w1.critical_exponent()
CPU times: user 1.11 s, sys: 0.00 s, total: 1.11 s
Wall time: 1.11 s
20
}}}
{{{
sage: w2 = Word(s)
sage: time w2.critical_exponent()
CPU times: user 0.26 s, sys: 0.00 s, total: 0.26 s
Wall time: 0.27 s
20
}}}
{{{
sage: w3 = Word(s, datatype="cpp_basic_string")
sage: time w3.critical_exponent()
CPU times: user 0.23 s, sys: 0.00 s, total: 0.23 s
Wall time: 0.23 s
20
}}}

Is factor of...

{{{
sage: t = wold.words.ThueMorseWord([0,1])
sage: W = t.parent()
sage: w = W([0,0,0])
sage: time w.is_factor_of(t[:1000000])
CPU times: user 17.51 s, sys: 0.00 s, total: 17.51 s
Wall time: 17.54 s
False
}}}
{{{
sage: t = words.ThueMorseWord([0,1])
sage: W = t.parent()
sage: w = W([0,0,0])
sage: time w.is_factor(t[:1000000])
CPU times: user 7.88 s, sys: 0.02 s, total: 7.90 s
Wall time: 7.96 s
False
}}}
{{{
sage: l = [sum(Integer(n).digits(base=2))%2 for n in range(1000000)]
sage: w = Word(l, datatype="cpp_basic_string")
sage: y = Word([0,0,0], datatype="cpp_basic_string")
sage: time w.has_factor(y)
CPU times: user 0.01 s, sys: 0.00 s, total: 0.01 s
Wall time: 0.01 s
False
}}}

Evaluation...

{{{
sage: w = wold.words.FibonacciWord()
sage: time w[:1000000].evaluation()
CPU times: user 7.30 s, sys: 0.03 s, total: 7.34 s
Wall time: 7.41 s
[618034, 381966]
}}}
{{{
sage: w = words.FibonacciWord()
sage: time w[:1000000].evaluation()
CPU times: user 3.82 s, sys: 0.02 s, total: 3.84 s
Wall time: 3.87 s
[618034, 381966]
}}}

The following got worse (why?)!! :

{{{
sage: w = wold.words.StandardEpisturmianWord(wold.Word('abc'))
sage: time len(w[:1000].palindromes())
CPU times: user 3.50 s, sys: 0.01 s, total: 3.51 s
Wall time: 3.52 s
1001
}}}
{{{
sage: w = words.StandardEpisturmianWord(Word('abc'))
sage: time len(w[:1000].palindromes())
CPU times: user 9.36 s, sys: 0.00 s, total: 9.36 s
Wall time: 9.36 s
1001
}}}

{{{
sage: w = words.ThueMorseWord()
sage: time w[:1000].defect()
CPU times: user 5.48 s, sys: 0.02 s, total: 5.51 s
Wall time: 5.61 s
212
}}}
{{{
sage: w = wold.words.ThueMorseWord()
sage: time w[:1000].defect()
CPU times: user 3.20 s, sys: 0.00 s, total: 3.20 s
Wall time: 3.20 s
212
}}}

Equality testing :

{{{
sage: s = 'abab'*100
sage: t = 'abab'*100
sage: %timeit s == t
1000000 loops, best of 3: 979 ns per loop
}}}
{{{
sage: w = Word('abab'*100)
sage: y = Word('abab'*100)
sage: %timeit w == y
10000 loops, best of 3: 175 µs per loop
}}}
{{{
sage: w = wold.Word('abab'*100)
sage: y = wold.Word('abab'*100)
sage: %timeit w == y
10000 loops, best of 3: 125 µs per loop
}}}

{{{
sage: s = [4,5,4,5]*100
sage: t = [4,5,4,5]*100
sage: %timeit s == t
10000 loops, best of 3: 44.8 µs per loop
sage: w = Word(s)
sage: y = Word(t)
sage: %timeit w == y
1000 loops, best of 3: 213 µs per loop
sage: w = wold.Word(s)
sage: y = wold.Word(t)
sage: %timeit w == y
10000 loops, best of 3: 132 µs per loop
}}}

Is palindrome...

{{{
sage: w = wold.Word([1,0,1]*1000)
sage: %timeit w.is_palindrome()
1000 loops, best of 3: 1.8 ms per loop
sage: w = Word([1,0,1]*1000)
sage: %timeit w.is_palindrome()
1000 loops, best of 3: 971 µs per loop
}}}


=== 6. Remove the repository sage/combinat/words_old ===

=== 7. Make the words_ng patches commutable in the sage-combinat tree ===

Actually, they do not commute with generalized permutations patches because of small conflicts in the setup.py file.

=== 8. Remove side effects of words_ng ===

Actually, the words_ng patches creates the empty repository sage/combinat/words_ng.

=== 9. Fold all the patches together!! ===

=== 10. Create a ticket on the sage trac ===

= Discussions made at Orsay =

This page discusses the specifications of methods in the class of Word. Most of the times the methods do what we want, but this page could help to define standards. Specifications must be precise because we accept that any Word_datatype overwrite methods defined in Word_all or Finiteword_all...

This page could also serve for discussion about improvement of words algorithms and words vocabulary.

In particular:
 * Does the library agree with the standard vocabulary for functions on strings (C string library, C++ string, python) ?
 * Does the type import in comparison, or must we impose type(self) == type(other) ? Now, the limit is not quite clear and depend on methods.
 * Do we authorize flexibility in argument, like in :
{{{
sage : w = wng.Word("abbaba")
sage : w.has_suffix("aba")
True
sage : w == "aba"
True
sage : w = wng.Word([0,1,0,0,1])
sage : w.has_suffix([0,0,1])
True
}}}
(we should think about a self._parent(other) at the beginning of each comparison method. Sadly, it's not a good idea : sometimes it's very expansive (a whole copy), and sometimes impossible (for example an infinite Word as argument))

== Vocabulary of other libraries ==

Agreed from the python standard:
 * {{{__add__(self, other)}}}: concatenation
 * {{{__cmp__(self, other)}}}: rich comparison (this include equality and less than and greater than)

Ambiguous :
 * {{{count(self, sub[, start[, stop]])}}}: Return the number of non-overlapping occurrences of substring sub in string self[start:stop]

Not used :
 * {{{partition(sep) -> (head, sep, tail)}}}: Searches for the separator sep in S, and returns the part before it, the separator itself, and the part after it.  If the separator is not found, returns S and two empty strings
 * {{{rpartition(sep) -> (tail, sep, head)}}}: Searches for the separator sep in S, starting at the end of S, and returns the part before it, the separator itself, and the part after it.  If the separator is not found, returns two empty strings and S.
 * {{{replace(old, new[, count]) -> string}}}: Returnd a copy of string S with all occurrences of substring old replaced by new.  If the  ptional argument count is given, only the first count occurrences are replaced.
 * {{{split([sep [,maxsplit]]) -> list of strings}}}: Return a list of the words in the string S, using sep as the delimiter string.  If maxsplit is given, at most maxsplit splits are done. If sep is not specified or is None, any whitespace string is a separator.
 * {{{rsplit([sep [,maxsplit]]) -> list of strings}}}: Return a list of the words in the string S, using sep as the delimiter string,  starting at the end of the string and working to the front.  If maxsplit is given, at most maxsplit splits are done. If sep is not  pecified or is None, any whitespace string is a separator.
 * {{{translate(table [,deletechars]) -> string}}}: Return a copy of the string S, where all characters occurring in the optional argument deletechars are removed, and the remaining characters have been mapped through the given translation table, which must be a string of length 256.


Modified:
 * {{{find(self, string[, start[, stop]]) -> int}}}: find the first occurrence of the string as a substring of self[start:stop] (return -1 if not find). It returns the index of the occurrence.
 * {{{rfind(self, string[, start, stop]]) -> int}}}: find the last occurrence of the string as a substring of self[start:stop] (return -1 if not find)
 * {{{index(self, string[, start, stop]]) -> int}}}: same as find but raise a ValueError if not find
 * {{{rindex(self, string[, start, stop]]) -> int}}}: same as rfind but raise a ValueError if not find
 * {{{startswith(self, sub[, start[, stop]]) -> bool}}}: tests if sub prefixes self[start:stop]
 * {{{endswith(self, sub[,start[, stop]]) -> bool}}}: tests if sub suffixes self[start:stop]


== Comparison methods ==
A comparison involves two different words. But a word could be a lot of different object (in particular from a data point of vue). 

 * Flexibility or not ?
 * What is exactly authorized ?

== Improvement ==
We can improve the speed of a lot of algorithms providing two functions
{{{
def find_first_different(self, other)
def find_last_different(self, other)
}}}
which should returns the first index of the different characters and -1 if one of the two words ended before. Those one could be really fast in the cythonized version.
