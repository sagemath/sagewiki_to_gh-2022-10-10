
These are the polynomials found on this page: <a href="http://magma.maths.usyd.edu.au/users/allan/gcdcomp.html">http://magma.maths.usyd.edu.au/users/allan/gcdcomp.html</a>  The files for Sage can be found at <a href="http://sage.math.washington.edu/home/mhansen/multivariate_gcd_benchmarks.tar.bz2">http://sage.math.washington.edu/home/mhansen/multivariate_gcd_benchmarks.tar.bz2</a> . Timings were done on a 2.0 GHz Core 2 Duo Linux system. 

For the Sage/Singular timings, I did the following: 
```txt
sage: load fermat_gcd_1var.py
sage: time a = p1.gcd(p2, algorithm='ezgcd')
```
For the Maxima timings, I did the following: 
```txt
sage: mp1 = maxima(p1)
sage: mp2 = maxima(p2)
sage: time a = mp1.gcd(mp2)
```

## 1 variable over QQ

File: fermat_gcd_1var.py 
            |   ezgcd  |  modular  |  maxima 
 p - 100    |   0.02   |    0.03   |  0.20   
 q - 1000   |  12.10   |    9.84   |  7.66   
 r - 10000  |  95.03   |   62.80   |  30.27  


### (Univariate)
p - 100    |  3.07 
q - 1000   |  - 
r - 2000   |  - 


## 2 variables over QQ

File: fermat_gcd_2var.py 
         | ezgcd  | modular  |  maxima 
p - 20   | 0.05   | 0.33     |  0.11   
q - 40   | 0.33   | 9.47     |  0.66   
r - 100  | 8.71   | -        |  14.40  
s - 160  | 89.57  | -        |    


## 3 variables over QQ

File: fermat_gcd_3var.py 
         |  ezgcd  |  modular  |  maxima 
 p - 20  |  0.30   |    -      |   1.42  
 q - 40  |  8.40   |    -      |  27.68  
 r - 60  | 92.03   |    -      |         


## 4 variables over QQ

File: fermat_gcd_4var.py 
         |  ezgcd  |  modular  |  maxima 
 p - 10  |   0.13  |    -      |  1.04   
 q - 16  |   0.93  |    -      |  8.08   
 r - 20  |   2.82  |    -      |  33.96  
 s - 30  |  40.06  |    -      |  80.86  


## 1 variable over GF(43051)

File: fermat_gcd_1var.py 
            |   ezgcd  |  modular 
 p - 100    |   0.03   |   0.03   
 q - 1000   |  10.65   |   8.33   
 r - 10000  |  75.74    |  85.41  


## 2 variables over GF(43051)

File: fermat_gcd_mod_2var.py 
         |  ezgcd   |  modular 
p - 20   |  0.25    |  0.25    
q - 40   |  14.23   |  14.00   
r - 100  |   -      |  -     
s - 160  |   -      |  -     


## 3 variables over GF(43051)

File: fermat_gcd_mod_3var.sage 
         |  ezgcd  |  modular 
 p - 10  |  0.84   |    0.86  
 q - 20  |  8.40   |    -     
 r - 60  | 92.03   |    -     


## 4 variables over GF(43051)

File: fermat_gcd_4var.py 
         |  ezgcd  |  modular 
 p - 10  |  99.75  |   102.57 
 q - 16  |     |         
 r - 20  |     |         
 s - 30  |     |         
