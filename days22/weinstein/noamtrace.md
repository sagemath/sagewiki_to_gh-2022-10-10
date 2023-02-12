

```txt
> See this worksheet, which has the polynomials and two examples:

Thanks.  So this is the curve  E: y^2 + y = x^3 - x.  The discriminant
w.r.t. y is D = 4*x^3 - 4*x + 1, so we're seeking quadratic forms
[A,B,C] over Q(x) with B^2-4AC=D; the class group of such forms
is isomorphic with the E(Q).

Let's do the case of discriminant -115 first, because the class number
is only 2.  You get a point (x,y)=(a,a+8) where a^2+5a+12=0.  This means
that  D=B^2-4AC  with  A = x^2+5*x+12,  B = 2*y+1 = 2*x+17.  (In general
B will be 2*y + a1*x + a3.)  So C = (D-B^2)/(4*A) = 6-x.  This (A,B,C)
is not reduced because deg(C) > deg(A).  Replacing (A,B,C) by the
equivalent (C,-B,A) yields (6-x, -(2*x+17), x^2+5*x+12).  To finish the
reduction, take (A,B,C) to (A, B-2*d*A, C-d*B+d^2*A) where d is the
polynomial part of C/(2*A); here d=1 so we get

 (A, B-2*A, C-B+A) = (6-x, -29, x^2+6*x+35) .

Thus the trace is (x,y) = (6,-15) which is the (-6)th multiple of
the standard generator (0,0), as expected (up to sign).

For discriminant -47 we have

 D = 4*x^3 - 4*x + 1  \\ as before
 A = x^5 - x^4 + x^3 + x^2 - 2*x + 1 \\ "y_1[0].minpoly()"
 B = 2*(x^4+x-1) + 1  \\ 2*y+1 as before
 C = (B^2-D) / (4*A) \\ = x^3 + x^2

and the reduction can be implemented as follows:

 verbose = 1;
 {
 while(poldegree(C)<poldegree(A),
   A_copy = A;  A = C;  C = A_copy;  B = -B;  \\ (A,B,C) <-- (C,-B,A)
   d = B \ (2*A);     \\ happily gp interprets "\" correctly
   C += d*(d*A-B);
   B -= 2*d*A;
   if(verbose,print([A,B,C]))
 )
 }

and since I set "verbose" to be nonzero the output keeps track of
the reduction as it progresses:

 [x^3 + x^2, -2*x^2 - 2*x + 1, x]
 [x, -1, -x^2 + 1]

at the last step we find that the trace has x=0 (the root of A)
and y=-1 (because 2*y+1 = -1).  So it's -1 times the standard generator.
Again this is consistent with the computation you report.

Here's an example of what happens when the trace is zero.  The first case
is discriminant -139; using the same program but with -139 in place of
-47 or -115, I find (on sage.math.washington.edu -- Heegner_point
isn't yet implemented in the version of sage at alhambra)
(x, y) = (A, 5*A-4) with  A^3 - 25*A^2 + 34*A - 12 = 0.  So here

 A = x^3 - 25*x^2 + 34*x - 12;
 B = 2*(5*x-4) + 1;
 C = (B^2-D) / (4*A);

makes C = -1, and the reduction algorithm reaches [-1, 0, x^3-x+1/4]
in one step.  Since here deg(A)=0 we have the trivial element of the
class group, i.e. the origin of the group law.

This is the example used in the original Gross-Zagier paper, where
they showed directly that the trace is zero by producing a modular
function on X_0(37)/w [which is the elliptic curve 37A1 -- the
parametrization degree is 2] with a triple pole at the cusp and
zeros at the CM-139 point!

NDE

PS:

I wrote:

> Here's an example of what happens when the trace is zero.
> The first case is discriminant -139;

No it isn't, though it *is* historically first...  Here's what
it looks like for D = -95, which also has a larger class number
so you can see more steps of the reduction algorithm.  Change the
and B lines to

 A = x^8 - 5*x^7 + 7*x^6 + 13*x^5 - 10*x^4 - 4*x^3 + x^2 - 5*x + 7
 B = 2*(24*x^7-55*x^6-78*x^5+683*x^4-234*x^3+1017*x^2+1905*x-2821)/2329 + 1

and then the same algorithm works, reaching in three steps an equivalent
(A,B,C) with deg(A)=0.  It accumulates unnecessary denominators along
the way, so the final A is not 1 or -1 as before but 331776/5424241
= 2^12 3^4 / (17 * 137)^2, with the denominator coming from B
(which is an algebraic integer but not necessarily in Z[x]),
and thus C is the quotient of D by the same constant.
This behavior  can be ameliorated by inserting a couple of lines
at the start of the loop that scale A and C so that the "content"
(gcd of coefficients) of A, and usually of C, is the same as that of B:

 {
 while(poldegree(C)<poldegree(A),
   c = content(B)/content(A);
   A *= c;  C /= c;
   if(verbose, c=content([A,B,C]); print(c,"*",[A,B,C]/c));
   A_copy = A;  A = C;  C = A_copy;  B = -B;  \\ (A,B,C) <-- (C,-B,A)
   d = B \ (2*A);     \\ happily gp interprets "\" correctly
   C += d*(d*A-B);
   B -= 2*d*A;
 )
 }
 [A,B,C]

the output is then better behaved (NB I cheated a bit by prettifying
the print line):

 1/2329*[x^8 - 5*x^7 + 7*x^6 + 13*x^5 - 10*x^4 - 4*x^3 + x^2 - 5*x + 7, 48*x^7 - 110*x^6 - 156*x^5 + 1366*x^4 - 468*x^3 + 2034*x^2 + 3810*x - 3313, 576*x^6 + 240*x^5 - 3551*x^4 + 14441*x^3 + 19424*x^2 + 14908*x + 198276]
 1/1152*[2304*x^6 + 960*x^5 - 14204*x^4 + 57764*x^3 + 77696*x^2 + 59632*x + 793104, -96*x^5 + 316*x^4 - 580*x^3 - 2560*x^2 + 4624*x - 20496, x^4 - 7*x^3 + 32*x^2 - 68*x + 132]
 1*[x^4 - 7*x^3 + 32*x^2 - 68*x + 132, -2*x^2 + 6*x - 23, 1]
 [1, 0, -x^3 + x - 1/4]


Hope this helps,
--NDE

PSS:

BTW if you're going to implement something like this in Sage
you'll probably want to check first that the content ratio is nonzero.
(If it's zero then B=0 and you've found a 2-torsion point, which
cannot happen on 37A but will occur in other examples.)

This should all work on hyperelliptic curves too -- it must be
basically the reduction part of Cantor's algorithm.

NDE
```