
Some bugs involving the Macaulay2-sage interface 

1. In a notebook, running sage, the following displays the tex source instead of the formatted tex. 


```txt
    m = macaulay2('matrix {{1,2},{3,4}}')
```
2. interact doesn't work well will Macaulay2, in a terminal window: 


```txt
sage: m2 = Macaulay2()
sage: m2.interact()
```

```txt
  --> Switching to Macaulay2 <-- 
```

```txt
macaulay2: R = QQ[x,y]
```

```txt
------------------------------------------------------------
   File "<ipython console>", line 3
     PolynomialRing)
                  ^
SyntaxError: invalid syntax
```
3. getting code for Macaulay2 functions displays the code, but gives an error. 


```txt
sage: m2.gcd??
```

```txt
Type:           Macaulay2Function
Base Class:     <class 'sage.interfaces.macaulay2.Macaulay2Function'>
String Form:    gcd
Namespace:      Interactive
File:           /Volumes/me/local/software/sage/sage-3.2.3/local/lib/python2.5/site-packages/sage/interfaces/macaulay2.py
Source:
code(methods gcd)

o5 = -- code for method: gcd(List)
     /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/integers.m2:28:15-28:33: --source code:
     gcd List := x -> gcd toSequence x
     ---------------------------------
     -- code for method: gcd(QQ,QQ)
     /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/integers.m2:32:27-34:50: --source code:
     gcd(QQ,QQ) := QQ => (x,y) -> (
          d := denominator x * (denominator y // gcd(denominator x, denominator y));
          gcd(numerator (x * d), numerator (y * d)) / d)
     ---------------------------------
     -- code for method: gcd(QQ,ZZ)
     /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/integers.m2:31:27-31:80: --source code:
     gcd(QQ,ZZ) := QQ => (y,x) -> gcd(x * denominator y, numerator y) / denominator y
     ---------------------------------
     -- code for method: gcd(RingElement,RingElement)
     /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/factor.m2:12:54-28:11: --source code:
     gcd(RingElement,RingElement) := RingElement => (r,s) -> (
          R := ring r;
          if ring s =!= R then error "gcd: expected elements in the same ring";
          if isField R then if r == 0 and s == 0 then 0_R else 1_R
          else if factoryAlmostGood R then (
               if (options R).Inverses then (r,s) = (numerator r, numerator s);
               new ring r from rawGCD(raw r, raw s))
          else if instance(R,PolynomialRing) and numgens R == 1 and isField coefficientRing R then monic (
               -- does this depend on the monomial order in R, too?
               -- would this code work for more than one variable?
               if r == 0 then s
               else if s == 0 then r
               else (
                    a := (syz( matrix{{r,s}}, SyzygyLimit => 1 ))_(0,0);
                    if s%a != 0 then error "can't find gcd in this ring";
                    s // a))
          else notImplemented())
     ---------------------------------
     -- code for method: gcd(RingElement,ZZ)
     /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/factor.m2:10:30-10:55: --source code:
     gcd(RingElement,ZZ) := (r,s) -> gcd(promote(s,ring r),r)
     ---------------------------------
     -- code for method: gcd(Sequence)
     /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/methods.m2:56:11-69:16: --source code:
          args -> (
               -- Common code for every associative method without options
               if #args === 2 then binaryLookup args
               else if #args >= 3 then (
                    r := self(args#0,args#1);
                    for i from 2 to #args-1 do r = self(r,args#i);
                    r)
               else if #args === 1 then args#0
               else if #args === 0 then (
                    f := lookup (1 : methodFunction);
                    if f === null then noMethod(methodFunction,args,outputs) else f args
                    )
               else error "wrong number of arguments"
               );
     | symbol           class                      value                                                   location of symbol
     | ------           -----                      -----                                                   ------------------
     | outputs        : List                    -- {false, false, false, false}                            /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/methods.m2:48:21-48:27
     | methodFunction : CompiledFunctionClosure -- gcd                                                     /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/methods.m2:49:6-49:19
     | binaryLookup   : FunctionClosure         -- {*Function[/Volumes/me/local/me-2/src/M2/BUILD/mike/da. /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/methods.m2:50:6-50:17
     | self           : FunctionClosure         -- {*Function[/Volumes/me/local/me-2/src/M2/BUILD/mike/da. /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/methods.m2:55:34-55:37
     ---------------------------------
     -- code for method: gcd(ZZ,QQ)
     /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/integers.m2:30:27-30:80: --source code:
     gcd(ZZ,QQ) := QQ => (x,y) -> gcd(x * denominator y, numerator y) / denominator y
     ---------------------------------
     -- code for method: gcd(ZZ,RingElement)
     /Volumes/me/local/me-2/src/M2/BUILD/mike/darwin64/installed/share/Macaulay2/Core/factor.m2:9:30-9:55: --source code:
     gcd(ZZ,RingElement) := (r,s) -> gcd(promote(r,ring s),s)
     ---------------------------------
     -- code for method: gcd(ZZ,ZZ)
     function 'gcd0': source code not available

*** ERROR: EOF in multi-line statementCall def: m2.gcd(self, *args, **kwds)

Call docstring:
    x.__init__(...) initializes x; see x.__class__.__doc__ for signature
```
4. C.dd, C.dd_3, (for C a Macaulay2 chain complex) should work.  For now, C.dot("dd")[3] works. C.dd should probably return a sage list of Macaulay2 matrices, until a '<a href="/ChainComplex">ChainComplex</a>' type is defined. 

5. The M2 executable should be called with a new argument "--print-width 0", so that M2 doesn't try to wrap output going to sage. 

6. In a notebook, in Macaulay2 mode, 'help' does not display all of its input.  Also, it would be nice to format it, or have a background for it similar to sage help. 


```txt
help minors
///

minors -- ideal generated by minors
***********************************

Synopsis
========

  * Usage: minors(n,M)
  * Inputs:
      * n, an integer, order of the minor
      * M, a matrix, a map between free modules
  * Outputs:
      * an ideal, the ideal generated by the n by n minors of the matrix M
  * Optional inputs:
      * First => a list, default value null, if given, should be a list of
        two integer lists, which will be the first minor computed
      * Limit => an integer, default value infinity, the maximum number of
        minors to find
      * Strategy => ...,  -- choose between Bareiss and Cofactor algorithms


Description
===========

Minors are generated in the same order as that used by "subsets(ZZ,ZZ)".

+--------------------------------------------------+
```