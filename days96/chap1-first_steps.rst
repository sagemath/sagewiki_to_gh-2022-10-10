.. escape-backslashes
.. default-role:: math

Chapter 1: First steps in Python and Sage
=========================================

:Authors:
    - Vincent Delecroix
    - Nadia Lafrenière
    - Thierry Monteil
:License: CC BY-NC-SA 3.0

The three golden rules
----------------------

Recall from the introduction the three most import things.

First, to execute a cell on which you have the focus press Shift-Enter.

Second, to access the documentation add a question mark `?` at the end
and press enter::

    sage: is_prime?

Third, to obtain the list of methods that starts with a given prefix, press
the tab key::

    sage: is_pr

Objects, functions, methods
---------------------------

Most names in Sage are either in *snake case* like ``bernoulli``,
``is_prime``, ``cos``, ... or *camel case* like
``VectorSpace``, ``PolynomialRing``, ``Matrix``, ... The
snake case notation is mostly reserved to functions

::

    sage: bernoulli(13)

::

    sage: is_prime(73)

::

    sage: cos(pi/3)

While camel case are often objects, that is to say after
calling it you obtain an object that you can query further::

    sage: K = GF(5)           # the field with 5 elements
    sage: K.cardinality()     # size of K

::

    sage: V = VectorSpace(K, 3)   # vector space K^3
    sage: V.cardinality()         # size of V

Note that in the above example we used ``K.cardinality()`` that
actually meant ``cardinality(K)``. Though in many programming
languages like Python functions are bind to objects. In this
situation they are named *methods*. Most method names are in
lower case. Tab-completion also applies to methods.
For example if you write ``V.`` in a cell and press the tab
key you will get all methods appliable to ``V``.

.. sagecell

While if you write ``V.card`` and press tab, you will magically
obtain ``V.cardinality`` because this is the unique method of ``V``
starting with ``card``

.. sagecell

Exercise 1.1
~~~~~~~~~~~~
A *partition* of a nonnegative integer `n` is a non-increasing list of
positive integers with total sum `n`.

Does Sage have a command for defining a partition ?

.. sagecell


(*hint*: type ``Part`` and then hit the ``<TAB>`` key)

Create the partition with list `[4, 3, 1, 1]` and assign it to the Python
name ``p``:

.. sagecell


(*hint*: to see documentation and examples for the Permutation command, type
``Partition?``)

Find the conjugate of ``p`` (and name it ``q``):

.. sagecell


Which of ``p`` and ``q`` dominates the other ?

.. sagecell


(*hint*: to see the methods available to the partition named ``p``, you can type
``p.`` and hit ``<TAB>``)


How did Sage decide whether ``p`` dominates ``q`` ?

.. sagecell

(*hint*: to access the source code, use ``p??``)


Exercise 1.2
~~~~~~~~~~~~

Find out what is the name of the function to construct
a matrix

.. sagecell

Compute the rank, the determinant and the Hermite normal form
of the following 5x5 integer matrix

.. MATH::

    \left(\begin{array}{rrrrr}
    8 & 0 & 7 & 5 & 6 \\
    9 & 0 & 6 & 9 & 4 \\
    4 & 9 & 5 & 3 & 0 \\
    6 & 9 & 4 & 9 & 3 \\
    0 & 8 & 4 & 5 & 6
    \end{array}\right)

.. sagecell

Obtain a latex code for this matrix using the function ``latex``

.. sagecell


Playing with integers
---------------------

To create an integer, simply write it in base 10 as::

    sage: 12395851

To assign the integer `14585` to a Python variable named ``n`` use::

    sage: n = 14585

Once the variable is created, you can access all its methods using
tab-completion. Write ``n.`` in the following cell and press the
tab key

.. sagecell

Exercise 1.3
~~~~~~~~~~~~

Find out the name of the method on integers that give the list
of prime factors of an integer ``n``

.. sagecell

(*note*: to do that, you first need to assign an integer to a Python variable
and use tab-completion on this variable)

Solve `Euler problem 3 <https://projecteuler.net/problem=3>`_: what
is the largest prime factor of the number `600851475143`

.. sagecell

Exercise 1.4
~~~~~~~~~~~~

Find the name of the function that given an integer ``n`` returns
the ``n``-th prime number

.. sagecell

