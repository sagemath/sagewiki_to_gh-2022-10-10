Writing a module fmpq_poly for rational polynomials in FLINT2.

[Sebastian, Monday night, 01:30]

1)  Naming conventions

It has taken me a while to think about how to deal with the various problems associated to maintaining a very similar naming convention as well as functionality.  The things I am thinking of here are "truncate", which as mentioned earlier is both a high level "truncation modulo t^n" end-user routine as well as a low-level routine, and "normalise", which I'd like to have and use as a subroutine for the numerator integer polynomial but which should *not* ensure the coprimality of the numerator and denominator - this should be left to a method "canonicalise".

I think the way to go about this is to simply have the functionality very similar to the fmpz_poly one but to simply document every method very carefully.

As far as the prefix "_" is used in signatures, I think it would be good if as a general rule methods without a "_" prefix expected their input to be in canonical form, that is, with a normalised numerator integer polynomial and a positive integer denominator which is coprime to the content of the numerator polynomial.

2)  Code written so far/ still to be written

So far I've written the following..

fmpq_poly:  init, init2, realloc, fit_length, set_length, clear, normalise, canonicalise, set, is_zero, equal.  (No test code yet.)

fmpz_vec:  content

Apart from the code in fmpq_poly, I still need to write..

fmpz_vec:  scalar division

3)  static inline

In fmpz_poly.h I saw a few "static inline" functions (like the one pasted below) which had some local variables.  I'm not really experienced in writing thread-safe C code, but I thought I'd quickly check this with you.  Couldn't this cause problems if different threads accessed and modified the same variable i simultaneously?

static inline
void _fmpz_poly_set_length(fmpz_poly_t poly, const ulong length)
{
    if (poly->length > length) // demote coefficients beyond new length
   {
      ulong i;
      for (i = length; i < poly->length; i++)
            _fmpz_demote(poly->coeffs + i);
   }

    poly->length = length;
}
