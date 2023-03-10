#!/usr/bin/env bash
###########################################
## PARI
###########################################

if [ -z "$SAGE_LOCAL" ]; then
    echo "SAGE_LOCAL undefined ... exiting"
    echo "Maybe run 'sage -sh'?"
    exit 1
fi

# Prepare all variables for building PARI/GP, except for CFLAGS
pari_set_environment()
{
    # Save current working directory (the src directory)
    CUR=`pwd`

    # This is needed or there are weird locale problems involving rpath
    # with building Sage:
    LANG=C
    export LANG

    # Add the proper flags for 64-bit build mode on OS X and OpenSolaris x64.
    # Setting CFLAGS is not sufficient on Solaris since PARI 2.4.3, as this
    # flag is not being used when the checks for GMP and Readline are made,
    # so the checks for them fail.  One must redefine CC and export that.

    # Let the user choose a flag other than "-m64" for 64-bit builds
    # if needed:
    if [ -z "$CFLAG64" ]; then
        CFLAG64=-m64
    fi

    if [ "x$SAGE64" = xyes ]; then
        echo "Building a 64-bit version of PARI/GP"
        CFLAGS="$CFLAGS $CFLAG64"
        CC="$CC $CFLAG64" && export CC
    fi

    # Pari ignores LDFLAGS when linking libpari-gmp.so, so we trick it:
    DLLDFLAGS="$LDFLAGS"
    export DLLDFLAGS

    # PARI does not build correctly with LD set (which is set by
    # sage-env).  PARI actually needs LD set to a compiler to do the
    # linking, not to the linker directly.
    unset LD

    # Let the user pass extra parameters to PARI's "Configure", e.g.
    # to specify desired graphics support (which is disabled by default):
    if [ -z "$PARI_CONFIGURE" ]; then
        echo "============================================================"
        echo "Configuring PARI/GP without graphics support (for plotting)."
        echo "If you need it, pass the appropriate option(s) to PARI by"
        echo "setting and exporting \$PARI_CONFIGURE prior to building"
        echo "Sage (or at least before you build/install the PARI spkg),"
        echo "e.g. by typing at the shell prompt:"
        echo "    export PARI_CONFIGURE=\"--graphic=auto\""
        echo "or"
        echo "    export PARI_CONFIGURE=\"--with-fltk\""
        echo "Note that PARI doesn't treat it as an error if the requested"
        echo "graphics library or the corresponding header files are not"
        echo "found; it will then simply disable graphics support."
        echo "Please consult the PARI documentation for further details."
        echo "============================================================"

        PARI_CONFIGURE="--graphic=none"
    else
        echo "============================================================"
        echo "Configuring PARI/GP with additional user-specified options:"
        echo "    PARI_CONFIGURE=\"$PARI_CONFIGURE\""

        # Do NOT add "--graphic=none" if the user provided one of these:
        #     "--with-fltk[=...]", "--with-qt[=...]"
        # Comment by leif: This misbehavoir seems to have been fixed in
        #                  PARI 2.4.3; the following doesn't hurt though:
        if ! (echo "$PARI_CONFIGURE" | egrep -- "--with-fltk|--with-qt") \
              >/dev/null;
        then
            echo "To avoid unexpected behavior, we prepend \"--graphic=none\":"
            PARI_CONFIGURE="--graphic=none $PARI_CONFIGURE"
            echo "    \"$PARI_CONFIGURE\""
            echo "(Disabling graphics can be overridden by user settings.)"
        fi
        echo "============================================================"
    fi

    # Allow the user to enable PARI self-tuning.
    # This is time-consuming, but some may want to do it.
    # Comment by leif: Also, PARI's Configure calls "make" (instead of $MAKE)
    #                  if we do tuning, so:
    #            TODO: Replace that in our patched version of Configure!
    if [ "$SAGE_TUNE_pari" = yes -o "$SAGE_TUNE_PARI" = yes ]; then
        echo
        echo 'PARI/GP will be tuned for your system since you set SAGE_TUNE_pari="yes".'
        echo 'This can take a long time.'
        echo 'WARNING: Tuning PARI/GP is unreliable. You may find your build of PARI'
        echo 'fails, or PARI/GP does not work properly once built. We recommend to'
        echo 'build this package with SAGE_CHECK="yes".'
        echo
        PARI_CONFIGURE="$PARI_CONFIGURE --tune"
    else
        echo
        echo 'To minimize Sage build time and to ensure the best reliability, PARI/GP'
        echo 'will not be tuned for your system. Experience shows tuning can be'
        echo 'unreliable. If you do want to tune PARI/GP, set the environment'
        echo 'variable SAGE_TUNE_pari="yes" by typing the following before building'
        echo 'Sage (or at least before building/installing PARI/GP):'
        echo '  SAGE_TUNE_pari=yes'
        echo '  export SAGE_TUNE_pari'
        echo 'If you do this, we strongly recommend to also enable checking. For this,'
        echo 'type the following:'
        echo '  SAGE_CHECK=yes'
        echo '  export SAGE_CHECK'
        echo
    fi

    unset GP_INSTALL_PREFIX # we do not want this to be set by the user

    # In addition, a lot of variables used (internally) by PARI might un-
    # intentionally get their values from the "global" environment, so it's
    # safer to clear them here (not further messing up PARI's scripts):
    unset static tune timing_fun error
    unset enable_tls
    unset with_fltk with_qt
    unset with_ncurses_lib
    unset with_readline_include with_readline_lib without_readline
    unset with_gmp_include with_gmp_lib without_gmp
    unset dfltbindir dfltdatadir dfltemacsdir dfltincludedir
    unset dfltlibdir dfltmandir dfltsysdatadir dfltobjdir
    # The following get set because we pass the respective parameters:
    # prefix kernel with_gmp with_readline

    # Set CFLAGS
    if [ "$SAGE_DEBUG" = yes ]; then
        # Disable optimisation, add debug symbols.
        CFLAGS="-O0 -g $CFLAGS"

        # Compile kernel files with -O1 instead of -funroll-loops; -O0 gives
        # a segmentation fault on some OS X systems when doing
        # factor(10356613*10694706299664611221)
        # See #13921, also reported upstream:
        # - http://pari.math.u-bordeaux.fr/archives/pari-dev-1301/msg00000.html
        PARI_MAKEFLAGS="KERNELCFLAGS=-O1 $PARI_MAKEFLAGS"
    else
        # Use PARI's default CFLAGS (with -g added).
        # PARI's Configure adds -O3 to the CFLAGS, so we don't need to add
        # it explicitly.
        CFLAGS="-g $CFLAGS"
    fi

    export CFLAGS
}


