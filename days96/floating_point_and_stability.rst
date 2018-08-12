.. escape-backslashes
.. default-role:: math

Exact and float point computations - Stability and unstability in dynamics
==========================================================================

There are a lot of different numbers in Sage. You will need to choose which
kind of numbers you want to use depending on your computations. In this worksheet
we will consider the following types of numbers:

- integers and rationals

- floating point numbers

- symbolic expressions

- algebraic numbers

Integers, rationals and floating point
++++++++++++++++++++++++++++++++++++++

To create an integer or a rational number, you just write it as you would
do on a sheet of paper

::

    sage: 2 + 3^5    # an integer

::

    sage: 23 / 45    # a rational number

To create a floating point number, you need to add a dot

::

    sage: 1.0

::

    sage: 3.25 + 22.18

Contrarily to integers and rationals, a floating point number has limited
precision. Compare the results of the two following cells

::

    sage: 2^100 + 2^10 - 2^100

::

    sage: 2.0^100.0 + 2.0^10.0 - 2.0^100.0

Can you explain the above behavior?

**Exercise:** Find the smallest power ``n`` so that ``2^n + 1 - 2^n`` and
``2.0^n + 1 - 2.0^n`` provide different answers.

.. sagecell

If you have an object ``a`` and want to know what kind of number it is, you
can use one of the functions ``parent`` or ``type``. The former returns
the set in which your object belongs while the second one returns the
type of the object (in a computer programming sense).

::

    sage: a = 2
    sage: b = 3/2
    sage: c = 5.0

::

    sage: print parent(a)
    sage: print parent(b)
    sage: print parent(c)

::

    sage: print type(a)
    sage: print type(b)
    sage: print type(c)


Maps of the interval: fixed points and iteration
++++++++++++++++++++++++++++++++++++++++++++++++

Let us consider the map `f_4(x) = 4 x (1 - x)` from the interval `[0,1]` to itself.

**Exercise:** Prove that `f_4` is surjective and plot it

.. sagecell

Show that `f_4(3/4) = 3/4` (in other words, the point `3/4` is a fixed point of
`f_4`). What do you expect from the following two commands (you have to guess
whether the answer will be ``True`` or ``False`` and you can then check your answer
by executing the cell)::

    sage: s = 3.0 / 4.0
    sage: 4 * s * (1 - s) == s

Now let `f_{7/2}(x) = \frac{7}{2} x (1 - x)`.

Prove that `f_{7/2}` is not surjective on `[0,1]` and that `5/7` is a fixed point of `f_{7/2}`.

**Exercise:** Is the following ``True`` or ``False``?
(you have to guess before executing the cell)

::

    sage: s = 5.0 / 7.0
    sage: 7.0 / 2.0 * s * (1.0 - s) == s

**Exercise:** Perform the same two computations as above with rational numbers instead
of floating point.

.. sagecell

On a computer a floating point number is a number of the form `m\, 2^n` where
`m` (the mantissa) and `n` (the exponent) have some fixed bounds. In
particular, floating point numbers have *finite* precision. Computations with
floating points numbers are inaccurate but very efficient.

Compare the following computation with rationals::

    sage: s = 1
    sage: for i in range(10):
    ....:     s = (s + 2/s) / 2
    sage: print s
    sage: print s.numerical_approx()

and the same computation with floating point numbers::

    sage: s = 1.0
    sage: for i in range(10):
    ....:     s = (s + 2.0 / s) / 2.0
    ....: print s

What can you say? What are these loops computing?

**Exercise:** Let us consider go back to the function
`f_{7/2}(x) = {7/2} x (1 - x)` from the interval [0,1] to itself.
Starting from `x_0 = 5/7` as a rational number, compute 100
iterations of the map `f`. Print the result as a rational number
and get an approximation using the class function ``numerical_approx``.

.. sagecell

Redo the same iteration starting with the floating point
number ``5.0 / 7.0`` instead. Print the result.

.. sagecell

What do you conclude?

Symbolic expressions
++++++++++++++++++++

A symbolic expression is created anytime you invoke a symbolic function on
exact input. For example

::

    sage: pi

::

    sage: sqrt(2)

**Exercise:** What are the parent and type of the two above examples?

.. sagecell

As for integers and rationals, you can use ``numerical_approx`` to
obtain an approximation of your number

::

    sage: print pi.numerical_approx()
    sage: print sqrt(2).numerical_approx()

Iterating a map with symbolic expressions will give you more complicated
expressions.

**Exercise:** Startinf from ``x_0 = sqrt(2) - 1`` as a symbolic expression
apply 10 times the map `x \maspto 4 x (1 - x)`.

.. sagecell

How many characters are there in this expression?

.. sagecell

Symbolic expressions are useful to manipulate expression trees and apply
simplification rules. However, most of the time this is *not* what you
want to use.

Algebraic numbers
+++++++++++++++++

You might want to perform exact computations on real numbers but integers
and rationals are not enough. A field in between the rationals
and the set of real numbers is the set of algebraic numbers. In Sage it
is called ``AA``. Elements of ``AA`` might be recognized because when not
an exact rational they appear with a question mark at their right end

::

    sage: AA(2)
    sage: AA(2).sqrt()

**Exercise:** Check that the two numbers above are indeed elements of ``AA``.

.. sagecell

You can compare elements

::

    sage: a = AA(2).sqrt()
    sage: b = AA(3).sqrt()
    sage: 213 * a < 174 * b

Taking square roots is not the only way to build elements from ``AA``. The
most universal way is to construct roots of polynomials (with coefficients
in ``QQ`` or ``AA``)

::

    sage: x = polygen(QQ)
    sage: p1 = x^3 - 3*x^2 + x - 1
    sage: p2 = x^3 - x - 1
    sage: r1 = p1.roots(AA)
    sage: r2 = p2.roots(AA)
    sage: print r1
    sage: print r2

::

    sage: a = r1[0][0]
    sage: b = r2[0][0]
    sage: y = polygen(AA)
    sage: p = a * x^3 - b * x^2 + x - a*b
    sage: p.roots(AA)[0][0]

**Exercise:** Construct the number ``(2/5)^(1/3)`` as an element of ``AA``.

.. sagecell

The advantage of ``AA`` is that it is very flexible. On the other hand it
might be slow (even very slow). You can have faster numbers using number
fields that are intermediate between rationals and real numbers. To
construct a number field the basic syntax is as follows

::

    sage: x = polygen(QQ)
    sage: K = NumberField(x^3 - 2, 'cbrt2', embedding=AA(2)^(1/3))

Note that you have to explicitely embbed the number field in ``AA`` in
order for comparison to work properly.

::

    sage: a = K.gen()    # generator of the number field
    sage: print cbrt2 > 1
    sage: print cbrt2 < 2

---

:Authors:
    - Vincent Delecroix
:License: CC BY-SA 3.0

