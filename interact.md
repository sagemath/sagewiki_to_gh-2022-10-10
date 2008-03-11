= Sage Interactions =

Post code that demonstrates the use of the interact command in Sage here.    It should be easy for people to just scroll through and paste examples out of here into their own sage notebooks.   

We'll likely restructure and reorganize this once we have some nontrivial content and get a sense of how it is laid out. 

== Graphics ==

== Calculus ==
=== A contour map and 3d plot of two inverse distance functions ===

{{{
@interact
def _(q1=(-1,(-3,3)), q2=(-2,(-3,3)), 
      cmap=['autumn', 'bone', 'cool', 'copper', 'gray', 'hot', 'hsv', 
           'jet', 'pink', 'prism', 'spring', 'summer', 'winter']):
     x,y = var('x,y')
     f = q1/sqrt((x+1)^2 + y^2) + q2/sqrt((x-1)^2+(y+0.5)^2)
     C = contour_plot(f, (-2,2), (-2,2), plot_points=30, contours=15, cmap=cmap)
     show(C, figsize=3, aspect_ratio=1)
     show(plot3d(f, (x,-2,2), (y,-2,2)), figsize=5, viewer='tachyon')     
}}}
attachment:mountains.png

== Number Theory ==

=== Illustrating the prime number thoerem ===
{{{
@interact
def _(N=(100,(2..2000))):
    html("<font color='red'>$\pi(x)$</font> and <font color='blue'>$x/(\log(x)-1)$</font> for $x < %s$"%N)
    show(plot(prime_pi, 0, N, rgbcolor='red') + plot(x/(log(x)-1), 5, N, rgbcolor='blue'))
}}}
attachment:primes.png

=== Computing the cuspidal subgroup ===
{{{
html('<h1>Cuspidal Subgroups of Modular Jacobians J0(N)</h1>')
@interact
def _(N=selector([1..8*13], ncols=8, width=10, default=10)):
    A = J0(N)
    print A.cuspidal_subgroup()
}}}

attachment:cuspgroup.png

=== A Charpoly and Hecke Operator Graph ===

{{{
# Note -- in Sage-2.10.3; multiedges are missing in plots; loops are missing in 3d plots
@interact
def f(N = prime_range(11,400),
      p = selector(prime_range(2,12),nrows=1),
      three_d = ("Three Dimensional", False)):
    S = SupersingularModule(N)
    T = S.hecke_matrix(p)
    G = Graph(T, multiedges=True, loops=not three_d)
    html("<h1>Charpoly and Hecke Graph: Level %s, T_%s</h1>"%(N,p))
    show(T.charpoly().factor())
    if three_d:
        show(G.plot3d(), aspect_ratio=[1,1,1])
    else:
        show(G.plot(),figsize=7)
}}}

attachment:heckegraph.png

=== Demonstrating the Diffie-Hellman Key Exchange Protocol ===

{{{
@interact
def diffie_hellman(button=selector(['New example'],label='',buttons=True)):
    import random
    p = random_prime(30)
    g = random.choice([2, 5])
    a = ZZ(randint(10, 30))
    b = ZZ(randint(10, 30))

    print """
<html>
<style>
.gamodp {
background:yellow
}
.gbmodp {
background:orange
}
.dhsame {
color:green;
font-weight:bold
}
</style>
<ol style="color:#000;font:12px Arial, Helvetica, sans-serif">
<li>Alice and Bob agree to use a prime number p=%s and base g=%s.</li>
<li>Alice chooses a secret integer a=%s, then sends Bob (<span class="gamodp">g<sup>a</sup> mod p</span>):<br/>%s<sup>%s</sup> mod %s = <span class="gamodp">%s</span>.</li>
<li>Bob chooses a secret integer b=%s, then sends Alice (<span class="gbmodp">g<sup>b</sup> mod p</span>):<br/>%s<sup>%s</sup> mod %s = <span class="gbmodp">%s</span>.</li>
<li>Alice computes (<span class="gbmodp">g<sup>b</sup> mod p</span>)<sup>a</sup> mod p:<br/>%s<sup>%s</sup> mod %s = <span class="dhsame">%s</span>.</li>
<li>Bob computes (<span class="gamodp">g<sup>a</sup> mod p</span>)<sup>b</sup> mod p:<br/>%s<sup>%s</sup> mod %s = <span class="dhsame">%s</span>.</li>
</ol></html>
    """ % (p, g, a, g, a, p, (mod(g ^ a, p)), b, g, b, p, (mod(g ^ b, p)), (mod(g ^ b, p)), a, p, mod((mod(g ^ b, p)) ^ a, p), (mod(g ^ a, p)), b, p, mod((mod(g ^ a, p)) ^ b, p))  
}}}
