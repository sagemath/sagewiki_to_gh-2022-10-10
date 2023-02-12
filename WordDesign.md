

# Word Design

Since Sage-combinat days in Orsay last January, Franco Saliola, Vincent Delecroix and Sébastien Labbé have been rethinking the design of the sage-words library. We call this new design the `words_next_generation` or simply `words_ng`. We did a lot of work during the Sage-combinat days but did not finished it. So, quickly the new code got rotten because of the spinxification that got in Sage in February. On June 9th, the ReST documentation was finished in all the files of `words_ng`. We hope to finish this big work really soon. 


## GOAL

The goal of the new design of the words library is to separate the data structures from the mathematical objects which will improve greatly the effectiveness of what is actually in sage. 

Mathematical Objects : 

         * Classes of words : 
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

## TO BE DONE


### 1. Concatenation (done)

Create a class for concatenating words; we want to at least be able to do what the old code could do. 

DONE by Franco : 

"I implemented a class called <a href="/CallableFromListOfWords">CallableFromListOfWords</a>, which creates a callable object from a list/tuple of words (it is just a tuple with the <ins>call</ins> method define). This is an improved version of what was there before. Take a look at the patch called words_ng_concatenation-fs.patch." 

But the following is still a problem. If X and Y are two words, the parent of X*Y seems to be the one of X: 


```txt
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
```
Franco says : "The behaviour is from the old code: it tries to create a word from Y in X.parent(); if that fails, then it tries to create a word from X in Y.parent(); and if that fails, then it raises an error. We don't have to raise an error: we could always return a word with parent Words_all." 


### 2. Add doctests (done)

A bunch of stuff is missing doctests. 

Here is the coverage in date of July 7: 


```txt
alphabet.py: 100% (27 of 27)
morphism.py: 100% (35 of 35)
shuffle_product.py: 100% (14 of 14)
suffix_trees.py: 100% (47 of 47)
word.py: 100% (152 of 152)
word_datatypes.pyx: 76% (45 of 59)
word_generators.py: 100% (20 of 20)
word_infinite_datatypes.py: 100% (18 of 18)
word_options.py: 100% (1 of 1)
words.py: 100% (38 of 38)

Overall weighted coverage score:  96.6%
Total number of functions:  411
We need   10 more function to get to 99% coverage.
```
Everything but `word_datatypes.pyx` is at 100%, but the fact that this is not at 100% is an illusion. The coverage script does not detect the doctest inside pyx files correctly. I think that this problem is related to <a href="http://trac.sagemath.org/sage_trac/ticket/1795">http://trac.sagemath.org/sage_trac/ticket/1795</a> which has a patch but still needs work. 


### 3. ReST the documentation (done)

Convert the documentation to the ReST format. 

DONE (finished June 9th 2009) 


### 4. Run the old doctests (done)

Run all the old doctests against with the new code and see what breaks.  This is mainly to test for backwards compatibility; and to test to see if we deleted some methods (then we have to deprecate them). 

DONE by Franco : 

"Today I re-ran the old doctests, and posted a small patch (called words_ng_small_fix-fs.patch) that dealt with one issue that I found.  There is nothing left to do with the old doctests. 

[Note that if you run the old tests, then you will see lots of errors. What I did was to go through each error and decide whether it was really an error. If it was, then it got fixed. Some of the old tests break because the new representation is different than the old one. Some doctests that test internal functions break as well, but that is okay since they are internal functions that are not available to the user.]" 


### 5. Performance testing (done)

Moved to the bottom of this page. 


### 6. Remove or move some files (done)

The following two files are currently added by the words_ng patch: 


```txt
A sage/combinat/words/setup.py
A sage/combinat/words/translator.py
```
I think the translator could be deleted. For the setup.py, I wonder if its content should not be moved to the usual setup.py file of sage.... 

Neither was necessary, I deleted them. --Franco 


### 7. Remove the dependencies to the repository sage/combinat/words_old (done)

