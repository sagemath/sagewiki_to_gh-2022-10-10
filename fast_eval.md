

# fast_eval call for test cases

I've mentioned that I'm rewriting fast_eval/fast_float.  (For those who aren't aware, the current fast_float gives a way to take an arbitrary Sage calculus expression or polynomial, and transform it so that you can very quickly substitute floating-point values for the variables and then evaluate the expression.)  The plan is to add evaluation over more types (not just hardware floating point), evaluate common subexpressions only once, and allow conditional expressions; I'll also be speeding up the existing floating-point code. 

I need to make some decisions on how the new interpreters should work. I'd like to do this based on benchmarking a large test suite, but I don't have a large test suite :) 

My current thoughts are to include at least the following evaluation domains: RDF, CDF, RealField(n), RealIntervalField(n), ZZ, QQ, ComplexField(n), Integers(n). 

So if you have any expressions that you would like to evaluate quickly over these domains, please add them to this page.  Doing so will increase the chances that your class of problem will be well-handled by the new fast_eval  framework.  (Other discussion, like suggestions for additional evaluation domains, should probably take place on the sage-devel mailing list.) 

Please include: 

1. An actual expression you would like to evaluate quickly.  This could be in the form of a short Sage script that creates the expression, or you could just save the expression as an sobj (using the "save" function; type "save?" at the Sage prompt for details). Since Sage currently does not support conditional expressions, if  your example involves conditionals, just give a short Python function that evaluates your expression. 
1. Some information about the class of expressions this is a representative of.  (For example, if your expression is a polynomial, is this the only polynomial you are interested in?  If not, do the other polynomials have similar degree, coefficient sizes, sparsity, etc.?) 
1. How many times you would evaluate this expression. 
1. Information about the evaluation points: Are the evaluation points all known at the beginning of the evaluation process?  If not, how many evaluation points are known at each stage of the process?  Are they evenly spaced, or otherwise patterned?  Do they form a grid in n dimensions?  (For example: for plotting, all of the evaluation points are known at the beginning.  For bisection-based root finding, at the beginning you know three evaluation points -- left, middle, right -- but each subsequent evaluation point depends on the result of previous evaluations.) 
1. The domain(s) you want to evaluate this expression over.  Are the domains known at the beginning of the evaluation process?  (Usually you only want to evaluate over one domain, which is known at the beginning of the evaluation process.  But you might want to start by evaluating over RealIntervalField(64) and then move up to RealIntervalField(128) if your answers aren't precise enough.  Or for a multimodular algorithm, you might want to evaluate over GF(p) for 100 different primes p.) 
1. Especially for inexact (floating-point) evaluation domains: What sort of intermediate precision do you need?  Is it OK to evaluate using single-precision floating point?  Is it OK to be even a little less precise than that?  Do you care about the behavior of trigonometric functions on very large inputs?  Do you care about preserving the exact underflow/overflow behavior of RDF, or would it be OK to sometimes get a (correct) finite answer when RDF would overflow to infinity?  Is it OK to apply the associative and distributive laws to your expression to get an expression that's equivalent if evaluated at infinite precision, but may give very different results at finite precision?  Do you need the evaluation results to be the same from one computer to the next?  Do you need the evaluation result to be the same from one run to the next? 
(Note that I will definitely provide an accurate interpreter that is basically equivalent to RDF; the point of question 6 is to decide whether I should also provide faster, less accurate interpreters.) 


## test case: plotting Taylor expansions for educational purposes

1.  
```txt
sage: [sin(x).taylor(x, 0, n) for n in range(1, 20, 2)]
[x,
 x - x^3/6,
 x - x^3/6 + x^5/120,
 x - x^3/6 + x^5/120 - x^7/5040,
 x - x^3/6 + x^5/120 - x^7/5040 + x^9/362880,
 x - x^3/6 + x^5/120 - x^7/5040 + x^9/362880 - x^11/39916800,
 x - x^3/6 + x^5/120 - x^7/5040 + x^9/362880 - x^11/39916800 + x^13/6227020800,
 x - x^3/6 + x^5/120 - x^7/5040 + x^9/362880 - x^11/39916800 + x^13/6227020800 - x^15/1307674368000,
 x - x^3/6 + x^5/120 - x^7/5040 + x^9/362880 - x^11/39916800 + x^13/6227020800 - x^15/1307674368000 + x^17/355687428096000,
 x - x^3/6 + x^5/120 - x^7/5040 + x^9/362880 - x^11/39916800 + x^13/6227020800 - x^15/1307674368000 + x^17/355687428096000 - x^19/121645100408832000]
```
2. Other examples would be similar, except that many interesting examples would be totally dense instead of 50% dense. 

3. Each expression would be evaluated about 1000 times. 

4. Evaluation points would be evenly spaced between -1 and 5. 

5. Evaluation should take place using hardware floating point. 

6. Slightly-inaccurate single-precision floating point is fine.  Any applications of associativity or distributivity are fine. 
