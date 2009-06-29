= SAGE for Matlab Users =

For starters, please see http://www.scipy.org/NumPy_for_Matlab_Users which discusses Numpy/Scipy for Matlab users.  Note that both Numpy and Scipy are included in SAGE. This resource will answer many of your questions, but probably not all.

Many numerical packages that ship with Sage, such as Numpy or cvxopt do not understand Sage's advanced types. See http://wiki.sagemath.org/faq#Typeissuesusingscipy.2CcvxoptornumpyfromSage for a heads-up.

== How do I enable an interactive GUI? ==
Matplotlib is included with Sage, and emulates Matlab plotting functionality. By default, Sage has matplotlib built only for file-based output, not interactive outputs. There are various graphical backends that matplotlib can use: read http://matplotlib.sourceforge.net/faq/installing_faq.html#what-is-a-backend to understand what a backend is. Unless you have a preference, this section will help you set up the TkAgg backend.

We're going to reinstall two packages automatically in sage. At any stage in the installation, you can test matplotlib by trying "sage -ipython -pylab" and running something like {{{x=randn(1000); hist(x)}}}.

 1. Make sure you have the SAGE_ROOT environment variable set. Otherwise, enter your Sage top-level or sage/local/bin/.
 1. Start "sage -python" and make sure "import _tkinter" and "import Tkinter" don't work. If they do, skip the next step.
 1. The Python shipped in Sage is not compiled with Tk support. Assuming you have the Tk development libraries installed somewhere in your Linux(*), run the following: "sage -f -i python-2_XXX" where you replace the last word with the latest python package included with sage: search http://sagemath.org/packages/standard/ for "python" to find out which it is. This will recompile Sage's Python (may take a few minutes).
 1. Try "sage -ipython -pylab" and plot something. If everything is fine, then skip the rest of these steps. If it isn't, Sage will complain it cannot import _tkagg. 
 1. Export SAGE_MATPLOTLIB_GUI to anything but no, e.g., "export SAGE_MATPLOTLIB_GUI='hello momma'".
 1. Recompile matplotlib with: "sage -f -i matplotlib-0.98_XXX" where again you get the latest matplotlib package name from http://sagemath.org/packages/standard/.
(*) To make sure your Linux has at least Tcl installed, make sure "tclsh" starts and gives you a prompt.

Now, if you start "sage -ipython -pylab" and try {{{x=randn(1000); hist(x)}}}, a beautiful Tk plot should pop up. You have your standard zoom and pan. You can run {{{xlabel('signal (mV)')}}} and the window will automatically update.

Some notes comparing matplotlib to Matlab graphics. In many aspects, matplotlib is far more advanced that Matlab, thanks to open source. However, matplotlib's 3d visualization significantly lags Matlab. All is not lost: Sage ships with numerous 3d (and 2d) plotting tools which you may find a good complement to matplotlib. See  http://www.sagemath.org/doc/reference/plot3d.html for more details.
