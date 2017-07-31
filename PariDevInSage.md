= Step by step tutorial on how to use PARI/GP development version in Sage =

This tutorial explains how to use a PARI/GP development version inside Sage.

== Prerequisites ==

 1. We assume that your PARI/GP source code is at `$PARI_ROOT`

 2. You need version of Sage compiled from source that is run with the command `sage`

== Procedure ==

 1. Download the script [[attachment:pari_sage.sh]]

 2. Start Sage environment {{{
$ cd $PARI_ROOT
$ sage -sh                # starts Sage environment
}}}

 3. Optional step: apply Sage patches located in `$SAGE_ROOT/build/pkg/pari/patches`.

 3. Compile pari {{{
$ cd $PARI_ROOT
$ make clean              # start with a clean slate
$ source pari_sage.sh     # reading pari_build.sh
$ pari_set_environment    # setting properly environment variables for compilation
$ pari_build              # building pari
$ pari_install            # installing pari
}}}

 3. Recompile cysignals {{{
$ sage -f cysignals       # recompile cysignals (to be linked correctly against pari)
}}}

 4. Compile the last version of cypari {{{
$ sage -pip install git+https://github.com/defeo/cypari2
}}}

 5. Recompile what needs to be {{{
$ sage -br
}}}

== Procedure to restore the standard PARI package in Sage ==

 1. {{{
$ sage -f pari
$ sage -f cysignals
$ sage -f cypari
$ sage -br
}}}
