== Debian release to support ==

sbuild: lenny x86-64: can create 32 & 64 bit arch specific packages, 14 in total:

 * Untuntu LTS
 * last two ubuntu releases
 * >=etch

== Make check ==
 * use schroot to run "make check"

== Problematic Packages ==

 * ATLAS  (atlas-sage-x.y or version bump)
 * Python (python-sage-x.y or version bump)
 * jmol - potential conflict with gcj in stable (testing an above fine)
 * Maxima: copies mgnuplot script to libexec (Maxima is already in Debian)

== Changelog ==

 * needs to be kept in sync with SPKG.txt (automated mechanism)
 * dch (Debian changelog)

== Initially ==
 * webserver for static only content
 * set up apt-get repo on $SAGE.MATH
 * To set up repo: reprpro + gpg key for signing
 * domain: mabye "debian.sagemath.org"

== Problem to be solved ==

 * Install location: /usr/share/sage/ - "sage" script in bin does cd and 
   then execute the appropriate sage scipt in /usr/share/sage/
 * location of tmp, i.e. $TMP, /tmp or /var/tmp, not $SAGE_ROOT/tmp
 * SAGE_ROOT/ipython - why is it there. What is the content (config files?)
 * databases in $SAGE_ROOT/data -> /use/share/sage/data
 * spkg directory: gone or moved to sage-dev.deb
 * make distclean: remove "*.c", "*.so", "*.os" in /devel/sage/
 * content of examples directory: What to do with the code?
 * LIB -> lib - Singular related, move to lib/Singular
 * text files from $SAGE_ROOT: /usr/share/doc/sage

== Package names ==
 
 * libraries (for example NTL):
  * ntl.dsc (the source source package), tarball with debian directory
  * libntl0_5.4.deb (initial NTL version, i.e. "0", contains shared library) 
  * libntl-dev.deb (headers & static libraries)
 * binary (eclib)
  * eclib.deb (binaries)
  * libec0.deb (shared libraries)
  * libec-dev.deb (headers & static libraries)
 * Singular
  * To be determined

== Setting up the build system (In Detail) ==

 * Start setup
 * Partitioning method: "Guided - use entire disk and set up LVM" - accept defaults and write LVM init to disk
 * delete original main LVM volume, create new VG, say with 10GB
 * set up accounts for root and users as usual
