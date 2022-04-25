= SageMath Windows =

Since SageMath 8.0 a native Windows binary installer is available for 64-bit versions of Windows 7 and up.  The latest releases of the Windows installer can be found [[https://github.com/sagemath/sage-windows/releases|here]].

<<TableOfContents>>

== Installation ==

To install Sage on Windows, first download the latest binary release from the [[https://github.com/sagemath/sage-windows/releases|releases on GitHub]].

Running the installer does not typically require Administrator permissions. By default it performs a "single user" installation that is appropriate for your personal machine if which you are the only user. For a multi-user machine, in order to make Sage installed for all users, it is necessary to run the installer with administrator permissions (right-click on the installer executable and select "Run as administrator...") then select "Install for all users when given the choice to do so later in the installation process. 

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

=== Running a different Linux VM ===

In addition to the VirtualBox appliance, there is a [[https://sagedebianlive.metelu.net/ SageMath Live]] Linux image based on Debian Live, which is designed to be flashed onto a USB drive, which can be used to boot directly into a working Debian-based Linux distribution built to run Sage.  You can download the `.img` file and run it in a VM as with the appliance.  Alternatively, if you are having trouble running VMs, or other things just aren't working on your system (we have seen many personal laptops that are too corrupted to even run a VM successfully in Windows) and just want to give Sage a try, one possibility is to actually use the SageMath Live USB as intended: Flash the downloaded image onto a USB drive, plug it into your computer, and try booting your computer from it.  This may require entering your computer's BIOS settings at boot time (this usually requires pressing a special key which depends on the computer, often `esc`, `f8`, `f12`, or some other function key) and changing the boot settings to allow booting the computer from a USB drive.  This will work on most systems that don't have outright hardware damage, and can at least give you a partially working system that you can use Sage on for the duration of a workshop, for example.

==== AIMS Desktop ====

AIMS (the African Institute for Mathematical Sciences) also maintains a product similar to the SageMath Live distribution called [[https://desktop.aims.ac.za/|AIMS Desktop]].  It is similarly a Debian Live-based distribution pre-loaded with open source mathematics software such as Sage.  It uses the official Debian package for Sage, so the version included in the current version is a little old, but good enough for evaluation.  It can be run in a VM, or from a bootable USB drive.  It is also designed to be installable to your hard disk either as a primary OS, or side-by-side with your existing Windows installation, and is well battle-tested across Africa and elsewhere.  It also has all you need to install and run newer versions of Sage, either using the [[https://doc.sagemath.org/html/en/installation/binary.html#linux|pre-built binaries for Linx]], or building from source.

=== Docker ===

We maintain regularly updated [[https://hub.docker.com/r/sagemath/sagemath|Docker images for SageMath]] (if you see a label on there that says "maintained: no!" please ignore it; that label is auto-generated and likely out-of-date, and we are working to fix it).  [[https://docs.docker.com/docker-for-windows/install/|Docker for Windows]] works better and is easier to install than ever.  However, it still requires a recent version of Windows that has Hyper-V support (see the [[https://docs.docker.com/docker-for-windows/troubleshoot/#virtualization-must-be-enabled|troubleshooting notes]].  For novices, or users with older computers, this may be slightly challenging to set up.  Hyper-V is Windows' built-in virtual machine hypervisor, and enabling it means that you ''will not'' be able to use other VM software such as VirtualBox, until and unless Hyper-V is disabled (Hyper-V can also be used as a replacement for VirtualBox, however).

That said, once Docker for Windows is installed, starting and running the `sagemath` Docker image is relatively easy, by following the same instructions [[https://hub.docker.com/r/sagemath/sagemath|on Docker Hub]] as you would use for any other OS.  Though if you've never used Docker before it does have a learning curve, whether on Windows or any other OS.  But there is a decent [[https://docs.docker.com/docker-for-windows/|Get started with Docker for Windows]] tutorial that should give you a feel for basic tasks like running and stopping containers, mapping network ports (useful if you want to run a Jupyter Notebook server, for example), and also mounting files and folders on your local machine into Docker containers as "volumes".  Docker is an incredibly useful tool for reproducible scientific programming in general, and so is worth getting to know, both as a means of running Sage and otherwise.

=== Windows Subsystem for Linux ===

(In progress; check back later.)

Recent versions of Windows 10 include a feature that can be enabled in development mode called Windows Subsystem for Linux (WSL).  The first version of WSL provided a Linux-compatibility layer directly in the Windows kernel.  However, there were some features which never worked quite properly.  The newly released [[https://docs.microsoft.com/en-us/windows/wsl/wsl2-install|WSL 2]] takes a different approach, by running a full Linux kernel transparently in the background using Hyper-V virtualization, but makes it easy to access and work with from Windows.

It is known to be possible to build and run Sage in both WSL and WSL 2 (though the latter likely works even better).  Anyone who has experience working on Sage in WSL is invited to update this section with their experiences.

If you just want to ''use'' Sage on Windows using WSL, install Ubuntu 20.04 LTS using [[https://docs.microsoft.com/en-us/windows/wsl/wsl2-install|WSL 2]] and then run (from within Ubuntu 20.04) `sudo apt update; sudo apt install sagemath` to install the version of Sage hosted in the Ubuntu 20.04 repositories (version 9.0 as of this writing).

==== Viewing 2D/3D plots from WSL in the Windows browser ====

If you want to use your Windows browser to view 2D/3D plots produced from the Sage command-line in WSL, you will need to first create a small wrapper script to translate a WSL path into a Windows path and open it with the appropriate Windows app:

{{{#!highlight bash
#!/bin/bash
# wslview_wslpath.sh
wslview $(wslpath -w $1)
}}}

Make sure it is executable. Assuming you placed it in your home folder:

{{{#!highlight bash
chmod +x /home/<username>/wslview_wslpath.sh
}}}

Now, add the following to your [[https://doc.sagemath.org/html/en/reference/repl/startup.html#the-init-sage-script|init.sage]]:

{{{#!highlight python
# Open 2D/3D plots in Windows browser.
wslview_wslpath = '/home/<username>/wslview_wslpath.sh'
from sage.misc.viewer import viewer
viewer.browser(wslview_wslpath)    # for 3D plots
viewer.png_viewer(wslview_wslpath) # for 2D plots

# Uncomment these lines to also open DVIs and PDFs in Windows.
#viewer.dvi_viewer(wslview_wslpath)
#viewer.pdf_viewer(wslview_wslpath)

# The Windows browser will be unable to access the threejs library installed
# in WSL, so you will need to use the online version of threejs.
sage.plot.plot3d.base.SHOW_DEFAULTS['online'] = True	
}}}

==== Launching Jupyter/JupyterLab from WSL in the Windows browser ====

If you want to launch Jupyter/JupyterLab in your Windows browser, you will need to make a small config change. First, [[https://jupyter-notebook.readthedocs.io/en/stable/config.html|generate a config file]] if you haven't already done so using one of:

{{{#!highlight bash
sage --jupyter notebook --generate-config
sage --jupyter lab --generate-config
}}}

Then, open the config file and make sure the option `use_redirect_file` is set to `False`:

{{{#!highlight python
c.NotebookApp.use_redirect_file = False
}}}

=== CoCalc ===

[[https://cocalc.com/|CoCalc]] (formerly SageMathCloud) is a collaborative cloud-based computing environment, originally designed for using Sage in the cloud.  Through CoCalc you can run Sage either in its command-line interface, or in a Jupyter Notebook, all through your web browser on a cloud-hosted environment, meaning you don't have to install any software (other than a web browser), but that you also need an internet connection.

CoCalc was originally designed by William Stein, the creator of Sage, to run Sage in the cloud (back when it was called SageMathCloud), but it was quickly realized that all the infrastructure needed to run Sage on the cloud can also be used for a more generic scientific computing environment, which the re-branded CoCalc now provides.  You can see some of the software provided by a CoCalc environment [[https://cocalc.com/doc/software.html|here]].

You can create an unlimited account for free, though the free accounts are limited in the amount of disk space they provide, and the amount of RAM they provide.  They also do not allow direct internet access from within the CoCalc environment (but you are allowed to upload your data files through the CoCalc interface).  See https://cocalc.com/policies/pricing.html for more details.  Sometimes William will also provide discounts for specific academic purposes, or for people who are willing to contribute to CoCalc's [[https://github.com/sagemathinc/cocalc|development]], though we cannot speak for him here.

As long as you have reasonably reliable internet connection, CoCalc is a great way to just try out Sage, and other open-source mathematics software, without having to go to the trouble of installing anything on your local machine.  However, with a flaky or overloaded internet connection, it can sometimes be slow and frustrating.
