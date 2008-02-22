=== Files to fix (Make all parents conform to the spec) ===

Useful script to list all parents in a given module: [attachment:list_parents.sage]

Nothing to do
 * catalogue, dsage, databases, ext, games, media, stats, server, plot, logic, tests lfunctions


Done
 * coding, functions, graphs
 * matrix [http://sage.math.washington.edu/home/robertwb/coerce/coerce-all.hg]
 * complex, real [http://sage.math.washington.edu/home/robertwb/coerce/coerce-real-complex.hg]
 * modules [attachment:coerce-free-module.patch]

In progress
 * groups

Little to do

 * algebras
 * calculus
 * categories
 * combinat
 * crypto
 * geometry

Lots to do

 * gsl
 * interfaces
 * libs
 * misc
 * modular
 * monoids
 * numerical
 * probability
 * quadratic_forms
 * schemes
 * sets

 * rings
  * polynomial
  * padic
  * other

Base classes
 * structure

=== Coercion doctesting ===

Comment from William: 
{{{
teragon:sage was$ sage -coverage categories/action.pyx
structure/element.pyx structure/coerce.pyx |grep SCORE
SCORE categories/action.pyx: 0% (0 of 22)
SCORE structure/element.pyx: 18% (28 of 153)
SCORE structure/coerce.pyx: 2% (1 of 39)

I tried to understand and use the coercion model code to trac down the issue with #2079 and
was amazed at how nonexistent the doctesting and documentation of
functions is there.
In order for people to write lots of coercion code all of Sage, it's critical that they can
read the coercion model code so they can track down -- for themselves -- what is going
wrong when they run into trouble.  I would put getting the coverage of the above files
(and whatever else is related to coercion) up to 100% as the first step in your coercion
model stuff.   Seriously.   And don't say it can't be doctested, since even though there are
a lot of things not easily accessible now from the interpreter, such as the coercion model
}}}

=== Categories to implement ===
