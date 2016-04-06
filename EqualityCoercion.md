{{{#!rst

Equality using Coercion considered harmful?
===========================================

Currently, Sage specifies that, upon comparing with ``a==b`` two objects `a` and `b` that do not have the same parent, a coercion is attempted to put them in the same parent. To prepare a discussion on whether that specification is viable in the long run, we are gathering here (borderline?) use cases where this behaviour is harmful. (Note that there is also the related problem of broken notions of equality for elements with the same parent which is discussed at EqualityUnhashable_.)

::

    sage: bool(pi == 3.14159265358979323)
    True
    sage: hash(pi)
    2943215493
    sage: hash(3.14159265358979323)
    1826823505

However Python 2.7 documentation specifies::

    object.__hash__(self)
    Called by built-in function hash() and for operations on members of hashed collections including set,
    frozenset, and dict. __hash__() should return an integer. The only required property is that objects
    which compare equal have the same hash value;

As a first consequence of the above behavior::

    sage: {3.1415926535897932: 'approx', pi: 'exact'}
    {3.1415926535897932: 'approx', pi: 'exact'}
    sage: {0:"exact", 0.0000000000000000000:"approx"}
    {0: 'approx'}

And also::

    sage: pii = 3.14159265358979323
    sage: bool(pii == pi)
    True
    sage: dd = {pi: "exact"}
    sage: pi in dd
    True
    sage: pii in dd
    False
    sage: pii in dd.keys()
    True


pi is an integer (and transitivity of equality)
-----------------------------------------------

::

    sage: R1 = RealField(2)
    sage: R2 = RealField(56)
    sage: pi1 = R1(pi); pi1
    3.0
    sage: pi2 = R2(pi); pi2
    3.141592653589793
    sage: pi1 == pi2
    True
    sage: bool(pi == pi2)
    True
    sage: pi1 == 3
    True

And we get a nice proof that pi = 3.

More strange consequences when using UniqueRepresentation
---------------------------------------------------------

::

    sage: F1 = FiniteEnumeratedSet([0.000000])
    sage: F2 = FiniteEnumeratedSet([0])
    sage: F1 is F2
    True
    sage: F2.list()
    [0.000000000000000]
    sage: 

An example showing that Sage's specifications clashes with Python's specifications
----------------------------------------------------------------------------------

::

    sage: S = SymmetricFunctions(QQ)
    sage: x = S.s()[5]
    sage: y = S.p()(x)
    sage: x == y
    True
    sage: hash(x), hash(y)
    (-1840429907820881728, 5178019317311573726)

It's surely syntactically nice to have x == y evaluate True after a
coercion. However enforcing that the two hash functions be the same
would be simply impossible: this would force to systematically coerce
any symmetric function to some fixed base for computing the hash
function, and we just can't afford that.

}}}
