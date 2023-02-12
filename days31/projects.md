

# Sage Days 31 Projects

[[_TOC_]] 


## LDAP-based authentication for Sage NB users

* Create an LDAPUserManager for the new flask-based Sage Notebook 
* See <a href="/Notebook%20LDAP">Notebook LDAP</a> for more detailed notes 
* See this <a class="http" href="http://productblog.37signals.com/products/2011/01/well-be-retiring-our-support-of-openid-on-may-1.html">warning about the problems with OpenID</a> 

## Integrating a coding view to replace the current textfield and tiny MCE views

* This was a student project in Math 480 last quarter. 
* The project here is to try it out, and see if it is a good idea or if something based on it should be included in Sage.  Not clear, due to the "weight" of codemirror. 
* Here it is: <a href="http://wstein.org/edu/2011/480a/projects/juarez-sean_johnson-priya_chagaleti.zip">http://wstein.org/edu/2011/480a/projects/juarez-sean_johnson-priya_chagaleti.zip</a> 
* In case you're curious: <a class="http" href="http://wstein.org/edu/2011/480a/projects/">the other projects</a> 

## Fix little issues with notebook so it works well standalone

* <a class="http" href="http://groups.google.com/group/sage-notebook/browse_thread/thread/163e2474db99d383">see this thread for ideas</a> 

## HTML 5 backend

* People:  
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9471">#9471</a> 

## MathJax

* People: Davide Cervone, Jason Grout 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9774">#9774</a> 
* From Nicolas Thiery:  would Mathjax be able to support pgf/tikz pictures? 

## Notebook Logging

* People: 
* Make it so the log files get rotated and compressed.  Support or use some standard tool. 
* Make it so log files contain something useful, and are configurable. 

## Database: SQLite

* People: 
The following should *at a minimum* work with SQLite, since that is included with Sage and whatever we do needs to at least work standard with Sage with "zero configuration".  

* Store all worksheets in a database 
* Store user configuration data in a table 
* Etc. 

## Create a Robust Notebook "System"

* People: 
* A script that starts a separate notebook process 
* It then starts monitoring the notebook to make sure it keeps running, and does a standard test (e.g., view published worksheet listing, login, create a worksheet, compute 2+2, delete worksheet, log out).  
* If it doesn't respond after a preset amount of time with any test, does a configurable action, e.g.,: 
            * kills and restarts the server 
            * sends emails to the admins 

## i18n

