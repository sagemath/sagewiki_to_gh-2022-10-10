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


== Setting up Apache and securing the Sage notebook ==

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
mkdir nbfiles
chmod g+w nbfiles
}}}
Create `notebook.py`:
{{{
from sage.all import *

notebook(directory='/home/ondrej/nbfiles', port=8000, accounts=True, address='', ulimit='-u 100 -v 300000 -t 3600', open_viewer=False, timeout=120, secure=False, server_pool=['nbuser@localhost'])
}}}
And start it using:
{{{
sage -python notebook.py
}}}
