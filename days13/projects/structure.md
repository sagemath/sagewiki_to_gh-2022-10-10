
[[_TOC_]] 


# Scharlau's talk


## Basic structure & operations

* $R$ ground ring, e.g. $R = Z_F$ 
* $F$ is the quotient ring of $R$ 
* $V$ a vector space over $F$ 
* basic structure: a quadratic module $(L,b)$, where 
   * $L\subseteq V$ is a f.g. $R$-module s.t. $FL=V$ 
   * $b : L\times L\rightarrow F$ symmetric bilinear form 

### Operations

* scaling : $^\tau(L,b) := (L, \tau b)$ 
* multiplying : $\tau\cdot(L,b) := (\tau L, b)$ 
* dualizing: $(L,b)<sup>\# := (L</sup>\#, b)$ 
   * $L^\# := \{ y\in V \;:\; b(x,y)\in R\;\forall x\in L \}$ 
* intersection: $L\cap M$ 
* sum $L+M$ 
* sublattices 
   * defined by generators 
   * defined by congruences 
               * in particular: $L_{v,p} := \{x\in L \;:\; b(v,x) \in p \}$ for $p$ an ideal of $R$ and $v\in L^\#$. 
* radical modulo $p$ 

### Example

* "partial dual" of $(L,b)$ 
   * $m\in F$, then $D_m(L,b) := (L<sup>\#\cap m</sup>{-1} L, mb)$. typically, $L\subseteq L^\#$ and $m\mid level(L,b)$ 
   * (here $level(L,b):=exponent(L^\#/L)$.) 
   * remark: for the theta series $\Theta_L$, the operator $D_p$ induces the Atkin-Lehner involution (at least in even dimension) 
* A Pari function for the partial dual, taking a Gram matrix as input 
<a href="days13/projects/structure/partial_dual.gp">partial_dual.gp</a> 
