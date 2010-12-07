Title: Computation of p-torsion of Jacobians of hyperelliptic curves

Abstract: An elliptic curve defined over a finite field of characteristic p can be ordinary or supersingular; this distinction measures certain properties of its p-torsion.  The p-torsion of the Jacobian of a curve of higher genus can also be studied and classified by interesting combinatorial invariants, such as the p-rank, a-number, and Ekedahl-Oort type.  Algorithms to compute these invariants exist but have not been implemented.  In this talk, I will explain how to compute these invariants and describe the lag in producing explicit curves with given p-torsion invariants.


== Project ==
$\mathbb{F}_q$, $q = p^a$, then $E/\mathbb{F}_q$ can be ordinary or supersingular.  
Some invariants, $a_p$, Frobenius polynomial, Newton slopes, Hasse invariants.

Suppose $C/\mathbb{F}_q$ is a curve of genus g.  It has invariants, p-rank, a-number, Ekedahl-Oort type, newton polygon.  The easiest type of curve to look at is $y^2 = f(x)$ where $f(x)$ has degree $2g+1$.  Only the Newton polygon has been implemented in Sage (for primes large enough). 

To compute some of these ?? which ??, 
set up $y^2 = f(x)$, raise $f(x)^{(p-1)}{2} = \sum c_i x^i$.  
Create the $(g\times g)$ matrix $M = (c_{p*i-j})$.  
For a hyper elliptic curve, $M^{(p)} = (c_{p*i-j}^p)$ and create $N = M M^{(p)} M^{(p^2)} ... M^{(p^{g-1})}$.

For the Ekedahl-Oort type you need the deRham operator.
