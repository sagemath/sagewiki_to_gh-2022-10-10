.. escape-backslashes
.. default-role:: math

Chapter 4: Functions
====================

:Authors:
    - Vincent Delecroix
:License: CC BY-SA 3.0

The aim of this fourth chapter is to introduce you to write yourself
your own function. This is useful if you want to reuse many times
the same piece of code while not copy/pasting it.

The structure of a function is always the same::

    sage: def f(n):
    ....:     f = n.prime_factors()
    ....:     return f[-1] + 1

Exercise 4.1
~~~~~~~~~~~~

Write a function computing the area of a triangle from the length of the three
sides::

    sage: # edit here

Exercise 4.2
~~~~~~~~~~~~

The duration of sunshine `D(\beta, d)` on a given place on Earth is given by
the formula

.. MATH::

    D(\beta,d) = 24 - \frac{24}{\pi}\arccos\left( \tan \beta \cdot
    \tan\left(\arcsin\left(\sin(\kappa)\cdot \sin\left(\frac{2\pi}{365}d
    \right)\right)\right)\right)

where `\kappa=\frac{23.44}{180}\pi` is the inclination of the earth in radian,
`d\in[0,365]` is the number of days after the spring equinox and
`\beta\in[-\pi/2,\pi/2]` is the latitude of the place in question.
Write the function ``D(beta, d)``::

    sage: # edit here

Construct the list of duration of sunshine in Marseille for the 31 days of the
month of July 2017::

    sage: # edit here

.. http://maths-au-quotidien.fr/lycee/duree.pdf
.. >>> D = 24 - S(24)/pi*acos(tan(beta)*tan(asin(sin(kappa)*sin(pi*S(2)/365*d))))
.. >>> DD = 24 - S(24)/pi*acos(tan(beta)*tan(alpha))

Exercise 4.3
~~~~~~~~~~~~

Let the sequence `u_{n+1}= \frac{1}{1+u_n^2}` with `u_0=0`.  Write a function
``U(n)`` which returns the value of `u_n`. Compute `u_{20}`::

    sage: # edit here

Exercise 4.4
~~~~~~~~~~~~

Write a function ``product_of_digits(n)`` which returns the product of the
digits of `n` written in base `10`::

    sage: # edit here

Exercise 4.5
~~~~~~~~~~~~

The number 6 is called a *perfect* number, because it is equal to the sum of
its proper divisors: `6=1+2+3`.  Write a function ``is_perfect(n)`` which
returns ``True`` or ``False`` whether the number ``n`` is perfect::

    sage: # edit here

Find all four perfect numbers below `10000`::

    sage: # edit here

Find all four perfect numbers below `10^6`::

    sage: # edit here

https://projecteuler.net/problem=23
(abundant, perfect, non-abundant numbers)

