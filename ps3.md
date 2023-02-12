

# Building Sage on Sony's PS3

These notes are about building Sage 3.2.3 on the PS3 using Yellow Dog Linux 6.1. Other distributions, i.e. Fedora Core for PPC, might need different fixes since the default ABI used by YDL is 32 bit while Fedora defaults to 64 bit. 


### Setup

* RAM is really tight, so disable all services you don't need 
* the VRAM can be used as high priority swap - see <a href="http://us.fixstars.com/support/solutions/ydl_6.x/ps3vram-as-swap">http://us.fixstars.com/support/solutions/ydl_6.x/ps3vram-as-swap</a> 

### Compiler

The YDL 6.1 gcc defaults to 32 bit mode. Considering the tight resources on the PS3 this seems like a good choice. A SAGE64 mode could also be implemented. Note that FC 10/PPC actually defaults to 64 bit. 


## 32 bit build


### NTL

Remove the code that prevents tuning on ppc64 


### GMP

Force ABI=32 for now 


### ATLAS

Atlas has no detection for the PS3 PPC CPU. Sage's spkg-install should also automatically enable ALTIVEC - see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/3791">#3791</a> 


### LinBox

Disable tuning since it ends up deeply in swap. Disabling tuning on any box with less than 256 MB memory might be a good idea. 


### m4ri

The build fails during the configure phase. It seems related to the detection of the L1 and L2 cache size. 


## 64 bit build

To come in the future. 
