
(Right now -- Feb 2010 -- these notes have some outdated bits. I plan to update these later this year, after Ubuntu Lucid is out.) 

These are some notes on using <a class="http" href="http://www.ubuntu.com/products/whatisubuntu/serveredition/jeos">JeOS</a> -- which stands for "Just Enough Operating System" -- and virtualization software to create a (hopefully) secure Sage server. I'm using <a class="http" href="http://www.virtualbox.org/">VirtualBox</a> and an Ubuntu host. 

This is intended for a server that you build and administer yourself; it's not the same as the VMWare image we distribute, which is intended "for the masses". I'm assuming you have experience with Linux administration and using virtualization software. 


## Preliminaries

   * I'm using VirtualBox OSE, version 2.0.2. I prefer the OSE version partially because I have a tiny free-software-zealot streak, but mostly because I'm lazy, and the open source edition gets packaged and maintained for Ubuntu. This means I can manage the VirtualBox packages along with all my other Ubuntu packages without even adding a "deb" line to my `sources.list`. 
   * JeOS used to be distributed as an .iso file, just like all the other flavors of Ubuntu, but now one uses <a class="https" href="https://help.ubuntu.com/community/JeOSVMBuilder">vmbuilder</a>; this is nice, except that it only supports KVM or Xen (and maybe VMWare?). Another option starting with Intrepid is to use the usual Ubuntu Server install disc and select "Minimal Install" from the main menu. (Type F4 to select "minimal virtual machine".) I already know VirtualBox, so I'm using that -- if you know how to get Sage running under KVM or Xen, let us know. For this project, it's enough to use the <a class="http" href="http://cdimage.ubuntu.com/jeos/releases/hardy/release/">Hardy CD image for JeOS</a>; Hardy is a long-term release, so we get security updates for the server version until 2013. 

## Setup

I installed JeOS under VirtualBox. This was no trouble. I recommend separating the root partition and the `/home` partition, so that if some idiot fills up the disk (accidentally or otherwise), the VM will still run. The OS, including the packages we're going to install, along with Sage takes up about 2.1 gigabytes; I'd allocate about 4 gigs for the root partition and maybe another 4 for `/home`. I used "`sageadm`" for the user I created during installation; we'll create more users later. Once the VM was running, I installed some new packages. Some of these aren't totally essential; use your own judgement. 

   * `openssh-server`: so we can administer the machine remotely. (The commercial version of VirtualBox includes an RDP server, but that's more than what we need here.) 
   * `wget`: for downloading new Sage releases. 
   * `elinks` or another text-based browser: just in case. 
   * `dtach`: like screen, but only does one window and no terminal emulation. This is all we need, and it's much smaller than screen: <a href="http://dtach.sourceforge.net/">http://dtach.sourceforge.net/</a> 
   * `unattended-upgrades` so security updates get installed automatically. 
   * `imagemagick` so the `animate()` command works. This pulls in about 150 megs of libraries, including some X libraries (for font support); this may seem like overkill, but we're going to install Sage, which is about 1.7 gigabytes. Disk usage is not a huge concern for us. 
   * `gcc` and so you can do "`%cython`" in the notebook. (Do you need g++ and make too?) 
   * I installed `mailx` (which pulls in exim) so that when cron jobs run, you can get mail about them. You could get by without this. 
   * I installed a couple of the packages recommended by `cron`: `checksecurity`, `lockfile-progs`, `logrotate`. 
Now, on the host, we'll set up port forwarding so the server is accessible from the outside world. I suppose we could do bridging and so on, but I don't really know how to set it up, and besides we only want two open ports going to the Sage server. 

On the host, pick a port to forward to port 22 on the Sage server so we can ssh into the server. I'm using 2222. Do: 
```txt
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/ssh/HostPort" 2222

VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/ssh/GuestPort" 22

VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/ssh/Protocol" TCP
```
Naturally you should replace `$VMNAME` with the name you gave your virtual machine, and if you want to use something else than 2222, replace that too. You can also change the "ssh" between "Config" and "Protocol" if you like; it's just a bit of text that identifies the service. Now choose a port where people will access the server, say 8000, and do a similar thing: 
```txt
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/sage/HostPort" 8000

VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/sage/GuestPort" 8000

VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/sage/Protocol" TCP
```
Now inside the VM, we'll create some unprivileged users. First, though, I created a `sageusers` group and added my main user (`sageadm`) to it: 
```txt
sudo addgroup sageusers
sudo adduser sageadm sageusers
```
Create an unprivileged user that defaults to the `sageusers` group: 
```txt
sudo adduser --ingroup sageusers nb1
```
I also created `nb2`, `nb3`, `nb4`, and `nb5`. I don't know how many you really need. Next, generate a passwordless ssh key as the `sageadm` user and copy it to all the unprivileged users; it's convenient to use "`ssh-copy-id nb1@localhost`" for this. 


## Running the server

Download Sage to the VM and install it; I unpacked the tarball into `/opt`. Create a directory for the notebook files -- this must be outside `sageadm`'s dot-sage directory; I used `~/nbfiles`. Change the permissions so it's group-writable by the `sageusers` group, and flip the setgid bit: do `chown sageadm:sageusers nbfiles`, then `chmod 2775 nbfiles`. (<a class="http" href="http://en.wikipedia.org/wiki/Setuid#setgid_on_directories">Some information on the setgid bit</a>.) 

Now run the server with `directory='/home/sageadm/nbfiles'`, an appropriate `server_pool`, and so on. I've attached the actual script I use to start the notebook: <a href="DanDrake/JustEnoughSageServer/start_notebook.sage">start_notebook.sage</a>. 


## Security notes

to come 


## Other things I find convenient

to come 


# Other Instructions

You can find another set of instructions at <a href="/Sageserver">SageServer</a> 
