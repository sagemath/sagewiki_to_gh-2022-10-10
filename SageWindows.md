= SageMath Windows =

As of SageMath 8.0 a native Windows binary installer is available for 64-bit versions of Windows 7 and up.  The latest releases of the Windows installer can be found [[https://github.com/sagemath/sage-windows/releases|here]].  Most users will find this to be better-integrated with their native system than the old [[SageAppliance|VirtualBox appliance]]; however, the appliance is still available for those who prefer it.

<<TableOfContents>>

== Installation ==

To install Sage on Windows, first download the latest binary release from the [[https://github.com/sagemath/sage-windows/releases|releases on GitHub]] (these may later be placed on the official [[http://www.sagemath.org/mirrors.html|SageMath mirrors]] as well).

Running the installer currently requires elevated permissions--you must be able to run the installer as Administrator (a pop-up will appear asking if you wish to elevate permissions for the installer, if you are able).  This will be possible on most users' personal machines.  (In the future a future version of the installer a "single-user" install that does not require Administrator privileges will also be available.)

The installer itself is a typical install wizard which can be completed in a few clicks:

{{attachment:installer1.png}}

The file installation portion can take several minutes, as there are many thousands of files to unpack and the installer is highly compressed--feel free to walk away and get coffee or something:

{{attachment:installer2.png}}

Upon completion you are given the option to install desktop icons, start menu icons, or both.  At least one is highly recommended; however, the shortcuts that are installed can also be found in the install location (e.g. `C:\Program Files\SageMath <Version>`).

== Usage ==

A normal installation includes three desktop and/or start menu shortcuts for starting Sage:

{{attachment:icons.png}}

=== SageMath ===

The first, most basic, is labeled simply `SageMath <Version>`.  This launches a terminal emulator that goes straight to the standard '''`sage:`''' command-line prompt:

{{attachment:console.png}}

This works just like the '''`sage:`''' prompt on most any other system.

{{{#!wiki note
'''Note'''

Start-up time for the prompt can sometimes take up to a few seconds, especially when starting Sage for the first time.  Typically the Sage version banner comes up quickly, but then there is a delay before the '''`sage:`''' prompt appears.  Just be patient.  Meanwhile, efforts are in progress to reduce start-up time.
}}}

Commands that output graphics, such as `plot()`, will typically open images in your system's default image viewer:

{{attachment:console2.png}}

If a default viewer for the file has not been assigned yet in the Windows shell, the standard Windows program selection menu will come up.

{{{#!wiki warning
''Warning''

There is a [[https://github.com/sagemath/sage-windows/issues/2|known issue]] that the console crashes if you click the normal exit icon on the window.  Instead, to exit the console, type `exit` and press `Enter`.  This will be fixed in a future version.
}}}

=== SageMath Notebook ===

The icon titled `SageMath <Version> Notebook` starts a Jupyter Notebook server with the ability to run notebooks in the Sage kernel (i.e. Sage in Jupyter).  Running this shortcut launches a Jupyter server in a terminal window:

{{attachment:notebook.png}}

Once the server is running, the Notebook should open in your default browser.  If it does not, you can copy and paste the URL from the output in the terminal Window.  The URL begins with `http://localhost:8888?token=`.  The token portion is important as well on newer versions of Jupyter, as a security measure.

{{{#!wiki important
''Important''

This window ''must'' be kept open in order to keep the Jupyter Notebook server running--it may be minimized, but closing it will shut down the server.

In a future version we hope to be able to run the Notebook server in the background.
}}}

=== SageMath Shell ===

This shortcut launches straight into a `bash` shell in the Sage environment (e.g. `sage` and all other software included in the Sage distribution can be run from the command-line) which includes many other common shell utilities.  This is generally for more advanced users already accustomed to using Sage in a UNIX-like environment, or those who would like to learn.

This environment is based on [[https://www.cygwin.com/|Cygwin]], so all documentation in the [[https://cygwin.com/cygwin-ug-net/cygwin-ug-net.html|Cygwin User's Guide]] is applicable.  However, for most common tasks, it is not necessary to know much or anything about Cygwin.

== Caveats ==

=== Optional and pip packages ===

The major known caveat to the current version of the SageMath Windows install is that it is not currently possible to install Sage optional packages.  Any attempt to do so will simply fail:

{{{
$ sage -i libhomfly
make: *** No rule to make target 'all-toolchain'.  Stop.
}}}

This is in part because the build toolchain for Sage packages is not included by the installer, and in part because not all optional packages are supported yet.

Additionally, any attempt to install new Python packages with `pip` will fail with a permission error.  E.g.,

{{{
$ pip install surface_dynamics
Collecting surface_dynamics
  Downloading surface_dynamics-0.3.2.tar.gz (11.0MB)
    100% |████████████████████████████████| 11.0MB 113kB/s
Installing collected packages: surface-dynamics
  Running setup.py install for surface-dynamics ... error
    Complete output from command /opt/sagemath-8.0/local/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-c8xB0d/surface-dynamics/setup.py';exec(compile(getattr(tokenize, 'open', open)(__file__).read().replace('\r\n', '\n'), __file__, 'exec'))" install --record /tmp/pip-q8Gm6v-record/install-record.txt --single-version-externally-managed --compile:
...
    running install_lib
    creating /opt/sagemath-8.0/local/lib/python2.7/site-packages/surface_dynamics
    error: could not create '/opt/sagemath-8.0/local/lib/python2.7/site-packages/surface_dynamics': Permission denied

    ----------------------------------------
Command "/opt/sagemath-8.0/local/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-c8xB0d/surface-dynamics/setup.py';exec(compile(getattr(tokenize, 'open', open)(__file__).read().replace('\r\n', '\n'), __file__, 'exec'))" install --record /tmp/pip-q8Gm6v-record/install-record.txt --single-version-externally-managed --compile" failed with error code 1 in /tmp/pip-build-c8xB0d/surface-dynamics/
}}}

This fails because SageMath is installed as Administrator, so any attempt to change files in the installation or add new ones will fail.  It is possible to work around this by right-clicking the SageMath Shell icon and, if available to you, run it with "Run as administrator":

{{attachment:run-as-admin.png}}

This will allow most `pip install` packages to be installed (however it will do nothing for Sage optional packages since the build toolchain for them is missing).  This usage generally works but is not ''supported'', so use at your own risk.

In the meantime different optional are being explored for better supporting installation of optional packages.

=== Hidden files ===

One caveat of both the shell, and other software (such as the Jupyter Notebook file browser) that lists files is that UNIX-based software does not distinguish Windows' notion of "hidden files" from non-hidden files.  In other words, files that are "hidden" in the Windows explorer/DOS are visible by default, which can be surprising.  In particular, the home directory listing (where the default "home" directory is your Windows user directory; e.g. `C:\Users\<Your Name>`) can contain some clutter you wouldn't normally see in Windows:

{{{
$ ls
 AppData
'Application Data'
 Contacts
 Cookies
 Desktop
 Documents
 dot_sage
 Downloads
 Favorites
 Links
'Local Settings'
 Music
'My Documents'
 NetHood
 NTUSER.DAT
 ntuser.dat.LOG1
 ntuser.dat.LOG2
 NTUSER.DAT{8aa7ab87-923b-11e7-86d1-c4af8d0d0d61}.TM.blf
 NTUSER.DAT{8aa7ab87-923b-11e7-86d1-c4af8d0d0d61}.TMContainer00000000000000000001.regtrans-ms
 NTUSER.DAT{8aa7ab87-923b-11e7-86d1-c4af8d0d0d61}.TMContainer00000000000000000002.regtrans-ms
 ntuser.ini
 OneDrive
 ...
}}}

Examples of this include the `AppData` folder, and the `NTUSER.DAT` files.

We would like to include an alternative `ls` that keeps such files hidden by default, but for now it's best just to ignore this and work around it.


== Other options for running SageMath on Windows ==

The Sage for Windows installer is probably the easiest, most user-friendly way to get Sage running as a native(-ish) Windows application (the "-ish" part is because it relies on the Cygwin POSIX emulation system to work, which adds additional overhead and slight instability compared to a non-Cygwin application, but for most users on modern systems it will work just fine).

As noted, however, there are other ways to run Sage on Windows which may be appropriate either if you have trouble getting the installer working, or if you have other needs (e.g. performance-tuned builds, or development) that are not well met by the installer.  Here are a few ideas:

=== Build Sage from source in Cygwin ===

The Sage for Windows installer comes with its own custom distribution of Cygwin, hand-picked to meet Sage's runtime requirements.  However, you may also manually install a generic Cygwin installation, and use it to build and run Sage from source.  There are comprehensive instructions for [[https://trac.sagemath.org/wiki/Cygwin64Port|building Sage on Cygwin]] over at Sage's development Trac site.

=== Running the VirtualBox appliance ===

As previously noted, an older way Sage was made available "for Windows" is as a VirtualBox appliance: [[SageAppliance|VirtualBox appliance]].  This makes it relatively easy to install and run a Linux VM that has been custom-built for running and working with Sage.  However, depending on your system, getting things like filesystem and network sharing can be a challenge (issues general to configuring a VM to run on your system, and not particular to Sage or the Sage VirtualBox Appliance).

=== Running a different Linux VM ===

In addition to the VirtualBox appliance, there is a [[https://sagedebianlive.metelu.net/ SageMath Live]] Linux image based on Debian Live, which is designed to be flashed onto a USB drive, which can be used to boot directly into a working Debian-based Linux distribution built to run Sage.  You can download the `.img` file and run it in a VM as with the appliance.  Alternatively, if you are having trouble running VMs, or other things just aren't working on your system (we have seen many personal laptops that are too corrupted to even run a VM successfully in Windows) and just want to give Sage a try, one possibility is to actually use the SageMath Live USB as intended: Flash the downloaded image onto a USB drive, plug it into your computer, and try booting your computer from it.  This may require entering your computer's BIOS settings at boot time (this usually requires pressing a special key which depends on the computer, often `esc`, `f8`, `f12`, or some other function key) and changing the boot settings to allow booting the computer from a USB drive.  This will work on most systems that don't have outright hardware damage, and can at least give you a partially working system that you can use Sage on for the duration of a workshop, for example.

==== AIMS Desktop ====

AIMS (the African Institute for Mathematical Sciences) also maintains a product similar to the SageMath Live distribution called [[https://desktop.aims.ac.za/|AIMS Desktop]].  It is similarly a Debian Live-based distribution pre-loaded with open source mathematics software such as Sage.  It uses the official Debian package for Sage, so the version included in the current version is a little old, but good enough for evaluation.  It can be run in a VM, or from a bootable USB drive.  It is also designed to be installable to your hard disk either as a primary OS, or side-by-side with your existing Windows installation, and is well battle-tested across Africa and elsewhere.  It also has all you need to install and run newer versions of Sage, either using the [[https://doc.sagemath.org/html/en/installation/binary.html#linux|pre-built binaries for Linx]], or building from source.

=== Docker ===

We maintain regularly updated [[https://hub.docker.com/r/sagemath/sagemath|Docker images for SageMath]] (if you see a label on there that says "maintained: no!" please ignore it; that label is auto-generated and likely out-of-date, and we are working to fix it).  [[https://docs.docker.com/docker-for-windows/install/|Docker for Windows]] works better and is easier to install than ever.  However, it still requires a recent version of Windows that has Hyper-V support (see the [[https://docs.docker.com/docker-for-windows/troubleshoot/#virtualization-must-be-enabled|troubleshooting notes]].  For novices, or users with older computers, this may be slightly challenging to set up.  Hyper-V is Windows' built-in virtual machine hypervisor, and enabling it means that you ''will not'' be able to use other VM software such as VirtualBox, until and unless Hyper-V is disabled (Hyper-V can also be used as a replacement for VirtualBox, however).

That said, once Docker for Windows is installed, starting and running the `sagemath` Docker image is relatively easy, by following the same instructions [[https://hub.docker.com/r/sagemath/sagemath|on Docker Hub]] as you would use for any other OS.  Though if you've never used Docker before it does have a learning curve, whether on Windows or any other OS.  But there is a decent [[https://docs.docker.com/docker-for-windows/|Get started with Docker for Windows]] tutorial that should give you a feel for basic tasks like running and stopping containers, mapping network ports (useful if you want to run a Jupyter Notebook server, for example), and also mounting files and folders on your local machine into Docker containers as "volumes".  Docker is an incredibly useful tool for reproducible scientific programming in general, and so is worth getting to know, both as a means of running Sage and otherwise.

=== Windows Subsystem for Linux ===

(In progress; check back later.)


=== CoCalc ===

(In progress; check back later.)
