

## Ondřej Čertík

   * web: <a href="http://ondrej.certik.cz/">http://ondrej.certik.cz/</a> 
   * Debian page: <a href="http://wiki.debian.org/OndrejCertik">http://wiki.debian.org/OndrejCertik</a> 

### Me and Sage

What I do or I am interested in: 

   * sage.calculus and integration of <a href="/SymPy">SymPy</a> 
   * <a href="/DebianSAGE">Debian Sage Packaging Team</a> 
   * <a class="http" href="http://cython.org/">Cython</a> 
   * <a href="/Sage_in_systemwide_python">Sage_in_systemwide_python</a> 
   * <a href="/OndrejCertik/SPD">Source Python Distribution</a> 
Generally: 

   * I want to use Sage in physics. I am not so much interested in pure math things, but I really want basic calculus to work and to work well. 

### Tips

How to test in parallel: 
```txt
$ ./sage -tp 6 devel/sage/sage/calculus/
```
Execute tests: 
```txt
SAGE_CHECK=yes sage -f sympy-0.6.3.spkg
```
How to build in parallel: 
```txt
export MAKE="make -j8"
```
How to install Sage using virtualbox: <a href="/SageVirtualBox">SageVirtualBox</a> 


### Links

* <a href="/OndrejCertik/SD16">Sage Days 16 videos</a> 

<a href="http://wiki.sagemath.org/Sage_Spkg_Tracking">http://wiki.sagemath.org/Sage_Spkg_Tracking</a> 

<a href="http://sage.math.washington.edu/home/ondrej/">http://sage.math.washington.edu/home/ondrej/</a> 

<a href="http://wiki.sagemath.org/SPKG_Audit">http://wiki.sagemath.org/SPKG_Audit</a> 

Here is a sample `spkg-install` script for a typical `configure && make && make install` package. Change the `PACKAGE_NAME=` line to the name of the package. 


```txt
if [ "$SAGE_LOCAL" = "" ]; then
   echo "SAGE_LOCAL undefined ... exiting";
   echo "Maybe run 'sage -sh'?"
   exit 1
fi

PACKAGE_NAME=Judy

cd src

./configure --prefix="$SAGE_LOCAL"
if [ $? -ne 0 ]; then
   echo "Error configuring $PACKAGE_NAME."
   exit 1
fi

make
if [ $? -ne 0 ]; then
   echo "Error building $PACKAGE_NAME."
   exit 1
fi

make install
if [ $? -ne 0 ]; then
   echo "Error installing $PACKAGE_NAME."
   exit 1
fi
```


---

 <a href="/CategoryHomepage">CategoryHomepage</a> 
