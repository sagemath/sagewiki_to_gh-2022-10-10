

## Linear algebra over small extensions of GF(2)


### Motivation


#### Echelon Forms

Here are some preliminary benchmarks for row echelon forms of dense random n x n matrices over GF(2^4) 
 n     |  Sage 4.5  |  NTL/2    |  Magma 2.15-10  |  M4RIE (SD 23.75)  |  M4RIE (current) 
 1000  |    49.49s  |   18.84s  |  0.090s         |  0.097s            |  0.05s           
 2000  |   429.05s  |  149.11s  |  0.510s         |  0.529s            |  0.28s           
 3000  |  1494.33s  |  526.57s  |  1.640s         |  2.315s            |  1.00s           


#### Multiplication

![days24/projects/gf2e/multiplication_r16.png](days24/projects/gf2e/multiplication_r16.png) 

Blue means faster than Magma by a factor of e<sup>blue</sup>. Red means slower than Magma by a factor of e<sup>-red</sup>. 


#### Elimination

![days24/projects/gf2e/elimination_r16.png](days24/projects/gf2e/elimination_r16.png) 

Blue means faster than Magma by a factor of e<sup>blue</sup>. Red means slower than Magma by a factor of e<sup>-red</sup>. 


### People

* Martin Albrecht 

## Library

1. Install an updated M4RI library 


```sh
#!sh
wget http://sage.math.washington.edu/home/malb/spkgs/libm4ri-20100701.p1.spkg
tar xvfj libm4ri-20100701.p1.spkg
cd libm4ri-20100701.p1/
rm -rf src
hg clone http://bitbucket.org/malb/m4ri
ln -s m4ri src
cd src
autoreconf --install
cd ..
./spkg-install
```
2. Download and install <a href="days24/projects/gf2e/libm4rie-19780101.0.spkg">libm4rie-19780101.0.spkg</a> 


