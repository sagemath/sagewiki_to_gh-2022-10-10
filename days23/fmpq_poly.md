
Writing a module fmpq_poly for rational polynomials in FLINT2. 

[Sebastian, Monday night, 01:30] 

1)  Naming conventions 

It has taken me a while to think about how to deal with the various problems associated to maintaining a very similar naming convention as well as functionality.  The things I am thinking of here are "truncate", which as mentioned earlier is both a high level "truncation modulo t^n" end-user routine as well as a low-level routine, and "normalise", which I'd like to have and use as a subroutine for the numerator integer polynomial but which should *not* ensure the coprimality of the numerator and denominator - this should be left to a method "canonicalise". 

I think the way to go about this is to simply have the functionality very similar to the fmpz_poly one but to simply document every method very carefully. 

As far as the prefix "_" is used in signatures, I think it would be good if as a general rule methods without a "_" prefix expected their input to be in canonical form, that is, with a normalised numerator integer polynomial and a positive integer denominator which is coprime to the content of the numerator polynomial. 

2)  Code written so far/ still to be written 

So far I've written the following.. 

fmpq_poly:  init, init2, realloc, fit_length, set_length, clear, normalise, canonicalise, set, is_zero, equal.  (No test code yet.) 

fmpz_vec:  content, scalar_divexact, scalar_fdiv_q, scalar_fdiv_q_2exp 

3)  static inline 

In fmpz_poly.h I saw a few "static inline" functions (like the one pasted below) which had some local variables.  I'm not really experienced in writing thread-safe C code, but I thought I'd quickly check this with you.  Couldn't this cause problems if different threads accessed and modified the same variable i simultaneously? 

static inline void _fmpz_poly_set_length(fmpz_poly_t poly, const ulong length) { 

         * if (poly->length > length) // demote coefficients beyond new length 
      * { 
               * ulong i; for (i = length; i < poly->length; i++) 
                                 * _fmpz_demote(poly->coeffs + i); } 
         * poly->length = length; 
} 

[Sebastian, Monday night, 2am] 

4)  White space 

It seems that more often than not the indentation is set to 4 spaces.  If I encounter something different in a part of a file that I'm working on, I might change it to 4 spaces.  I hope that's OK. 

5)  fmpz_vec:  aliasing 

There are quite a few ways that one might want to support aliasing for fmpz_vec methods.  Today already you mentioned that you'd want to support fmpz_vec operations in case where the resulting vector is exactly aligned with the input vector or vectors, but that other ways of overlapping input and output vectors should not be supported.  When fmpz_vec methods take an additional fmpz argument (e.g. for scalar multiplication and division), should it be supported that the additional fmpz is an entry in one of the vectors (input or output)? 

I guess it'd be a good idea to briefly think about what should be supported and to document that behaviour and then simply declare the behaviour "undefined" in the remaining cases? 

[Sebastian, Monday night, 3am] 

6)  Conversion between fmpz and mpz types 

At the moment I can't seem to find the methods "fmpz_to_mpz" and "mpz_to_fmpz". 

7)  More methods written 

fmpq_poly:  set_si, set_ui, set_fmpz, neg, inv, swap 

I still need to find the method "mpz_to_fmpz" in order to write the methods "set_mpz" and "set_mpq". 

[Sebastian, Tuesday morning, 11am] 

8)  Polynomial parameters 

I couldn't find the method "degree" for fmpz_poly.  I added the methods 

fmpq_poly:  degree, length 

[Sebastian, Tuesday before lunch, 2pm] 

I'm done - apart from testing! - with all the basic non-arithmetic functions now.  After lunch I'll work on addition and multiplication. 

[Sebastian, Tuesday night, 0:30am] 

9) Testing 

Lots of things done.  Testing for all the non-arithmetic function implemented so far. 

10) Arithmetic functionality 

Addition is almost done, still needs testing.  (Implement an "obviously" correct naive method, then compare the answers.) 

11) TODO in fmpz_vec 

Implement is_zero 
