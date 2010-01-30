goto [[main page]]

<<TableOfContents>>

= Cantor =

Cantor is a front-end for many mathematical software applications like Sage, Maxima, R and KAlgebra. Cantor belongs to [[http://edu.kde.org/|The KDE Education Project]] and lets you use your favorite mathematical applications from within a nice KDE-integrated Worksheet Interface. It offers assistant dialogs for common tasks and allows you to share your worksheets with others.

'''Cantor's main features are:'''
 * Nice Worksheet view for evaluating expressions
 * View of plotting results inside the worksheet or in a separate window
 * Easy plugin based structure to add different Backends
 * [[http://ghns.freedesktop.org/|GetHotNewStuff]] integration to upload/download example worksheets
 * Typesetting of mathematical formulas using LaTeX
 * Backend aware syntax highlighting
 * Plugin based assistant dialogs for common tasks (like integrating a function or entering a matrix)

= Install Cantor =
 * [[daysmarseille|Sage Days 20]] -- Marseille, France (February 22-26, 2010); theme: Combinatorics
 * [[http://www.fields.utoronto.ca/programs/scientific/09-10/sage/index.html|Sage Days 20.5]] -- Toronto, Canada (May 3-7, 2010); theme: Algebraic Combinatorics, 

Here a way to build only cantor ;)

1- First obtain the sources
... See More
svn co svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeedu/cantor

2- Replace the the content of cantor/CMakeLists.txt with this

http://pastebin.com/m28be29f

3- Type this 4 commands

cd cantor
mkdir build
cd build
cmake ../

You can choose where to install with this param DCMAKE_INSTALL_PREFIX
For example:
cmake -DCMAKE_INSTALL_PREFIX=/usr/ ../

4- Type this command

make install




= Using Sage with Cantor =
 * Worksheet managment ...
 *
 * 

= Links =
 * Official Site - http://edu.kde.org/cantor/ 
 * Author's Blog - http://arieder.wordpress.com/

----
Front-ends
