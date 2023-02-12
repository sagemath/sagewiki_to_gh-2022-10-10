

# Step by step tutorial on how to use PARI/GP development version in Sage

This tutorial explains how to use a PARI/GP development version inside Sage. This is currently a bit hackish and the aim is to have this possibility natively supported (see <a class="https" href="https://groups.google.com/forum/#!topic/sage-devel/nTwhCV89FXE">this thread on sage-devel</a>. 


## Prerequisites

1. We assume that your PARI/GP source code is at `$PARI_ROOT` 
1. You need version of Sage compiled from source that is run with the command `sage` 

## Procedure

1. Download the script <a href="PariDevInSage/pari_sage.sh">pari_sage.sh</a> 
1. Start Sage environment ```txt
$ cd $PARI_ROOT
$ sage -sh                # starts Sage environment
```
1. Optional step: apply Sage patches located in `$SAGE_ROOT/build/pkg/pari/patches`. 
1. Compile pari ```txt
$ cd $PARI_ROOT
$ make clean              # start with a clean slate
$ source pari_sage.sh     # reading pari_build.sh
$ pari_set_environment    # setting properly environment variables for compilation
$ pari_build              # building pari
$ pari_install            # installing pari
```
1. Recompile cysignals ```txt
$ sage -f cysignals       # recompile cysignals (to be linked correctly against pari)
```
1. Compile the last version of cypari (this currently breaks, but <a class="https" href="https://github.com/defeo/cypari2/pull/28">this pull request fixes it</a>) ```txt
$ sage -pip install git+https://github.com/defeo/cypari2
```
1. Recompile what needs to be ```txt
$ sage -br
```

## Procedure to restore the standard PARI package in Sage

1. ```txt
$ sage -f pari
$ sage -f cysignals
$ sage -f cypari
$ sage -br
```