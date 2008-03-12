= Sage Interactions =

Post code that demonstrates the use of the interact command in Sage here.    It should be easy for people to just scroll through and paste examples out of here into their own sage notebooks.   

We'll likely restructure and reorganize this once we have some nontrivial content and get a sense of how it is laid out. 

== Miscellaneous ==

=== Evaluate a bit of code in a given system ===

by William Stein (there is no way yet to make the text box big):

{{{
@interact
def _(system=selector([('sage0', 'Sage'), ('gp', 'PARI'), ('magma', 'Magma')]), code='2+2'):
    print globals()[system].eval(code)
}}}

attachment:evalsys.png


== Graph Theory ==

=== Automorphism Groups of some Graphs ===

by William Stein (I spent less than five minutes on this):

{{{
@interact
def _(graph=['CycleGraph', 'CubeGraph', 'RandomGNP'],
      n=selector([1..10],nrows=1), p=selector([10,20,..,100],nrows=1)):
    print graph
    if graph == 'CycleGraph':
       print "n (=%s): number of vertices"%n
       G = graphs.CycleGraph(n)
    elif graph == 'CubeGraph':
       if n > 8:
           print "n reduced to 8"
           n = 8
       print "n (=%s): dimension"%n
       G = graphs.CubeGraph(n)
    elif graph == 'RandomGNP':
       print "n (=%s) vertices"%n
       print "p (=%s%%) probability"%p
       G = graphs.RandomGNP(n, p/100.0)

    print G.automorphism_group()
    show(plot(G))
}}}

attachment:autograph.png

== Calculus ==
=== A contour map and 3d plot of two inverse distance functions ===
by William Stein
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

=== A simple tangent line grapher ===
by Marshall Hampton
{{{
html('<h2>Tangent line grapher</h2>')
@interact
def tangent_line(f = input_box(default=sin(x)), xbegin = slider(0,10,1/10,0), xend = slider(0,10,1/10,10), x0 = slider(0, 1, 1/100, 1/2)):
    prange = [xbegin, xend]
    x0i = xbegin + x0*(xend-xbegin)
    var('x')
    df = diff(f)
    tanf = f(x0i) + df(x0i)*(x-x0i)
    fplot = plot(f, prange[0], prange[1])
    print 'Tangent line is y = ' + tanf._repr_()
    tanplot = plot(tanf, prange[0], prange[1], rgbcolor = (1,0,0))
    fmax = f.find_maximum_on_interval(prange[0], prange[1])[0]
    fmin = f.find_minimum_on_interval(prange[0], prange[1])[0]
    show(fplot + tanplot, xmin = prange[0], xmax = prange[1], ymax = fmax, ymin = fmin)
}}}
attachment:tangents.png

== Linear Algebra ==

=== Numerical instability of the classical Gram-Schmidt algorithm ===
by Marshall Hampton (tested by William Stein, who thinks this is really nice!)
{{{
def GS_classic(a_list):
    '''
    Given a list of vectors or a matrix, returns the QR factorization using the classical (and numerically unstable) Gram-Schmidt algorithm.    
    '''
    if type(a_list) != list:
        cols = a_list.cols()
        a_list = [x for x in cols]
    indices = range(len(a_list))
    q = []
    r = [[0 for i in indices] for j in indices]
    v = [a_list[i].copy() for i in indices]
    for i in indices:
        for j in range(0,i):
            r[j][i] = q[j].inner_product(a_list[i])
            v[i] = v[i] - r[j][i]*q[j]
        r[i][i] = (v[i]*v[i])^(1/2)
        q.append(v[i]/r[i][i])
    q = matrix([q[i] for i in indices]).transpose()
    return q, matrix(r)
def GS_modern(a_list):
    '''
    Given a list of vectors or a matrix, returns the QR factorization using the 'modern' Gram-Schmidt algorithm.    
    '''
    if type(a_list) != list:
        cols = a_list.cols()
        a_list = [x for x in cols]
    indices = range(len(a_list))
    q = []
    r = [[0 for i in indices] for j in indices]
    v = [a_list[i].copy() for i in indices]
    for i in indices:
        r[i][i] = v[i].norm(2)
        q.append(v[i]/r[i][i])
        for j in range(i+1, len(indices)):
            r[i][j] = q[i].inner_product(v[j])
            v[j] = v[j] - r[i][j]*q[i]
    q = matrix([q[i] for i in indices]).transpose()
    return q, matrix(r)
html('<h2>Numerical instability of the classical Gram-Schmidt algorithm</h2>')
@interact
def gstest(precision = slider(range(3,53), default = 10), a1 = input_box([1,1/1000,1/1000]), a2 = input_box([1,1/1000,0]), a3 = input_box([1,0,1/1000])):
    myR = RealField(precision)
    displayR = RealField(5)
    html('precision in bits: ' + str(precision) + '<br>')
    A = matrix([a1,a2,a3])
    A = [vector(myR,x) for x in A]
    qn, rn = GS_classic(A)
    qb, rb = GS_modern(A)
    html('Classical Gram-Schmidt:')
    show(matrix(displayR,qn))
    html('Stable Gram-Schmidt:')
    show(matrix(displayR,qb))
}}}
attachment:GramSchmidt.png

