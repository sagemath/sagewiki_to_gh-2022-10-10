

# SageX hacking example --- fix the mangled pow() function

Some useful links:  

      * <a class="http" href="http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/version/Doc/overview.html">http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/version/Doc/overview.html</a> 
Pyrex has an unfortunate bug in the way it handles the power function for cdef integers. Namely 


```python
#!python 
%pyrex

def foo(int n):
    return 2**n
```

```txt
foo(3)
///
8.0
```
Looking at the c source code we see the the error on line 85 


```txt
  __pyx_1 = PyFloat_FromDouble(pow(2, __pyx_v_n)); if (!__pyx_1) {__pyx_filename = __pyx_f[0]; __pyx_lineno = 7; goto __pyx_L1;}
```
Here the c function pow() is being used, which only operates on doubles. This is fine if the return type is a float, but if it is, say, a python object, then this code (potentially) violates two principles: (1) Behave like python when possible and (2) arithmatic on two cdef ints (longs, etc.) should return an int (long, etc.) 

Expand the sagex spkg found in SAGE_ROOT/spkg/standard (tar xvfj sagex-20070126.spkg). Now the all the code we want to look at (for this problem) is in Pyrex/Compiler/. Most of the time you will want to look at Parsing.py (for parsing) and Node.py/ExprNode.py (for code generation). Read the comments at the top of those files, but don't be worried if you don't underand them right away.  

The relavent code is in the <a href="/PowNode">PowNode</a>.compute_c_result_type() function (line 2514).  


```txt
    def compute_c_result_type(self, type1, type2):
        if self.c_types_okay(type1, type2):
            return PyrexTypes.c_double_type
        else:
            return None
```
The questions now becomes, what is the best way of fixing this issue.  

         * Leave as is. 
         * Dissallow (int)**(int), forcing the user to do an explicit cast. 
         * Use the pow() function, coercing the result back to an int. 
         * Write a pow() function for ints, longs, etc.  
I'm leaning towards #2 
