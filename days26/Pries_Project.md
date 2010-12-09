Title: Computation of p-torsion of Jacobians of hyperelliptic curves

Abstract: An elliptic curve defined over a finite field of characteristic p can be ordinary or supersingular; this distinction measures certain properties of its p-torsion.  The p-torsion of the Jacobian of a curve of higher genus can also be studied and classified by interesting combinatorial invariants, such as the p-rank, a-number, and Ekedahl-Oort type.  Algorithms to compute these invariants exist but have not been implemented.  In this talk, I will explain how to compute these invariants and describe the lag in producing explicit curves with given p-torsion invariants.


== Project ==
$\mathbb{F}_q$, $q = p^a$, then $E/\mathbb{F}_q$ can be ordinary or supersingular.  
Some ways to determine this implemented in Sage: $a_p$, newton_slopes of Frobenius_polynomial, Hasse_invariant.

Suppose $C/\mathbb{F}_q$ is a curve of genus g.  The easiest type of curve to look at are hyperelliptic curves 
$y^2=f(x)$ where $f(x)$ has degree $2g+1$.  
The p-torsion of its Jacobian has invariants generalizing the ordinary/supersingular distinction.  These are called p-rank, a-number, Ekedahl-Oort type, etc.  Its Jacobian also has a Newton polygon (the length of slope 0 portion equals the p-rank).  The Newton polygon has been implemented for hyperelliptic curves in Sage for large p.  The easiest type of curve to look at is $y^2 = f(x)$ where $f(x)$ has degree $2g+1$. 

To compute some of these: 
set up $y^2 = f(x)$, raise $f(x)^{(p-1)}{2} = \sum c_i x^i$.  
Create the $(g\times g)$ matrix $M = (c_{p*i-j})$ (the ijth entry is the coefficient of x^{pi-j}).  
Look at the g by g matrix, 

$M^{(p^i)} = (c_{p*i-j}^{p^i})$ 

(take the $p^i$th power of each coefficient and create $N = M M^{(p)} M^{(p^2)} ... M^{(p^{g-1})}$.

The matrix M is the matrix for the Cartier operator on the 1-forms.
The p-rank is the rank of N.
The a-number equals g-rank(M).

For the Ekedahl-Oort type you need the action of F and V on the deRham cohomology (more difficult).

Test cases: $y^2=x^p-x$ (p-rank 0, and (if I remember correctly) a-number $(p-1)/2$).

Some questions: for genus 4 (or higher), and given prime - is there a curve of p-rank 0 and a-number 1.

I will describe more motivation and questions on Thursday.

References: Yui, Voloch, 


Initial code by Alyson [[attachment:Pries Aly code.sws|Initial code by Alyson (sws)]]
Version 2: Anja, Gagan [[attachment:Pries project1 code.sws|version 2 (sws)]]
Computing M and a-rank [[attachment:compute Hasse Vitt M.sws|Computing Hasse Vitt M]]

Computing N [[attachment:Computing N for Hyperelliptic curve.sws|Computing N]]

Corrected, Edited version: [[attachment:Computing N Corrected MG Edit(2).sws|Computing N Edit (sws)]] (After fixing indexing problem)


See [[http://demo.sagenb.org/home/pub/64/|this published version]].
