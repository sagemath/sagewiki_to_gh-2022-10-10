

# Carl -- what I did at dev1

1. Fixed a lot of coercion-branch doctests. 

2. Discussed changes to Cython for fast numpy array access (and some other language/compiler changes). 

3. Discussed changes to fast_float: support more data types than only C doubles; evaluate DAGs with shared subexpressions; support conditionals; and possibly use a JIT for a further speedup (probably at least 5x on "sufficiently complicated" examples). 

4. Demonstrated `sage_input` and posted a preliminary version on Trac (<a href="http://trac.sagemath.org/sage_trac/ticket/3485">http://trac.sagemath.org/sage_trac/ticket/3485</a>) 

Example: 
```txt
sage: sage_input((polygen(GF(3))+1)^4)

R.<x> = GF(3)[]
x^4 + x^3 + x + 1
```
5. Gave a quick talk on Cylindrical Algebraic Decomposition. 

6. Brought a Segway and gave rides. 
