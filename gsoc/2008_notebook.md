

# Google Summer of Code 2008 Sage Project Idea: The Sage Notebook

MENTORS: William Stein (<a href="mailto:wstein@gmail.com">wstein@gmail.com</a>) and Tom Boothby (<a href="mailto:boothby@u.washington.edu">boothby@u.washington.edu</a>).  

<a class="http" href="http://sagemath.org">Sage</a> is a unified open source mathematics software environment that provides a viable free open source alternative to Magma, Maple, Mathematica, and Matlab.   Try the notebook <a class="https" href="https://sagenb.org">online right now</a>; also, come chat with us at #sage-devel on irc.freenode.net.  

* See also: <a href="http://www.knoboo.com/">http://www.knoboo.com/</a> for ideas, possibilities for collaboration, etc.  That code is all GPL'd so we can easily share back and forth, etc.  

* Also a student at Case Western has rewritten the security backend.  

**Requirements:** This project requires Python and Javascript coding skills, and a solid understanding of AJAX programming.  

The Sage notebook is an AJAX application similar to Google Documents that provides functionality for all mathematical software somewhat like Mathematica notebooks.  It was written from scratch (in Javascript and Python) by the Sage development team, and has been used daily by thousands of people over the last year.  It's one of the main _killer features_ of Sage.  This project is about improving the notebook.  No special mathematical knowledge is required.     If you're really interested in this project, write to William Stein (<a href="mailto:wstein@gmail.com">wstein@gmail.com</a>) and Tom Boothby (<a href="mailto:boothby@u.washington.edu">boothby@u.washington.edu</a>). 

* Develop the new <a class="http" href="http://wiki.sagemath.org/interact">interact functionality</a> 
* Rewrite the storage backend (for users and data) to use a <a class="http" href="http://www.sqlalchemy.org/">SQLalchemy</a>-based backend.  
* Implement user profiles and per-user customization. 
* Make the notebook user-skinable.  
* General improvements and bug fixes; here are some relevant <a class="http" href="http://trac.sagemath.org/sage_trac">trac tickets</a> (search for #number): 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2652">#2652</a>: notebook should let you evaluate cells without losing cursor position 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2636">#2636</a>: notebook -- changing a cell without evaluate should put the red line back ... 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2633">#2633</a>: Notebook tweaks 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2631">#2631</a>: Distinguishing between (un)evaluated cells 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2629">#2629</a>: Bottom of page problems 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2628">#2628</a>: Literate notebook 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2606">#2606</a>: command line option to kill a background notebook 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2605">#2605</a>: Notebook tab-backspace-(shift enter) gives bug 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/386">#386</a>  Enhance "attach <file>" in the notebook 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/406">#406</a>  notebook -- improve support for other system modes 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/408">#408</a>  Notebook glitch in Safari 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/413">#413</a>  saving non-evaluated cells 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1466">#1466</a>  improve the "click to the left" aspect of the notebook 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1467">#1467</a>  make it possible to upload/download worksheets as plain text 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1468">#1468</a>  notebook -- create a global option so that word wrap is on or off by default always 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1496">#1496</a>  notebook -- make it easy to link different worksheets 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/245">#245</a>  a bunch of random notebook improvement ideas 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/246">#246</a>  height of a notebook cell 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/251">#251</a>  Notebook worksheet multithreading 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/260">#260</a>  transparent graphics output 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/301">#301</a>  Create some functions for notebook history 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/302">#302</a>  Report server errors to online notebook users 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/322">#322</a>  Have global code page for Notebook 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/336">#336</a>  Create an option to clear all cell output 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/338">#338</a>  In doc browser make hyper links to referenced code in SAGE library 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/353">#353</a>  public sage notebook robustness 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/359">#359</a>  Consider adding dhtml javascript drawing functionality to the SAGE notebook 