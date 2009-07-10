= Sage Download Guide =

This guide explains how to download Sage and which version you should download from one of the [[http://www.sagemath.org/mirrors.html|download mirrors]]. You need to know your operating system, the download mirror closest to your geographic location, and maybe some specific system information.

For more information on how to actually install Sage, please refer to the [[http://www.sagemath.org/doc/installation/|Installation Guide]].

== Operating System ==

The first thing you have to know is your [[http://en.wikipedia.org/wiki/Operating_System|operating system]]. When your computer boots, it probably displays a startup screen that indicates the name of your operating system. The second most important thing, if applicable, is your type of [[http://en.wikipedia.org/wiki/CPU|CPU]]: is it a 32-bit CPU, a 64-bit CPU, or something else like "atom" for some netbooks?

 1. [[http://en.wikipedia.org/wiki/Microsoft_windows|Microsoft Windows]] -- If you are using Windows (whether XP or Vista), you need to get a [[http://en.wikipedia.org/wiki/VMware|VMware image]] for the [[http://www.vmware.com/products/player/|VMWare virtual machine player]]. The VMware player runs Sage inside a virtual computer, which is actually Linux, and you can interact with Sage through your web browser. From the VMware player window, you can also interact with Sage through the Sage command line interface. The VMware image can also be run on other platforms, provided that there are VMware players for those platforms.

 1. [[http://en.wikipedia.org/wiki/Linux|Linux]] -- There are several Linux distributions and each binary we provide has been especially built for that distribution. Before each release, Sage is tested on the following Linux distributions: [[http://www.centos.org|CentOS]], [[http://www.debian.org|Debian]], [[http://www.fedoraproject.org|Fedora]], [[http://www.opensuse.org|openSUSE]], and [[http://www.ubuntu.com|Ubuntu]]. Binaries are available for 32-bit and 64-bit versions of Linux, so it might be helpful to know if your CPU is a 32-bit CPU or a 64-bit CPU. For Linux systems, you can use one of the provided binaries. You can also download a source distribution of Sage and compile Sage using that distribution.

 1. [[http://en.wikipedia.org/wiki/Mac_os_x|Mac OS X]] -- Sage is often tested on OS X 10.5.x. It is possible to run Sage on OS X 10.4.x without problems. For Mac OS X, you need to know your processor type (whether it is Intel or PowerPC) and if your CPU is 32-bit or 64-bit. If you want to compile a source distribution of Sage, you should first make sure that your system has the relevant software development tools, including Xcode.

== Selection ==

If you know how to select your binary, then proceed with downloading it from your nearest [[http://www.sagemath.org/mirrors.html|download mirror]]. After the binary has been successfully downloaded, extract that binary and you can then run Sage. It is possible to develop Sage with that binary.

If you are unsure about your system or you wish to compile Sage by yourself, download the source distribution. It is an archive that contains a base system with compressed Sage packages, also known as SPKGs.
