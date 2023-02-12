

# Using Sage with SquashFS


## Introduction

SquashFS is the mountable read-only filesystem, almost all linux live and install systems are using. It is builtin the linux kernel and all tools are available for all linux platforms. It is a little bit like a compressed iso cd image file. But it can hold a full unix filesystem and has some other speed up features.    

Pro:  

* more system independent because it is built in the kernel even on quite a lot of embedded or arm linux  
* parallel processing optimized  
* speed and memory optimized mount functionality on (almost?) all linux systems  
* smaller disk space usage  
* backup functionality  
Contra:  

* 3.3<->4.0 version problem on old linux systems, so you have to create the sqfs at the system you built it or you have to convert it later  
* the sqfs file is bigger than the lzma binary 
* you need the rights for mounting filesystems on the machine where you want to use it live 

## Where it is useful?

* If you need a special version for some classroom pcs with older processors 
* If you have to bring sagemath to quite a lot of pcs 
* If the system is to weak for compiling or has not enough disk space and there is no binary for your maybe older linux 
* If you want to test sagemath just for short or if you want to setup a quick'n dirty sagemath server 
* If you want to use sagemath on your netbook with insufficient disk space from an usb-stick or sd card (512Mb is enough) 
* If you are using old hardware you can check sagemath very fast by checking the md5sum of the sqfs file 

## Where can I download sagemath SquashFS-files

Prebuilt squashfs files for some ubuntu versions can be found here: 

* <a href="http://boxen.math.washington.edu/home/frank/sagemath/squashfs/">http://boxen.math.washington.edu/home/frank/sagemath/squashfs/</a> 

## How to make a SquashFS file

1. First download sagemath to your fastest Computer available. 
1. Install the packages needed (for debian/ubuntu: **sudo apt-get install gfortran m4 build-essential squashfs-tools**)   
1. Compile sagemath and run the tests. 
1. If needed copy/move it to the place where will be mounted later and start it there (some paths are hardcoded) 
1. Go to a terminal: **mksquashfs /path/to/sage-x.y.z /path/to/sage-x.y.z.sqfs** 
(If you have to compile a special version for old machines configurate the variables for make  so that it compiles for the processors on which you want to use sagemath. E.g. if you build sagemath on a system with SSE3 optimization then it will work properly only on systems where the processor has this functionality.) 


## How to mount the SquashFS file

About mounting files per /etc/fstab or directly per mount command there a lot of man pages in almost all languages available. Please just use the search engine of you choice. 

1. First create the folder where sagemath should be mounted in (it has to be same to the system where you built the sqfs file!!). The Path /usr/local/sage-x.y.z is the standard, where x.y.z stands for the version 
1. under debian/ubuntu type: **sudo mount -o loop -t squashfs /path/to/sage-x.y.z.sqfs /path/to/sage-x.y.z** 
1. now you can start sage with **/path/to/sage-x.y.z/sage** 
You can create a link so that you just can type **sage** to start sagemath: 

**sudo ln -s /path/to/sage-x.y.z/sage /usr/local/bin/sage** 


## Further Information about SquashFS

* <a href="http://www.linux-mag.com/cache/7357/1.html">http://www.linux-mag.com/cache/7357/1.html</a> 
* <a href="http://www.tldp.org/HOWTO/SquashFS-HOWTO/">http://www.tldp.org/HOWTO/SquashFS-HOWTO/</a> 