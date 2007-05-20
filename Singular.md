= Description =
Singular is a Computer Algebra System for polynomial computations with special emphasis on the needs of commutative algebra, algebraic geometry, and singularity theory. 

Singular is distributed freely under the GNU General Public License (version 2 of the License); with the following additional restrictions (which override any conflicting restrictions in the GPL):
The following software used with SINGULAR have their own copyright: the omalloc library, the readline library, the Gnu Multiple Precision Library (GMP), NTL: A Library for doing Number Theory (NTL), the MultiProtocol library (MP), the Singular-Factory library, the Singular-libfac library, and, for the Windows distributions the Cygwin DLL and the Cygwin tools (Cygwin), and the XEmacs editor (XEmacs).
Their copyrights and licenses can be found in the accompanying files which are distributed along with these packages.

The Singular team won the ISAAC 2004 Richard D. Jenks Memorial Prize for Excellence in Software Engineering for Computer Algebra. 

= Website =
http://www.singular.uni-kl.de/

= Integration into SAGE =
Singular is integrated in two ways:
 * by using the Pexpect interface which means that every functionality of Singular is accessible from SAGE. However, this communication channel via pseudo ttys and string parsing may be pretty slow depending on the task at hand. Please refer to the SAGE reference manual, the SAGE tutorial, and the Singular manual for details.
 * by linking directly against a shared library called libSINGULAR which we derive from Singular. This way multivariate polynomial arithmetic over $Q$ and $GF(p)$ is provided through Singular. Other base fields (rings) will follow. In shared library mode no support for the Singular interpreter is provided which means that only a basic subset of Singular's capabilities are available. All of Singular's capabilities are however provided through the pexpect interface and convenient conversion methods are provided.

= Examples =
{{{#!python
sage: P.<x,y,z> = PolynomialRing(QQ,3) # uses Singular in shared library mode
sage: type(P)
<type 'sage.rings.polynomial.multi_polynomial_libsingular.MPolynomialRing_libsingular'>
sage: I = sage.rings.ideal.Katsura(P)
sage: I.groebner_basis() # calls Singular via the  pexpect interface in background
[x + 2*y + 2*z - 1, 10*y*z + 12*z^2 - y - 4*z, 5*y^2 - 3*z^2 - y + z, 210*z^3 - 79*z^2 + 7*y + 3*z]
sage: f = I.gens()[0]
sage: g = f._singular_() # -> pexpect interface
sage: P(g) # -> shared library mode
sage: x + 2*y + 2*z - 1
}}}

= Performance =
Singular provides a very fast multivariate polynomial implementation. Please note, that benchmarking these things in the Singular interpreter will probably give false results as the interpreter is very basic. To gather some simple performance datapoints consider:
{{{#!python
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
sage: print "MAGMA        %0.2f"%magma.cputime(t)
}}}
On http://sage.math.washington.edu (1.8Ghz Opteron) and SAGE 2.5.1 (with a libSINGULAR without debugging options) this produces 
{{{

}}}
as output. On a 2.33Ghu Core2Duo Macbook Pro running a 64-bit Debian/Linux and the same software configuration this produces
{{{
over QQ
SAGE/Singular 1.42
MAGMA         0.76
over GF(32003)
SAGE/Singular 0.15
MAGMA        0.39
}}}
as output.

= Tips, Tricks, and Pitfalls =
 * As the pseudo tty interface may be slow it is always better to throw data at Singular in large chunks instead of small pieces. Consider this example:
{{{#!python
sage: singular.ring(0,'(x,y)','dp')
//   characteristic : 0
//   number of vars : 2
//        block   1 : ordering dp
//                  : names    x y
//        block   2 : ordering C
sage: x=singular("x")
sage: f=0
sage: time for i in range(1000): f+=x^i
CPU times: user 0.95 s, sys: 0.12 s, total: 1.08 s
Wall time: 1.69
sage: time _ = singular.eval("poly f=0; for(i=0; i<1000 ; i=i+1) { f=f+x^i; }; f")
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 0.15
}}}
