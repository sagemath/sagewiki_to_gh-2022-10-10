goto [[Tips]]

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
Here a way to build only cantor ;)

 * First obtain the sources
svn co svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeedu/cantor

 * Replace the the content of cantor/CMakeLists.txt with this

<pre>
czzxc zxcz
</pre>


http://pastebin.com/m28be29f

 * Type this 4 commands:
 cd cantor
 mkdir build
 cd build
 cmake ../

 You can choose where to install with this param DCMAKE_INSTALL_PREFIX For example: 
 cmake -DCMAKE_INSTALL_PREFIX=/usr/ ../

 * Type this command

<code>
make install
</code>

= Using Sage with Cantor =
 * Worksheet managment ...
 *
 * 

= Links =
 * Official Site - http://edu.kde.org/cantor/ 
 * Author's Blog - http://arieder.wordpress.com/

----
Front-ends