Right now, many files in `sage/combinat` still depend on `sage/combinat/words_old`. For example, the following ones : 


```txt
M sage/combinat/integer_vector_weighted.py
M sage/combinat/lyndon_word.py
M sage/combinat/ribbon.py
M sage/combinat/ribbon_tableau.py
M sage/combinat/set_partition_ordered.py
M sage/combinat/sf/ns_macdonald.py
M sage/combinat/skew_tableau.py
M sage/combinat/tableau.py
```
This must me changed to the new code. 


### 8. Make the words_ng patches commutable in the sage-combinat tree (done)

Actually, the words_ng patch doesn't apply cleanly on a untouched version sage (there are small conflicts). Moreover, it is possible that the other sage-combinat patches don't apply cleanly over words_ng patch due for example to small conflict in the `setup.py` file. 


### 9. Add equality testing for datatypes (to be done later)


### 10. Remove the repository sage/combinat/words_old (done)


### 11. Fold all the patches together!! (done)

Franco merged and split the current patches into two: one which only touches the files inside the words directory (including the all.py, etc.) and one that only touches the combinat files outside the words directory. It made it easier for rebasing (next step). 


### 12. Rebase to the latest version of sage (incorporating any changes made to the current code in Sage while we were developing) (done)


### 13. Create a ticket on the sage trac (done)

This is ticket <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6519">#6519</a>. 


# Discussions made at Orsay

This page discusses the specifications of methods in the class of Word. Most of the times the methods do what we want, but this page could help to define standards. Specifications must be precise because we accept that any Word_datatype overwrite methods defined in Word_all or Finiteword_all... 

This page could also serve for discussion about improvement of words algorithms and words vocabulary. 

In particular: 

* Does the library agree with the standard vocabulary for functions on strings (C string library, C++ string, python) ? 
* Does the type import in comparison, or must we impose type(self) == type(other) ? Now, the limit is not quite clear and depend on methods. 
* Do we authorize flexibility in argument, like in : 

```txt
sage : w = wng.Word("abbaba")
sage : w.has_suffix("aba")
True
sage : w == "aba"
True
sage : w = wng.Word([0,1,0,0,1])
sage : w.has_suffix([0,0,1])
True
```
(we should think about a self._parent(other) at the beginning of each comparison method. Sadly, it's not a good idea : sometimes it's very expansive (a whole copy), and sometimes impossible (for example an infinite Word as argument)) 


## Vocabulary of other libraries

Agreed from the python standard: 

* `__add__(self, other)`: concatenation 
* `__cmp__(self, other)`: rich comparison (this include equality and less than and greater than) 
Ambiguous : 

* `count(self, sub[, start[, stop]])`: Return the number of non-overlapping occurrences of substring sub in string self[start:stop] 
Not used : 

* `partition(sep) -> (head, sep, tail)`: Searches for the separator sep in S, and returns the part before it, the separator itself, and the part after it.  If the separator is not found, returns S and two empty strings 
* `rpartition(sep) -> (tail, sep, head)`: Searches for the separator sep in S, starting at the end of S, and returns the part before it, the separator itself, and the part after it.  If the separator is not found, returns two empty strings and S. 
* `replace(old, new[, count]) -> string`: Returnd a copy of string S with all occurrences of substring old replaced by new.  If the  ptional argument count is given, only the first count occurrences are replaced. 
* `split([sep [,maxsplit]]) -> list of strings`: Return a list of the words in the string S, using sep as the delimiter string.  If maxsplit is given, at most maxsplit splits are done. If sep is not specified or is None, any whitespace string is a separator. 
* `rsplit([sep [,maxsplit]]) -> list of strings`: Return a list of the words in the string S, using sep as the delimiter string,  starting at the end of the string and working to the front.  If maxsplit is given, at most maxsplit splits are done. If sep is not  pecified or is None, any whitespace string is a separator. 
* `translate(table [,deletechars]) -> string`: Return a copy of the string S, where all characters occurring in the optional argument deletechars are removed, and the remaining characters have been mapped through the given translation table, which must be a string of length 256. 
Modified: 

