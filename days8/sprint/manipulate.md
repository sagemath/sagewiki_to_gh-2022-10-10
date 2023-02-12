

# Create manipulate functionality for notebook inspired by Traits and Mathematica

I implemented something last night. See <a href="http://trac.sagemath.org/sage_trac/attachment/ticket/1322/manipulate-take3.patch">http://trac.sagemath.org/sage_trac/attachment/ticket/1322/manipulate-take3.patch</a> which works like this: 


```txt
@manipulate
def myfactor(n):
    print jsmath(factor(n))


@manipulate
def polys(m):
    R = QQ['x']
    f = R.random_element(m)
    print "f = ", jsmath(f)
    print "real roots = ", f.real_roots()
    show(plot(f))



@manipulate
def ellcurve(label):
    E = EllipticCurve(label)
    show(E)
    show("E conductor = %s"%E.conductor())
    show(E.q_eigenform(7))
    show(plot(E))



@manipulate
def pl(n):
    var('x,y')
    show(x^n-y^n)
    show(plot3d(x^n-y^n, (x,-2,2), (y,-2,2)))
```