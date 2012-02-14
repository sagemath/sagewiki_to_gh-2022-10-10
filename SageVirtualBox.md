See also: DanDrake/JustEnoughSageServer and SageAppliance

You need a recent virtualbox, or the (proprietary) server version of it (which is free as in beer). In any case, the steps below work for me on Ubuntu intrepid:


/etc/apt/sources.list:
{{{
deb http://download.virtualbox.org/virtualbox/debian intrepid non-free
}}}
Execute:
{{{
$ wajig install virtualbox-2.1
}}}
Answer yes to install the kernel module, it should just work. Create the virtual image:
{{{
$ VBoxManage createvm -name ubuntu -register
$ VBoxManage modifyvm ubuntu -memory "2048MB" -acpi on -boot1 dvd -nic1 nat
$ VBoxManage createvdi -filename ~/.VirtualBox/Machines/ubuntu/ubuntu.vdi -size 20000 -register
$ VBoxManage modifyvm ubuntu -hdb ~/.VirtualBox/Machines/ubuntu/ubuntu.vdi
$ VBoxManage registerimage dvd ~/ext/debian-40r6-i386-netinst.iso
$ VBoxManage modifyvm ubuntu -dvd ~/ext/debian-40r6-i386-netinst.iso
}}}
== Start the image ==
{{{
$ VBoxHeadless -startvm ubuntu
VirtualBox Headless Interface 2.1.2
(C) 2008-2009 Sun Microsystems, Inc.
All rights reserved.

Listening on port 3389
}}}
Connect to the image (requires X) on the same machine:
{{{
rdesktop localhost
}}}
Or you can login remotely by forwarding the 3389 port:
{{{
$ ssh -L 3389:localhost:3389 server
}}}
And from your desktop computer
{{{
$ rdesktop localhost
}}}

Install the system. After installing it, remove the cd (iso image) by
{{{
$ VBoxManage modifyvm ubuntu -dvd none
}}}

== Stop the image (do not save changes) ==
{{{
$ VBoxManage controlvm ubuntu poweroff
}}}

== Stop the image (save changes) ==
{{{
$ VBoxManage controlvm ubuntu savestate
}}}


== Networking ==

In order to be able to login using ssh, do:
{{{
$ VBoxManage setextradata ubuntu "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guestssh/Protocol" TCP
$ VBoxManage setextradata ubuntu "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guestssh/GuestPort" 22
$ VBoxManage setextradata ubuntu "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guestssh/HostPort" 2222
}}}
Then you can login on the server using:
{{{
$ ssh -p 2222 localhost
}}}
Or if you put this into your `.ssh/config`:
{{{
Host pythonnb
    HostName localhost
    User ondrej
    Compression no
    Port 2222
}}}
Then you can connect just by `ssh pythonnb`.

To forward the port 8000 for the Sage notebook, use:
{{{
$ VBoxManage setextradata ubuntu "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guest8000/Protocol" TCP
$ VBoxManage setextradata ubuntu "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guest8000/GuestPort" 8000
$ VBoxManage setextradata ubuntu "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guest8000/HostPort" 8000
}}}

== Sage ==

Download and install Sage as usual in the virtual machine. Start the notebook:
{{{
$ ./sage
----------------------------------------------------------------------
| Sage Version 3.2.3, Release Date: 2009-01-05                       |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: notebook(address="")
[...]
**************************************************
*                                                *
* Open your web browser to http://localhost:8000 *
*                                                *
**************************************************
}}}
And connect to http://localhost:8000 on your host machine.


== Securing the Sage notebook ==

Do all of the below as the user `ondrej`, that will run the notebook server. Create an `nbuser` user that will run the actual worksheets:
{{{
$ sudo adduser nbuser
$ sudo addgroup sageusers
$ sudo adduser ondrej sageusers
$ sudo adduser nbuser sageusers
}}}
Setup ssh keys, so that you can do `ssh nbuser@localhost` without a password.
Create a working directory:
{{{
$ mkdir nbfiles
$ chmod g+w nbfiles
}}}
You '''have''' to make Sage available just by calling `sage` and it needs to be in default paths, e.g. it's not enough to add the path to Sage to your .bashrc. Do it by:
{{{
$ cd /usr/local/bin
$ sudo ln -s /home/ondrej/ext/sage-3.2.3-Debian4.0-32bit-Intel-i686-Linux/sage .
}}}
Create `notebook.py`:
{{{
from sage.all import *

notebook(directory='/home/ondrej/nbfiles', port=8000, accounts=True, address='', ulimit='-u 100 -v 3000000 -t 3600', open_viewer=False, timeout=120, secure=False, server_pool=['nbuser@localhost'])
}}}
And start it using:
{{{
$ sage -python notebook.py
}}}

== Setting up lighttpd ==

{{{
$ wajig install lighttpd
}}}
Create `/etc/lighttpd/conf-available/20-notebook.conf`:
{{{
server.modules   += ( "mod_proxy" )

$SERVER["socket"] == ":8080" {
    proxy.server = ( "" =>
        ( (
        "host" => "127.0.0.1",
        "port" => 8000
        ) )
    )
}
}}}
Enable it:
{{{
$ sudo lighty-enable-mod notebook
$ sudo /etc/init.d/lighttpd force-reload
}}}
And login to your computer from the outside world to the port 8080 (you can of course just setup the port 80 instead of 8080).
