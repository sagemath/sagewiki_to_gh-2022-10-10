

# Reimplement Basic Quaternion Algebra Arithmetic

[[_TOC_]] 

PEOPLE:  

   * William Stein 
   * Justin Walker 
Basic arithmetic in quaternion algebras in Sage is horrid since it is about 20-50 times SLOWER than Magma!  For example consider the following (see below).  Doctest coverage is not horrid: 
```txt
quaternion_algebra.py: 37% (11 of 29)
quaternion_algebra_element.py: 57% (12 of 21)
quaternion_order.py: 0% (0 of 9)
quaternion_order_element.py: 0% (0 of 8)
quaternion_order_ideal.py: 0% (0 of 6)
quaternion_order_ideal_element.py: 0% (0 of 1)
```

```txt
%magma
A<i,j,k> := QuaternionAlgebra(RationalField(),-5,-2);
a := i + j + k;
b := i - j - k;
t := Cputime();
for i in [1..10000] do
    c := (a-i)*(b+i);
end for;
print Cputime(t);    
///
0.080
```

```txt
A.<i,j,k> = QuaternionAlgebra(QQ,-5,-2)
a = i + j + k
b = i - j - k
t = cputime()
for i in [1..10000]:
    c = (a-i)*(b+i)
print cputime(t)
///
4.291297
```

```txt
4.291297/0.08
///
53.6412125000000
```

```txt
%magma
A<i,j,k> := QuaternionAlgebra(RationalField(),-5,-2);
a := i + j + k;
b := i - j - k;
t := Cputime();
for i in [1..1000] do
    c := (a-i)^10*(b+i)^10;
end for;
print Cputime(t);    
///
0.110
```

```txt
A.<i,j,k> = QuaternionAlgebra(QQ,-5,-2)
a = i + j + k
b = i - j - k
t = cputime()
for i in [1..1000]:
    c = (a-i)^10*(b+i)^10
print cputime(t)
///
2.804453
```

```txt
2.804452/0.11
///
25.4950181818182
```

## Project goals

   1. Bring doctest coverage of quaternion_* to 100% 
   1. Make basic arithmetic with quaternions as fast (or faster) than Magma. 

## Wishlist


### From Rainer Schulze-Pillot

* create  representatives for the types of maximal orders in a quaternion algebra over a number (or maybe also function)  field. 
* same for Eichler orders of given square free level, for an Eichler order give also maximal orders whose intersection it is 
* compute numbers of ideal classes, Brandt matrices and reduced Brandt matrices, compute the neighbourhod graph of (types of) maximal orders 
* compute for an Eichler order the index of the group of units of the ground field in the group of units of the order. 
The basic facts are in Vigneras' Springer lecture notes 800 and her article in L'Enseignement Mathematique 21, a nicer (although written in german) writeup is in Ute Gebhardt's Diplom thesis, to be found at <a href="http://www.math.uni-sb.de/ag/schulze/ute/">http://www.math.uni-sb.de/ag/schulze/ute/</a> 
