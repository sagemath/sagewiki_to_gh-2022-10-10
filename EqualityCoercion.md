{{{#!rst

Equality and Coercion could be harmful
======================================

The goal of this page is to gather all problems due to equality accepting coercion in borderline cases::

    sage: bool(pi == 3.14159265358979323)
    True
    sage: hash(pi)
    2943215493
    sage: hash(3.14159265358979323)
    1826823505

But gathered from Python 2.7 documentation::

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

}}}
