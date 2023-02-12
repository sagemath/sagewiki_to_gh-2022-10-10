
[[_TOC_]] 


# Installing Qt, PyQt, VTK and Mayavi2 in Sage

I've become a huge Qt fan and do all my C++ coding in Qt... stuff with and without GUIs.  So, the key for me was to see how I could get all Sage's goodness merged with Python and Qt.  Mayavi2 / Scipy / ipython are also important tools for my work so I've managed to nail them all together. 

The good news is its relatively straightforward but there are some tricks to make it all go together nicely 


## First, Build Sage

untar, type make. 


## Second, Adjust / prepare sage

Sage needs a little twiddling to avoid problems.  I can't recall exactly why I've done all the things I've done... but they were probably for a good reason.  I'll show what I do and perhaps over time it can be adjusted or verified exactly what made me decide to do certain things 


```txt
# insert this at the end of $SAGE_LOCAL/bin/sage-env
export CPATH=$SAGE_LOCAL/include:/usr/include
export CMAKE_INCLUDE_PATH=$SAGE_LOCAL/include:/usr/include
export CMAKE_LIBRARY_PATH=$SAGE_LOCAL/lib:/usr/lib
export LD_LIBRARY_PATH=$SAGE_LOCAL/lib/vtk-5.5:$LD_LIBRARY_PATH
export ETS_TOOLKIT=qt4
```
CPATH is adjusted cuz it should be.  Sage didn't have it set although its close cousin LIBRARY_PATH was set.  I think this helps out with VTK primarily... perhaps it just makes it unnecessary to set other environment variables when building everything.  Either way, it doesn't hurt and helps disambiguate when building Sage on a system which has the same _stuff_ Sage provides. 

The CMAKE_* variables are for cmake (surprisingly).  I adjust LD_LIBRARY_PATH early on cuz it doesn't really hurt even though there's nothing in the vtk directory till its built. 

ETS_TOOLKIT is pretty important.  Mayavi2 is in a meta-state somewhere between <a href="/WxWidgets">WxWidgets</a> and <a href="/PyQt">PyQt</a>.  ETS_TOOLKIT helps it when it gets confused (which it still does to a degree) 


```txt
# bash script
# this does the insertion of the code described previously
cat ~/share2/development/sage/scripts/setvtkenvironment.sh >> $SAGE_LOCAL/bin/sage-env

cd $SAGE_LOCAL/lib
rm libz.so*
ln -s -f /usr/lib/libz.so libz.so.1
ln -s -f libz.so.1 libz.so
ln -s -f libpng12.so libpng.so

echo '*************** '
echo '*************** '
echo Restart the sage shell
echo '*************** '
echo '*************** '
```
It turns out that on ubuntu, git doesn't like Sage's libz.  So, I just use what is native.  Something wanted libpng.so and didn't like libpng12.so... hence the other symbolic link. 

I run the script above from within a sage shell which needs to be restarted to suck in the new environment hence the reminder. 


## Suck in the source for everything

Instead of adjusting my scripts, know that I put all the qt stuff in a directory called tarbox.  In hindsight that was pretty stupid... but I'm probably stuck forever unless I wanna do work to fix it... maybe you'll wanna use tarbox also (probably not). 

Also, I maintain a clone of the Qt, <a href="/QtCreator">QtCreator</a> repos as well as the tar files for <a href="/PyQt">PyQt</a> and Sip.  As of 10/15/2009, everything works with the latest repos and code of everything (Sage, Mayavi2, VTK, Qt, <a href="/QtCreator">QtCreator</a>, <a href="/PyQt">PyQt</a> and Sip).  <a href="/PyQt">PyQt</a> may break because it _just_ became compliant with Qt 4.6 although Phil will probably try and keep on top of it should things break. 


```txt
# another bash script
GT_TARDIR='/home/tarbox/share2/development/sage/tarfiles'
GT_GITDIR='/home/tarbox/share2/development/gitrepos'

mkdir -p $SAGE_ROOT/tarbox/qt

# Qt and QtCreator

cd $SAGE_ROOT/tarbox/qt
git clone file:///$GT_GITDIR/qt.git
git clone file:///$GT_GITDIR/qt-creator.git

# SIP
tar xf $GT_TARDIR/sip.tar.gz
mv sip* sip

# already need to have hacked the license checking out of PyQt
# (comment out check_license()...)
tar xf $GT_TARDIR/PyQt.tar.bz2
mv PyQt* PyQt

# pull in sageqt working directory from git

cd $SAGE_ROOT/tarbox
git clone file:///home/tarbox/share2/development/gitrepos/sageqt.git
```
I maintain my own git repo of Qt and <a href="/QtCreator">QtCreator</a> because sucking from Nokia can be slow.  However, all I'm doing is mirroring the Qt and <a href="/QtCreator">QtCreator</a> repos on gitorious.  The Qt site explains all... but for thoroughness, if you wanted to suck the latest repo for Qt and Creator 


