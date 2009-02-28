= Reimplement Basic Quaternion Algebra Arithmetic =

PEOPLE: 
  * William Stein
  * Justin Walker

Basic arithmetic in quaternion algebras in Sage is very bad.  For example consider the following:

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
