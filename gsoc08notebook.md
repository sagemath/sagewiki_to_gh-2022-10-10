= Google Summer of Code 2008 Sage Project Idea: The Sage Notebook =

[http://sagemath.org Sage] is a unified open source mathematics software environment that provides a viable free open source alternative to
Magma, Maple, Mathematica, and Matlab.   Try the notebook [https://sagenb.org online right now].

'''Requirements:''' This project requires Python and Javascript coding skills, and a solid understanding of AJAX programming. 

The Sage notebook is an AJAX application similar to Google Documents that provides functionality for all mathematical software somewhat like Mathematica notebooks. 
It was written from scratch (in Javascript and Python) by the Sage development team, and has been used daily by thousands of people over the last year.  It's one of the
main ''killer features'' of Sage.  This project is about improving the notebook.  No special mathematical knowledge is required.    

 * Develop the new [http://wiki.sagemath.org/interact interact functionality]
 * Rewrite the storage backend (for users and data) to use a [http://www.sqlalchemy.org/ SQLalchemy]-based backend. 
 * Implement user profiles and per-user customization.
 * Make the notebook user-skinable. 
 * General improvements and bug fixes; here are some relevant [http://trac.sagemath.org/sage_trac trac tickets]:
  * #386  Enhance "attach <file>" in the notebook
  * #406  notebook -- improve support for other system modes
  * #408  Notebook glitch in Safari
  * #413  saving non-evaluated cells
  * #1466  improve the "click to the left" aspect of the notebook
  * #1467  make it possible to upload/download worksheets as plain text
  * #1468  notebook -- create a global option so that word wrap is on or off by default always
  * #1496  notebook -- make it easy to link different worksheets
  * #245  a bunch of random notebook improvement ideas
  * #246  height of a notebook cell
  * #251  Notebook worksheet multithreading
  * #260  transparent graphics output
  * #301  Create some functions for notebook history
  * #302  Report server errors to online notebook users
  * #322  Have global code page for Notebook
  * #336  Create an option to clear all cell output
  * #338  In doc browser make hyper links to referenced code in SAGE library
  * #353  public sage notebook robustness
  * #359  Consider adding dhtml javascript drawing functionality to the SAGE notebook
