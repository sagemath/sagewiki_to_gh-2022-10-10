= Sage Days 96 =

Sage days 96 to be held at the Fields Institute for the program [[http://www.fields.utoronto.ca/activities/18-19/teichmuller|Teichmüller Theory and its Connections to Geometry, Topology and Dynamics]]. The schedule is available on the [[http://www.fields.utoronto.ca/activities/18-19/sage-days|Fields website]]. This wiki page will be updated with all documents relative to the workshop (worksheets, tutorials, demos, nice pictures, etc).

In order to assist to the workshop you are asked to come with your laptop (though you are also welcome without laptop). It would also be great if you could make sure that Sage is installed on it (see "Sage Installation" below).

== Worksheets ==

 * [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=intro.en.ipynb|Introduction]] with the picture [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=S_2_1.svg|S_2_1.svg]] to be downloaded in the same folder (the worksheet is also available as [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=intro.en.rst|intro.en.rst]] and [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=intro.en.pdf|intro.en.pdf]])
 * Programming
   * [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=chap1-first_steps.ipynb|Chapter 1: First steps]]
   * [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=chap2-list_and_for.ipynb|Chapter 2: List and for loops]]
   * [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=chap3-if.ipynb|Chapter 3: Conditionals if/elif/else]]
   * [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=chap4-functions.ipynb|Chapter 4: Functions]]
   * [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=chap5-while.ipynb|Chapter 5: While loops]]
   * [[https://wiki.sagemath.org/days96?action=AttachFile&do=get&target=chap6-advanced_exercises.ipynb|Chapter 6: Advanced exercises]]

== Sage Installation ==

The installation procedure depends on your operating system:

 * Ubuntu (versions >= 18.04) and archlinux: install the packages sagemath and sagemath-jupyter
 * gentoo: you can give a try to [[https://github.com/cschwan/sage-on-gentoo|sage on gentoo]]
 * all other systems (GNU/Linux, OSX, Windows): go to the [[http://www.sagemath.org/|main SageMath website]], go to the download section, choose a download server close to your location and download the Sage binary that corresponds to your operating system.
 * If you run GNU/Linux or OSX you can also try to compile the software from sources. The procedure is described [[http://doc.sagemath.org/html/en/installation/source.html|in the documentation]].

=== Installing flipper, snappy, flatsurf and surface_dynamics ===

These packages are installed through pip. Depending how you did install Sage you might run in different kind of complications.

 * To install flipper, it should work out of the box with the command line    (if you do not know how to open a command line, ask one of the organizer)
   {{{
   $ sage -pip install flipper --user
   }}}
   If the above command does not work you are in trouble, see with Vincent. If it does work, go to next step.
 * To install surface_dynamics and snappy you need a working version of gcc and g++ (that should be the case for most of you). The commands are similar
   {{{
   $ sage -pip install surface_dynamics --users
   $ sage -pip install snappy --user
   }}}
 * Lastly, to install flatsurf, look at the instructions at https://github.com/videlec/sage-flatsurf

== Organizers and participants ==

See [[http://www.fields.utoronto.ca/activities/18-19/sage-days|the Fields Institute webpage]].

== Link to Pad ==

At [[https://mensuel.framapad.org/p/sagedays96|this pad]], we will coordinate lunch and so on.
