Some bugs involving the Macaulay2-sage interface

1. In a notebook, running sage, the following displays the tex source instead of the formatted tex.

{{{
    m = macaulay2('matrix {{1,2},{3,4}}')
}}}

2. interact doesn't work well will Macaulay2, in a terminal window:

{{{
sage: m2 = Macaulay2()
sage: m2.interact()
}}}

{{{
  --> Switching to Macaulay2 <-- 
}}}
{{{
macaulay2: R = QQ[x,y]
}}}
{{{
------------------------------------------------------------
   File "<ipython console>", line 3
     PolynomialRing)
                  ^
SyntaxError: invalid syntax
}}}
