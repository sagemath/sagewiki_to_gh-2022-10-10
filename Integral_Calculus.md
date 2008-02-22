= Integral Calculus =


Besides the examples on this page, please see the discussion in ["BasicCalculus"].

== Definite and Indefinite Integrals ==

SAGE can compute both definite integrals like $\int_0^1 \frac{dx}{x^3+1}$ and 
indefinite integrals such as $\int \frac{dx}{x^3+1}$:


{{{
sage: print integrate(1/(x^3+1),x)
                                         2 x - 1
                       2	    atan(-------)
                  log(x  - x + 1)	 sqrt(3)    log(x + 1)
                - --------------- + ------------- + ----------
                         6	       sqrt(3)	        3
sage: integrate(1/(x^3+1), x, 0, 1)
(6*log(2) + sqrt(3)*pi)/18 + sqrt(3)*pi/18
}}}
More examples:

{{{
sage: integrate(1/x^2, x, 1, infinity)
1
sage: f = x^3 
sage: f.integral()
x^4/4
sage: integral(x^3,x)
x^4/4
sage: f = x*sin(x^2)
sage: integral(f,x)
-cos(x^2)/2
}}}

=== The Definite Integral ===

          o The definition of area under curve

          o Relation between velocity and area

          o Definition of Integral

          o The Fundamental Theorem of Calculus 

== Indefinite Integrals and Change ==

          o Indefinite Integrals

          o Physical Intuition 

== Substitution and Symmetry ==

          o The Substitution Rule

          o The Substitution Rule for Definite Integrals

          o Symmetry 

== Applications to Areas, Volume, and Averages ==

=== Using Integration to Determine Areas Between Curves ===

=== Computing Volumes of Surfaces of Revolution ===

=== Average Values ===

== Polar coordinates and complex numbers ==

       o Polar Coordinates

       o Areas in Polar Coordinates

       o Complex Numbers

       o Polar Form 

       o Complex Exponentials and Trig Identities

       o Trigonometry and Complex Exponentials 


== Integration Techniques ==

=== Integration by parts ===

=== Trigonometric integrals ===

       o Some Remarks on Using Complex-Valued Functions 

=== Trigonometric substitutions ===

=== Factoring polynomials ===

=== Integration of Rational Functions Using Partial Fractions ===

=== Approximating Integrals ===

=== Improper Integrals ===

          o Convergence, Divergence, and Comparison 
