== Debian release to support ==

sbuild: lenny x86-64: can create 32 & 64 bit arch specific packages, ~12 in total:

 * Ubuntu LTS
 * last two Ubuntu releases
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
 * domain: maybe "debian.sagemath.org" or "sagemath.org/debian"

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
 * create official Sage GPG key to sign packages

== Package names ==
 
 * Comply with Debian policy when possible
 * libraries (for example NTL):
  * ntl_5.4.1-1.dsc (the source source package), tarball with debian directory
  * libntl0_5.4.1-1_i386.deb (initial NTL version, i.e. "0", contains shared library) 
  * libntl-dev_5.4.1-1_i386.deb (headers & static libraries)
 * binary (eclib)
  * eclib_1.0_i386.deb (binaries)
  * libec0_1.0_i386.deb (shared libraries)
  * libec-dev_1.0_i386.deb (headers & static libraries)
 * Singular
  * To be determined

== Setting up the build system (In Detail) ==

 * Start Debian installer
 * Partitioning method: "Guided - use entire disk and set up LVM" - accept defaults and write LVM init to disk
 * delete original main LVM volume, create new VG, say with 10GB
 * set up accounts for root and users as usual
 * update to lenny: edit /etc/apt/source and replace "etch" with "lenny"
 * "aptitude update"
 * "aptitude dist-upgrade" (wait a while :) )
 * download Tim's script collection from the main Deb packaging page [http://www.sagemath.org:9001/days7/DebianPackagingSprint?action=AttachFile (tarball here for now)], untar ...
 * file "packages" contains list of packages needed for the build system
 * aptitude install `cat packages` installs the packages listed in packages
 * file "approx.conf.tail": append file to approx.conf - make sure to set a fast mirror, i.e. not the MIT repo
 * restart approx service via "/etc/init.d/approx restart"
 * edit make-chroot and set $VG to volume group name or export VG
 * Now create change roots for various targets using make-chroot: Parameters $1 is SUITE (i.e. lenny), $2 is ARCH (i.e. i386)
 * If things go wrong remove lvm group created :(
 
