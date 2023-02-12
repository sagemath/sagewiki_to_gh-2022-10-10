

# Cryptography


## Linear feedback shift registers (LFSRs)

A special type of stream cipher is implemented in Sage, namely, a LFSR sequence defined over a finite field. Stream ciphers have been used for a long time as a source of pseudo-random number generators. 

S. Golomb ("Shift register sequences", Aegean Park Press, Laguna Hills, Ca, 1967) gives a list of three statistical properties a sequence of numbers $\mathbf{a}=\{ a_n \}_{n=1}^\infty$, $a_n\in \{0,1\},$ should display to be considered "random". Define the autocorrelation of $ {\bf a}$ to be 

$$ C(k)=C(k,{\bf a})=\lim_{N\rightarrow \infty} {1\over N}\sum_{n=1}<sup>N (-1)</sup>{a_n+a_{n+k}}. $$ 

In the case where $ {\bf a}$ is periodic with period $ P$ then this reduces to 

$$ C(k)={1\over P}\sum_{n=1}<sup>P (-1)</sup>{a_n+a_{n+k}}. $$ 

Assume $ {\bf a}$ is periodic with period $ P$ . 

* _balance_: $ \vert\sum_{n=1}<sup>P(-1)</sup>{a_n}\vert\leq 1$ .  
* _low autocorrelation_: 
         * $$ C(k)= \left\{ \begin{array}{cc} 1,& k=0,\\ \epsilon, & k\not= 0. \end{array}\right. $$ (For sequences satisfying these first two properties, it is known that $ \epsilon=-1/P$ must hold.)  
* _proportional runs property_: In each period, half the runs have length $ 1$ , one-fourth have length $ 2$ , etc. Moreover, there are as many runs of $ 1$ 's as there are of 0 's.  
A sequence satisfying these properties will be called **pseudo-random**. 

A general feedback shift register is a map $ f:{\bf F}_q<sup>d\rightarrow {\bf F}_q</sup>d$ of the form 

$$ \begin{array}{c} f(x_0,...,x_{n-1})=(x_1,x_2,...,x_n),\\ x_n=C(x_0,...,x_{n-1}), \end{array}$$ 

where $ C:{\bf F}_q^d\rightarrow {\bf F}_q$ is a given function. When $ C$ is of the form 

$\displaystyle C(x_0,...,x_{n-1})=c_0x_0+...+c_{n-1}x_{n-1}, $ 

for some given constants $ c_i\in {\bf F}_q$ , the map is called a linear feedback shift register (LFSR). The sequence of coefficients $ c_i$ is called the **key** and the polynomial 

$\displaystyle C(x) = 1+ c_0x +...+c_{n-1}x^n $ 

is sometimes called the **connection polynomial**. 

**Example**: Over $ GF(2)$ , if $ [c_0,c_1,c_2,c_3]=[1,0,0,1]$  then $ C(x) = 1 + x + x^4$ , 

$\displaystyle x_n = x_{n-4} + x_{n-1}, n\geq 4. $ 

The LFSR sequence is then 

$$ \begin{array}{c} 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1... ..., 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1,, ... . \end{array}$$ 

The sequence of $ 0,1$ 's is periodic with period $ P=2^4-1=15$ and satisfies Golomb's three randomness conditions. However, this sequence of period 15 can be "cracked" (i.e., a procedure to reproduce $ g(x)$ ) by knowing only 8 terms! This is the function of the Berlekamp-Massey algorithm (James L. Massey, Shift-Register Synthesis and BCH Decoding, IEEE Trans. on Information Theory, vol. 15(1), pp. 122-127, Jan 1969.), implemented as `lfsr_connection_polynomial` (which produces the reverse of `berlekamp_massey`). 


```txt
sage: F = GF(2)
sage: o = F(0)
sage: l = F(1)
sage: key = [l,o,o,l]; fill = [l,l,o,l]; n = 20
sage: s = lfsr_sequence(key,fill,n); s
[1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0]
sage: lfsr_autocorrelation(s,15,7)
4/15
sage: lfsr_autocorrelation(s,15,0)
8/15
sage: lfsr_connection_polynomial(s)
x^4 + x + 1
sage: berlekamp_massey(s)
x^4 + x^3 + 1

```

## Classical crytosystems

Sage has a type for cryptosystems (created by David Kohel, who also wrote the examples below), implementing classical cryptosystems. The general interface is as follows: 


```txt
sage: S = AlphabeticStrings()
sage: S
Free alphabetic string monoid on A-Z
sage: E = SubstitutionCryptosystem(S)
sage: E
Substitution cryptosystem on Free alphabetic string monoid on A-Z
sage: K = S([ 25-i for i in range(26) ])
sage: e = E(K)
sage: m = S("THECATINTHEHAT")
sage: e(m)
GSVXZGRMGSVSZG
```
Here's another example: 


```txt
sage: S = AlphabeticStrings()
sage: E = TranspositionCryptosystem(S,15);
sage: m = S("THECATANDTHEHAT")
sage: G = E.key_space()
sage: G
Symmetric group of order 15! as a permutation group
sage: g = G([ 3, 2, 1, 6, 5, 4, 9, 8, 7, 12, 11, 10, 15, 14, 13 ])
sage: e = E(g)
sage: e(m)
EHTTACDNAEHTTAH
```
The idea is that a ``cryptosystem`` is a map $E: KS \rightarrow Hom_{Set}(MS,CS)$ where KS, MS, and CS are the key space, plaintext (or message) space, and ciphertext space, respectively. E is presumed to be injective, so `e.key()` returns the pre-image key.  
