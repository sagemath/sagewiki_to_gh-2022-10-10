= Sage Days 31 Project Ideas =

<<TableOfContents>>

== HTML 5 backend ==
 * People: 
 * [[http://trac.sagemath.org/sage_trac/ticket/9471|#9471]]


== MathJax ==
 * People: Davide Cervone, Jason Grout
 * [[http://trac.sagemath.org/sage_trac/ticket/9774|#9774]]
 * From Nicolas Thiery:  would Mathjax be able to support pgf/tikz pictures?


== Notebook Logging ==
 * People:
 * Make it so the log files get rotated and compressed.  Support or use some standard tool.
 * Make it so log files contain something useful, and are configurable.

== Database: SQLite ==

 * People:

The following should *at a minimum* work with SQLite, since that is included with Sage and whatever we do needs to at least work standard with Sage with "zero configuration". 

 * Store all worksheets in a database
 * Store user configuration data in a table
 * Etc.

== Create a Robust Notebook "System" ==
 * People:
 * A script that starts a separate notebook process
 * It then starts monitoring the notebook to make sure it keeps running, and does a standard test (e.g., view published worksheet listing, login, create a worksheet, compute 2+2, delete worksheet, log out). 
 * If it doesn't respond after a preset amount of time with any test, does a configurable action, e.g.,:
     * kills and restarts the server
     * sends emails to the admins

== i18n ==
 * People:
 * port the internationalization patches ([[http://trac.sagemath.org/sage_trac/ticket/9428|#9428]]) to the new notebook

== Jmol Update ==
 * People: Jonathan Gutow
 * [[http://trac.sagemath.org/sage_trac/ticket/9238|#9238]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11078|#11078]]

== notebook to and from other formats ==
 * People: Rob Beezer, Bruce Cohen
 * sws2tex - see [[https://bitbucket.org/whuss/sws2tex/|its bitbucket site]]
 * sws2rst - see [[http://trac.sagemath.org/sage_trac/ticket/10637|#10637]]
 * rst to notebook - see [[http://trac.sagemath.org/sage_trac/ticket/11459|#11459]]

    * Note from Sébastien Labbé:  I would like to polish up and merge into Sage a script I wrote this winter to translate .rst files into notebook (txt) files. It is based on the file docHTMLProcessor.py which is part of the sage notebook.  Although, since there are always rumors that the Sage Notebook is changing, I did not push it any further and was waiting for the new version of the Notebook before. The script (rst2notebook) is available in the misc directory of the [[http://combinat.sagemath.org/hgwebdir.cgi/misc/file/ef17ccb37589/notebook2rst/|sage-combinat hg server]].

== The mysterious moving/disappearing text bug ==
 * People: Karl-Dieter Crisman
 * Find a reproducible one
 * Fix it

== Geogebra integration ==
 * People: Bruce Cohen
 * Confirm proof of concept at [[http://trac.sagemath.org/sage_trac/ticket/7489|#7489]]
 * Make some progress figuring out how to actually get it into Sage in new notebook

== Folders, Tags, Hierarchies ==
 * People: Rob Beezer
 * Provide organization to list of worksheets
 * Give worksheets identifiers that allow cross-worksheet links
 * [[http://groups.google.com/group/sage-notebook/browse_thread/thread/a973097dae8a8055|#7665]]
 * [[http://trac.sagemath.org/sage_trac/ticket/1496|#1496]]
 * R Beezer: I think there is at least one more ticket out there, using a Javascript tree library to do this, but I cannot find it.

== Sorting lists of worksheets ==
 * People: Rob Beezer
 * Sort lists of worksheets based on creation time, modified time, tag, alphabetical

== Various proposals for enhancements ==
 * People:
 * [[http://groups.google.com/group/sage-notebook/browse_thread/thread/a973097dae8a8055|sage-notebook Post]]

== Configure cell "skip-ahead" behavior ==
 * People: Rob Beezer
 * [[http://groups.google.com/group/sage-notebook/browse_thread/thread/3caa14df476d5a0e|sage-notebook Post]]

== Widget Infrastructure ==
 * People:
 * Create a general way to easily incorporate (Javascript) widgets, such as existing Tiny MCE editor and graph editor or rumored matrix editor, equation editor, function palette, etc
 * [[http://trac.sagemath.org/sage_trac/ticket/9585|#9585]] (Davide Cervone)

== Notebook Code Site Issues ==
 * People: William Stein (maintainer/owner)
 * [[http://code.google.com/p/sagenb/issues/list]]
