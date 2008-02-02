= Sage FAQ: Frequently Asked Questions =
----------
 * QUESTION: I created the file {{{SAGE_ROOT/devel/sage/sage/calculus/stokes.py}}}, and have changed my mind and want to completely delete it from Sage, but it keeps coming back (i.e. it is still importable) when I type {{{sage -br}}}.  What do I do?
 * ANSWER: Delete both {{{SAGE_ROOT/devel/sage/build/sage/calculus/stokes.py}}} '''and''' {{{SAGE_ROOT/devel/sage/build/lib.*/sage/calculus/stokes.py}}}.
----------
 * QUESTION: Does sage contain a function similar to Mathematica's ToCharacterCode[]? That is, I'd like to covert something like "Big Mac" to ascii numerals for further processing. Thanks
 * ANSWER: Yes, use {{{ord}}}, e.g., {{{map(ord,'abcde')}}} outputs {{{[97, 98, 99, 100, 101]}}}.
----------
 * QUESTION: Is there anything so Sage can be made to automatically execute commands on startup?
 * ANSWER: Yes, just make a file {{{$HOME/.sage/init.sage}}} and it will be executed any time you start sage.
----------
 * QUESTION: My Sage upgrade failed with missing gmp symbols on OSX 10.4. What can I do?
 * ANSWER: Moving a sage install on OSX 10.4 and then upgrading anything that is linked against NTL leads to link errors due to missing gmp symbols. The problem is the link mode with which the dynamic NTL is created. I have a fix, but I am currently verifying that it really fixes the issue. Everything that is linked against NTL needs to be recompiled, i.e. singular and cremona at the moment. To add to the confusion: This is not an issue on OSX 10.5. A fix for this issue went into 2.8.15, so please report if you see this with a more current Sage release.
----------
 * QUESTION: When I compile Sage my computer beeps and shuts down or hangs.
 * ANSWER: Compiling Sage is quite taxing on the CPU. The above behavior usually indicates that your computer has overheated. In many cases this can be fixed by cleaning the CPU fan and assuring proper ventilation of the system. Please ask you system administrator or a professional to do this in case you have never done this since you can potentially damage your system.
----------
 * QUESTION: When I run doctests on OSX I see the following messages, but in the end Sage reports that everything went fine:
{{{
sage -t  devel/sage-main/sage/libs/pari/gen.pyx
python(4563) malloc: *** vm_allocate(size=4096000000) failed (error code=3)
python(4563) malloc: *** error: can't allocate region
python(4563) malloc: *** set a breakpoint in szone_error to debug
}}}
 * ANSWER: The issue above isn't a doctest failure, it is an error message printed by the system and it is exactly what one expects to see -- in that particular doctest, we try to allocate a very large list in Pari that doesn't fit into physical memory (it it at least 100GB in size). So OSX tells you that it couldn't allocate a chunk of memory roughly 4 GB in size, which is expected, since Sage is still a 32 bit application on OSX.
