
If you plan to organize a sage days with people that do not have sage on their laptop, here are some tips that may help you get prepared. You should be prepared not to have any internet connection and rely on the material you will bring. Do not forget power cables and a wireless router. 

You should consider a **multiple combined strategies** approach. Here are some realistic ones. 

[[_TOC_]] 


## The self-replicating live USB

<a href="/ThierryMonteil">ThierryMonteil</a> built a <a class="http" href="http://sagedebianlive.metelu.net/">live Debian Sage USB</a>, you can: 

   * **clone :** the live USB key can replicate itslef to another USB key, indefinitely, which allows you to spread Sage in a fast way (if participants of the workshop participate to the replication, you can spread Sage in a logarithmic time ;). 
   * **share :** the data put to the /share directory will be transmitted to the replicated USB keys. Use this to spread your specific worksheets or papers along with Sage. 
   * **personal data :** participants can store all their personal data (e.g. Sage worksheet, LaTeX files,...), an those data will then be accessible as with any USB key (from the /user directory). No personal data (except explicitely shared data) is duplicated when the key is cloned to another key. 
   * **upgrade :** you can update the software from a more recently downloaded live USB key, while keeping personal data on the target USB key. Use this if you organize recurrent workshops. 
   * **batteries included :** the key contains other softwares (geogebra, latex, editors, gimp, vlc, libreoffice,...) and some optional Sage packages (e.g. GAP database). 
Hence, if you have 200 euros to spend, buy one USB key of 4GB for each participant plus 10% to saturate the market (some people will have to bring one back to their boss/friend/other). Build a few keys and let the participants clone the other keys (it takes about 16 minutes per key times the logarithm of the number of participants, which is much faster than building each one by yourself in linear time, moreover they will learn how to do it when going back in their university). You can also ask your participant to bring their own USB key (worked quite well at <a class="http" href="http://ejcim2013.univ-perp.fr/index.php?page=accueil">EJCIM 2013</a>). 


## Bring a Minimal Autonomous Sage Build that works on any GNU/Linux desktop without additional dependency

To sage binary maintainers: please reconsider having libgfortran distributed with the binaries. Some problems also appeared with openssl. We definitely need to maintain a build that is able to run on any GNU/Linux distro (no dependency at all except libc6) and old hardware (no sse2). I can help in such a task. 


### Server side

It is do-able. Here is an attempt of describing how i did: 

* build a minimal live Debian system (with only build-essential gfortran m4 binutils openssl libssl-dev) 
* run it on a real Pentium 3 (using qemu is much slower) 
* add some swap (using mkswap and swapon) since the build of the html reference manual costs a lot of RAM (about 1GB) and may not be built otherwise. 
* export variables SAGE_FAT_BINARY='yes' SAGE_ATLAS_ARCH='PIII' SAGE_BINARY_BUILD='yes' 
* modify atlas spkg according to the ticket #13706 (or wait until it is fixed). 
* run make (takes about 19 hours) 
* copy /usr/lib/libbgfortran.so.3* and /usr/lib/libcrypto.* and /usr/lib/libssl.so* in the ${SAGE_ROOT}/local/lib/ directory 
* run sage -bdist and md5sum 
I guess it shouldn't be hard to distribute imagemagick dvipng ffmpeg in the sage binaries. 


### Client side

This will be possibly harder. Concerning the browser java stuff, i do not know how to let the browser know how to pick a jre which is located in the sage binaries. Maybe we should build a firefox extension that installs the equivalent of default-jre and icedtea6-plugin in a protable way ? No idea for howto do this. 


## GNU/Linux + Sage install

Some participants will want to have GNU/Linux installed on their machine. Unlike Nicolas, i consider this as a long-term saving time point if we want not having to consider windows-related problems in the future. The participants will want GNU/Linux to be installed (as dual boot) on their laptop only at the end of the workshop (this happened both this year and last year), once they are convinced than GNU/Linux beats Windows everywhere :) If you plan to help in installing GNU/Linux, ask the participants to apply earlier, some installs take more time than planned. 

Bring huge empty haddisks (> 1TB). Participants won't have backup. Backup the whole filesystem (or even the whole device), not only the interesting files, windows has some strange capabilities. dd is your best friend. If you have to resize a windows ntfs partitions (for dual boot): 

* boot on windows 
* defragment the disk  
* run checkdisk 
* restart on a live GNU/Linux 
* resize the partitions (e.g. with gparted) 
* reboot on windows to let it know the sizes have changed 
* reboot on your GNU/Linux installer and start the install 
Bring the install binaries of some recent distro (the one you are used to), and all the necessary to make upgrades and to install missing dependencies (you must get prepared to wait for 3 hours for a 22MB download, or even to have no internet connection at all. Bring both a USB and a CD of the installer (some computer are not able to boot on USB). If you use a Debian-based distro, apt-cacher will be helping a lot for the upgrades and the installation of missing dependencies offline. Note that by default apt-cacher only caches the packages, not the headers (they change with time). Those look small but are big if the internet connection is weak. If you have no internet connection, modify the expire_hours variable in /etc/apt-cacher/apt-cacher.conf to something bigger thant the number of hours that are remaining until the end of the sage days, and run a full upgrade from a place with a good internet connection to fill the cache. 

Bring corresponding sage binaries, and an autonomous binary for people with other distro. Bring sage sources. 


## Serve a notebook on a LAN

Bring a powerfull computer and a wifi router to be able to serve a notebook for the remaining people for which previous solutions did not work (bios not able to boot on USB, not willing to install Linux on their machine). Unless you have a very strong server, it is usually not enough for all participants, but it can help the few remaining people for which the previous methods did not work. 