* People: Mike, Burcin 
* port the internationalization patches (<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9428">#9428</a>) to the new notebook 

## Jmol Update

* People: Jonathan Gutow 
* See <a class="http" href="http://code.google.com/p/sagenb/issues/detail?id=1">how to put in flask notebook</a> for setup instructions. 
Related tickets: 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11080">#11080</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9238">#9238</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11078">#11078</a> 
One place to try: 

* This can be tested on IanSR's LDAP-based Sage Notebook which is available <a class="http" href="http://sage.nebiogrid.org/">here</a>, but to use this you need to create an account on our system <a class="https" href="https://portal.nebiogrid.org/d/account/register">here</a>.  This is a single form, with email confirmation.  You should use institutional email addresses, not gmail, hotmail, etc. as those accounts will be purged from time to time. 

## Quantumino Puzzle Solver

Solve the the puzzle with Sage so that less people lose time to solve it by hand and make them work on the Notebook. 

* People: Sébastien Labbé 
* The problem : <a class="http" href="http://familygamesamerica.com/mainsite/consumers/productview.php?pro_id=274&amp;search=quantumino">Quantumino Puzzle</a> 
* The solution : <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11379">#11379</a> 

## notebook to and from other formats

* People: Rob Beezer, Bruce Cohen, Sébastien Labbé 

### sws2tex

* see <a class="https" href="https://bitbucket.org/whuss/sws2tex/">its bitbucket site</a> 

### sws2rst

* see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10637">#10637</a> 

### rst2txt and rst2sws

* People: Sébastien Labbé 
* see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11459">#11459</a> 
You can now upload a ReST file in the Sage Notebook to get a worksheet.  

Also, from the same ReST file, you can create an HTML file by using the docutils command `rst2html`. During the week, I was able to make <a href="/MathJax">MathJax</a> work on this HTML output.  

* See <a class="http" href="http://www.thales.math.uqam.ca/~labbes/Sage/rst2sws/">this page</a> on my website for more info and test this on the file calculus.rst available. 
By the way, if you are using vim like me, you might be interested by this trick thanks to Franco Saliola: 

* <a class="http" href="http://www.thales.math.uqam.ca/~labbes/Sage/vim/sage_docstring_highlighting.html">ReST syntax highlighting for Sage docstrings in VIM</a> 

## Notebook Administration Issues

* People: William Stein 
* Write an improved script for monitoring the health of a notebook server. 
* Move all the notebook servers to one single account on one computer.  In particular, the sagenb0 virtual machine on boxen crashes completely every few days, which is a major pain in my (=William's) arse.  Also, all servers should be running sage-4.7 and a flask-based server.  
* Experiment with having a virtual machine just for running user code (and nothing else). 

## The mysterious moving/disappearing text bug

* People: Ryan Grout, Jason Grout, John Travis 
* Find a reproducible one (Found) 
      * See <a class="http" href="http://code.google.com/p/sagenb/issues/detail?id=23">Google code</a> for the bug report. 
* Fix it (Possibly?) 
      * (The issue we found was with the TinyMCE autosave plugin.  We fixed it by just preventing the plugin from loading) 

## Geogebra integration

* People: Bruce Cohen, Rob Beezer, Rado, Mike Gage, Keshav Kini 
* Confirm proof of concept at <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7489">#7489</a> 
* Bruce: We looked at #7489, but I was not satisfied with the output.  Rado showed me how he used <iframe> for graph_editor.   
* The webwork people (Mike and Jason) have taken the iframe() function and will use it in their work.  I should open a new ticket to put iframe() into Sage.  It is more general than #7489. 
* Opened <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11489">#11489</a> to include method html.iframe().  My thanks to Rob and Keshav for helping this newbie with the process.  Take a look at <a class="http" href="http://flask.sagenb.org/home/pub/87">html.iframe()</a> for my current work.  

## Folders, Tags, Hierarchies

* People: Rob Beezer 
* Provide organization to list of worksheets 
* Give worksheets identifiers that allow cross-worksheet links 
* <a class="http" href="http://groups.google.com/group/sage-notebook/browse_thread/thread/a973097dae8a8055">#7665</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1496">#1496</a> 
* R Beezer: I think there is at least one more ticket out there, using a Javascript tree library to do this, but I cannot find it. 

## Sorting lists of worksheets

* People: Rob Beezer 
* Sort lists of worksheets based on creation time, modified time, tag, alphabetical 

## Various proposals for notebook enhancements

* People: 
* <a class="http" href="http://groups.google.com/group/sage-notebook/browse_thread/thread/a973097dae8a8055">sage-notebook Post</a> 

## Configure cell "skip-ahead" behavior

* People: Rob Beezer 
* <a class="http" href="http://groups.google.com/group/sage-notebook/browse_thread/thread/3caa14df476d5a0e">sage-notebook Post</a> 

## Widget Infrastructure

* People: 
* Create a general way to easily incorporate (Javascript) widgets, such as existing Tiny MCE editor and graph editor or rumored matrix editor, equation editor, function palette, etc 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9585">#9585</a> (Davide Cervone) 

## Notebook Code Site Issues

* People: William Stein (maintainer/owner) 
* <a class="http" href="http://code.google.com/p/sagenb/issues/list">http://code.google.com/p/sagenb/issues/list</a> 

## Create better documentation for files of notebook

* Create wiki page for draft of where to find templates, cell commands, login protocols, etc.  
      * Idea is to have a one-stop shop telling to find any given thing in notebook 
* Move to developer guide in basic ReST style 

## Comparison of number field elements

* People: Robert Bradshaw, Mike Hanson, Burcin Erocal 
* Fix issues related to the (broken) ordering of number field elements: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6132">#6132</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7160">#7160</a>, #10062, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10064">#10064</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10849">#10849</a>,  

## Symbolics

* A bunch of issues related to symbolics, mostly based on user requests. 

### Documentation

* People:  Document the relation between pynac <-> Sage and how symbolic functions work. Can be divided into 3 parts: 
* Generic design explanation in `sage.symbolic` 
* pynac and using Python objects in `numeric` objects 
* Symbolic functions 

### add more symbolic functions

* People:  Use the symbolics framework to implement special functions. This involves writing methods for symbolic evaluation (for example `sin(pi) -> 0`, differentiation, wrapper for numeric evaluation, etc.). See <a class="http" href="http://trac.sagemath.org/sage_trac/wiki/symbolics/functions">the trac wiki page</a>. See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11143">#11143</a>. 

### Long standing symbolics issues

* People: Burcin 
* segfaults caused by ordering issues in pynac <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9880">#9880</a> 
* Dynamic attributes for symbolic functions <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9556">#9556</a> 

# Sage Days 31 Tickets Needing Review

* Temporarily disable '@' symbol in username because it breaks TinyMCE <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11343">#11343</a> 
* Merges in Flask - Use SAGE_TEMPLATE_PATH for custom templates <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11106">#11106</a> 
* Upgrade Mercurial: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10594">#10594</a>; the new spkg file comes with fixes for <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11121">#11121</a> and <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11120">#11120</a> which also need review. 
* Easy documentation fix for top-level solve: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10444">#10444</a> 
* Improve LaTeXing: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11498">#11498</a> <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9478">#9478</a> 
* Prohibit conversion of 2x3 matrices to 3x2 etc., which is very dangerous due to right-action-convention: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10793">#10793</a> 