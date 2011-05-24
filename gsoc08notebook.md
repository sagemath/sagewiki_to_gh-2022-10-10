= Google Summer of Code 2008 Sage Project Idea: The Sage Notebook =

MENTORS: William Stein (wstein@gmail.com) and Tom Boothby (boothby@u.washington.edu). 

[[http://sagemath.org|Sage]] is a unified open source mathematics software environment that provides a viable free open source alternative to
Magma, Maple, Mathematica, and Matlab.   Try the notebook [[https://sagenb.org|online right now]]; also, come chat with us at #sage-devel on
irc.freenode.net. 

* See also: http://www.knoboo.com/ for ideas, possibilities for collaboration, etc.  That code is all GPL'd so we can easily share back and forth, etc. 

* Also a student at Case Western has rewritten the security backend. 

'''Requirements:''' This project requires Python and Javascript coding skills, and a solid understanding of AJAX programming. 

The Sage notebook is an AJAX application similar to Google Documents that provides functionality for all mathematical software somewhat like Mathematica notebooks. 
It was written from scratch (in Javascript and Python) by the Sage development team, and has been used daily by thousands of people over the last year.  It's one of the
main ''killer features'' of Sage.  This project is about improving the notebook.  No special mathematical knowledge is required.     If you're really interested in this project,
write to William Stein (wstein@gmail.com) and Tom Boothby (boothby@u.washington.edu).


 * Develop the new [[http://wiki.sagemath.org/interact|interact functionality]]
 * Rewrite the storage backend (for users and data) to use a [[http://www.sqlalchemy.org/|SQLalchemy]]-based backend. 
 * Implement user profiles and per-user customization.
 * Make the notebook user-skinable. 
 * General improvements and bug fixes; here are some relevant [[http://trac.sagemath.org/sage_trac|trac tickets]] (search for #number):
  * [[http://trac.sagemath.org/sage_trac/ticket/2652|#2652]]: notebook should let you evaluate cells without losing cursor position
  * [[http://trac.sagemath.org/sage_trac/ticket/2636|#2636]]: notebook -- changing a cell without evaluate should put the red line back ...
  * [[http://trac.sagemath.org/sage_trac/ticket/2633|#2633]]: Notebook tweaks
  * [[http://trac.sagemath.org/sage_trac/ticket/2631|#2631]]: Distinguishing between (un)evaluated cells
  * [[http://trac.sagemath.org/sage_trac/ticket/2629|#2629]]: Bottom of page problems
  * [[http://trac.sagemath.org/sage_trac/ticket/2628|#2628]]: Literate notebook
  * [[http://trac.sagemath.org/sage_trac/ticket/2606|#2606]]: command line option to kill a background notebook
  * [[http://trac.sagemath.org/sage_trac/ticket/2605|#2605]]: Notebook tab-backspace-(shift enter) gives bug
  * [[http://trac.sagemath.org/sage_trac/ticket/386|#386]]  Enhance "attach <file>" in the notebook
  * [[http://trac.sagemath.org/sage_trac/ticket/406|#406]]  notebook -- improve support for other system modes
  * [[http://trac.sagemath.org/sage_trac/ticket/408|#408]]  Notebook glitch in Safari
  * [[http://trac.sagemath.org/sage_trac/ticket/413|#413]]  saving non-evaluated cells
  * [[http://trac.sagemath.org/sage_trac/ticket/1466|#1466]]  improve the "click to the left" aspect of the notebook
  * [[http://trac.sagemath.org/sage_trac/ticket/1467|#1467]]  make it possible to upload/download worksheets as plain text
  * [[http://trac.sagemath.org/sage_trac/ticket/1468|#1468]]  notebook -- create a global option so that word wrap is on or off by default always
  * [[http://trac.sagemath.org/sage_trac/ticket/1496|#1496]]  notebook -- make it easy to link different worksheets
  * [[http://trac.sagemath.org/sage_trac/ticket/245|#245]]  a bunch of random notebook improvement ideas
  * [[http://trac.sagemath.org/sage_trac/ticket/246|#246]]  height of a notebook cell
  * [[http://trac.sagemath.org/sage_trac/ticket/251|#251]]  Notebook worksheet multithreading
  * [[http://trac.sagemath.org/sage_trac/ticket/260|#260]]  transparent graphics output
  * [[http://trac.sagemath.org/sage_trac/ticket/301|#301]]  Create some functions for notebook history
  * [[http://trac.sagemath.org/sage_trac/ticket/302|#302]]  Report server errors to online notebook users
  * [[http://trac.sagemath.org/sage_trac/ticket/322|#322]]  Have global code page for Notebook
  * [[http://trac.sagemath.org/sage_trac/ticket/336|#336]]  Create an option to clear all cell output
  * [[http://trac.sagemath.org/sage_trac/ticket/338|#338]]  In doc browser make hyper links to referenced code in SAGE library
  * [[http://trac.sagemath.org/sage_trac/ticket/353|#353]]  public sage notebook robustness
  * [[http://trac.sagemath.org/sage_trac/ticket/359|#359]]  Consider adding dhtml javascript drawing functionality to the SAGE notebook
