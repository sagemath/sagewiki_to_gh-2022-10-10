= SageX bug fixing -- fix the mangled pow() function =

Pyrex has an unfortunate bug in the way it handles the power function for cdef integers. Namely

{{{#!python
%pyrex

def foo(int n):
    return 2**n
}}}

{{{
foo(3)
///
8.0
}}}

Looking at the c source code we see the the error on line 85

{{{
  __pyx_1 = PyFloat_FromDouble(pow(2, __pyx_v_n)); if (!__pyx_1) {__pyx_filename = __pyx_f[0]; __pyx_lineno = 7; goto __pyx_L1;}
}}}

Here the c function pow() is being used, which only operates on doubles. This is fine if the return type is a float, but if it is, say, a python object, then this code is incorrect. I will change this so that the resulting type is an integer in this case. 

Some useful links: 

   * [http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/version/Doc/overview.html]