```txt
git clone git://gitorious.org/qt/qt.git
git clone git://gitorious.org/qt-creator/qt-creator.git
```
The various mv statements above are simply renaming... the tarballs encode the version stuff so I just make it uniform. 

One important point:  Note the comment about check_license().  In config.py in the <a href="/PyQt">PyQt</a> distro, it checks the license.  I have no idea what license applies although I do know the licensing is a problem and why <a href="/PyQt">PyQt</a> is being re-developed by Nokia and others as the <a href="/PySide">PySide</a> project.  I'm pretty sure you can use it for your own personal use.  Either way, it likes to check and I couldn't figure any of it out... therefore, I hack out where check_license() is called.  Some smart unix person might use a sed / awk / grep / perl incantation to accomplish what I pull off quite clumsily with emacs. 


## Build Qt


```txt
# bash shell

# can't recall why this is critical....

unset MAKE

# Qt

cd $SAGE_ROOT/tarbox/qt/qt
./configure -optimized-qmake -no-qt3support -confirm-license -opensource -opengl -I $SAGE_LOCAL/include -L $SAGE_LOCAL/lib -prefix $SAGE_LOCAL 2>&1 | tee qtconfigure.log
make 2>&1 | tee qtmake.log
make install 2>&1 | tee qtmakeinstall.log

# QtCreator

mkdir -p $SAGE_ROOT/tarbox/qt/creator-build
cd $SAGE_ROOT/tarbox/qt/creator-build
qmake $SAGE_ROOT/tarbox/qt/qt-creator/qtcreator.pro 2>&1 | tee qt_qmake.log
make 2>&1 | tee qt_make.log
```
I unset MAKE for this script.  And its for a really really good reason... that I just can't recall at the moment.  Something to do with all the particles in the universe exploding at the speed of light if it isn't unset, but that might be wrong.  Anyway, I unset it and all seems right with the universe. 

Note though, that this is only unset in the script.  I assume MAKE is set in Sage for a reason so if you're just cutting and pasting instead of creating your own scripts, you should reset the environment after building 


## Build PyQt


```txt
# bash script

# SIP

cd $SAGE_ROOT/tarbox/qt/sip
python configure.py 2>&1 | tee sip_configure.log
make 2>&1 | tee sip_make.log
make install 2>&1 | tee sip_makeinstall.log

# PyQt

cd $SAGE_ROOT/tarbox/qt/PyQt
python configure.py 2>&1 | tee PyQt_configure.log
make 2>&1 | tee PyQt_make.log
make install 2>&1 | tee PyQt_makeinstall.log
```

## Download VTK

This is a slight pain the first time you do this because you need to log into Kitware's CVS repo.  That they're using CVS shouldn't be held against them as they're serious badasses...  This is some pathological holdover for distribution and I guarantee they're using something else internally.  If not, I'll be crushed and know that there is indeed no hope for the future of mankind... 

Its all on their site, but for those who wanna follow at home 


```txt
cvs -d :pserver:anonymous@www.cmake.org:/cvsroot/CMake login
# respond with password cmake
cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/VTK login
# respond with password vtk
cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/VTKData login
# respond with password vtk
```
If you do the above, some magical hidden file will go somewhere in your home directory and you'll never need to worry about it again.  Clearly, this security step is critical for National Defence so be careful with how you use this information. 

From then and all times in the future, to grab the latest VTK version, and build cmake 


```txt
# bash script
mkdir -p $SAGE_ROOT/tarbox/vtk
cd $SAGE_ROOT/tarbox/vtk

# Checkouts

cvs -d :pserver:anonymous@www.cmake.org:/cvsroot/CMake co CMake

cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/VTK checkout VTK

cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/VTKData checkout VTKData

# Builds

# CMake

cd CMake
./bootstrap --prefix=$SAGE_LOCAL
make
make install
```

## Build VTK

