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

==== Generic Installation ====

This installation would work in most situations. Though if you happen to be in one of the specific situations listed below, just jump to that section.

 * To install flipper, it should work out of the box with the following command (if you do not know how to open a command line, ask one of the organizer)
   {{{
   $ sage -pip install flipper --user
   }}}
   If the above command does not work, ask for help. If it does work, go to next step.
 * To install surface_dynamics and snappy you need a working version of gcc and g++ (that should be the case for most of you). The commands are similar to the one before
   {{{
   $ sage -pip install surface_dynamics --user
   $ sage -pip install snappy --user
   }}}
   Similarly, report any error or weird behavior.
 * Lastly, to install flatsurf, look at the instructions at https://github.com/videlec/sage-flatsurf

==== Mac OS X specifics ====

If you are using the binaries for Mac OS X, the computer might complain with `could not fetch URL ...`. In that situation, you can try the two following solutions

 1. You do have Xcode installed in which case you can recompile the Python shipped with Sage with SSL support with
 {{{
 $ sage -i openssl
 $ sage -f python2 
 }}}
 Then go back to the instructions "Installing flipper, snappy, flatsurf and surface_dynamics".

 2. The alternative to option 1 is to download each package independently:
  * [[https://files.pythonhosted.org/packages/1f/d2/549e874f7a66e03869207cb7e3a9d3d5789c5ee9d18990f1c869963b0a17/flipper-0.12.3.tar.gz|flipper-0.12.3.tar.gz]]
  * [[https://files.pythonhosted.org/packages/52/8d/9d27f127f159ac58f31a318c36a633d992b5f2430f0624a01910e3c1f5b6/surface_dynamics-0.4.0.tar.gz|surface_dynamics-0.4.0.tar.gz]]
  * [[https://files.pythonhosted.org/packages/69/16/8affdc4731004eee67413a24373544aca43688fae2698719378c9eafd9be/snappy-2.6.tar.gz|snappy-2.6.tar.gz]]
  * [[https://github.com/videlec/sage-flatsurf/archive/master.zip|master.zip]]
 and then install them via
 {{{
 $ sage -pip install flipper-0.12.3.tar.gz
 $ sage -pip install surface_dynamics-0.4.0.tar.gz
 $ sage -pip install snappy-2.6.tar.gz
 $ sage -pip master.zip
 }}}

==== Ubuntu >= 18.04 and Debian >= 8.0 packages ====

If you happen to have installed the packages `sagemath` and `sagemath-jupyter` from your package manager in Debian/Ubuntu then you would need to do
{{{
$ source /usr/share/sagemath/bin/sage-env
$ pip install flipper --user
$ pip install surface_dynamics --user
$ pip install snappy --user
}}}
For the installation of flatsurf, follows the instruction at https://github.com/videlec/sage-flatsurf and replace any instance of `sage -pip` by `pip`.

==== Archlinux ===

If you are a Archlinux and are using the packages `sagemath` and `sagemath-jupyter` from the package manager then do
{{{
$ pip install flipper --user
$ pip install surface_dynamics --user
$ pip install snappy --user
}}}
For the installation of flatsurf, follows the instruction at https://github.com/videlec/sage-flatsurf and replace any instance of `sage -pip` by `pip`.

== Organizers and participants ==

See [[http://www.fields.utoronto.ca/activities/18-19/sage-days|the Fields Institute webpage]].

== Link to Pad ==

At [[https://mensuel.framapad.org/p/sagedays96|this pad]], we will coordinate lunch and so on.
