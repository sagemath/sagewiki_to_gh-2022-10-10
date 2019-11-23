This page aims at inventorying Live USB running sage. It is a working page to see what exists, not always up-to-date.

<<TableOfContents>>

== Sage Debian Live ==

=== Links ===

 * Homepage : https://sagedebianlive.metelu.net/
 * Download page (Sage mirrors) : https://www.sagemath.org/download-liveusb.html

=== Data ===

 * Main Author : ThierryMonteil
 * Base Distro : Debian jessie (using http://live.debian.net/)
 * Current sage version : 6.7
 * Current kernel : Linux 3.16.0 , 32 bits (compilation for other platforms is possible)
 * Size : 3.1 GB
 * RAM required : 512 MB RAM

=== Features ===

 * Design
   * Self-contained : designed to be used and distributed without internet connection.
   * The whole system is bootstrapped at each build, with an up-to-date and coherent set of softwares.
   * The source code is public and can be (hopefuly) easily modified to feet particular needs (e.g. adding software, setting defaults).
 * Clone : the USB key can replicate itself on any other plugged USB key, to ease spreading the software without internet connection. No personal data is duplicated to the cloned key. Possibility for the user to share additional data from her key to the cloned one (pdf lecture notes, worksheets, pictures of the workshop,...). Possible to upgrade an existing live USB key, while keeping personal data.
 * Straightforward home persistence : the changes made on the user homedir are kept for next reboots, but no additional partitionning or customization is needed, the data can be accessed from any other OS.
 * Self repair : the live USB drive can try to self-repair its own filesystem, which can be useful if the user removed it while running.
 *  Language switcher : the user can change the system language easily (this feature apparently does not exist in xfce nor lxde). All existing UTF-8 locales are generated.
 *  Contains quite a lot of softwares : sagemath (boosted with octave, scilab, some optional packages: database_gap, gap_packages, nauty, dot2tex, cbc, cryptominisat, d3js, [[the scipy stack|http://scipy.org/stackspec.html]]), geogebra, latex, editors, gimp, vlc, libreoffice, backup, rescue,...



== Sage Puppy Live (a.k.a. Sage Live CD) ==

=== Links ===

 * Homepage: http://boxen.math.washington.edu/home/emil/doc/html/en/. 
 * Download page : http://boxen.math.washington.edu/home/emil/sagelive/
 * Sources to build your own : ?

=== Data ===

 * Main Author : Emil Widmann
 * Base Distro : Puppy Linux 5.11 Quickset edition
 * Current sage version : 5.3
 * Current kernel : 2.6.33 , 32 bits
 * Size : 595 MB
 * RAM required : 512 MB RAM

=== Features ===

 * basic localization/languages and 44 different keyboard maps, no automatic updates.
 * Installer to USB, harddisk, etc included. 
 * Additional software packages available (e.g. libreoffice module, development module), 
 * Can access Ubuntu Lucid Lynx repos, ssh server and preconfigured sage server with 20 worker accounts included for local networks. 
 * Installation to harddisk with "personal save-file" for persistence needs min 850 MB disc space. 
 * Sage html doc included. 
 * If installed to harddisk with personal-savefile for persistence it will need 1,2 GB in "frugal install" mode.







== Sage Ubuntu Live ==

=== Links ===

 * Homepage: ?
 * Download page : ?
 * Sources to build your own : ?

=== Data ===

 * Main Author : Jan Groenewald
 * Base Distro : Ubuntu 12.04.1
 * Current sage version : ?
 * Current kernel : 64 bits
 * Size : 1.5 GB
 * RAM required : 512 MB RAM

There are two live USB:

 * Sage LiveCD, based on Ubuntu 12.04.1, with Sage 5.5 Source Code, and all build and runtime dependencies
   * size: 1.5 GB iso file, 
   * EN+FR on image, other languages available from repos, automatic updates from aims/sagemath PPA.
 * Sage LiveCD, based on Ubuntu 12.04.1, with Sage 5.5 compiled, and with all runtime dependencies
   * size: 1.6 GB sio file, 
   * EN+FR on image, other languages available from repos, automatic updates from aims/sagemath PPA.

=== Requirements for both ===

 * 700 MHz processor (about Intel Celeron or better)
 * 512 MiB RAM (system memory, preferable much more, especially for the dev version to build sage from scratch)
 * 5 GB of hard-drive space (or USB stick, memory card or external drive but see LiveCD for an alternative approach)
 * VGA capable of 1024x768 screen resolution