----------
 * QUESTION: Sage 2.9 and higher fails compiling ATLAS on Linux. How can I fix this?
 * ANSWER: The most likely cause is enabled power management. Disabling it should fix the problem. Depending on your flavor of distribution this might either be possible with some nice GUI tool or not. On the commandline do the following as {{{root}}} for each CPU you have: {{{/usr/bin/cpufreq-selector -g performance -c #number CPU}}}. On Ubuntu try disabling "Power Manager" via "System --> Preferences --> Sessions" under the "Startup Programs" or using {{{cpufreq-set}}} via command line.
----------
 * QUESTION: Sage fails with the error message {{{restore segment prot after reloc: Permission denied}}}. What is wrong?
 * ANSWER: The problem is related to SELinux: http://www.ittvis.com/services/techtip.asp?ttid=3092. We are currently tracking this issue at http://www.sagetrac.org/sage_trac/ticket/480.
----------
 * QUESTION: Upgrading Sage went fine, but now the banner still shows the old version. How can I fix this?
 * ANSWER: Try doing {{{sage: hg_scripts.merge()}}} followed by {{{sage: hg_scripts.commit()}}}. As an alternative, you can simply try {{{hg_scripts.pull()}}}.
----------
 * QUESTION: How do I run sage in daemon mode, i.e. as a service?
 * ANSWER: We currently do not have a ready-to-go solution. There are several possibilities: Use screen, nohup or disown. We are tracking the issue at http://www.sagetrac.org/sage_trac/ticket/381 - so stay tuned.
----------
 * QUESTION: I downloaded a Sage binary and it crashes on startup with {{{Illegal instruction}}}. What can I do?
 * ANSWER: The binaries have been built for a newer architecture than you have. We want to acquire an older machine and install a bunch of minimal Linux images on it for building Sage binaries to avoid this, but it hasn't happened  yet. One solution is to build from source. Another solution to have your distributions' ATLAS package installed. That package has to provide dynamic version of the ATLAS libaries from the 3.8 release. Then go into {{{$SAGE_LOCAL/lib}}} and delete {{{libatlas.*}}}, {{{libf77blas.*}}} and {{{libcblas.*}}}.  That needs to be repeated every time you update Sage. Certain Via CPUs like {{{Nehemiah}}} also seem to have trouble with the binaries we provide and the solution seems to be to build from source since ATLAS isn't the culprit in that case. We are investigating the issue.
----------
 * QUESTION: I just downloaded version 2.8.15 for Mac OSX and tried to run notebook() and dyld is unable to load libintl.3.dylib.  I don't have a libintl.3.dylib in {{{usr/local/lib}}} and I didn't find it in {{{$SAGE_ROOT/local/lib}}}. Is there a workaround?
 * ANSWER:  Yes, put the libintl3.dylib from http://sagemath.org/SAGEbin/apple_osx/intel/10.4-extra_files/ {{{in SAGE_ROOT/local/lib/}}}. Sage 2.8.15 and later contain a copy of the library, so please let us know if you experience the problem with any later release.
----------
 * QUESTION: I am using Mac OSX. Where do I put the jsMath "font" directory to eliminate the red box?
 * ANSWER: See http://www.math.union.edu/~dpvc/jsMath/download/jsMath-fonts.html where it says "For Mac OS X users: download and unpack the archive, then drag the fonts to your Library/Fonts folder (or to the FontBook, or just double-click them and press the "install" button).".
----------
 * QUESTION: The show command for plotting 3D objects does not work. 
 * ANSWER: Since Sage 2.9.2 we have switched to using jmol, a Java applet, for 3D plotting. There are several possibilities for the cause of the malfunction: You do not have Java installed at all or the Java installed is an older GNU based alternative Java implementation, which causes some yet to determine problem. A solution to both issues is to either install Sun's Java SDK or to update the GNU based Java implementation. As of January 2008 Debian's Java in testing works, but stable does have problems.
----------
 * QUESTION: May I use Sage tools in a commercial environment?
 * ANSWER: YES!  Absolutely!  Basically the *only* constraint is that if you make changes to Sage itself and redistribute this changed version of Sage publicly, then you must make these changes available to us so that we can put them into the standard version of Sage (if we want).   Otherwise, you'll free to use as many copies of Sage as you want completely for free to make money, etc., without paying any license fees at all.
----------
 * QUESTION: I want to write some Cython code that uses finite field arithmetic but {{{cimport sage.rings.finite_field_givaro}}} fails. What can I do?
 * ANSWER: You need to give hints to Sage so that it uses C++ (both Givaro and NTL are C++ libraries), and it also needs the GMP and STDC C++ libraries. Here is a small example:

{{{
# These comments are hints to Sage/Pyrex about the compiler and
# libraries needed for the Givaro library:
#
#clang c++ 
#clib givaro gmpxx gmp m stdc++

cimport sage.rings.finite_field_givaro

# Construct a finite field of order 11.
cdef sage.rings.finite_field_givaro.FiniteField_givaro K
K = sage.rings.finite_field_givaro.FiniteField_givaro(11)

print "K is a", type(K)

print "K cardinality =", K.cardinality()

# Construct two values in the field:
cdef sage.rings.finite_field_givaro.FiniteField_givaroElement x
cdef sage.rings.finite_field_givaro.FiniteField_givaroElement y
x = K(3)
y = K(6)

print "x is a", type(x)
print "x =", x
print "y =", y
print "x has multiplicative order =", x.multiplicative_order()
print "y has multiplicative order =", y.multiplicative_order()
print "x*y =", x*y

# Show that x behaves like a finite field element:
for i in range(1, x.multiplicative_order() + 1):
    print i, x**i


assert x*(1/x) == K.one_element()
}}}

To find out more, type {{{sage.rings.finite_field_givaro.FiniteField_givaro.}}} at the Sage prompt and hit tab, then use ?? to get more info on each function. For example:

{{{sage.rings.finite_field_givaro.FiniteField_givaro.one_element??}}}

tells you more about the multiplicative unit element in the finite field.
----------
 * QUESTION: How do I make the VMware appliance for Windows automatically login as "sage"?
 * ANSWER: Follow http://ubuntu-utah.ubuntuforums.org/showthread.php?t=303319.  Short version: put in the file {{{/usr/bin/autologin}}} the text

{{{
#! /bin/sh
/bin/login -f sage
}}}

and make this file executable; then edit {{{/etc/event.d/tty1}}}, comment out 

{{{
respawn /sbin/getty 38400 tty1
}}}

and add

{{{
respawn /sbin/getty -n -1 /usr/bin/autologin 38400 tty1
}}}

Now every time the appliance reboots, it will automatically load directly to the sage: prompt.  Warning: This will make it nearly impossible to get a terminal prompt!  So only do this if you don't plan on any further management.
----------

= ToDo =

 * QUESTION: Sage fails to compile on OSX 10.4 
 * ANSWER: Most likely resource issue.
 * QUESTION: Notebook doesn't work
 * ANSWER: networking issues, firewall blocking, proxy setting screwed up

 * Individual FAQ entries should be referable by a URL, possibly http://wiki.sagemath.org/faq?someid=something
 * You can do that with page anchors: [http://wiki.sagemath.org/faq?#something]. Moin``Moin [http://moinmo.in/HelpOnLinking can insert page anchors] but it doesn't seem like that facility is turned on for this installation. If we could get that enabled, we could insert anchors for all the questions on this page.
