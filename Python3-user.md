||<#FF6347>Warning: || Starting from version 9.0,  the default distributed version of Sage is using Python 3. See [[Python3-Switch]] for more information.||

= Main caveat from writing Python 3 Sagemath code when you are used to Python 2 =

We list the most visible changes that any user would certainly run into the first time she uses a Python 3 based version when she used to run a Python 2 based one. This page is not intended to be a complete manual of the differences but a short page of what you need to know to get started. The [[https://docs.python.org/3/whatsnew/3.0.html|What's new page of the Python official website]] provides more technical details.
 
== 1. print ==

In Python 2, `print` is a keyword (as `for`, `if`, etc)
{{{#!highlight python
sage-8.9: print "hello", 1, 2
hello 1 2
}}}

In Python 3, `print` becomes a function
{{{#!highlight python
sage-9.0: print("hello", 1, 2)
hello 1 2
}}}
Writing a print statement without the parenthesis results in a `SyntaxError`
{{{#!highlight python
sage-9.0: print "hello", 1, 2
  File "<ipython-input-9-e91077222f2e>", line 1
    print "hello", Integer(1), Integer(2)
                ^
SyntaxError: invalid syntax
}}}
One cool thing about this `print` function is that it takes various arguments (you can write in files or use a different separator).
{{{#!highlight python
sage-9.0: print("The", "number", 3, "is", "prime", sep=' XX ')
The XX number XX 3 XX is XX prime
}}}


== 2. range and xrange ==

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
The main advantage of this range object in Python 3 is when you perform a simple iteratation `for i in range(1000)`. In Python 2 this would have created a list of 1000 elements and then iterated through it. In Python 3, there is no list creation and hence no memory allocation for these 1000 elements.


The iterator `xrange` is no longer valid in Python 3 simply use `range` instead.

== 3. strings, unicode and bytes ==

In Python 2 a chain of characters between simple, double or triple quotes creates an ascii string. To create a unicode string one has to use the prefix `u` (which remains valid in Python 3).

In Python 3, a chain of characters between quote will gives rise to a unicode string. To create specifically an ascii string one has to use the prefix `b` (which is already valid in Python 2).
