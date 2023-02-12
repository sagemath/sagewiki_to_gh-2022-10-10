

# Description

Singular is a Computer Algebra System for polynomial computations with special emphasis on the needs of commutative algebra, algebraic geometry, and singularity theory.  

Singular is distributed freely under the GNU General Public License (version 2 of the License); with the following additional restrictions (which override any conflicting restrictions in the GPL): The following software used with SINGULAR have their own copyright: the omalloc library, the readline library, the Gnu Multiple Precision Library (GMP), NTL: A Library for doing Number Theory (NTL), the <a href="/MultiProtocol">MultiProtocol</a> library (MP), the Singular-Factory library, the Singular-libfac library, and, for the Windows distributions the Cygwin DLL and the Cygwin tools (Cygwin), and the XEmacs editor (XEmacs). Their copyrights and licenses can be found in the accompanying files which are distributed along with these packages. 

The Singular team won the ISAAC 2004 Richard D. Jenks Memorial Prize for Excellence in Software Engineering for Computer Algebra.  


# Website

<a href="http://www.singular.uni-kl.de/">http://www.singular.uni-kl.de/</a> 


# Integration into SAGE

The <a href="/pexpect">pexpect</a> interface allows to deal with Singular objects from within SAGE. This allows to perform almost any Singular calculation  from within SAGE. 


```python
#!python 
sage: r = singular.ring(0,'(x,y,z)','dp')
sage: f = singular('x + 2*y + 2*z - 1')
sage: g = singular('x^2 + 2*y^2 + 2*z^2 - x')
sage: h = singular('2*x*y + 2*y*z - y')
sage: I = singular.ideal(f,g,h)
sage: I.std()

x+2*y+2*z-1,
10*y*z+12*z^2-y-4*z,
4*y^2+2*y*z-y,
210*z^3-79*z^2+7*y+3*z

```
Alternatively, commands can be passed to the Singular interpreter directly, allowing SAGE to perform every calculation Singular is capable of. 


```python
#!python 
sage: ret = singular.eval('ring r = 0,(x,y,z),dp')
sage: ret = singular.eval('poly f= x + 2*y + 2*z - 1')
sage: ret = singular.eval('poly g = x^2 + 2*y^2 + 2*z^2 - x')
sage: ret = singular.eval('poly h = 2*x*y + 2*y*z - y')
sage: ret = singular.eval('ideal i = f,g,h')
sage: print singular.eval('std(i)')
_[1]=x+2y+2z-1
_[2]=10yz+12z2-y-4z
_[3]=4y2+2yz-y
_[4]=210z3-79z2+7y+3z
```
This functionality is used by several 'native' SAGE objects to perform calculations. For instance, if a Gröbner basis is to be calculated in SAGE Singular is used by default: 


```python
#!python 
sage: P.<x,y,z> = PolynomialRing(QQ,3)
sage: I = sage.rings.ideal.Katsura(P,3)
sage: I.groebner_basis() # calls Singular in background
[x + 2*y + 2*z - 1, 10*y*z + 12*z^2 - y - 4*z, 5*y^2 - 3*z^2 - y + z, 210*z^3 - 79*z^2 + 7*y + 3*z]
```
However, the communication channel via pseudo ttys and string parsing may be pretty slow depending on the task at hand. 

To use Singular's high performance multivariate polynomial arithmetic SAGE links directly against a shared library called libSINGULAR which we derive from Singular. So far, multivariate polynomial arithmetic over $Q$, $GF(p)$, and $GF(p^n)$ is implemented this way. However, in this shared library mode no support for the Singular interpreter is provided which means that only a basic subset of Singular's capabilities are available, i.e. those written in C/C++. All of Singular's capabilities are however available through the forementioned <a href="/pexpect">pexpect</a> interface and convenient conversion methods are provided. 


# Examples


