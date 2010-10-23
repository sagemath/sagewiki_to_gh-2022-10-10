= Standard keywords for Sage trac =

You may specify any number of keywords on a given ticket, zero, one or more from any category.
Also note that these keywords are mostly for defects rather than enhancements.
This page documents some standard keywords, but feel free to use other keywords if you think they are relevant.

== Kind of bug ==

||'''keyword'''||'''meaning'''||
||build||Sage does not build||
||doctest||A failure in a doctest||
||segfault||"Unhandled SIGSEGV: A segmentation fault occurred in Sage" or similar like SIGBUS||
||doesnotstart||Sage does not start up||
||exception||Some command yields an exception where it is not expected||
||wrongresult||Sage computes something, but the answer is wrong||
||memleak||A memory leak||
||slow||Something is very slow because of a clear bug (don't use this to mean that a whole new algoritm should be implemented to speed things up)||
||interrupt||Some computation cannot be interrupted or strange stuff happens if it is interrupted||

== Where is the bug ==

When originally posting the bug, these keywords are usually guesses.  But that's okay if you have a strong suspicion.

||'''keyword'''||'''meaning'''||
||atlas, ..., zodb3||An spkg name if you think the problem is in the spkg or should be fixed in the spkg||
||upstream||Problem exists upstream||
||gcc||A bug in gcc||

== Kind of system ==

Only use this if you suspect that your bug is related to your particular system.

||'''keyword'''||'''meaning'''||
||linux||Linux||
||fedora, debian, redhat||Any particular distribution||
||macosx||Mac OS X||
||solaris||Solaris||
||windows||Microsoft Windows||
||i386||Intel 32-bit Pentium or similar processors||
||x86_64||Intel 64-bit Pentium or similar processors||
||ia64||Intel Itanium||
||ppc||PowerPC processors||
||32bit, 64bit||32-bit or 64-bit systems||

== Kind of patch ==

Since most patches simply patch the Sage library, we do not have a keyword for that.

||'''keyword'''||'''meaning'''||
||spkg||ticket contains a patch for a spkg||
||newspkg||ticket adds a new spkg which did not exist before||
||scripts||ticket has a patch to sage_scripts||
||extcode||ticket has a patch to extcode||
||examples||ticket has a patch to examples||
||c_lib||ticket has some patch changing files in c_lib||
||sageroot||some file not in the sage library, not in any spkg||
