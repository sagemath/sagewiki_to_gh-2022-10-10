#pragma section-numbers 2
= Sage FAQ: Frequently Asked Questions =
<<TableOfContents>>

== Introduction ==


=== What is Sage? ===

Sage is a comprehensive open-source mathematics software suite that has the mission statement "Creating a viable free open source alternative to Magma, Maple, Mathematica, and Matlab."  See https://www.sagemath.org/ for more details.


=== Does it run on my computer? ===

Probably, we are trying to support a wide range of computers. See the [[SupportedPlatforms|supported platforms list]] for details.


== Getting Sage ==


=== Can I try out Sage without downloading anything? ===

Yes!  Go to https://cloud.sagemath.com/ and set up a free account.  If you log in, you will be working on a free Sage cloud server that will work identically to the one you get with Sage.


=== How do I get a Sage program I can run immediately? ===

Go to https://www.sagemath.org/download.html and click on the link for the binary for your operating system.


=== How do I get the Sage source code? ===

Go to https://www.sagemath.org/download-source.html to download the tar archive for any release of Sage.


=== How do I get a previous release of Sage? ===

Go to https://www.sagemath.org/src-old to download the tar archive for any release of Sage.


== Installing and running Sage ==


=== Wouldn't it be way better if Sage did not ship as a gigantic bundle? ===

Some OS [[Distribution|distributions]] do this, to varying degrees. However it requires
continual maintenance and distribution-specific knowledge that the Sage team does not have.
We are happy to accept reasonable patches that would help make this task easier for them. (See a rant from 2009 at the bottom of the page.)


=== How do I compile the source to Sage? ===

Download the source tar archive, extract the archive, change your directory to be inside of it, and read the README.txt file there.  Basically, after making sure you have the proper prerequisite tools installed, you type {{{make}}}.


=== How do I run Sage on a platform other than VirtualBox or Windows? ===

Change your directory to the sage directory and run {{{./sage}}}

To start an online notebook server, start Sage and type {{{notebook()}}} at the sage command prompt.


=== How do I run Sage with VirtualBox? ===

You must install the !VirtualBox software available at http://www.virtualbox.org/wiki/Downloads. Then run the downloaded Sage virtual appliance and follow these [[SageAppliance|additional instructions]].

=== How do I create my own Sage virtual machine ? ===

See [[VirtualBox|these instructions]].

=== How do I run Sage in Windows? ===

As of SageMath 8.0 a [[SageWindows|native Windows binary installer]] is available.  This should work for most users with 64-bit Windows 7 and up.

For older versions of Sage, or for users with needs not met by the current version of the binary installer,  the !VirtualBox appliance images are still available--see the instructions for running [[SageAppliance|the Sage virtual appliance]].

=== I installed Sage on a Unix or Linux server where I have an account, but my personal computer runs Windows.  How do I access the Sage notebook? ===

You can use port forwarding with ssh to interact with the notebook via a Windows browser.

Log into the server, and run the Sage notebook.  Typically this involves the command

{{{
./sage -notebook
}}} 

from within the Sage directory.

If this is the first time you have used the Sage notebook, the system will prompt you to create an admin password.  The system will then give you instructions that look like this:

{{{
**************************************************
*                                                *
* Open your web browser to http://localhost:8080 *
*                                                *
**************************************************
}}} 

Make a note of the number after localhost (in our example, 8080).  This is the port that the notebook expects you to use.

Now, close the notebook using Ctrl-C, and log out of the server.  You want to open a new ssh connection using port forwarding.

If you are using the free ssh program PuTTy, you should first enter the name of your server.  Then find the port forwarding options: you can locate these by going to Connections, then SSH, then Tunneling in the "Category" menus on the left.  Enter the port number (e.g., 8080) in the Source Port box, and then enter localhost: followed by the port number (e.g., localhost:8080) in the Destination box.  Make sure the Local radio button is selected, and click Add.  Then hit Open to log into your server.

