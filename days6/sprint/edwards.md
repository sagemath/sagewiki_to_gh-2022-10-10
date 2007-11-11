Edwards coordinates formulas.

Paul Zimmerman is working on this (!)

{{{
%time
R.<y1,y2,c,d,x1,x2> = QQ[]
e = 1-d*c^4
S = R.quotient([x1^2+y1^2-c^2*(1+d*x1^2*y1^2), x2^2+y2^2-c^2*(1+d*x2^2*y2^2)])

# the Edwards addition law:
x3 = (x1*y2+y1*x2)/(c*(1+d*x1*x2*y1*y2))
y3 = (y1*y2-x1*x2)/(c*(1-d*x1*x2*y1*y2))


# map to the Montgomery curve:
u1 = (c+y1)/(c-y1); v1=2*c*u1/x1
g = (1/e)*v1^2-u1^3-(4/e-2)*u1^2-u1
print S(g.numerator())

u2 = (c+y2)/(c-y2); v2 = 2*c*u2/x2
g = (1/e)*v2^2-u2^3-(4/e-2)*u2^2-u2
print S(g.numerator())

u3 =(c+y3)/(c-y3); v3=2*c*u3/x3
g = (1/e)*v3^2-u3^3-(4/e-2)*u3^2-u3
print S(g.numerator())

# add on the Montgomery curve:
lambd = (v2-v1)/(u2-u1)
r3 = (1/e)*lambd^2-(4/e-2)-u1-u2; s3 =lambd*(u1-r3)-v1;

# check the answer:
print S((u3-r3).numerator()), S((v3-s3).numerator())
///
0
0
0
0 0
CPU time: 0.06 s,  Wall time: 0.09 s
}}}