```python
#!python 
sage: P.<x,y,z> = PolynomialRing(QQ,3) # uses Singular in shared library mode
sage: type(P)
<type 'sage.rings.polynomial.multi_polynomial_libsingular.MPolynomialRing_libsingular'>
sage: I = sage.rings.ideal.Katsura(P)
sage: I.groebner_basis() # calls Singular via the pexpect interface in background
[x + 2*y + 2*z - 1, 10*y*z + 12*z^2 - y - 4*z, 5*y^2 - 3*z^2 - y + z, 210*z^3 - 79*z^2 + 7*y + 3*z]
sage: f = I.gens()[0]
sage: g = f._singular_() # shared library implementation -> pexpect interface
sage: P(g) # pexpect interface implementation -> shared library mode
x + 2*y + 2*z - 1
```

# Performance

Singular provides a very fast multivariate polynomial implementation. Please note, that benchmarking these things in the Singular interpreter will probably give false results as the interpreter is very basic. To gather some simple performance datapoints consider Richard Fateman's <a class="http" href="http://www.sigsam.org/cca/articles/143/fastmult.pdf">fastmult</a> benchmark 
```python
#!python 
sage: print "over QQ"

sage: P.<x,y,z> = PolynomialRing(QQ,3)
sage: p = (x + y + z + 1)^20 # the Fateman fastmult benchmark
sage: q = p + 1
sage: t = cputime()
sage: r = p*q
sage: print "SAGE/Singular %0.2f"%cputime(t)

sage: p = p._magma_() # MAGMA 2.13-2
sage: q = q._magma_()
sage: t = magma.cputime()
sage: r = p*q
sage: print "MAGMA         %0.2f"%magma.cputime(t)

sage: print "over GF(32003)"

sage: P.<x,y,z> = PolynomialRing(GF(32003),3)
sage: p = (x + y + z + 1)^20 # the Fateman fastmult benchmark
sage: q = p + 1
sage: t = cputime()
sage: r = p*q
sage: print "SAGE/Singular %0.2f"%cputime(t)

sage: p = p._magma_() # MAGMA 2.13-2
sage: q = q._magma_()
sage: t = magma.cputime()
sage: r = p*q
sage: print "MAGMA         %0.2f"%magma.cputime(t)
```
On <a href="http://sage.math.washington.edu">http://sage.math.washington.edu</a> (1.8Ghz Opteron) and SAGE 2.5.1 (with a libSINGULAR without debugging options) this produces  
```python
#!python 
over QQ
SAGE/Singular 2.35
MAGMA         0.86
over GF(32003)
SAGE/Singular 0.24
MAGMA         0.52
```
as output. On a 2.33Ghu <a href="/Core2Duo">Core2Duo</a> Macbook Pro running a 64-bit Debian/Linux and the same software configuration this produces 
```python
#!python 
over QQ
SAGE/Singular 1.42
MAGMA         0.76
over GF(32003)
SAGE/Singular 0.15
MAGMA         0.39
```
as output. 


# Tips, Tricks, and Pitfalls

As the pseudo tty interface may be slow it is always better to throw data at Singular in large chunks instead of small pieces. Consider this example: 
```python
#!python 
sage: singular.ring(0,'(x,y)','dp')
//   characteristic : 0
//   number of vars : 2
//        block   1 : ordering dp
//                  : names    x y
//        block   2 : ordering C
sage: x=singular("x")
sage: f=0
sage: time for i in range(10000): f+=x^i
CPU times: user 4.30 s, sys: 1.28 s, total: 5.58 s
Wall time: 6.47

sage: ret =singular.eval('int i')
sage: time _ = singular.eval("poly f=0; for(i=0; i<10000 ; i=i+1) { f=f+x^i; }; f")
CPU times: user 0.00 s, sys: 0.00 s, total: 0.01 s
Wall time: 1.24

```
Please note, that this calculation can be done much faster by using the libSINGULAR interface. 
```python
#!python 
sage: P.<x,y> = PolynomialRing(QQ,2)
sage: f= 0
sage: sage: time for i in range(10000): f+=x^i
CPU times: user 0.82 s, sys: 0.00 s, total: 0.82 s
Wall time: 0.83
```
 
