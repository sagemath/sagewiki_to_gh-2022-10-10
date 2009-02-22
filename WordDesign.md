= Word Design =

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
