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
$ VBoxManage createvdi -filename “/var/vbox/ubuntu.vdi” -size 20000 -register
$ VBoxManage registerimage dvd ~/ext/debian-40r6-amd64-netinst.iso
$ VBoxManage modifyvm ubuntu -dvd ~/ext/debian-40r6-amd64-netinst.iso
}}}
Start the image:
{{{
$ VBoxHeadless -startvm ubuntu
VirtualBox Headless Interface 2.1.2
(C) 2008-2009 Sun Microsystems, Inc.
All rights reserved.

Listening on port 3389
}}}
Connect to the image (requires X):
{{{
rdesktop localhost
}}}
You can login remotely if you want, or forward the port.
