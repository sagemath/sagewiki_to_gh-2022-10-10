= Sage FAQ: Frequently Asked Questions =
----------
 * QUESTION: Is there anything so Sage can be made to automatically execute commands on startup?
 * ANSWER: Yes, just make a file {{{$HOME/.sage/init.sage}}} and it will be executed any time you start sage.
----------
 * QUESTION: My Sage upgrade failed with missing gmp symbols on OSX 10.4. What can I do?
 * ANSWER: Moving a sage install on OSX 10.4 and then upgrading anything that is linked against NTL leads to link errors due to missing gmp symbols. The problem is the link mode with which the dynamic NTL is created. I have a fix, but I am currently verifying that it really fixes the issue. Everything that is linked against NTL needs to be recompiled, i.e. singular and cremona at the moment. To add to the confusion: This is not an issue on OSX 10.5. A fix for this issue went into 2.8.15, so please report if you see this with a more current Sage release.
----------
 * QUESTION: Sage fails with the error message {{{restore segment prot after reloc: Permission denied}}}. What is wring?
 * ANSWER: The problem is related to SELinux: http://www.ittvis.com/services/techtip.asp?ttid=3092. We are currently tracking this issue at http://www.sagetrac.org/sage_trac/ticket/480.
----------
 * QUESTION: Upgrading Sage went fine, but now the banner still shows the old version. How can I fix this?
 * ANSWER: Try doing {{{sage: hg_scripts.merge()}}} followed by {{{sage: hg_scripts.commit()}}}.
----------
 * QUESTION: I downloaded a Sage binary and it crashes on startup with {{{Illegal instruction}}}. What can I do?
 * ANSWER: The binaries have been built for a newer architecture than you have. We want to acquire an older machine and install a bunch of minimal Linux images on it for building Sage binaries to avoid this, but it hasn't happened  yet. The solution is to build from source until then.
----------
 * QUESTION: May I use Sage tools in a commercial environment?
 * ANSWER: YES!  Absolutely!  Basically the *only* constraint is that if you make changes to Sage itself and redistribute this changed version of Sage publically, then you must make these changes available to us so that we can put them into the standard version of Sage (if we want).   Otherwise, you'll free to use as many copies of Sage as you want completely for free to make money, etc., without paying any license fees at all.
----------
 * QUESTION: I want to write some Pyrex code that uses finite field arithmetic but {{{cimport sage.rings.finite_field_givaro}}} fails. What can I do?
 * ANSWER: You need to give hints to Sage so that it uses C++ (both Givaro and NTL are C++ libraries) and it also needs the GMP and STDC C++ libraries. Here is a small example:

{{{
# These comments are hints to Sage/Pyrex about the compiler and
# libraries needed for the Givaro library:
#
#clang c++ 
#clib givaro gmpxx gmp m stdc++

cimport sage.rings.finite_field_givaro

# Construct a finite field of order 11.
cdef sage.rings.finite_field_givaro.FiniteField_givaro K
K = sage.rings.finite_field_givaro.FiniteField_givaro(11)

print "K is a", type(K)

print "K cardinality =", K.cardinality()

# Construct two values in the field:
cdef sage.rings.finite_field_givaro.FiniteField_givaroElement x
cdef sage.rings.finite_field_givaro.FiniteField_givaroElement y
x = K(3)
y = K(6)

print "x is a", type(x)
print "x =", x
print "y =", y
print "x has multiplicative order =", x.multiplicative_order()
print "y has multiplicative order =", y.multiplicative_order()
print "x*y =", x*y

# Show that x behaves like a finite field element:
for i in range(1, x.multiplicative_order() + 1):
    print i, x**i


assert x*(1/x) == K.one_element()
}}}

To find out more, type {{{sage.rings.finite_field_givaro.FiniteField_givaro.}}} at the Sage prompt and hit tab, then use ?? to get more info on each function. For example:

{{{sage.rings.finite_field_givaro.FiniteField_givaro.one_element??}}}

tells you more about the multiplicative unit element in the finite field.
