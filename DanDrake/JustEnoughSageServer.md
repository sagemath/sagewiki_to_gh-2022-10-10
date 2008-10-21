These are some notes on using [http://www.ubuntu.com/products/whatisubuntu/serveredition/jeos JeOS] -- which stands for "Just Enough Operating System" -- and virtualization software to create a (hopefully) secure Sage server. I'm using [http://www.virtualbox.org/ VirtualBox] and a Ubuntu host.

This is intended for a server that you build and administer yourself; it's not the same as the VMWare image we distribute, which is intended "for the masses". I'm assuming you have experience with Linux administration and using virtualization software.

== Preliminaries ==

* I'm using !VirtualBox OSE, version 2.0.2. I prefer the OSE version partially because I have a tiny free-software-zealot streak, but mostly because I'm lazy, and the open source edition gets packaged and maintained for Ubuntu. This means I can manage the !VirtualBox packages along with all my other Ubuntu packages without even adding a "deb" line to my `sources.list`.

* JeOS used to be distributed as an .iso file, just like all the other flavors of Ubuntu, but now one uses [https://help.ubuntu.com/community/JeOSVMBuilder vmbuilder]; this is nice, except that it only supports KVM or Xen. I already know VirtualBox, so I'm using that -- if you know how to get Sage running under KVM or Xen, let us know. For this project, it's enough to use the [http://cdimage.ubuntu.com/jeos/releases/hardy/release/ Hardy CD image for JeOS]; Hardy is a long-term release, so we get security updates for the server version until 2013.

== Setup ==

I installed JeOS under !VirtualBox. This was no trouble. I recommend separating the root partition and the `/home` partition, so that if some idiot fills up the disk (accidentally or otherwise), the VM will still run. The OS, including the packages we're going to install, along with Sage takes up about 2.1 gigabytes; I'd allocate about 4 gigs for the root partition and maybe another 4 for `/home`. I used "`sageadm`" for the user I created during installation; we'll create more users later. Once the VM was running, I installed some new packages. Some of these aren't totally essential; use your own judgement.

  * `openssh-server`: so we can administer the machine remotely. (The commercial version of !VirtualBox includes an RDP server, but that's more than what we need here.)
  * `wget`: for downloading new Sage releases
  * `elinks` or another text-based browser: just in case
  * `dtach`: like screen, but only does one window and no terminal emulation. This is all we need, and it's much smaller than screen
  * `unattended-upgrades` so security updates get installed...unattended.
  * `imagemagick` so the `animate()` command works. This pulls in about 150 megs of libraries, including some X libraries (for font support); this may seem like overkill, but we're going to install Sage, which is about 1.7 gigabytes. Disk usage is not a huge concern for us.
  * `gcc` and so you can do "`%cython`" in the notebook. (Do you need g++ too?)


more to come
