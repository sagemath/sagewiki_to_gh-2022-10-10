

# Developing Python/Sage with Netbeans

Netbeans is a GUI development environment. The following instructions explain how to work on Sage, for Linux (Ubuntu 8.10, but should work everywhere (works on Mac OS 10.4)). It helps with coding, build and run still on command-line. Sometimes it just guesses things, but most of the time it is pretty smart and gives help for navigating around, completion of commands and more. 

written by <a href="mailto:harald.schilly@gmail.com">harald.schilly@gmail.com</a>, 2009-01-18 

2010-29-11: the following instructions do not teach netbeans how to deal with cython files, which implies you cannot run most sage scripts. 


## Benefits

* syntax highlighting and assistance 
* code completion (CTRL-SPACE) 
* corrects formatting (his probably dangerous, because it changes code-lines throughout the file and we would need a common definition to avoid diffs just for indents and newlines) 
* indexes python and all libraries, i.e. you get a list of all available classes, functions and methods, completion of partial identifiers and they also show you the help for each command. 
* press "CTRL" and click on the class or method name, and you it will jump to it's definition, perhaps opening the appropriate python file. 
* finds the usage of a method or class: right-click on it and "find usage" or CTRL-F7 
* lists all classes and methods in current file in a tree for easy navigation: menu: Window>Navigating>Navigator 
* refactoring: i.e. there is limited support (you have to go through all automatic changes in the preview) for renaming variables, classes, etc. 
* tasks: netbeans searches the source code for tokens that indicate open tasks and lists them ("TODO", etc.), in menu: Window > Tasks 
* mercurial support 
* (trac integration/interaction would possible) 

## Requirements

* <a class="http" href="http://www.netbeans.org/">Netbeans 6.5</a> 
* Python-Plugin 
      * Netbeans menu: Tools > Plugins, search for "Python", install 

## Setup


### Definitions

* SAGE_ROOT = root dir of Sage 
* NETBEANS_ROOT = root dir of netbeans 

### Instructions

These instructions are intended to use the Python version that ships with Sage. It's probably ok to just setup a new project using the system wide Python x.y.z. 

1. $NETBEANS_ROOT/bin/netbeans 
1. File > New Project - Python > with existing sources 
      * Name: "SageNetbeans" or what you like, save it in your $HOME dir 
      * Python platform: Manage - "New..." - select Python executable "$SAGE_ROOT/bin/python" (note: or "$SAGE_ROOT/local/bin/python") , name it "Python x.y.z Sage" 
      * select "Python x.y.z Sage" on the left, on the right in tab "Python Path" you can see the paths are in $SAGE_ROOT/local/lib/... (maybe click "auto detect" ?) (you can change this later in the project properties) 
1. next > source root folder: "$SAGE_ROOT/devel/sage/sage" - finish! 

### Note

* After first startup it has to scan and index all the Python stuff (progress indicator bottom right). This could take some minutes, so don't wonder why nothing works... 
* Personally, I'm not happy with the default GTK theme in ubuntu linux, therefore I have to change the look&feel settings: edit NETBEANS_ROOT/etc/netbeans.conf - in the "netbeans_default_options" variable, change add/change parameter "--laf javax.swing.plaf.metal.MetalLookAndFeel" to get the java specific metal look&feel (or what you want). 

## Mercurial

Netbeans supports Merucrial out of the box. Right-click on files in "File" window (Window>Files), see local diffs in a special diff window, commit changes, undo local changes. The Netbeans editor itself also supports nonlinear undos, right click on the left side of a highlighted change, see the diff, change only this part as in the local repository. 


## Trac Integration

It is theoretically possible to integrate Netbeans with Trac using <a class="http" href="http://code.google.com/p/cubeon/">Cube°n</a>. Maybe someone wants to look deeper into this ... 

* in netbeans, Tools > Plugins - Install "cube" (all of them) 
* <a class="http" href="http://code.google.com/p/cubeon/wiki/GSTracRepository">cube example for Trac repository integration in netbeans</a> 
* <a class="http" href="http://trac-hacks.org/wiki/XmlRpcPlugin">trac xmlrpc</a> remote xml procedures to interact with Trac. 

## Open Issues

* for some reason i don't know all files are marked as "ignored" by mercurial. 
* you have to build and start Sage still by hand ("./sage -br" on the command line), but it would be possible to select a python script to run in the project properties > run... 
* pyx/pxd are recognized as normal text-files 

## Further Info

* Install the "C/C++ Plugin" if you want to edit C/C++ files. 


---

 <a href="/DocumentationProject">DocumentationProject</a> 
