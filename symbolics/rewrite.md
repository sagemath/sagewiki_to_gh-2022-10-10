== Rewriting symbolic expressions ==

This page holds notes related to the design of the `rewrite()` function on symbolic expressions. This function should provide a clean interface to various transformations which can be performed on symbolic expressions. For example:

{{{
sage: rewrite(exp(x), "exp2sincos")
-I*sin(I*x) + cos(I*x)
sage: rewrite(exp(-I*x), "exp2sincos")
-I*sin(x) + cos(x)
sage: rewrite(exp(a+I*b), "exp2trig")
(sinh(a) + cosh(a))*(I*sin(b) + cos(b))
sage: rewrite((e^x)^2-e^(-2*x)+e^(-4*x)+(e^x)^4, 'exp2sinhcosh')
2*sinh(2*x) + 2*cosh(4*x)
}}}

This is not a Sage kernel function.
You must load the attached file "rewrite.sage" if you want to use this function.

You can add inline comments, by using the `{i}` tag.
 {i} burcin: Some comment.

For general comments use the '''Notes''' section below.

=== Signature ===

{{{
rewrite(rule=None, source=None, target=None, filter=None)
}}}
 * rule - string
 A string from the rules section below specifying which transformation to use
 * target - optional keyword argument - string or function
 Specify a target function type instead of a single rule. For example:
 {{{
sage: (binomial(n, k)*factorial(n)).rewrite(target=gamma)
gamma(n+1)^2/(gamma(k+1)*gamma(n-k+1))
 }}}
 * source - optional keyword argument - string or function
 Specify the transformation to use by giving `source` and `target` arguments. For example:
 {{{
sage: (exp(x)*tan(x)).rewrite(source=tan, target=sin) # find a better example
exp(x)*sin(x)*cos(x)
 }}}
 * filter - callable which takes symbolic expressions as arguments returns True or False
 A function to decide if the given rule should be applied to a subexpression


=== Rules ===

The list below is taken from Francois Maltey's notes:

{{{
exp2sinhcosh   : exp(x) => sinh(x) + cosh(x)
exp2sincos     : exp(x) => cos(i*x) - i*sin(i*x)
lessIinExp     : exp(a+i*b) => exp(a)*(cos(b)+i*sin(b))
exp2trig       : exp(a+i*b) => (cosh(a)+sinh(a))*(cos(b)+i*sin(b))

trigo2sincos   : [tan(x)|cot(x)] => [sin(x)/cos(x)|cos(x)/sin(x)]
trigh2sinhcosh : [tanh(x)|coth(x)] => [sinh(x)/cosh(x)|cosh(x)/sinh(x)]

sinhcosh2exp   : [sinh(x)|cosh(x)] => (exp(x) [-|+] exp(-x))/2
sincos2exp     : [sin(x)|cos(x)] => -i(exp(i*x) [-|+] exp(-i*x))/2

trigo2exp      : sincos2exp o trigo2sincos
trigh2exp      : sinhcosh2exp o trigh2sincos
trig2exp       : trigo2exp and trigh2exp

cos22sin       : (cos(x)^(2*p) => (1-sin(x)^2)^p et pour 2p+1
sin22cos       : (sin(x)^(2*p) => (1-cos(x)^2)^p et pour 2p+1
cosh22sinh     : (cosh(x)^(2*p) => (1+sinh(x)^2)^p et pour 2p+1
sinh22cosh     : (sinh(x)^(2*p) => (cosh(x)^2-1)^p et pour 2p+1

trigo2trigh    : cos(x) => cosh(i*x) avec sin(x), tan(x) et cot(x)
trigh2trigo    : cosh(x) => cos(i*x) avec sin(x), tan(x) et cot(x)
lessIinTrig    : sin(i*x) => i*sinh(x) sinh, cos, cosh, tan, tanh, cot, coth

tancot22sincos : tan(x)^(2*p)=(1/cos(x)^2-1)^p, avec 2*p+1 et cot
tanhcoth22sinhcosh: tanh(x)^(2*p)=(1-1/cosh(x)^2)^p, avec 2*p+1 et cot

sincos2tanHalfh: sin(x) => 2*tan(x/2)/(1+tan(x/2)^2) avec cos 
sinhcosh2tanhHalfh: sinh(x) => 2*tanh(x/2)...

asin2acos      : arcsin (x) => Pi/2-arccos(x)
acos2asin      : arccos (x) => Pi/2-arcsin(x)
atrigh2log     : arcsinh(x) => log(x+sqrt(x^2+1), avec arcosh, etc.
atrigo2log     : arcsin(x)  => i*log(i*x+sqrt(1-x^2)) avec arccos et arctan

fact2gamma     : factorial(n) => Gamma(n+1)
gamma2fact     : Gamma(n+1) => factorial(n-1)
binomial2fact  : binomial(n,p) => n!/(p!*(n-p)!)
fact2binomial  : (n+a)!/((p+b)!(n-p+c)! => ... avec a, b et c entiers fixés

exp2pow        : exp(ln(a)*b) => a^b 
pow2exp        : a^b => exp(ln(a)*b)
}}}

==== Notes ====

Add general comments about the design here. 

 * burcin: looking forward to getting this in
