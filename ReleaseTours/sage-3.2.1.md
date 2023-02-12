

# Sage 3.2.1 Release Tour

Sage 3.2.1 was released on December 1, 2008. For the official, comprehensive release notes, see <a class="http" href="http://www.sagemath.org/src/announce/sage-3.2.1.txt">sage-3.2.1.txt</a>. 


## Algebra

* Divisors over integers (Robert Bradshaw) -- A much simpler and faster algorithm for the divisors function over integers. The new optimized code is faster than a similar integer divisor function in the version of PARI/GP that's bundled with Sage 3.2.1, as well as outperforming a similar integer divisor function found in the version of Magma that Sage 3.2.1 interfaces with. 
* Finite field operations (John Palmieri) -- A few methods for finite field elements including additive order, p-th power, and p-th root where p is the characteristic of the field. 

## Basic arithmetic

* Polynomials over a field (Burcin Erocal) -- Improving the user interface of polynomial classes.  
* Polynomial square roots (John Palmieri, Carl Witty) -- A method to test whether a polynomial is square over the field it is defined. If the polynomial is square, then the method has the option of returning a square root. 

## Build

* Improve `sage -upgrade` (William Stein, Michael Abshoff) -- The Sage upgrade command can now take an optional URL from which it will pull all spkg's, and this URL can be a Sage install.  The upgrade command lists packages that will be upgraded before upgrading them, and autodownloads a new version of any spkg that hasn't successfully been installed before upgrading it.  
* Problematic CPU flags (William Stein, Michael Abshoff) -- Binary distributions of Sage for Linux (e.g. Ubuntu) may not work properly once installed. The following CPU flags are known to prevent Sage from running properly: sse, 3d, mmx, pni, and cmov. 

## Calculus

* Gamma and factorial functions (Mike Hansen, Burcin Erocal, Wilfried Huss) -- Symbolic gamma and factorial functions. 
* Update to sympy-0.6.3 (Ondrej Certik) -- Update to the latest upstream of <a href="/SymPy">SymPy</a> (sympy-0.6.3), which is a Python library for symbolic mathematics. For more information about <a href="/SymPy">SymPy</a>, please visit <a href="http://code.google.com/p/sympy/">http://code.google.com/p/sympy/</a>. 
* Numerical trigonometry (Robert Bradshaw) -- Optimized floating point evaluation of trigonometric functions such as sine and cosine. For example, numerical calculation of sine via _fast_float_ is now twice as fast as math.sin. 
* Floating point calculation (Robert Bradshaw) -- Changing the parsing code for numerical computation to use RDF, which is a better reflection of the underlying precision. For calculus expressions involving real numbers, redundant trailing zeros are removed. 

## Coercion

* Coercion API (Robert Bradshaw) -- Some simplification of the coercion interface. 

## Combinatorics

* Coding theory (David Joyner) -- Several changes in linear_codes.py which should speed up (and in some cases do:-) some coding theory computations considerably. It adds interfaces to Cython and C functions of Robert Miller, CJ Tjhal, and Jeffery Leon. Speed up of minimum_distance (for codes over GF(2) and GF(3)), the spectrum (=weight_distribution), and permutation_automorphism_group are expected and in most cases achieved. (Also a new function is_permutation_equivalent was added, which interfaces with Robert Miller's double coset partition refinement code.) 
* Incidence structures and block designs (David Joyner) -- Beginning of an incidence structure class and an implementation of some basic block design algorithms. A few functions require GAP's Design package (which is included in gap_packages-4.4.10_6.spkg) but calling GAP or GAP's Design was only done when the corresponding Sage functionality was missing. Robert Miller's recent code on computing the automorphism group of a non-linear binary code was used to implement the automorphism group of a block design.  

## Finance

* Obtaining high resolution financial data (Chris Swierczewski, Brett Nakashima, William Stein) -- Refined ability to obtain weekly and daily financial data from Google Finance and Yahoo Finance. Input options, such as start date and end date, are more user-friendly. More elaborate documentation. Some support for international (read: non-NASDAQ or NYSE) stock exchanges. 

## Testing

* Added only_optional doctest option (William Stein) -- Added a new option `sage -t -only_optional=component` that allows one to run only the optional doctests that depend on a given component.   Thus much of the optional functionality of Sage will now be much easier to automatically test.  