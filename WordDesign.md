= Word Design =

The following page discusses the whole specifications of methods in the class of Word. Most of the times the methods do what we want, but this page could help to define standards. Specifications must be precise because we accept that any Word_datatype overload the methods defined in Word_all or Finiteword_all...
This page could also serve for discussion about improvement of words algorithms and words vocabulary.

In particular:
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

== Comparison methods ==
 * Flexibility or not ?
 * What is exactly authorized ?

== Improvement ==
We can improve the speed of a lot of algorithms providing two functions
{{{
def find_first_different(self, other)
def find_last_different(self, other)
}}}
which should returns the first index of the different characters and -1 if one of the two words ended before.