* `find(self, string[, start[, stop]]) -> int`: find the first occurrence of the string as a substring of self[start:stop] (return -1 if not find). It returns the index of the occurrence. 
* `rfind(self, string[, start, stop]]) -> int`: find the last occurrence of the string as a substring of self[start:stop] (return -1 if not find) 
* `index(self, string[, start, stop]]) -> int`: same as find but raise a <a href="/ValueError">ValueError</a> if not find 
* `rindex(self, string[, start, stop]]) -> int`: same as rfind but raise a <a href="/ValueError">ValueError</a> if not find 
* `startswith(self, sub[, start[, stop]]) -> bool`: tests if sub prefixes self[start:stop] 
* `endswith(self, sub[,start[, stop]]) -> bool`: tests if sub suffixes self[start:stop] 

## Comparison methods

A comparison involves two different words. But a word could be a lot of different object (in particular from a data point of vue).  

* Flexibility or not ? 
* What is exactly authorized ? 

## Improvement

We can improve the speed of a lot of algorithms providing two functions 
```txt
def find_first_different(self, other)
def find_last_different(self, other)
```
which should returns the first index of the different characters and -1 if one of the two words ended before. Those one could be really fast in the cythonized version. 


## Comparison of new code vs. old code (Sage version 4.1 and earlier)

Below are timings between the new 'words_ng' code and the code in Sage versions 4.1 and earlier. In the following comparisons, the old code was loaded as the module `wold.`. 

**NOTE: the examples below involving the cpp_basic_string datatype are not part of the patch for trac ticket <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6519">#6519</a>. A patch implementing the cpp_basic_string datatype will be included in a separate ticket.** 

Creation of small words: 


```txt
    Empty word

        sage: %timeit wold.Word()
        10000 loops, best of 3: 52.4 µs per loop
        sage: %timeit Word()
        100000 loops, best of 3: 7.94 µs per loop

    from string

        sage: %timeit wold.Word("abbabaab")
        10000 loops, best of 3: 72 µs per loop
        sage: %timeit Word("abbabaab")
        100000 loops, best of 3: 13.4 µs per loop

    from list

        sage: %timeit wold.Word([0,1,1,0,1,0,0,1])
        10000 loops, best of 3: 68.6 µs per loop
        sage: %timeit Word([0,1,1,0,1,0,0,1])
        100000 loops, best of 3: 11.9 µs per loop

    converted to list

        sage: %timeit wold.Word("01101001") # already converts to a 'list'
        10000 loops, best of 3: 70.9 µs per loop
        sage: %timeit Word("01101001", datatype="list")
        100000 loops, best of 3: 14.4 µs per loop

    from tuple

        sage: %timeit wold.Word((0,1,1,0,1,0,0,1), alphabet=(0,1))
        10000 loops, best of 3: 65.8 µs per loop
        sage: %timeit Word((0,1,1,0,1,0,0,1)))
        100000 loops, best of 3: 12.2 µs per loop

    from iterator

        sage: from itertools import count
        sage: %timeit wold.Words(alphabet='natural numbers')(count()) # no checks
        10000 loops, best of 3: 60.9 µs per loop
        sage: %timeit Words(alphabet='natural numbers')(count())  # includes checks
        10000 loops, best of 3: 147 µs per loop

    from callable

        sage: f = lambda n : add(Integer(n).digits(2)) % 2

        sage: %timeit wold.Word(f, alphabet=[0,1]) # no checks
        10000 loops, best of 3: 62.1 µs per loop
        sage: %timeit Word(f) # includes checks
        1000 loops, best of 3: 587 µs per loop

        sage: %timeit wold.Word(f, alphabet=[0,1])[:8] # no checks
        10000 loops, best of 3: 103 µs per loop
        sage: %timeit Word(f, length=8) # includes checks
        10000 loops, best of 3: 128 µs per loop

    from a string and with a parent

        sage: %timeit wold.Word("abbabaab", alphabet="abc")
        10000 loops, best of 3: 66.7 µs per loop
        sage: %timeit Word("abbabaab", alphabet="abc")
        10000 loops, best of 3: 27.9 µs per loop
```
Creation of large words: 


