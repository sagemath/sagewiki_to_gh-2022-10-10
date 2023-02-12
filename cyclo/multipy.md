

# Multimodular matrix multiply over cyclotomic fields


```txt
10:39 < craigcitro> so wait, multiplying two matrices over Q(zeta_r) will be more complicated than just multiplying two of these, right?
10:39 < craigcitro> because the modding by the cyclotomic poly will have to happen somewhere ...
10:39 < wstein> To multiply two matrices one does this:
10:39 < wstein> (1) a single matrix multiply to get the reduction mod all primes over p.
10:40 < craigcitro> ohh, you're going to it multimodular ...
10:40 < wstein> (2) turn the columns into n*m matrices (we'll need a fast reshape command)
10:40 < wstein> (3) mutiply mod p (very very fast -- should dominate - uses clements FFLAS)
10:40 < wstein> (4) reshape
10:40 < wstein> (5) lift via a matrix multiply
10:41 < wstein> (6) do for many p and then apply the ALREADY WRITTEN AND OPTIMIZED CRT code for matrices over ZZ.
```