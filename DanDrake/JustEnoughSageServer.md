These are some notes on using [[http://www.ubuntu.com/products/whatisubuntu/serveredition/jeos|JeOS]] -- which stands for "Just Enough Operating System" -- and virtualization software to create a (hopefully) secure Sage server. I'm using [[http://www.virtualbox.org/|VirtualBox]] and an Ubuntu host.

This is intended for a server that you build and administer yourself; it's not the same as the VMWare image we distribute, which is intended "for the masses". I'm assuming you have experience with Linux administration and using virtualization software.

== Preliminaries ==

  * I'm using !VirtualBox OSE, version 2.0.2. I prefer the OSE version partially because I have a tiny free-software-zealot streak, but mostly because I'm lazy, and the open source edition gets packaged and maintained for Ubuntu. This means I can manage the !VirtualBox packages along with all my other Ubuntu packages without even adding a "deb" line to my `sources.list`.
  * JeOS used to be distributed as an .iso file, just like all the other flavors of Ubuntu, but now one uses [[https://help.ubuntu.com/community/JeOSVMBuilder|vmbuilder]]; this is nice, except that it only supports KVM or Xen (and maybe VMWare?). Another option starting with Intrepid is to use the usual Ubuntu Server install disc and select "Minimal Install" from the main menu. (Type F4 to select "minimal virtual machine".) I already know !VirtualBox, so I'm using that -- if you know how to get Sage running under KVM or Xen, let us know. For this project, it's enough to use the [[http://cdimage.ubuntu.com/jeos/releases/hardy/release/|Hardy CD image for JeOS]]; Hardy is a long-term release, so we get security updates for the server version until 2013.

== Setup ==

I installed JeOS under !VirtualBox. This was no trouble. I recommend separating the root partition and the `/home` partition, so that if some idiot fills up the disk (accidentally or otherwise), the VM will still run. The OS, including the packages we're going to install, along with Sage takes up about 2.1 gigabytes; I'd allocate about 4 gigs for the root partition and maybe another 4 for `/home`. I used "`sageadm`" for the user I created during installation; we'll create more users later. Once the VM was running, I installed some new packages. Some of these aren't totally essential; use your own judgement.

  * `openssh-server`: so we can administer the machine remotely. (The commercial version of !VirtualBox includes an RDP server, but that's more than what we need here.)
  * `wget`: for downloading new Sage releases.
  * `elinks` or another text-based browser: just in case.
  * `dtach`: like screen, but only does one window and no terminal emulation. This is all we need, and it's much smaller than screen: http://dtach.sourceforge.net/
  * `unattended-upgrades` so security updates get installed automatically.
  * `imagemagick` so the `animate()` command works. This pulls in about 150 megs of libraries, including some X libraries (for font support); this may seem like overkill, but we're going to install Sage, which is about 1.7 gigabytes. Disk usage is not a huge concern for us.
  * `gcc` and so you can do "`%cython`" in the notebook. (Do you need g++ and make too?)
  * I installed `mailx` (which pulls in exim) so that when cron jobs run, you can get mail about them. You could get by without this.
  * I installed a couple of the packages recommended by `cron`: `checksecurity`, `lockfile-progs`, `logrotate`.

Now, on the host, we'll set up port forwarding so the server is accessible from the outside world. I suppose we could do bridging and so on, but I don't really know how to set it up, and besides we only want two open ports going to the Sage server.

On the host, pick a port to forward to port 22 on the Sage server so we can ssh into the server. I'm using 2222. Do:
{{{
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/ssh/HostPort" 2222

VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/ssh/GuestPort" 22

VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/ssh/Protocol" TCP
}}}
Naturally you should replace `$VMNAME` with the name you gave your virtual machine, and if you want to use something else than 2222, replace that too. You can also change the "ssh" between "Config" and "Protocol" if you like; it's just a bit of text that identifies the service. Now choose a port where people will access the server, say 8000, and do a similar thing:
{{{
VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/sage/HostPort" 8000

VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/sage/GuestPort" 8000

VBoxManage setextradata "$VMNAME" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/sage/Protocol" TCP
}}}

Now inside the VM, we'll create some unprivileged users. First, though, I created a `sageusers` group and added my main user (`sageadm`) to it:
{{{
sudo addgroup sageusers
sudo adduser sageadm sageusers
}}}
Create an unprivileged user that defaults to the `sageusers` group:
{{{
sudo adduser --ingroup sageusers nb1
}}}
I also created `nb2`, `nb3`, `nb4`, and `nb5`. I don't know how many you really need. Next, generate a passwordless ssh key as the `sageadm` user and copy it to all the unprivileged users; it's convenient to use "`ssh-copy-id nb1@localhost`" for this.

== Running the server ==

Download Sage to the VM and install it; I unpacked the tarball into `/opt`. Create a directory for the notebook files -- this must be outside `sageadm`'s dot-sage directory; I used `~/nbfiles`. Change the permissions so it's group-writable by the `sageusers` group, and flip the setgid bit: do {{{chown sageadm:sageusers nbfiles}}}, then {{{chmod 2775 nbfiles}}}. ([[http://en.wikipedia.org/wiki/Setuid#setgid_on_directories|Some information on the setgid bit]].)

Now run the server with `directory='/home/sageadm/nbfiles'`, an appropriate `server_pool`, and so on. I've attached the actual script I use to start the notebook: [[attachment:start_notebook.sage]].

== Security notes ==

to come

== Other things I find convenient ==

to come

= Other Instructions =

I recently set up a Sage server, and here are very rough notes of the commands that I used.  I started with a fresh copy of Ubuntu 9.10 and Sage installed.

Install apache2 and enable the proxy modules
{{{
sudo apt-get install apache2

sudo a2enmod proxy
sudo a2enmod proxy_http
}}}

Create an apache virtual server for the Sage server.  I created a file {{{/etc/apache2/sites-available/sagenotebook}}} with the following contents, replacing YOUR_SERVER_NAME with your server name (e.g. sagenb.example.com).  Also replace YOUR_SERVER_ADMIN_EMAIL_ADDRESS with your admin email address.
{{{
<VirtualHost *:80>   ServerName YOUR_SERVER_NAME

ProxyRequests Off

<Proxy *>
Order deny,allow
Allow from all
</Proxy>

ProxyPass / http://localhost:8000/
ProxyPassReverse / http://localhost:8000/

 DocumentRoot /
 <Location />   DefaultType text/html
 </Location>

   ErrorLog /var/log/apache2/error.log

   # Possible values include: debug, info, notice, warn, error, crit,
   # alert, emerg.
   LogLevel warn

   CustomLog /var/log/apache2/access.log combined
   ServerAdmin YOUR_SERVER_ADMIN_EMAIL_ADDRESS
 </VirtualHost>
}}}


Enable the site in apache and restart apache
{{{
sudo a2dissite default
sudo a2ensite sagenotebook
sudo /etc/init.d/apache2 restart
}}}


Now add a server and 10 user accounts.  The Sage notebook will invoke one of these 10 accounts to do the worksheet processing.
{{{
sudo addgroup sageuser
sudo adduser --disabled-password sageserver
sudo adduser --disabled-password --ingroup sageuser sageuser0
sudo adduser --disabled-password --ingroup sageuser sageuser1
sudo adduser --disabled-password --ingroup sageuser sageuser2
sudo adduser --disabled-password --ingroup sageuser sageuser3
sudo adduser --disabled-password --ingroup sageuser sageuser4
sudo adduser --disabled-password --ingroup sageuser sageuser5
sudo adduser --disabled-password --ingroup sageuser sageuser6
sudo adduser --disabled-password --ingroup sageuser sageuser7
sudo adduser --disabled-password --ingroup sageuser sageuser8
sudo adduser --disabled-password --ingroup sageuser sageuser9
}}}

I wanted to restrict logins for the sage server and sage users.  I want to prevent logins as sageserver, and restrict sageuser* logins to only come from localhost.  I'll use sudo to run commands as the sage server.  Under {{{/etc/pam.d/sshd}}}, uncomment this line, and add "nodefgroup":

{{{
account  required     pam_access.so nodefgroup
}}}

Then in {{{/etc/security access.conf}}}, add these lines:

{{{
-:(sageuser):ALL EXCEPT localhost
-:sageserver:ALL
}}}


Now set up passwordless ssh keys
{{{
sudo -u sageserver -i "ssh-keygen -t dsa"
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser0 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser1 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser2 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser3 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser4 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser5 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser6 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser7 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser8 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sageuser9 -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
}}}

Test logins (do at least one to generate the known_hosts file)
{{{
sudo -u sageserver -i "ssh sageuser0@localhost echo Done"
}}}


I store the following command in a file {{{/home/sageserver/startnotebook}}} to start the notebook
{{{
#!/bin/sh
echo "notebook(interface='localhost', port=8000, accounts=True, timeout=1200, server_pool=['sageuser%d@localhost'%i for i in range(10)], ulimit='-v 300000 -u 100', open_viewer=False)" | ~/sage/sage
}}}

Now copy the current version of Sage into the sageserver home directory.  I set up things so that /home/sageserver/sage/ is a symbolic link to whatever the current version is (like /home/sageserver/sage-4.3.2/)

To start the sage server, do the following.  Note that since I am using sudo to run commands as sageserver, instead of logging in as sageserver, I have to do the {{{script /dev/null}}} trick to get screen to work.

{{{
sudo su -l sageserver
script /dev/null
screen
./startnotebook
}}}
