== SAGE plotting ==

Here are some python plotting engines/libraries:

   Older/not python dedicated:
       * Grace: http://www.idyll.org/~n8gray/code
       * PGPLOT: http://efault.net/npat/hacks/ppgplot
       * PLplot: http://www.plplot.org
       * opemath: Written by William Schelter and part of Maxima (thus also SAGE) is a TCL/Tk plotting program which allows for interactive viewing. It has no separate download page. An example is this [http://modular.math.washington.edu/home/wdj/art/saddle.png saddle]:
     {{{sage: maxima.eval("plot3d(2^(-u^2+v^2),[u,-1,1],[v,-1,1],[plot_format, openmath]);")}}}

   Currently developed / good:
       * matplotlib: http://matplotlib.sourceforge.net

SAGE's plotting functionality is built on top of matplotlib, which is a
very extensive plotting library with a user interface that is very similiar to Matlab's plotting.
The interface that SAGE provides to matplotlib is very Mathematica like.

There are also several links to plotting/graphics/data visualization programs at the scipy [http://www.scipy.org/Topical_Software#head-b98ffdb309ccce4e4504a25ea75b5c806e4897b6 wiki].
