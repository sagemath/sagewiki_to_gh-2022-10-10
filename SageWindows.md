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