```txt
    from a list

        sage: t = words.ThueMorseWord()
        sage: w = list(t[:1000000])

        sage: %timeit wold.Word(w)
        10 loops, best of 3: 819 ms per loop
        sage: %timeit Word(w)
        10000 loops, best of 3: 23.4 µs per loop

        sage: %timeit wold.Words([0,1])(w)
        10 loops, best of 3: 836 ms per loop
        sage: %timeit Words([0,1])(w)
        10000 loops, best of 3: 86.6 µs per loop

    from a string

        sage: t = words.ThueMorseWord()
        sage: u = ''.join(map,(str,list(t[:1000000])))

        sage: %timeit wold.Word(u)
        10 loops, best of 3: 840 ms per loop
        sage: %timeit Word(u)
        10000 loops, best of 3: 25 µs per loop

        sage: %timeit wold.Words('01')(u)
        10 loops, best of 3: 861 ms per loop
        sage: %timeit Words('01')(u)
        10000 loops, best of 3: 87.5 µs per loop

    from list, converted to string datatype

        sage: %timeit Word(w, datatype="str")
        10 loops, best of 3: 298 ms per loop

    from list, converted to new cpp datatype

        sage: %timeit Word(w, datatype="cpp_basic_string") # new feature
        10 loops, best of 3: 81.3 ms per loop
```
Accessing letters 


```txt
        sage: tm = words.ThueMorseWord()
        sage: l = list(tm[:1000000])
        sage: t = tuple(l)
        sage: s = ''.join(map(str,w))

    from list

        sage: u = wold.Word(l)
        sage: %timeit u[95827]
        100000 loops, best of 3: 8.37 µs per loop

        sage: w = Word(l)
        sage: %timeit w[95827]
        1000000 loops, best of 3: 238 ns per loop

    from tuple

        sage: u = wold.Word(t, alphabet=(0,1))
        sage: %timeit u[95827]
        100000 loops, best of 3: 8.66 µs per loop

        sage: w = Word(t)
        sage: %timeit w[95827]
        1000000 loops, best of 3: 232 ns per loop

    from string

        sage: u = wold.Word(s)
        sage: %timeit u[95827]
        100000 loops, best of 3: 8.33 µs per loop

        sage: w = Word(s)
        sage: %timeit w[95827]
        1000000 loops, best of 3: 233 ns per loop
```
Counting occurrences of letters 


```txt
    from string

        sage: u = wold.Word(s)
        sage: time u.count('0')
        CPU times: user 59.69 s, sys: 0.03 s, total: 59.72 s
        Wall time: 59.97 s

        sage: w = Word(s)
        sage: %timeit w.count('0')
        1000 loops, best of 3: 1.41 ms per loop

    from list

        sage: u = wold.Word(l)
        sage: time u.count(0)
        CPU times: user 59.45 s, sys: 0.28 s, total: 59.73 s
        Wall time: 60.51 s

        sage: w = Word(l)
        sage: %timeit w.count(0)
        100 loops, best of 3: 16.9 ms per loop
```
Critical exponent... 


```txt
        sage: l = [0,1,2,3,0,1,2,3]*10

    from list

        sage: u = wold.Word(l)
        sage: time u.critical_exponent()
        CPU times: user 1.11 s, sys: 0.00 s, total: 1.11 s
        Wall time: 1.11 s
        20

        sage: w = Word(l)
        sage: time w.critical_exponent()
        CPU times: user 0.26 s, sys: 0.00 s, total: 0.26 s
        Wall time: 0.27 s
        20

    from cpp_basic_string 

        sage: w3 = Word(l, datatype="cpp_basic_string")
        sage: time w3.critical_exponent()
        CPU times: user 0.23 s, sys: 0.00 s, total: 0.23 s
        Wall time: 0.23 s
        20
```
Is factor of... 