== Number Theory ==

=== Illustrating the prime number thoerem ===
by William Stein
{{{
@interact
def _(N=(100,(2..2000))):
    html("<font color='red'>$\pi(x)$</font> and <font color='blue'>$x/(\log(x)-1)$</font> for $x < %s$"%N)
    show(plot(prime_pi, 0, N, rgbcolor='red') + plot(x/(log(x)-1), 5, N, rgbcolor='blue'))
}}}
attachment:primes.png

=== Computing the cuspidal subgroup ===
by William Stein
{{{
html('<h1>Cuspidal Subgroups of Modular Jacobians J0(N)</h1>')
@interact
def _(N=selector([1..8*13], ncols=8, width=10, default=10)):
    A = J0(N)
    print A.cuspidal_subgroup()
}}}

attachment:cuspgroup.png

=== A Charpoly and Hecke Operator Graph ===
by William Stein

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
by Timothy Clemans (refereed by William Stein)
{{{
@interact
def diffie_hellman(button=selector(["New example"],label='',buttons=True), 
    bits=("Number of bits of prime", (8,12,..512))):
    maxp = 2^bits
    p = random_prime(maxp)
    k = GF(p)
    g = k.multiplicative_generator()
    a = ZZ.random_element(10, maxp)
    b = ZZ.random_element(10, maxp)

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
<h2>%s-Bit Diffie-Hellman Key Exchange</h2>
<ol style="color:#000;font:12px Arial, Helvetica, sans-serif">
<li>Alice and Bob agree to use the prime number p=%s and base g=%s.</li>
<li>Alice chooses the secret integer a=%s, then sends Bob (<span class="gamodp">g<sup>a</sup> mod p</span>):<br/>%s<sup>%s</sup> mod %s = <span class="gamodp">%s</span>.</li>
<li>Bob chooses the secret integer b=%s, then sends Alice (<span class="gbmodp">g<sup>b</sup> mod p</span>):<br/>%s<sup>%s</sup> mod %s = <span class="gbmodp">%s</span>.</li>
<li>Alice computes (<span class="gbmodp">g<sup>b</sup> mod p</span>)<sup>a</sup> mod p:<br/>%s<sup>%s</sup> mod %s = <span class="dhsame">%s</span>.</li>
<li>Bob computes (<span class="gamodp">g<sup>a</sup> mod p</span>)<sup>b</sup> mod p:<br/>%s<sup>%s</sup> mod %s = <span class="dhsame">%s</span>.</li>
</ol></html>
    """ % (bits, p, g, a, g, a, p, (g^a), b, g, b, p, (g^b), (g^b), a, p, 
       (g^ b)^a, g^a, b, p, (g^a)^b)
}}}

attachment:dh.png

=== Web apps ===
== Bioinformatics ==
by Marshall Hampton
{{{
import urllib2 as U
@interact
def protein_browser(GenBank_ID = input_box('165940577', type = str), file_type = selector([(1,'fasta'),(2,'GenPept')])):
    if file_type == 2:
        gen_str = 'http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=protein&sendto=t&id='
    else:
        gen_str = 'http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=protein&sendto=t&dopt=fasta&id='
    f = U.urlopen(gen_str + GenBank_ID)        
    g = f.read()
    f.close()
    html(g)
}}}
attachment:biobrowse.png

=== Somewhat Silly Egg Painter ===
by Marshall Hampton (refereed by William Stein)
{{{
var('s,t')
g(s) = ((0.57496*sqrt(121 - 16.0*s^2))/sqrt(10.+ s))
def P(color, rng):
    return parametric_plot3d((cos(t)*g(s), sin(t)*g(s), s), (s,rng[0],rng[1]), (t,0,2*pi), plot_points = [150,150], rgbcolor=color, frame = False, opacity = 1)
colorlist = ['red','blue','red','blue']
@interact
def _(band_number = selector(range(1,5)), current_color = Color('red')):
    html('<h1 align=center>Egg Painter</h1>')
    colorlist[band_number-1] = current_color
    egg = sum([P(colorlist[i],[-2.75+5.5*(i/4),-2.75+5.5*(i+1)/4]) for i in range(4)])
    show(egg)
}}}
attachment:eggpaint.png
