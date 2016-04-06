{{{#!rst

"Mathematical" equality breaks Python
=====================================

There are a number of instances in Sage where the implementation of ``a==b`` breaks the contract that Python assumes for hash functions ob objects. (The following is unrelated to the problem of equality with coercion discussed on the page EqualityCoercion_.)

Fuzzy objects
-------------

Only fixed modulus p-adic numbers can implement an obvious hash functions. Currently some other p-adic elements do which causes horrible bugs:

::

    sage: @cached_function
    ....: def is_one(x):
    ....:     return x==1

    sage: R = Zp(3, 70)
    sage: is_one(R(1,1))
    True
    sage: is_one(R(2^64))
    True
    sage: R(2^64)
    1 + 2*3 + 2*3^2 + 3^3 + 3^4 + 2*3^5 + 3^7 + 2*3^8 + 3^10 + 2*3^11 + 2*3^13 + 3^14 + 2*3^16 + 3^18 + 3^19 + 2*3^20 + 3^21 + 3^23 + 2*3^25 + 3^26 + 2*3^27 + 2*3^28 + 3^29 + 2*3^30 + 2*3^31 + 2*3^34 + 2*3^35 + 2*3^36 + 3^37 + 3^38 + 3^39 + 3^40 + O(3^70)

The reason for this is that p-adics break Python's contract on hash functions, namely

    object.__hash__(self)
    Called by built-in function hash() and for operations on members of hashed collections including set,
    frozenset, and dict. __hash__() should return an integer. The only required property is that objects
    which compare equal have the same hash value;

With the current notion of equality, the only possible hash function would be a constant (which is not very useful) or a hash function that raises a TypeError (also not very useful.)

Fuzzy objects
-------------

Objects with different representations. An example here are fraction field elements or ideals. There is a well defined notion of equality. However, there is in general no normal form, so there is no non-trivial hash function for these objects.

}}}