```txt
        sage: tm = words.ThueMorseWord()
        sage: l = list(tm[:1000000])
        sage: t = tuple(l)
        sage: s = ''.join(map(str,l))

    from string

        sage: w = wold.Word(s)
        sage: u = w.parent()('000')
        sage: time u.is_factor_of(w)
        CPU times: user 11.10 s, sys: 0.10 s, total: 11.19 s
        Wall time: 11.21 s
        False

        sage: w = Word(s)
        sage: u = w.parent()('000')
        sage: time u.is_factor(w)
        CPU times: user 1.29 s, sys: 0.00 s, total: 1.29 s
        Wall time: 1.34 s
        False

    from list

        sage: w = wold.Word(l)
        sage: u = w.parent()([0,0,0])
        sage: time u.is_factor_of(w)
        CPU times: user 10.88 s, sys: 0.01 s, total: 10.89 s
        Wall time: 10.91 s
        False

        sage: w = Word(l)
        sage: u = w.parent()([0,0,0])
        sage: time u.is_factor_of(w)
        CPU times: user 2.66 s, sys: 0.00 s, total: 2.66 s
        Wall time: 2.67 s
        False

    from tuple

        sage: w = wold.Word(t, alphabet=[0,1])
        sage: u = w.parent()((0,0,0))
        sage: time u.is_factor_of(w)
        CPU times: user 10.96 s, sys: 0.00 s, total: 10.96 s
        Wall time: 10.96 s
        False

        sage: w = Word(t)
        sage: u = w.parent()((0,0,0))
        sage: time u.is_factor(w)
        CPU times: user 2.60 s, sys: 0.00 s, total: 2.60 s
        Wall time: 2.61 s
        False

    from cpp_basic_string

        sage: w = Word(l, datatype='cpp_basic_string')
        sage: u = w.parent()([0,0,0], datatype='cpp_basic_string')
        sage: time w.has_factor(u)
        CPU times: user 0.01 s, sys: 0.00 s, total: 0.01 s
        Wall time: 0.01 s
        False
```
Evaluation... 


```txt
        sage: fibo = words.FibonacciWord()
        sage: l = list(fibo[:1000000])
        sage: t = tuple(l)
        sage: s = ''.join(map(str,l))

    from string

        sage: w = wold.Word(s)
        sage: time w.evaluation()
        CPU times: user 3.38 s, sys: 0.00 s, total: 3.38 s
        Wall time: 3.38 s
        [618034, 381966]

        sage: w = Word(s)
        sage: time w.evaluation_dict()
        CPU times: user 0.48 s, sys: 0.00 s, total: 0.48 s
        Wall time: 0.49 s
        {'0': 618034, '1': 381966}

    from list

        sage: w = wold.Word(l)
        sage: time w.evaluation()
        CPU times: user 3.47 s, sys: 0.00 s, total: 3.47 s
        Wall time: 3.47 s
        [618034, 381966]

        sage: w = Word(l)
        sage: time w.evaluation_dict()
        CPU times: user 0.48 s, sys: 0.00 s, total: 0.48 s
        Wall time: 0.48 s
        {0: 618034, 1: 381966}

    from tuple

        sage: w = wold.Word(t, alphabet= [0,1])
        sage: time w.evaluation()
        CPU times: user 3.61 s, sys: 0.01 s, total: 3.62 s
        Wall time: 3.62 s
        [618034, 381966]

        sage: w = Word(t)
        sage: time w.evaluation_dict()
        CPU times: user 0.46 s, sys: 0.00 s, total: 0.46 s
        Wall time: 0.48 s
        {0: 618034, 1: 381966}
```
Palindromic defect (length + 1 - number of distincts palindromes factors): 


