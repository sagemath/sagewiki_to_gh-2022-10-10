= Step by step tutorial on how to use PARI/GP development version in Sage =

This tutorial explains how to use a PARI/GP development version inside Sage.

Prerequisites

1. We assume that your PARI/GP source code is at $PARI_ROOT

2. You need to use a version of Sage compiled from source located at $SAGE_ROOT

Procedure

1. Download the script [[attachment:pari_sage.sh]]

2. Do
{{{
$ cd $PARI_ROOT
$ sage -sh                # starts Sage environment
$ source pari_build.sh    # reading pari_build.sh
$ pari_apply_patches      # optional patch applications
$ pari_set_environment    # setting properly environment variables for compilation
$ pari_build              # building pari
$ pari_install            # installing pari
$ sage -f cysignals       # recompile cysignals (to be linked correctly against pari)
$ sage -f cypari          # recompile cypari2
$ sage -br                # recompiles what need to be
}}}

Procedure to undo the experimental PARI

1.
{{{
$ sage -f pari
$ sage -f cysignals
$ sage -f cypari
$ sage -br
}}}
