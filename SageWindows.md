= SageMath Windows =


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
