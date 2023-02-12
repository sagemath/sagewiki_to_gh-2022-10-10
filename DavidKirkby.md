

## David Kirkby

Email: david.kirkby AT SPAMFREE onetel DOT net 

... 

**An spkg-install for 'lcalc', for which I hope the functionality will be added at a earlier stage in the build process. ** 


```txt
#!/usr/bin/env bash
# This spkg-install was written for 'lcalc', but in such a way that it is
# hoped it can be used much more widely in Sage. As such, it does things that
# are not needed for 'lcalc', but will be used to test the general principles

if [ -z "$SAGE_LOCAL" ] ; then
   echo "SAGE_LOCAL undefined ... exiting";
   echo "Maybe run 'sage -sh'?"
   exit 1
fi

# Force an exit on all errors. However, it will be desirable to unset this
# sometimes, as you might want to test for a particular error and exit with
# a message. You can't do that with 'set -e'. So use 'set +e' to unset it
set -e

# Compile for 64-bit if SAGE64 is set to 'yes' or '1'
if [ "x$SAGE64" = "xyes" ] || [ "x$SAGE64" = "x1" ]  ; then
   CFLAGS="$CFLAGS -m64 "
   CXXFLAGS="$CXXFLAGS -m64 "
   FFLAGS="$FFLAGS -m64 "
fi

# If SAGE_DEBUG is set either unset (the default), set to '1', 'yes',  or 'TRUE'
# then build with debugging information. Otherwise, don't add debugging information.

# Since both the Sun and GNU compilers accept -g to give debugging information
# there is no need to do anything specific to one compiler or the other.

if [ "x$SAGE_DEBUG" = "x" ] || [ "x$SAGE_DEBUG" = "x1" ] ; then
  echo "Code will be built with debugging information present. Set 'SAGE_DEBUG' to '0' if you don't want that."
  CFLAGS="$CFLAGS -g "
  CXXFLAGS="$CXXFLAGS -g "
  FFLAGS="$FFLAGS -g "
elif [ "x$SAGE_DEBUG" = "xyes" ] || [ "x$SAGE_DEBUG" = "xTRUE" ] ; then
  echo "Code will be built with debugging information present. Set 'SAGE_DEBUG' to '0' if you don't want that."
  CFLAGS="$CFLAGS -g "
  CXXFLAGS="$CXXFLAGS -g "
  FFLAGS="$FFLAGS -g "
fi

# Display all warnings from the compilers. Do so in a way that works for
# both The GNU Compiler Collection (gcc, g++, gfortran), as well as for
# Sun's compilers. Since the compilers use different methods, the compiler
# must be tested. In fact, not all Sun compilers use the same method.

# gcc/g++/gfortran uses -Wall to show this.

# The best flags for the Sun Studio 12 compiler suite are below. It is possible some of these
# flags may not work with older version of Sun compilers. It would also need
# more testing, before being more widely used in Sage.


# Determine if the C compiler is the Sun or GNU compiler. This is based on the fact that
# 'gcc --version' will print 'GNU' somewhere in the output, and the Sun compiler will print
# 'sun' somewhere in the output if called with the options '-flags'. The exit code of grep is used,
# as I'm advised this is the best way to do this. 

# Add appropriate flag(s) to show all warnings.
if "$CC" -flags 2>&1 | grep -i sun  ;  then
  CFLAGS="$CFLAGS -errshort=full "
  SUN_COMPILER=1
elif "$CC" --version | grep 'GCC'  ; then
  CFLAGS="$CFLAGS -Wall "
  GNU_COMPILER=1
else
  echo "The spkg-install file can't work out what C compiler you are using"
  echo "No flags will be added to show extra warnings while compiling C"
fi

# Determine if the C++ compiler is the Sun or GNU compiler
# Add appropriate flag(s) to show all warnings.
if "$CXX" -flags 2>&1 | grep -i sun  ;  then
  CXXFLAGS="$CXXFLAGS +w2 "
  SUN_COMPILER=1
elif "$CXX" --version | grep 'GCC'  ; then
  CXXFLAGS="$CXXFLAGS -Wall "
  GNU_COMPILER=1
else
  echo "The spkg-install file can't work out what C++ compiler you are using"
  echo "No flags will be added to show extra warnings while compiling C++"
fi


# Determine if the Fortran compiler is the Sun or GNU compiler
# Add appropriate flag(s) to show all warnings.
if [ -z "$SAGE_FORTRAN" ] ; then
   echo "No Fortran compiler has been defined. No flags will be added to detect warnings, as the compiler type is unknown"
else
   if "$SAGE_FORTRAN" -flags 2>&1 | grep -i sun  ;  then
      FFLAGS="$FFLAGS -w2 "
      SUN_COMPILER=1
   elif "$SAGE_FORTRAN" --version | grep 'GCC'  ; then
      FFLAGS="$FFLAGS -Wall "
      GNU_COMPILER=1
   else
      echo "The spkg-install file can't work out what Fortran compiler you are using"
      echo "No flags will be added to show extra warnings while compiling Fortran"
   fi
fi

# Checks that the user is not mixing the Sun and GNU compilers. This problem
# has been seen on code built with the aid of SCons, but in general could
# happen with any code if the user has specified a C compiler but not a C++ one.
# This problem is even more likely to occur with the Fortran compiler - I've done
# it myself when building Sage!

if [ "x$SUN_COMPILER" = "x1" ] && [ "x$GNU_COMPILER" = "x1" ] ; then
  echo "You are mixing the Sun and GNU C/C++/Fortran compilers"
  echo "Such a combination will lead to problems. Check CC, CXX & SAGE_FORTRAN carefully."
  echo "Exiting ..."
  exit 1
fi

cd src

if [ `uname` = "SunOS" ]; then
    LCALC_LIBS="-lpari -lmpfr -lgmpxx -lgmp -liberty"
else
    LCALC_LIBS="-lpari -lmpfr -lgmpxx -lgmp"
fi

export CC CXX CFLAGS CXXFLAGS LCALC_LIBS SAGE_FORTRAN FFLAGS

echo "Building Rubinstein's lcalc program using CC=$CC"
echo "                                          CCX=$CXX"
echo "                                          SAGE_FORTRAN=$SAGE_FORTRAN"
echo "                                          CFLAGS=$CFLAGS"
echo "                                          CXXFLAGS=$CXXFLAGS"
echo "                                          FFLAGS=$FFLAGS"
echo "                                          LCALC_LIBS=$LCALC_LIBS"

# disable Cygwin build for now
if [ `uname` = "CYGWIN" ]; then
    echo "Sorry, the lcalc build is currently broken"
    echo 1
fi

cd src

set +e

success() {
    if [ $? -ne 0 ]; then
        echo "Error building lcalc '$1'"
        exit 1
    fi
}

set -e

export DEFINES=""
cp ../../patches/Makefile.sage Makefile
make lcalc
success 'plain'

echo "Now copying over the lcalc binary"
cp lcalc "$SAGE_LOCAL/bin"
success 'install'

```


---

 

* <a href="/CategoryHomepage">CategoryHomepage</a> 