# Build PARI/GP
pari_build()
{
    # Configure PARI/GP, forcing bash instead of /bin/sh.  It is not
    # strictly necessary to use bash, but it hopefully makes the script
    # less system-dependent.  Since Sage assumes the existence of bash
    # anyway, it doesn't hurt either. -- jdemeyer
    #
    # Note that "--graphic=none" is (usually) added to PARI_CONFIGURE:
    echo "AT $(pwd)"
    bash ./Configure --prefix="$SAGE_LOCAL" \
        --with-readline="$SAGE_LOCAL" --with-gmp="$SAGE_LOCAL" \
        --with-runtime-perl="/usr/bin/env perl" \
        --kernel=gmp $PARI_CONFIGURE

    if [ $? -ne 0 ]; then
        echo >&2 "Error: Configuring PARI with readline and GMP kernel failed."
        exit 1
    fi

    if [ ! -f Makefile ]; then
        echo >&2 "Error: Unable to configure PARI: No Makefile generated!"
        exit 1
    fi

    $MAKE $PARI_MAKEFLAGS gp
    if [ $? -ne 0 ]; then
        echo >&2 "Error: Building PARI/GP failed."
        exit 1
    fi
}


pari_install()
{
    echo "Installing PARI/GP..."

    # install non-parallel (-j1) because of race conditions
    $MAKE -j1 install install-lib-sta
    if [ $? -ne 0 ]; then
        echo >&2 "Error installing PARI"
        exit 1
    fi

    # Copy anal.h
    cp -f "src/language/anal.h" "$SAGE_LOCAL/include/pari/anal.h"
    if [ $? -ne 0 ]; then
        echo >&2 "Error copying anal.h"
        exit 1
    fi

    cd "$CUR"
}



