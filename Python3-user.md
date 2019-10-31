||<#FF6347>Warning: || Starting from version 9.0,  the default distributed version of Sage is using Python 3. See [[Python3-Switch]] for more information.||

= Main caveat =

== range and xrange ==

In Python `range` is a function that returns a list.
{{{#!highlight python
sage-8.9: range(5)
[0, 1, 2, 3, 4]
sage-8.9: type(range(5))
<type 'list'>
}}}
In Python 3, `range` is an object that somehow behave as a list (ie elements can still be acessed with square bracket, it has a length, etc) but it is not a list.
{{{#!highlight python
sage-9.0: range(5)
range(0, 5)
sage-9.0: range(5)[2]
2
sage-9.0: range(5)[1::2]
range(1, 5, 2)
sage-9.0: type(range(5))
<class 'range'>
}}}

The iterator `xrange` is no longer valid in Python 3 simply use `range` instead.

== strings, unicode and bytes ==

In Python 2 a chain of characters between simple, double or triple quotes creates an ascii string. To create a unicode string one has to use the prefix `u` (which remains valid in Python 3).

In Python 3, a chain of characters between quote will gives rise to a unicode string. To create specifically an ascii string one has to use the prefix `b` (which is already valid in Python 2).
