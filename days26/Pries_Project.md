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

References: [[attachment:yui-on_the_jacobian_of_hyperelliptic_curves_over_fields_of_characteristic_p_gt_2.pdf|Yui]], Voloch, 

Possible reference http://www.math.colostate.edu/~pries/Preprints/00DecPreprints/08groupschemeconm1007.pdf


Cartier matrix and Hasse-Witt Matrix: [[attachment:final final M and N.sws|Best and most up to date!]]

Code for Documentation Reference: [[attachment:Code For Documentation Reference.sws|Doc Ref]]


Alternative exponentiation f^((p-1)/2). So far not faster. [[attachment:alternative exponentiation of f.sws]]
Intermediate worksheet [[attachment:intermediate worksheet for exponentiation.sws]]

See [[http://demo.sagenb.org/home/pub/64/|this published version]].
