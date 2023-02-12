

# Flu

* almost defeated mine 

# M4RI


## Pronounciation

* It is pronounced "MARI" now. 

## PLUQ Factorisation of Dense GF(2) Matrices

* learned a **lot** from Clement 
* still work in progress, some initial code is written 
* nothing to be shown yet, but will keep working 
* work-in-progress, alpha, not working code will be released in a few days with the standard M4RI library 

## M4RI Improvements

* autodetection of L1 and L2 cache 
* switch over to Strassen-Winograd Multiplication by default in Sage 
* learned a potential further improvement to multiplication from Bill Hart (needs to be implemented) 
* Performance on <a href="/Core2Duo">Core2Duo</a> improved: 

```python
#!python 
sage: A = random_matrix(GF(2),3.2*10^4,3.2*10^4)
sage: B = random_matrix(GF(2),3.2*10^4,3.2*10^4)
sage: time C = A._multiply_strassen(B,cutoff=4092) #Old
CPU times: user 51.32 s, sys: 0.14 s, total: 51.46 s
Wall time: 51.86

sage: time C = A._multiply_strassen(B,cutoff=8192) #New
CPU times: user 44.93 s, sys: 0.15 s, total: 45.08 s
Wall time: 45.32
```

```python
#!python 
sage: A = random_matrix(GF(2),3.2*10^4,3.2*10^4)
sage: time A.echelonize() #Old
CPU times: user 53.67 s, sys: 0.05 s, total: 53.71 s
Wall time: 53.99

sage: A = random_matrix(GF(2),3.2*10^4,3.2*10^4)
sage: time A.echelonize() #New
CPU times: user 44.25 s, sys: 0.03 s, total: 44.29 s
Wall time: 44.50
```
* RAM consumption for elimination seems lower than Magma, since we don't use any temporaries due to the lack of asymptotically fast elimination. (after you substract the static Sage RAM). 
   * Magma: Total time: 340.579 seconds, Total memory usage: 1934.02MB (for 64000<sup>2</sup> / 8 / 1024.0<sup>2</sup> = 488.281MB) 
* newest benchmarks: 

```python
#!python 
sage: A = random_matrix(GF(2),6.4*10^4,6.4*10^4)
sage: time A.echelonize()
CPU times: user 357.87 s, sys: 1.26 s, total: 359.12 s
Wall time: 362.16
```

```txt
> A:=RandomMatrix(GF(2),64*10^3, 64*10^3);
> time E:=EchelonForm(A);
Time: 336.350
```

## Parallel M4RI

* Tried to implement parallel elimination and failed 
* If it worked however it would enable in the only parallel Gröbner basis engine (<a href="/PolyBoRi">PolyBoRi</a>) in commutative polynomial rings I'm aware of. 

# Review Process

* Editor Meetings 
* Reviews 

# Benchmark**ing

* found out that the mention of "mark**ing" is not allowed on this wiki 