= Description =
Singular is a Computer Algebra System for polynomial computations with special emphasis on the needs of commutative algebra, algebraic geometry, and singularity theory. 

Singular is distributed freely under the GNU General Public License (version 2 of the License); with the following additional restrictions (which override any conflicting restrictions in the GPL):
The following software used with SINGULAR have their own copyright: the omalloc library, the readline library, the Gnu Multiple Precision Library (GMP), NTL: A Library for doing Number Theory (NTL), the MultiProtocol library (MP), the Singular-Factory library, the Singular-libfac library, and, for the Windows distributions the Cygwin DLL and the Cygwin tools (Cygwin), and the XEmacs editor (XEmacs).
Their copyrights and licenses can be found in the accompanying files which are distributed along with these packages.

The Singular team won the ISAAC 2004 Richard D. Jenks Memorial Prize for Excellence in Software Engineering for Computer Algebra. 

= Website =
http://www.singular.uni-kl.de/

= Integration into SAGE =
Singular is integrated using the Pexpect interface which means that every functionality of Singular is accessible from SAGE. However, this communication channel via pseudo ttys and string parsing may be pretty slow depending on the task at hand. Please refer to the SAGE reference manual, the SAGE tutorial, and the Singular manual for details.

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
