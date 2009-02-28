= Reimplement Basic Quaternion Algebra Arithmetic =

PEOPLE: 
  * William Stein
  * Justin Walker

Basic arithmetic in quaternion algebras in Sage is horrid since it is about 20-50 times SLOWER than Magma!  For example consider the following (see below).  Doctest coverage is not horrid:
{{{
quaternion_algebra.py: 37% (11 of 29)
quaternion_algebra_element.py: 57% (12 of 21)
quaternion_order.py: 0% (0 of 9)
quaternion_order_element.py: 0% (0 of 8)
quaternion_order_ideal.py: 0% (0 of 6)
quaternion_order_ideal_element.py: 0% (0 of 1)
}}}

{{{
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
}}}

{{{
A.<i,j,k> = QuaternionAlgebra(QQ,-5,-2)
a = i + j + k
b = i - j - k
t = cputime()
for i in [1..10000]:
    c = (a-i)*(b+i)
print cputime(t)
///
4.291297
}}}

{{{
4.291297/0.08
///
53.6412125000000
}}}

{{{
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
}}}

{{{
A.<i,j,k> = QuaternionAlgebra(QQ,-5,-2)
a = i + j + k
b = i - j - k
t = cputime()
for i in [1..1000]:
    c = (a-i)^10*(b+i)^10
print cputime(t)
///
2.804453
}}}

{{{
2.804452/0.11
///
25.4950181818182
}}}

== Project goals ==

  1. Bring doctest coverage of quaternion_* to 100%
  2. Make basic arithmetic with quaternions as fast (or faster) than Magma.
  