Solve `Euler problem 7 <https://projecteuler.net/problem=7>`_: what is
the 100001-th prime number

.. sagecell

Exercise 1.5
~~~~~~~~~~~~

Solve `Euler problem 10 <https://projecteuler.net/problem=10>`_: what
is sum of prime numbers below two milions?

.. sagecell

(*hint*: You can use the function ``sum`` to make the sum of
elements in a list.)

Exercise 1.6
~~~~~~~~~~~~

What is the name of the method on integer that provides the list of
digits?

.. sagecell

Check that the sum of digits of `2^{15} = 32768` is `3 + 2 + 7 + 6 + 8 = 26`

.. sagecell

Solve `Euler problem 16 <https://projecteuler.net/problem=16>`_
and `Euler problem 20 <https://projecteuler.net/problem=20>`_

.. sagecell

Note that the comparison operators are ``==`` (for equality), ``!=`` (for
difference). You already used the sign ``=`` but for another purpose:
assignment of value to a variable.

Graphics and Symbolic functions
-------------------------------

It is often helpful to make pictures in mathematics. Sage comes with a lot
of graphical capabilities. The main commands for 2d plotting are

* ``plot``: plot an object
* ``point2d``: plot a list of points
* ``line2d``: draw a broken line between points
* ``polygon2d``: draw a polygon

For example::

    sage: plot(sin(x), (x, 0, 2*pi))

::

    sage: point2d([(0,0), (1,1), (2,0), (3,1)], color='red')

Graphics can be assigned to variables and it is possible to superimpose
them using addition::

    sage: P1 = plot(sin(x), (x, 0, 2*pi), color='blue')
    sage: P2 = plot(cos(x), (x, 0, 2*pi), color='red')
    sage: P = P1 + P2
    sage: P.show()

Note also that many objects possess a ``plot`` method that allows to produce
graphics::

    sage: m = AlternatingSignMatrices(20).random_element()
    sage: fpl = m.to_fully_packed_loop()
    sage: fpl.plot(link_color_map='rainbow')

To learn more about graphics, have a look at http://doc.sagemath.org/html/en/reference/plotting/sage/plot/plot.html
and https://doc.sagemath.org/html/en/tutorial/tour_plotting.html

Exercise 1.7
~~~~~~~~~~~~

Draw a graphics of the function `f(x) = \sin(x) + \cos(x) - x \exp(x)` for `x`
between `0` and `1`

.. sagecell

Using the function ``find_root``, obtain an approximation of the unique
solution `r` of `f(r) = 0` with `r \in (0,1)`.

.. sagecell

Draw a graphics of `f` together with a red vertical line between `(r, -1)`
and `(r, 1)`

.. sagecell

Exercise 1.8
~~~~~~~~~~~~

What are the first 20 terms of the Taylor expansion at `x = 0` of the function
`g(x) = 1 / \sqrt{1 - 4*x}`

.. sagecell

Check on the taylor expansion that

.. MATH::

    g(x) = \sum_{n \geq 0} \binom{2n}{n} x^n

.. sagecell

Combinatorics
-------------

In Sage, it is possible to build set of objects such that the `alternating sign
matrices <https://en.wikipedia.org/wiki/Alternating_sign_matrix>`_ of size `100
\times 100`::

    sage: A = AlternatingSignMatrices(100)
    sage: A

Exercise 1.9
~~~~~~~~~~~~

How many alternating sign matrices of size `100 \times 100` are there?

.. sagecell

How does it compare with the number of atoms in the universe?

Exercise 1.10
~~~~~~~~~~~~~

Solve `Euler problem 24 <https://projecteuler.net/problem=24>`_: what is the
millionth lexicographic permutation of `\{0, 1, \ldots, 9\}`?

.. sagecell

Exercise 1.11
-------------

Solve `Euler problem 5 <https://projecteuler.net/problem=5>`_:
what is the smallest positive number that is divisible by all of the
numbers from 1 to 20?

.. sagecell


More resources
--------------

On the `Euler project <https://projecteuler.net>`_ website you can find mathematical
challenges to be solved with a computer. You can challenge yourself with the following
ones that do not require any programming but only to find the right Sage function

Some other tutorial are available on internet, in particular

* `Official Python tutorial <https://docs.python.org/2.7/tutorial/>`_