```txt
        sage: s = 'ab'*1000
        sage: l = ['a', 'b']*1000
        sage: t = ('a', 'b')*1000

    from string

        sage: w = wold.Word(s)
        sage: time w.defect()
        CPU times: user 10.09 s, sys: 0.04 s, total: 10.14 s
        Wall time: 10.16 s
        0

        sage: w = Word(s)
        sage: time w.defect()
        CPU times: user 8.76 s, sys: 0.01 s, total: 8.77 s
        Wall time: 8.77 s
        0

    from list

        sage: w = wold.Word(l)
        sage: time w.defect()
        CPU times: user 10.12 s, sys: 0.03 s, total: 10.15 s
        Wall time: 10.18 s
        0

        sage: w = Word(l)
        sage: time w.defect()
        CPU times: user 8.69 s, sys: 0.04 s, total: 8.73 s
        Wall time: 8.73 s
        0

    from tuple

        sage: w = wold.Word(t, alphabet=['a','b'])
        sage: time w.defect()
        CPU times: user 10.10 s, sys: 0.03 s, total: 10.12 s
        Wall time: 10.13 s
        0

        sage: w = Word(t)
        sage: time w.defect()
        CPU times: user 8.70 s, sys: 0.01 s, total: 8.72 s
        Wall time: 8.72 s
        0
```
The following got worse (why?)!! : 


```txt
        sage: sage: w = wold.words.StandardEpisturmianWord(wold.Word('abc'))
        sage: time w[1000]
        CPU times: user 0.80 s, sys: 0.00 s, total: 0.80 s
        Wall time: 0.81 s
        'b'

        sage: w = words.StandardEpisturmianWord(Word('abc'))
        sage: time w[1000]
        CPU times: user 5.78 s, sys: 0.00 s, total: 5.79 s
        Wall time: 5.83 s
        'b'
```
Equality testing (this could be improved by adding `__eq__` and `__ne__` to the datatypes.): 


```txt
        sage: fibo = words.FibonacciWord()
        sage: l = list(fibo[:1000000])
        sage: l2 = list(l)
        sage: t = tuple(l)
        sage: t2 = tuple(l)
        sage: s = ''.join(map(str,l))
        sage: s2 = str(s)

    from string

        sage: %timeit s == s2
        10000000 loops, best of 3: 143 ns per loop

        sage: w = wold.Word(s)
        sage: w2 = wold.Word(s2)
        sage: %timeit w == w2
        10 loops, best of 3: 250 ms per loop

        sage: w = Word(s)
        sage: w2 = Word(s2)
        sage: %timeit w == w2
        10 loops, best of 3: 409 ms per loop

    from list

        sage: %timeit l == l2
        100 loops, best of 3: 8.17 ms per loop

        sage: w = wold.Word(l)
        sage: w2 = wold.Word(l2)
        sage: %timeit w == w2
        10 loops, best of 3: 254 ms per loop

        sage: w = Word(l)
        sage: w2 = Word(l2)
        sage: %timeit w == w2
        10 loops, best of 3: 390 ms per loop

    from tuple

        sage: %timeit t == t2
        100 loops, best of 3: 7.06 ms per loop

        sage: w = wold.Word(t, alphabet=[0,1])
        sage: w2 = wold.Word(t2, alphabet=[0,1])
        sage: %timeit w == w2
        10 loops, best of 3: 252 ms per loop

        sage: w = Word(t)
        sage: w2 = Word(t2)
        sage: %timeit w == w2
        10 loops, best of 3: 386 ms per loop

```
In the new code, many functions are faster without an ordered alphabet : 


```txt
        sage: wa = Word('aabababa'*100,alphabet='ab')
        sage: w = Word('aabababa'*100)
        sage: %timeit w == w
        1000 loops, best of 3: 340 µs per loop
        sage: %timeit wa == wa
        100 loops, best of 3: 2.59 ms per loop
```