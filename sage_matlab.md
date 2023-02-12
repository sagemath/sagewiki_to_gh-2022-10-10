

# Sage for Matlab Users

For starters, please see <a href="http://www.scipy.org/NumPy_for_Matlab_Users">http://www.scipy.org/NumPy_for_Matlab_Users</a> which discusses Numpy/Scipy for Matlab users.  Note that both Numpy and Scipy are included in SAGE. This resource will answer many of your questions, but probably not all. 

Many numerical packages that ship with Sage, such as Numpy or cvxopt do not understand Sage's advanced types. See <a href="http://wiki.sagemath.org/faq#Typeissuesusingscipy.2CcvxoptornumpyfromSage">http://wiki.sagemath.org/faq#Typeissuesusingscipy.2CcvxoptornumpyfromSage</a> for a heads-up. 


## How do I enable an interactive GUI?

Matplotlib is included with Sage, and emulates Matlab plotting functionality. By default, Sage has matplotlib built only for file-based output, not interactive outputs. There are various graphical backends that matplotlib can use: read <a href="http://matplotlib.sourceforge.net/faq/installing_faq.html#what-is-a-backend">http://matplotlib.sourceforge.net/faq/installing_faq.html#what-is-a-backend</a> to understand what a backend is. Unless you have a preference, this section will help you set up the <a href="/TkAgg">TkAgg</a> backend. 

We're going to reinstall two packages automatically in sage. At any stage in the installation, you can test matplotlib by trying "sage -ipython -pylab" and running something like `x=randn(1000); hist(x)`. 

1. Add the following line to your $HOME/.matplotlib/matplotlibrc (or create it if necessary): "backend : <a href="/TkAgg">TkAgg</a>". If "sage -ipython -pylab" still won't show you your plot, go to the next step. 
1. Make sure you have the SAGE_ROOT environment variable set. Otherwise, enter your Sage top-level or sage/local/bin/. If you set this in your .bashrc (or whatever shell you are using) file, make sure to restart the shell or export it manually with export SAGE_ROOT=/path/to/sage 
1. Start "sage -python" and make sure "import _tkinter" and "import Tkinter" don't work. If they do, skip the next step. 
1. The Python shipped in Sage is not compiled with Tk support. Assuming you have the Tk development libraries installed somewhere in your Linux(*), run the following: "sage -f python". This will recompile Sage's Python (may take a few minutes). 
1. Try "sage -ipython -pylab" and plot something. If everything is fine, then skip the rest of these steps. If it isn't, Sage will complain it cannot import _tkagg.  
1. Export SAGE_MATPLOTLIB_GUI to anything but no, e.g., "export SAGE_MATPLOTLIB_GUI='hello momma'". Again if you do this in .bashrc (or whatever shell config file) restart your shell or export it manually. 
1. Recompile matplotlib with: "sage -f matplotlib". 
1. If matplotlib has errors while building you will likely have to rebuild freetype. Rebuild it with sage -f freetype. 
1. Now rebuild matplotlib again with "sage -f matplotlib". It should build cleanly now. 
(*) To make sure your Linux has at least Tcl installed, make sure "tclsh" starts and gives you a prompt. 

Now, if you start "sage -ipython -pylab" and try `x=randn(1000); hist(x)`, a beautiful Tk plot should pop up. You have your standard zoom and pan. You can run `xlabel('signal (mV)')` and the window will automatically update. 

Some notes comparing matplotlib to Matlab graphics. In many aspects, matplotlib is far more advanced that Matlab, thanks to open source. However, matplotlib's 3D visualization significantly lags behind Matlab. All is not lost, however: Sage ships with numerous 3D (and 2D) plotting tools which you may find a good complement to matplotlib. See  <a href="http://www.sagemath.org/doc/reference/plot3d.html">http://www.sagemath.org/doc/reference/plot3d.html</a> for more details. 
