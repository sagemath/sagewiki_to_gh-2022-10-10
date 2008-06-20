= Carl -- what I did at dev1 =

1. Fixed a lot of coercion-branch doctests.

2. Discussed changes to Cython for fast numpy array access (and some other language/compiler changes).

3. Discussed changes to fast_float: support more data types than only C doubles; evaluate DAGs with shared subexpressions; support conditionals; and possibly use a JIT for a further speedup (probably at least 5x on "sufficiently complicated" examples).

4. Demonstrated sage_input and posted a preliminary version on TRAC.
