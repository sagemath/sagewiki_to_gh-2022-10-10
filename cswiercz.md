##master-page:HomepageTemplate
#format wiki
== Chris Swierczewski ==
Email: [[MailTo(cswiercz AT SPAMFREE gmail DOT com)]]

The following is a missing piece of documentation for adding new <tt>.pyx</tt> to the ''Sage'' library: See [http://www.sagemath.org/doc/html/prog/node40.html 5.2] of the [http://www.sagemath.org/doc/html/prog/prog.html Sage Programming Guide].

== Writing Optimized Compiled Code with Sage ==
=== Examples ===
==== Creating .pyx Files in the Sage Library ====

Suppose you want a more permanent way of including your optimized Cython code in Sage. Perhaps
you want to contribute to the Sage project? This guide will show you how to create a simple
Cython module and then link it to the Sage library so that your code will appear in future
versions of Sage.

= Opentick =

Opentick provides free real-time and historical market data for trading systems and trading platforms. See www.opentick.com.

This package is used by the sage.finance module.

=== otfeed1.1 (Chris Swierczewski, 27 Aug 2008) ===
 * Checkout from {{{cvs -d :pserver:anonymous@cvs.opentick.com:/var/cvs co otfeed1.1-dev}}} (Note that this currently does not work! Results in following error message:)
   {{{
   cvs [checkout aborted]: connect to cvs.opentick.com(64.210.196.151):2401 failed: No route to host
   }}}
   For now, download from http://cvs.opentick.com/cgi-bin/cvsweb.cgi/otfeed1.1-dev/otfeed1.1-dev.tar.gz?tarball=1.
 * Download patch from http://otfeed-patches.googlecode.com/files/otfeed1.1-dev-autotools.patch into top-level folder so that compiler can use GNU autotools.
 * Apply patch using the following command:
   {{{
   patch -p1 < otfeed1.1-dev-autotools.patch
   }}}
 * Configure, make, and install Opentick source in {{{src/}}} to {{{$SAGE_ROOT}}}
 * Make and install C++ binary, otwrapper.
 * Copy binary into {{{$SAGE_LOCAL/bin}}}

----
 CategoryHomepage
