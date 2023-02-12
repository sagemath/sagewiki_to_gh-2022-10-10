

# The Road to LLL in SAGE

<a class="http" href="http://perso.ens-lyon.fr/damien.stehle/english.html">Damien Stehle</a>'s fpLLL code is wrapped at <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/723">#723</a> or <a class="http" href="http://sage.math.washington.edu/home/malb/fplll.patch">fplll.patch</a> respectively. For some problems, this gives quite good performance already: 


```python
#!python 
sage: B = MatrixSpace(IntegerRing(), 50, 51)(0)
sage: for i in range(50): B[i,0] = ZZ.random_element(2**10000)
....:
sage: for i in range(50): B[i,i+1] = 1
....:
sage: time C = B.LLL('fpLLL:fast')
CPU times: user 9.54 s, sys: 0.00 s, total: 9.54 s
Wall time: 9.56

sage: C.is_LLL_reduced()
True

sage: BM = B._magma_()
sage: time CM = BM.LLL()
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 15.20

sage: time magma.eval("CM := LLL(%s:Fast:=1)"%BM.name())
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 11.68
```
However, the main strength of MAGMA's LLL is that it chooses a reasonably 'good' LLL implementation automatically. This is described in Damien Stehle's <a class="http" href="http://perso.ens-lyon.fr/damien.stehle/FPLLL_SURVEY.html">paper</a> and timings can be found in some of his <a class="http" href="http://magma.maths.usyd.edu.au/Magma2006/talks/stehle.pdf">slides</a>. For those examples SAGE seems to perform quite poorly. 


## LLL Heuristic

To develop a simple heuristic how to choose a LLL implementation, we thought about using the following benchmarking examples. All these examples are generated using Stehle's `generate.c`} code and follow his slides for dimensions and bitsizes. 

* 1000 dimensional matrices filled uniformly random with integers of 10, 100, or 1000 bits respectively. 
* matrices as they occur for the Knapsack problem with (dimension,bitsize) pairs of (10, 100000), (100,10000), (150,5000) 
* matrices as they appear for solving simultaneous Diophantine equations of (dim,bits) pairs (3, 128), (12, 10000), (76, 5000) 
* Ajtai (d, bits) (10, 7), (2, 13), (3, 11) 
* particular bad matrices with entries sized at 64, 128, and 500 bits. 
* NTRU (dim, bits, q) (10,100,12), (100,100,35), (5,1000,75) 