= Sage Days 31 Project Ideas =

<<TableOfContents>>

== HTML 5 backend ==
 * [[http://trac.sagemath.org/sage_trac/ticket/9471|#9471]]


== MathJax ==
 * [[http://trac.sagemath.org/sage_trac/ticket/9774|#9774]]


== Notebook Logging ==
 * Make it so the log files get rotated and compressed.  Support or use some standard tool.
 * Make it so log files contain something useful, and are configurable.

== Database: SQLite ==

The following should *at a minimum* work with SQLite, since that is included with Sage and whatever we do needs to at least work standard with Sage with "zero configuration". 

 * Store all worksheets in a database
 * Store user configuration data in a table
 * Etc.

== Create a Robust Notebook "System" ==
 * A script that starts a separate notebook process
 * It then starts monitoring the notebook to make sure it keeps running, and does a standard test (e.g., view published worksheet listing, login, create a worksheet, compute 2+2, delete worksheet, log out). 
 * If it doesn't respond after a preset amount of time with any test, does a configurable action, e.g.,:
     * kills and restarts the server
     * sends emails to the admins

== i18n ==
 * port the internationalization patches ([[http://trac.sagemath.org/sage_trac/ticket/9428|#9428]]) to the new notebook

== Jmol Update ==
 * [[http://trac.sagemath.org/sage_trac/ticket/9238|#9238]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11078|#11078]]

== notebook to and from other formats ==
 * sws2tex - see [[https://bitbucket.org/whuss/sws2tex/|its bitbucket site]]
 * sws2rst - see [[http://trac.sagemath.org/sage_trac/ticket/10637|#10637]]
 * rst to notebook
I would like to polish up and merge into Sage a script I wrote this
winter to translate .rst files into notebook (txt) files. It is based
on the file docHTMLProcessor.py which is part of the sage notebook.
Although, since there are always rumors that the Sage Notebook is
changing, I did not push it any further and was waiting for the new
version of the Notebook before. The script (rst2notebook) is available
in the misc directory of the [[http://combinat.sagemath.org/hgwebdir.cgi/misc/file/ef17ccb37589/notebook2rst/|sage-combinat hg server]].

== The mysterious moving/disappearing text bug ==
 * Find a reproducible one
 * Fix it


I think that week would be perfect to polish it and finish it.

Sébastien Labbé
