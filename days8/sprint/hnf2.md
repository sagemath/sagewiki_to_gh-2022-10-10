=  Further optimize the implementation of Hermite Normal Form in Sage =

PEOPLE: Clement Pernet, William Stein

SUMMARY: Do the following:

   1. Rewrite add row to (a) use a block method, and (b) use fast non-recursive code (it is silly right now).

   2. Implement (or wrap?) Clement's "twice as fast" double det. ---> done(cpernet 03/01/08), still need some tune-up.

   3. Improve LinBox rational solver: efficiency with small size entries, endianness issue making it brake on solaris;

       Wrap it in sage

   4. Validate linbox-1.1.5rc1.spkg and givaro-3.2.10.spkg for sage-2.10.3
