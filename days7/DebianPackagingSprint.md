

## Debian release to support

sbuild: lenny x86-64: can create 32 & 64 bit arch specific packages, ~12 in total: 

* Ubuntu LTS 
* last two Ubuntu releases 
* >=etch 

## Make check

* use schroot to run "make check" 

## Problematic Packages

* ATLAS  (atlas-sage-x.y or version bump) 
* Python (python-sage-x.y or version bump) 
* jmol - potential conflict with gcj in stable (testing and above fine) 
* Maxima: copies mgnuplot script to libexec (Maxima is already in Debian) 

## Changelog

* needs to be kept in sync with SPKG.txt (automated mechanism) 
* dch (Debian changelog) 

## Initially

* webserver for static only content 
* set up apt-get repo on $SAGE.MATH 
* To set up repo: reprpro + gpg key for signing 
* domain: <a href="http://debian.sagemath.org">http://debian.sagemath.org</a> registered, still points at sagemath.org, needs vhost to be set up 

## Problem to be solved

* Install location: /usr/share/sage/ - "sage" script in bin does cd and  
      * then execute the appropriate sage scipt in /usr/share/sage/ 
* location of tmp, i.e. $TMP, /tmp or /var/tmp, not $SAGE_ROOT/tmp 
* SAGE_ROOT/ipython - why is it there. What is the content (config files?) 
* databases in $SAGE_ROOT/data -> /use/share/sage/data 
* spkg directory: gone or moved to sage-dev.deb 
* make distclean: remove "*.c", "*.so", "*.os" in /devel/sage/ 
* content of examples directory: What to do with the code? 
* LIB -> lib - Singular related, move to lib/Singular 
* text files from $SAGE_ROOT: /usr/share/doc/sage 
* create official Sage GPG key to sign packages 

## Package names

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

## Setting up the build system (In Detail)

* based on build system for <a class="http" href="http://debathena.mit.edu">Debian-Athena</a> 
* Start Debian installer 
* Partitioning method: "Guided - use entire disk and set up LVM" - accept defaults and write LVM init to disk 
* delete original main LVM volume, create new VG, say with 10GB 
* set up accounts for root and users as usual 
* update to lenny: edit /etc/apt/source and replace "etch" with "lenny" 
* "aptitude update" 
* "aptitude dist-upgrade" (wait a while :) ) 
* download Tim's script collection from the main Deb packaging page <a class="http" href="http://wiki.sagemath.org/days7/DebianPackagingSprint?action=AttachFile">(tarballs here for now)</a>, untar ... [the code is being partially merged in the sage-scripts repo, some of the other might end up on a wiki page somewhere else once this is over] 
* file "packages" contains list of packages needed for the build system 
* aptitude install `cat packages` installs the packages listed in packages.  Also install cdbs. 
* file "approx.conf.tail": append file to approx.conf - make sure to set a fast mirror, i.e. not the MIT repo 
* restart approx service via "/etc/init.d/approx restart" 
* edit make-chroot and set $VG to volume group name or export VG 
* Now create change roots for various targets using make-chroot: Parameters $1 is SUITE (i.e. lenny), $2 is ARCH (i.e. i386) 
* If things go wrong remove lvm group created :( 
* download Tim's other script collection from the main Deb packaging page <a class="http" href="http://www.sagemath.org:9001/days7/DebianPackagingSprint?action=AttachFile">(tarballs for now)</a>, untar into /usr/local/bin ... 
* export DEBATHENA_APT=(path to SAGE apt repository) 
* adduser sage sbuild (where sage is a user you want to be able to do builds) 

## Using the chroot environments

* Create GPG key: gpg --gen-key (follow instructions) 
* export key in ascii format: gpg --export -armor > sage-archive.asc 
* mount-defaults: uncomment /dev/pts, tmpfs mounts since there are currently problems with schroot 1.1.6-1. P potential solution: uncomment  /dev/pts, /dev/shm mount points 
* starting schroot env: example gutsy: 
         * schroot -c gutsy-i386-sbuild 

## To actually do builds

* get SAGE .spkg and unpack into DIR 
* copy debian directory into $DIR/src 
* build source package using debuild -S from inside package directory ($DIR/src) 
* build binary packages using "da sbuildhack [resulting .dsc file]" from $DIR 
* upload into SAGE repository using "daupload-release [resulting .changes file]" from $DIR 
* use clean-schroots whenever you run out of disk space due to stale build chroots (often get leaked when you do ^C during a build) 
* autotools-dev, m4 (should be added to the dependencies - if they aren't) 
* using sbuildhack  - setup: adduser $USER sbuild [make sure user is in right group] 
* `/etc/sbuild/sbuild.conf`: 
               * set mailto, maintainer, etc... 
               * uncomment '$sbuild_mode = "user";' 

### Example

* apt-get source valgrind [downloads sources, patches, dsc file] 
* sbuildhack lenny-i386 valgrind-3.3.0-1.dsc 
* Building a Debian package via `make` from `$SAGE_LOCAL`: 
      * set env variable `DEBIAN_RELEASE` to "lenny-i386" [building deb in schroot env] 
      * set env variable `USEDEB` to "yes": first try to sudo apt-get install `$SPKG.deb` 
      * sage-spkg: check if `DEBIAN_RELEASE` is set: if spkg-debian exists in `$SPKG_ROOT` execute it, otherwise do default sbuildhack - see <a href="http://trac.sagemath.org/sage_trac/ticket/2098">http://trac.sagemath.org/sage_trac/ticket/2098</a> for patch 

## Structure for dist-specific build systems in general

* Can expect upstream sources to be available at `$SPKG_ROOT/src` 
* Can store distribution-specific files in `$SPKG_ROOT/dist/$NAME` 

## Possibly useful links

* Debian alternatives system: see <a class="http" href="http://www.debian-administration.org/articles/91">http://www.debian-administration.org/articles/91</a>, <a class="http" href="http://manpages.debian.net/cgi-bin/man.cgi?query=update-alternatives&amp;apropos=0&amp;sektion=0&amp;manpath=Debian+Sid&amp;format=html&amp;locale=en">http://manpages.debian.net/cgi-bin/man.cgi?query=update-alternatives&apropos=0&sektion=0&manpath=Debian+Sid&format=html&locale=en</a> 