Return to your sage directory, and run 

{{{
./sage -notebook
}}} 

again.

This time, when the notebook prompts you to open your web browser to a particular address, you should do so (in our example, that means opening a new browser window and going to http://localhost:8080 ).  Log in using the username admin and the password you created.  Once you have done so, you can create new users by following the Settings link and then choosing the Manage Users option.

=== How do I run a parallel build? ===

The command
{{{
export MAKE="make -j8"
}}} 
will enable 8 threads for parts of the build that support parallelism. Change the number 8 as appropriate to suit the number of cores on your system.

The command
{{{
export SAGE_PARALLEL_SPKG_BUILD="yes"
}}}
will enable building the spkgs in parallel.


=== How do I run Sage in a browser that is not the system default ===

Issue this command "env SAGE_BROWSER=opera /usr/bin/sage -notebook" either from the command prompt or as a menu command for Sage. Assumes a Linux operating system, Opera as the browser, and I happen to use KDE as my desktop.


=== How to get Sage's Python to recognize my system's Tcl/Tk install? ===

It may be that you have Tcl/Tk installed and that your system's Python recognizes it but Sage's Python does not. To fix that, install the tcl/tk development library. On Ubuntu, this is the command

{{{
sudo apt-get install tk8.5-dev
}}}
Next, reinstall Sage's Python:

{{{
sage -f python-2.5.2.p8
}}}
This will pick up the tcl/tk library automatically. If
 
{{{#!python numbers=none
sage: import _tkinter
sage: import Tkinter
}}}
does not raise an ImportError then it worked.


=== How do I import Sage into a Python script? ===

Yes you can import Sage as a library in a Python script. One caveat is that you need to run that Python script using the version of Python that is bundled with Sage (e.g. Sage 5.8 has Python 2.7.3). To import Sage, put the following in your Python script:
{{{
from sage.all import *
}}}
Then when you want to run your script, you need to invoke Sage with the option "-python" which would run your script using the Python that comes with Sage. For example, if Sage is in your PATH variable then you can do this:
{{{
sage -python /path/to/my/script.py
}}}
Another way is to write a Sage script and run that script using Sage itself. A Sage script has the file extension ".sage" and is more or less a Python script but uses Sage-specific functions and commands. You can then run that Sage script like so:
{{{
sage /path/to/my/script.sage
}}}
This will take care of loading the necessary environment variables and default imports for you.


=== I'm seeing an error about 'Permission denied' on a file called sage-flags.txt ===

When sage is built from source, it keeps track of what special instructions your CPU 
supports (such as `SSE2`), and records these (so that if you try running the code on a different machine,
which doesn't support these extra instructions, you get a sensible error message instead
of a segfault or illegal instruction). Since this should be stored with sage itself (as opposed 
to a user's `.sage` directory), it has to be created by someone with the appropriate permissions.

So if you're seeing something like this:

{{{#!python numbers=none
Traceback (most recent call last):
  File "/usr/local/sage-4.0.2/local/bin/sage-location", line 174, in <module>
    t, R = install_moved()
  File "/usr/local/sage-4.0.2/local/bin/sage-location", line 18, in install_moved
    write_flags_file()
  File "/usr/local/sage-4.0.2/local/bin/sage-location", line 82, in write_flags_file
    open(flags_file,'w').write(get_flags_info())
IOError: [Errno 13] Permission denied: '/usr/local/sage-4.0.2/local/lib/sage-flags.txt'
}}}

it probably means that you compiled/installed sage as one user, but haven't run it to let it
generate the `sage-flags.txt` file. Just run `sage` one time as whatever user installed it, and 
this problem should go away. This would also be easy to fix by having sage run once as part of
the install process; see [[https://trac.sagemath.org/sage_trac/ticket/6375|trac #6375]] for 
this fix.


=== I used Debian/Ubuntu to install Sage 3.0.5 and that version is giving lots of errors. What can I do? ===

The version of Sage, i.e. Sage version 3.0.5, that's available through apt-get in Debian and Ubuntu is very old. No-one has yet found time to update the Debian/Ubuntu version of Sage. Help wanted! You should download the latest version of Sage from the [[https://www.sagemath.org/download.html|download page]]. If you would like to help with updating the Debian/Ubuntu version of Sage, please email the [[https://groups.google.com/group/sage-devel|sage-devel]] mailing list.

=== Can I see a calculation step-by-step? ===

Unfortunately no. You can run the python debugger to execute it step-by-step, but that is entirely different from how a human would do a calculation.

== Developing in Sage ==


=== What tools do I need to develop in Sage? ===

You need the prerequisite tools listed in the ([https://github.com/sagemath/sage/blob/master/README.txt|README.txt]] file in the root directory of Sage.

=== Where is the source code to Sage? ===

You can browse the complete source code to everything in Sage at https://github.com/sagemath/sage. This is a web interface to the Git repository.

=== How can I rebuild the Sage library in parallel? ===

When you run {{{sage -b}}}, the Sage library gets rebuilt. If you've changed a large number of files (for example, by using Git to jump over many revisions), rebuilding the library will take a long time. If you are using a multicore machine, you can speed this up very easily: set the {{{MAKE}}} environment variable. If you run, say, {{{env MAKE='make -j5' ./sage -b}}} then the Sage library will get rebuilt using five threads. The other library-rebuilding commands also work: {{{-br}}}, {{{-ba}}}, and {{{-ba-force}}} all respect {{{MAKE}}}. In the bash shell, you can also simply do {{{export MAKE='make -j5'}}} and thereafter any rebuilds you do will automatically use five threads.

Note that there is an apparent bug in GNU make, so that you cannot leave a space between the {{{-j}}} and the number of threads (jobs, as Make calls them). So {{{make -j 5}}} and so on will ''not'' work.

== Working in Sage ==

=== What exactly does Sage do when I type 0.6**2? ===

 * QUESTION: When I type 0.6**2 in Python, it returns 0.35999999999999999.  When I do the same in Sage it returns 0.360000000000000.  Why?
 * ANSWER: See [[https://docs.python.org/tutorial/floatingpoint.html|the Python tutorial]] to understand why Python does what it does.    What Sage does is "preparse" the input and transforms it like this:
{{{
sage: preparse('0.6**2')
"RealNumber('0.6')**Integer(2)"
}}}
So what is *actually* run is:
{{{
RealNumber('0.6')**Integer(2)
}}}
The Sage developers (in fact, Carl Witty) decided that Sage floating point numbers should by default print only the known correct decimal digits, when possible, thus skirting the problem that Python has.  This decision has its pros and cons.  Note that {{{RealNumber}}} and {{{Integer}}} are Sage specific, so you wouldn't be able to just type the above into python and expect it to work without first doing {{{from sage.all import RealNumber, Integer, preparse}}}. 


=== Why is Sage's command history different than Magma's ===

 * QUESTION: Using Sage, I am missing a feature of Magma command line interface. In Magma, if I enter a line found in history using up arrow key, and then press down arrow key, then the next line in history is fetched. This feature allows me to fetch as many successive lines in history as like. Does Sage(or readline) have a similar feature?
 * ANSWER: No, Sage does not have a similar feature.  The IPython command prompt uses the readline library (via pyreadline), which evidently doesn't support this feature.  Magma has its own custom "readline-like" library, which does support this feature.   (Since so many people have requested this feature, if anybody can figure out how to implement it, then such an implementation would certainly be welcome!)


=== How do I work with noncommutative variables ===

 * QUESTION: I'd like to do some mathematics with variables that do not commute with each other.  How do I do that?
 * ANSWER: Use the FreeAlgebra object:
{{{
sage: R.<a,b> = FreeAlgebra(QQ, 2)
sage: a*b + b*a
a*b + b*a
sage: s = matrix(R)
sage: s = matrix(R, [[a,b],[b,a]]); s
[a b]
[b a]
sage: s*s
[a^2 + b^2 a*b + b*a]
[a*b + b*a a^2 + b^2]
sage: b*s*s
[  b*a^2 + b^3 b*a*b + b^2*a]
[b*a*b + b^2*a   b*a^2 + b^3]
}}}

For matrices in particular, see [[https://groups.google.com/group/sage-devel/browse_thread/thread/cafb486c79a2eb3c/d0bb78d09a4fb52a]]

=== How do I save an object so I don't have to compute it each time I open a worksheet? ===

The {{{save}}} and {{{load}}} commands will save and load an object, respectively.  In the notebook, the {{{DATA}}} variable is the location of the data storage area of the worksheet.  To save the object {{{my_stuff}}} in a worksheet, you could do {{{save(my_stuff, DATA+"my_stuff")}}} and to reload it, you would just do {{{my_stuff = load(DATA+"my_stuff")}}}


== Getting help ==


=== How do I get help? ===

There is a website for asking help: https://ask.sagemath.org.

Sage has two very active email lists: 

* For developers of sage: https://groups.google.com/group/sage-devel

* For users of sage: https://groups.google.com/group/sage-support.

There are also two very active IRC channels: #sage-devel and #sage-support on freenode.

Many developers also actively blog and also post other Sage-related tutorials and talks.  See https://www.sagemath.org/help.html for a listing of these resources.

== Other questions ==

----------
 * QUESTION: I downloaded a Sage binary and it crashes on startup with `Illegal instruction`. What can I do?
 
 * ANSWER: Short answer: One way to fix this is to build Sage entirely from source. Another option is to fix your Sage installation by rebuilding MPIR and ATLAS by typing the following in the root of your Sage installation directory and wait about 15-20 minutes:
 {{{
rm spkg/installed/mpir* spkg/installed/atlas*
make
 }}}
 More explanation: The binaries have been built for a newer architecture than what you have.  Nobody has yet figured out how to build Sage in such a way that MPIR and ATLAS work on all hardware.  This will eventually get fixed. 
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
 * ANSWER 1: Compiling Sage is quite taxing on the CPU. The above behavior usually indicates that your computer has overheated. In many cases this can be fixed by cleaning the CPU fan and assuring proper ventilation of the system. Please ask your system administrator or a professional to do this in case you have never done this since you can potentially damage your system.
 * ANSWER 2: For Linux users, if you suspect that the compilation fails because of a resource issue, a fix might be to edit your /etc/inittab so that Linux boots into run level 3. The file /etc/inittab usually contains something similar to the following snippet:
 {{{
#   0 - halt (Do NOT set initdefault to this)
#   1 - Single user mode
#   2 - Multiuser, without NFS (The same as 3, if you do not have networking)
#   3 - Full multiuser mode
#   4 - unused
#   5 - X11
#   6 - reboot (Do NOT set initdefault to this)
#
id:5:initdefault:
}}}
 which directs your Linux distribution to boot into a graphical login screen. Comment out the line "id:5:initdefault:" and add the line "id:3:initdefault:", so that you now have something like:
 {{{
#   0 - halt (Do NOT set initdefault to this)
#   1 - Single user mode
#   2 - Multiuser, without NFS (The same as 3, if you do not have networking)
#   3 - Full multiuser mode
#   4 - unused
#   5 - X11
#   6 - reboot (Do NOT set initdefault to this)
#
# id:5:initdefault:
id:3:initdefault:
}}}
 Now if you reboot your system, you'll be greeted with a text based login screen. This allows you to log into your system with a text based session from within a virtual terminal, which doesn't consume as much system resources as would be the case with a graphical session. Then build your Sage source distribution from within your text based session.
----------
 * QUESTION: When I run doctests on OSX I see the following messages, but in the end Sage reports that everything went fine:
 {{{
sage -t  devel/sage-main/sage/libs/pari/gen.pyx
python(4563) malloc: *** vm_allocate(size=4096000000) failed (error code=3)
python(4563) malloc: *** error: can't allocate region
python(4563) malloc: *** set a breakpoint in szone_error to debug
}}}
 * ANSWER: The issue above isn't a doctest failure, it is an error message printed by the system and it is exactly what one expects to see -- in that particular doctest, we try to allocate a very large list in Pari that doesn't fit into physical memory (it is at least 100GB in size). So OSX tells you that it couldn't allocate a chunk of memory roughly 4 GB in size, which is expected, since Sage is still a 32 bit application on OSX.
----------
 * QUESTION: Sage 2.9 and higher fails compiling ATLAS on Linux. How can I fix this?
 * ANSWER: The most likely cause is enabled power management. Disabling it should fix the problem. Depending on your flavor of distribution, this might either be possible with some nice GUI tool or not. On the command line do the following as {{{root}}} for each CPU you have: {{{/usr/bin/cpufreq-selector -g performance -c #number CPU}}}. On Ubuntu try disabling "Power Manager" via "System --> Preferences --> Sessions" under the "Startup Programs" or using {{{cpufreq-set}}} via command line.
----------
 * QUESTION: Sage fails with the error message {{{restore segment prot after reloc: Permission denied}}}. What is wrong?
 * ANSWER: The problem is related to SELinux: http://www.ittvis.com/services/techtip.asp?ttid=3092. We are currently tracking this issue at https://trac.sagemath.org/sage_trac/ticket/480.
----------
 * QUESTION: When I start Sage, SELinux complains that '/path/to/libpari-gmp.so.2' requires text-relocation.  How can I fix it?
 * ANSWER: The problem can be fixed by running the following command "chcon -t textrel_shlib_t /path/to/libpari-gmp.so.2"
----------
 * QUESTION: Upgrading Sage went fine, but now the banner still shows the old version. How can I fix this?
 * ANSWER: You can type {{{sage: banner()}}} to see the real version. You have to to type {{{make build}}} to re-build sage and get the correct banner.
----------
 * QUESTION: How do I run sage in daemon mode, i.e. as a service?
 * ANSWER: We currently do not have a ready-to-go solution. There are several possibilities: Use screen, nohup or disown. We are tracking the issue at https://trac.sagemath.org/sage_trac/ticket/381 - so stay tuned.
----------
 * QUESTION: I just downloaded version 2.8.15 for Mac OSX and tried to run notebook() and dyld is unable to load libintl.3.dylib.  I don't have a libintl.3.dylib in {{{usr/local/lib}}} and I didn't find it in {{{$SAGE_ROOT/local/lib}}}. Is there a workaround?
 * ANSWER:  Yes, put the libintl3.dylib from https://www.sagemath.org/SAGEbin/apple_osx/intel/10.4-extra_files/ {{{in SAGE_ROOT/local/lib/}}}. Sage 2.8.15 and later contain a copy of the library, so please let us know if you experience the problem with any later release.
----------
 * QUESTION: I am using Mac OSX. Where do I put the jsMath "font" directory to eliminate the red box?
 * ANSWER: See http://www.math.union.edu/~dpvc/jsMath/download/jsMath-fonts.html where it says "For Mac OS X users: download and unpack the archive, then drag the fonts to your Library/Fonts folder (or to the FontBook, or just double-click them and press the "install" button).".
----------
 * QUESTION: The show command for plotting 3D objects does not work.
 * ANSWER 1: Since Sage 2.9.2 we have switched to using jmol, a Java applet, for 3D plotting. There are several possibilities for the cause of the malfunction: You do not have Java installed at all or the Java installed is an older GNU based alternative Java implementation, which causes some yet to determine problem. A solution to both issues is to either install Sun's Java SDK or to update the GNU based Java implementation. As of January 2008 Debian's Java in testing works, but stable does have problems.
 * ANSWER 2: If you are running a brand new (as of April 2008) Ubuntu 8.04, they ship the Java Plugin by IcedTea. This is basically a good idea, but a bit too early since it is broken. Either wait for an update or uninstall the IcedTea Plugin and install the "SUN Java 6 Plugin". Later, switch back to IcedTea, since it is based on OpenJDK 7 (or SUNs Java 7) which is the next Java version. You can check for the used plugin in Firefox 3 by typing "about:plugins" into the URL bar. [[https://bugs.launchpad.net/ubuntu/+source/icedtea-java7/|read more here at launchpad]]
----------
 * QUESTION: May I use Sage tools in a commercial environment?
 * ANSWER: YES!  Absolutely!  Basically the *only* constraint is that if you make changes to Sage itself and redistribute this changed version of Sage publicly, then you must make these changes available to us so that we can put them into the standard version of Sage (if we want).   Otherwise, you are free to use as many copies of Sage as you want completely for free to make money, etc., without paying any license fees at all.
----------
 * QUESTION: I want to write some Cython code that uses finite field arithmetic but {{{cimport sage.rings.finite_field_givaro}}} fails. What can I do?
 * ANSWER: You need to give hints to Sage so that it uses C++ (both Givaro and NTL are C++ libraries), and it also needs the GMP and STDC C++ libraries. Here is a small example:
 {{{#!python numbers=off
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
 To find out more, type {{{sage.rings.finite_field_givaro.FiniteField_givaro.}}} at the Sage prompt and hit tab, then use ?? to get more information on each function. For example: {{{sage.rings.finite_field_givaro.FiniteField_givaro.one_element??}}} tells you more about the multiplicative unit element in the finite field.
----------
# * QUESTION: How do I make the VMware appliance for Windows automatically login as "sage"?
# * ANSWER: Follow http://ubuntu-utah.ubuntuforums.org/showthread.php?t=303319.  Short version: put in the file {{{/usr/bin/autologin}}} the text
# {{{
#! /bin/sh
#/bin/login -f sage
#}}}
# and make this file executable; then edit {{{/etc/event.d/tty1}}}, comment out
# {{{
#respawn /sbin/getty 38400 tty1
#}}}
# and add
# {{{
#respawn /sbin/getty -n -1 /usr/bin/autologin 38400 tty1
#}}}
# Now every time the appliance reboots, it will automatically load directly to the sage: prompt.  Warning: This will make it nearly impossible to get a terminal prompt!  So only do this if you don't plan on any further management.
#
#If you do need to escape to a shell, you can run the following from inside sage (untested):
#{{{#!python numbers=none
#import os
#os.execp('sh')
#}}}
#then use "sudo -s" to get a root shell.
#----------
# * QUESTION: When running Sage under VMware, if you log in under manage you are not given the permissions to create a file!
# * ANSWER: Type "sudo su" before creating files.
#----------
 * QUESTION: I'm getting weird build failures on OSX. How do I fix this?
 * ANSWER: Search the build log (install.log) to see if you're getting "fork: Resource temporarily unavailable.". If so, try the following. Create (or edit) /etc/launchd.conf and include the following:
 {{{
limit maxproc 512 2048
}}}
 . then reboot.  See [[http://www.macosxhints.com/article.php?story=20050709233920660|this page]] for more details.
----------
 * QUESTION: How do I use the bitwise XOR operator in Sage?
 * ANSWER: Define two variables, for example {{{a = 5; b = 8}}}, and evaluate {{{a.__xor__(b)}}}, 13. You can also do {{{(5).__xor__(8)}}} (the parentheses are necessary so that Sage doesn't think you have a real number). There are several ways to define a function: {{{xor = lambda x, y: x.__xor__(y)}}} and then do {{{xor(3, 8)}}}. Another option, which sneaks around the Sage preparser, is {{{def xor(a,b):  return eval("%s^%s"%(a,b))}}}. You can also turn off the Sage preparser with {{{preparser(False)}}} -- then {{{^}}} will work just like in Python, and you can later turn on the preparser with {{{preparser(True)}}}. (That only works in command-line Sage; in a notebook, switch to Python mode.)
----------
 * QUESTION: When I try to use LaTeX in the notebook, it says it cannot find {{{fullpage.sty}}}!
 * ANSWER: That's not a question. But we can help you solve your problem. :) The general -- but perhaps not very helpful -- answer is that you need to install {{{fullpage.sty}}} into a directory searched by TeX. In Ubuntu (and probably many other Linux distributions), you should install the {{{texlive-latex-extra}}} package. If that's not available, try installing the {{{tetex-extra}}} package. If you are using OS X, you will have to use whatever TeX distribution you use to get {{{fullpage.sty}}} (if you use [[http://www.tug.org/mactex|MacTeX]], it's likely already installed). If you are using the VMware image in Windows, you'll need to log into the VMware image and install {{{texlive-latex-extra}}} there.
----------
 * QUESTION: With objects {{{a}}} and {{{b}}} and a function {{{f}}}, I accidentally typed {{{f(a) = b}}} instead of {{{f(a) == b}}}.  This returned a {{{TypeError}}} (as expected), but also deleted the object {{{a}}}.  Why?
 * ANSWER: It's because of how functions are  defined in Sage using the {{{f(x) = expr}}} notation using the preparser.  Also notice that if you make this mistake inside of an {{{if}}} statement, you will get a {{{SyntaxError}}} before anything else goes wrong, so in this case, there is no problem.

== Wouldn't it be way better if Sage did not ship as a gigantic bundle? ==

This has been discussed over and over again and it plainly doesn't
work. The Sage in Debian does not pass doctests, not even close. In
general the combinatorial explosion of configurations to debug is way
too large and it is next to impossible to find any distribution where
the version numbers even remotely match. We updated to GAP 4.4.12 in
Sage 3.3 and the doctests involving GAP will in certain files be
broken with any previous GAP release. If you used the Debian packages
for Singular Sage won't work since we patch NTL and when those NTL
libs come in conflict either Sage doesn't compile or Singular blows
up. I can go on and on and on about similar issues and that is only
the stuff I know about right on top of my head. I have never taken the
time to go out and do dumb things to break Sage :)

In the near future we plan to upgrade to a svn release of the
development version of pari and then closely track it as bugs we
report are often only fixed in pari-2.4.3svn. There is *no* way any
distribution can track this without potentially breaking other code
dependent on pari and you will be royally screwed if you want to use
pari 2.3.4 in Sage (the stable release at this point) since Sage won't
even build. We will fix all in tree code that gets broken with the new
pari-svn and push it back upstream, but until that shows up in a
distribution we will long have shipped Sage 4.0.

The way we do it is the only way and I have doubts that any
distribution packaged Sage will even be able to keep up with the
official release given that I (=Michael Abshoff) spend working full time as the Sage
release manager :)


= ToDo =

 * QUESTION: Sage fails to compile on OSX 10.4
 * ANSWER: Most likely resource issue.
 * QUESTION: Notebook doesn't work
 * ANSWER: networking issues, firewall blocking, proxy setting screwed up
 * Individual FAQ entries should be referable by a URL, possibly https://wiki.sagemath.org/faq?someid=something
 * You can do that with page anchors: https://wiki.sagemath.org/faq?#something. Moin``Moin [[http://moinmo.in/HelpOnLinking|can insert page anchors]] but it doesn't seem like that facility is turned on for this installation. If we could get that enabled, we could insert anchors for all the questions on this page.