OK, I sorta don't really know how to use cmake.  I originally thought cmake was a mistake until I started working with qmake... and had a few run-ins with autoconf and I get it.  But that doesn't mean I know anything... and since learning is absolutely out of the question, I cheat and use ccmake which is a curses based pseudo gui thingy 

Hence, your machine needs ncurses, nvidia-glx-***-dev and a bunch of other OpenGL libraries which I can't recall... In fact, I gave up the last time I did an install and simply copied over the dpkg installs.  Somebody with a clue might know with some degree of certainty.  Originally, I used the tried and true method of installing opengl and glx looking things until it worked. (I should have been a surgeon) 

Anyway, this is what I do to build VTK... 


```txt
mkdir -p $SAGE_ROOT/tarbox/vtk/vtkbuild; cd vtkbuild; ccmake ../VTK
```
If ccmake doesn't exist, you probably didn't have ncurses installed. 

Now the fun part.  Hit 'c' to get it to figure out whats going on.  It works pretty hard for a while, so it must be doing something important... 

The first options you want to set are in the short list presented 

* Shared Libraries 
* CMAKE_INSTALL_PREFIX to be $SAGE_LOCAL... but I don't know how to use environment variables in ccmake so I type the full path in 
* use Qt 
* wrap python 
Then hit 'c' again and it won't be very happy about something or other. Can't recall why, but hit 'e' and adjust 

* use Qt version 4... it has a 0... and its not 4.5 or 4.6, its just 4 
* turn off VTK_USE_TK (mostly because you probably don't have TK installed and probably don't want it) 
* use system provided zlib, png, and freetype.  basically, search for zlib and the others are close... turn em on. 
Hit 'c' again... it'll think a bit. and "appear" happy, but its really not.  For some wacko reason, the only thing it doesn't find are the freetype headers.  Sage has em in $SAGE_LOCAL/lib/freetype2.  Again, I simply adjust manually 

Hit 'c' one last time and you _hopefully_ will have the option to hit 'g' and build the makefile 

then its make; make install if the moon is in phase etc. 


## Download Mayavi2


```txt
# bash script
mkdir -p $SAGE_ROOT/tarbox/ets
cd $SAGE_ROOT/tarbox/ets

TARDIR='/home/tarbox/share2/development/sage/tarfiles'

tar xf $TARDIR/configobj*.tar.*
mv configobj* configobj
cd configobj
python setup.py install

cd $SAGE_ROOT/tarbox/ets

svn co https://svn.enthought.com/svn/enthought/ETSProjectTools/trunk ETSProjectTools
cd ETSProjectTools
python setup.py install

cd $SAGE_ROOT/tarbox/ets
ets co ets
```
the configobj thing I'm not sure about.  I think it may be already in Ubuntu or Sage... but originally I had trouble.  Quite possibly, this step can be skipped. 

Then, you're just grabbing the Enthought special tools and using that tool to suck everything Mayavi2 needs... which is some subset of whatever _ets_ is defined as which, I think, is everything (I usually default to getting everything... probably compensation for other failures in life) 


## Build Mayavi2

The last thing you need is Swig.  Trivial install... grab from <a href="http://www.swig.org/">http://www.swig.org/</a> unwind the tarball and 


```txt
./configure --prefix=$SAGE_LOCAL
make
make install
```
Then you can use the ets tools.  I don't completely understand this stuff but cd into the enthought directory created by the ets checkout as per the above then: 


```txt
ets develop
ets install
```

## Test Everything

My standard test to see if things worked is: 


```txt
ipython -pylab -q4thread
```
and I paste the demo from the Mayavi2 documentation into ipython 


```txt
from numpy import pi, sin, cos, mgrid
dphi, dtheta = pi/250.0, pi/250.0
[phi,theta] = mgrid[0:pi+dphi*1.5:dphi,0:2*pi+dtheta*1.5:dtheta]
m0 = 4; m1 = 3; m2 = 2; m3 = 3; m4 = 6; m5 = 2; m6 = 6; m7 = 4;
r = sin(m0*phi)**m1 + cos(m2*phi)**m3 + sin(m4*theta)**m5 + cos(m6*theta)**m7
x = r*sin(phi)*cos(theta)
y = r*cos(phi)
z = r*sin(phi)*sin(theta)

# View it.
from enthought.mayavi import mlab
s = mlab.mesh(x, y, z)
```
You'll know real quick like if things are working. 
