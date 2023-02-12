

# Sage Days 96


## August 13-16 2018

Sage days 96 to be held at the Fields Institute for the program <a class="http" href="http://www.fields.utoronto.ca/activities/18-19/teichmuller">Teichmüller Theory and its Connections to Geometry, Topology and Dynamics</a>. The schedule is available on the <a class="http" href="http://www.fields.utoronto.ca/activities/18-19/sage-days">Fields website</a>. This wiki page will be updated with all documents relative to the workshop (worksheets, tutorials, demos, nice pictures, etc). 

In order to assist to the workshop you are asked to come with your laptop (though you are also welcome without laptop). It would also be great if you could make sure that Sage is installed on it (see "Sage Installation" below). 

Workshop dinner on thursday (Sky Dragon on Dundas and Spadina). 

[[_TOC_]] 


## Worksheets

* <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=intro.en.ipynb">Introduction</a> with the picture <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=S_2_1.svg">S_2_1.svg</a> to be downloaded in the same folder (the worksheet is also available as <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=intro.en.rst">intro.en.rst</a> and <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=intro.en.pdf">intro.en.pdf</a>) 
* Programming 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=chap1-first_steps.ipynb">Chapter 1: First steps</a> 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=chap2-list_and_for.ipynb">Chapter 2: List and for loops</a> 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=chap3-if.ipynb">Chapter 3: Conditionals if/elif/else</a> 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=chap4-functions.ipynb">Chapter 4: Functions</a> 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=chap5-while.ipynb">Chapter 5: While loops</a> 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=chap6-advanced_exercises.ipynb">Chapter 6: Advanced exercises</a> 
* Thematic tutorials 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=floating_point_and_stability.ipynb">Floating point and stability</a> 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=random_walk.ipynb">Simple random walk on Z</a> 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=CollatzConjecture.ipynb">Collatz conjecture</a> 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=Dictionaries-GraphTheory.ipynb">Python dictionaries and graph theory</a> (you also need to download the images <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=euler.png">euler.png</a> and <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=graph0.png">graph0.png</a>) 
      * <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=Strings-BWT.ipynb">The Burrows-Wheeler transform</a> 
* <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=flipper_tutorial.pdf">flipper tutorial</a> (for the last exercises you will need <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=flipper_nf_conversion.py">flipper_nf_conversion.py</a>) 
* <a class="https" href="https://wiki.sagemath.org/days96?action=AttachFile&amp;do=get&amp;target=Fields-2018-flatsurf_and_surface_dynamics_demo.ipynb">flatsurf and surface_dynamics demo</a>. 

## Participant projects

Projects for the week 

Projects that were done during the week: 

* Aaron (Toronto) 
   * use flatsurf to improve old code 
   * given a triangulated flat surface and a direction, find a representation as the suspension of an IET 
   * shear coordinates of hyperbolic surfaces 
* Ali (Teheran) 
   * given a flat surface, compute the algebraic equation of the underlying Riemann surface 
   * given a triangulated quadratic differential, decide if it admits a Strebel direction. 
   * equations for covers of Riemann surfaces (and for quotients!) 
   * rewrite code that was previously done in Mathematica (because Sage is <a href="/OpenSource">OpenSource</a>) 
* Anja (Toronto) 
   * study some infinite iet on [0,1] with rational discontinuities 
   * order of certain periodic IET's presented in nice way 
* Chris (Indiana) 
   * find the Iso-Delaunay decomposition (in L^2) of Teichmüller discs 
   * collect evidence the Iso-Delaunay decomposition (in L^2) of Q(S) - are the "cells" contractible? 
* Ian (Toronto) 
   * Delaunay problem: Given a triangulated quadratic differential, compute the L^infinity Delaunay triangulation 
   * Build the horocycle automaton. (Saul: Once you have the veering automaton, you just need to find the horocyclic edges....) 
   * Build all of the veering automata for strata of dimension at most four. 
* Rex (Toronto) 
   * work with homogeneous spaces (integration over H^2 / Gamma and possibly working in higher rank) 
* Saul (Warwick) 
   * layout problem: given a triangulated quadratic differential, draw it (ie unfold the triangulation in the plane without crashes) 
   * automate producing automata - how can we lay out the graphs in a sensible fashion?  What are their automorphisms? 
* Ser-Wei 
   * redo some old examples in Sage 
   * Suppose that D is a (Veech!) Teichmuller disk in M_{0,5}.  Fix \tau a track that carries all of the boundary laminations for D.  What is the image of \bdy D in P(\tau) (the polytope of projectivised measured laminations)?  Draw it in Sage! 
* Vincent (Bordeaux) 
   * given a translation surface, decompose the vertical into components 
   * given a stratum Q(\kappa) find a geometric veering triangulation in it. (aka a seed for the automaton) -> done!! 
   * given a geometric veering triangulation, decide if it is regular or not. 
   * generate cylinder diagrams for quadratic differentials 
   * layout of surface, loaded from flipper 
* Adriano (Toronto), Christine (New York), Dan (Toronto), Derrick (Toronto), Paul (Oklahoma), Pratyush (Yale), Yvon (Toronto) 
   * worksheets 

## Sage Installation

The installation procedure depends on your operating system: 

* Debian (versions >= 9.0) and Ubuntu (versions >= 18.04): install the packages `sagemath`, `sagemath-doc-en` and `sagemath-jupyter` 
* archlinux: install the packages `sagemath`, `sagemath-doc` and `sagemath-jupyter` 
* gentoo: you can give a try to <a class="https" href="https://github.com/cschwan/sage-on-gentoo">sage on gentoo</a> 
* all other systems (GNU/Linux, OSX, Windows): go to the <a class="http" href="http://www.sagemath.org/">main SageMath website</a>, go to the download section, choose a download server close to your location and download the Sage binary that corresponds to your operating system. 
* If you run GNU/Linux or OSX you can also try to compile the software from sources. The procedure is described <a class="http" href="http://doc.sagemath.org/html/en/installation/source.html">in the documentation</a>. 

### Installing flipper, snappy, flatsurf and surface_dynamics

We will be interested in these Sage days to four Python-Sage modules that provide many tools to work with surfaces and 3-dimensional manifolds 

* <a class="http" href="http://flipper.readthedocs.io/en/latest/">flipper</a>: mapping classes (homeomorphisms of surfaces) 
* <a class="https" href="https://github.com/videlec/sage-flatsurf">flatsurf</a>: translation surfaces (affine transformation, linear flow, etc) 
* <a class="http" href="http://www.labri.fr/perso/vdelecro/flatsurf_sage.html">surface_dynamics</a>: interval exchange transformations, origamis and more 
* <a class="https" href="https://www.math.uic.edu/t3m/SnapPy/">snappy</a>: 3-d hyperbolic geometry 
These packages are installed through pip. Depending how you did install Sage you might run in different kind of complications. 


#### Generic Installation

This installation would work in most situations. Though if you happen to be in one of the specific situations listed below, just jump to that section. 

* To install flipper, it should work out of the box with the following command (if you do not know how to open a command line, ask one of the organizer) 
      * ```txt
   $ sage -pip install flipper --user
   
```If the above command does not work, ask for help. If it does work, go to next step. 
* To install surface_dynamics and snappy you need a working version of gcc and g++ (that should be the case for most of you). The commands are similar to the one before 
      * ```txt
   $ sage -pip install surface_dynamics --user
   $ sage -pip install snappy --user
   
```Similarly, report any error or weird behavior. 
* Lastly, to install flatsurf, look at the instructions at <a href="https://github.com/videlec/sage-flatsurf">https://github.com/videlec/sage-flatsurf</a> 

#### Mac OS X specifics

If you are using the binaries for Mac OS X, the computer might complain with `could not fetch URL ...`. In that situation, you can try the two following solutions 

1. You do have Xcode installed with the command line tools. In this case you can recompile the Python shipped with Sage with SSL support with ```txt
 $ sage -i openssl
 $ sage -f python2 
 
```Then go back to the instructions "Installing flipper, snappy, flatsurf and surface_dynamics". 
1. The alternative to option 1 is to download each package independently: 
   * <a class="https" href="https://files.pythonhosted.org/packages/1f/d2/549e874f7a66e03869207cb7e3a9d3d5789c5ee9d18990f1c869963b0a17/flipper-0.12.3.tar.gz">flipper-0.12.3.tar.gz</a> 
   * <a class="https" href="https://files.pythonhosted.org/packages/52/8d/9d27f127f159ac58f31a318c36a633d992b5f2430f0624a01910e3c1f5b6/surface_dynamics-0.4.0.tar.gz">surface_dynamics-0.4.0.tar.gz</a> 
   * <a class="https" href="https://files.pythonhosted.org/packages/69/16/8affdc4731004eee67413a24373544aca43688fae2698719378c9eafd9be/snappy-2.6.tar.gz">snappy-2.6.tar.gz</a> 
   * <a class="https" href="https://github.com/videlec/sage-flatsurf/archive/master.zip">master.zip</a> and then install them via ```txt
 $ sage -pip install flipper-0.12.3.tar.gz
 $ sage -pip install surface_dynamics-0.4.0.tar.gz
 $ sage -pip install snappy-2.6.tar.gz
 $ sage -pip master.zip
 
```

#### Ubuntu 16.04 with ppa

If you run Ubuntu 16.04 and you install Sage with the ppa then do 
```txt
$ sage -sh
(sage-sh)$ pip install flipper --user
(sage-sh)$ pip install surface_dynamics --user
(sage-sh)$ pip install snappy --user
(sage-sh)$ exit
```
(The `sage -sh` command brings you to a special environment where you have access to Sage Python) 


#### Ubuntu >= 18.04 and Debian >= 8.0 packages

If you happen to have installed the packages `sagemath` and `sagemath-jupyter` from your package manager in Debian/Ubuntu then you would need to do 
```txt
$ source /usr/share/sagemath/bin/sage-env
$ pip install flipper --user
$ pip install surface_dynamics --user
$ pip install snappy --user
```
For the installation of flatsurf, follows the instruction at <a href="https://github.com/videlec/sage-flatsurf">https://github.com/videlec/sage-flatsurf</a> and replace any instance of `sage -pip` by `pip`. 


#### Archlinux

Do 
```txt
$ sage -sh
(sage-sh)$ pip2 install flipper --user
(sage-sh)$ pip2 install surface_dynamics --user
(sage-sh)$ pip2 install snappy --user
(sage-sh)$ exit
$
```
For the installation of flatsurf, follows the instruction at <a href="https://github.com/videlec/sage-flatsurf">https://github.com/videlec/sage-flatsurf</a> and replace any instance of `sage -pip` by `pip`. 


### Windows

Before following the generic instruction do 
```txt
(sage-sh) $ apt-cyg install libcrypt-devel
(sage-sh) $ apt-cyg install liblapack-devel
```

## Organizers and participants

See <a class="http" href="http://www.fields.utoronto.ca/activities/18-19/sage-days">the Fields Institute webpage</a>. 


## Questions and answers

**Saul**: Why does snake_case have that name?   
 **Vincent**: See the discussion here - <a href="https://en.wikipedia.org/wiki/Snake_case">https://en.wikipedia.org/wiki/Snake_case</a>. 

**Derrick**: If I'm running Sage on a Windows installation, how to I make Jupyter launch in the correct directory?   
 **Derrick**: [question 41348 on ask](<a href="https://ask.sagemath.org/question/41348/sagemath-windows-81-launching-jupyter-from-another-directory-or-drive/">https://ask.sagemath.org/question/41348/sagemath-windows-81-launching-jupyter-from-another-directory-or-drive/</a>) 

**Aaron**: Does Python have a built-in way to iterate over the product of two iterators that don't necessarily terminate?   
 **Vincent**: No, but Sage does have a [cantor_product](<a href="https://doc.sagemath.org/html/en/reference/misc/sage/misc/mrange.html">https://doc.sagemath.org/html/en/reference/misc/sage/misc/mrange.html</a>). Example: 
```python
P = sage.misc.mrange.cantor_product(NN, repeat=2)
for _ in range(10):
    print(next(P))
```
produces (0, 0), (1, 0), (0, 1), (2, 0), (1, 1), (0, 2)... Although the feature isn't documented, iterating up to (0, n) only requires n calls to `NN.next()`. 

**Rex**: Let L be a list. To get a new list K with the elements of L in reverse order, we can write K = L[::-1] What is each the colons and the -1 telling Sage to do exactly?   
 **Vincent**: These are [Python slices](<a href="https://docs.python.org/2.3/whatsnew/section-slices.html">https://docs.python.org/2.3/whatsnew/section-slices.html</a>) 

**Aaron**: How do we specify a quadratic differential?   
 **Vincent**: triangulated surface, where the lengths live in some arithmetic.  (Floating point numbers are not numbers!) 

**Saul**: is there a way to start with floating point surface, and quickly rule out "small" components (eg no short cylinders)? 

**Rex**: I'm running something that's printing a list of integers as it runs. Is there any way to tell Sage to truncate the old output (I'm only interested in seeing how far it has gone along)?   
 **Vincent**: If you do 
```txt
from IPython.display import clear_output
```
then you can use the function `clear_output()` to remove everything in the output. Though this slows down a lot the computation. 

The following previous answer does not work (in Jupyter) 
```txt
from sys import stdout
from time import sleep
stdout.write('hello\r')
sleep(1)   # wait for 1 sec
stdout.write('bouh \r')
sleep(1)   # wait for 1 sec
stdout.write('next \r')
```
The character '\r' means carriage return and go back the the begining of the line so that you can erase what you just wrote. But with this method, it only works with one line being updated. 

**Rex**: Do different packages ever have any dependencies such that uninstalling one package causes problems for others? For example, if I uninstall flipper at some later point in time (say to reinstall an updated version), could this cause issues with other packages that might rely on flipper?   
 **Saul**: Yes, this could happen.  Package management is tricky. 

**Rex**: Also, is there a simpler way to update a package than uninstalling and reinstalling it?   
 **Saul**:Something like  
```txt
pip install <PACKAGE> --user --upgrade 
```

## Troubles and bug reports


### SageMath documentation on archlinux

operating system: archlinux sage version: 8.2 installation: from the package manager pacman problem: the documentation with the question mark is not working properly in the console. This has been reported to <a href="https://bbs.archlinux.org/viewtopic.php?id=239525">https://bbs.archlinux.org/viewtopic.php?id=239525</a> 


### Archlinux pip installation problem

The local installation (done via "pip install X --user") are different within Sage and within Python Namely 
```txt
$ pip2 install X --user
$ sage -sh -c "pip2 install X --user"
```
The reason is that PYTHONUSERBASE is set by sage-env before Sage is launched. A patch has been sent to Antonio Rojas (who is the maintainer). And it is now solved! 


### Misleading comment in cygwin version

Reported at <a href="https://groups.google.com/forum/#!topic/sage-devel/wdjj8ur5m9c">https://groups.google.com/forum/#!topic/sage-devel/wdjj8ur5m9c</a> 


### Numbering mismatch in surface_dynamics

Rex: the labeling of the square tiles in an origami is mismatched with the labelings of the vertices in its associated graph. The squares start with 1,2,3,... but the graph vertices begin with 0,1,2,... 


### Documentation requests

The example for Graph.vertex_cover makes it look like the method outputs a plot of the graph with the vertex cover colored. <a href="https://doc.sagemath.org/html/en/reference/graphs/sage/graphs/graph.html#sage.graphs.graph.Graph.vertex_cover">https://doc.sagemath.org/html/en/reference/graphs/sage/graphs/graph.html#sage.graphs.graph.Graph.vertex_cover</a> 

There's no unambiguous description of what the <a href="/EllipticCurve">EllipticCurve</a> constructor does. <a href="https://doc.sagemath.org/html/en/constructions/elliptic_curves.html">https://doc.sagemath.org/html/en/constructions/elliptic_curves.html</a> 

The documentation for installing Sage packages under Windows is very misleading. The page 

         * <a href="https://wiki.sagemath.org/SageWindows">https://wiki.sagemath.org/SageWindows</a> 
opens with the sentence, "The major known caveat to the current version of the <a href="/SageMath">SageMath</a> Windows install is that it is not currently possible to install Sage optional packages," with no indication that it is possible to install Sage pip packages. The Windows Sage shell has a similarly misleading warning: "Do not use this for installing Sage packages using 'sage -i' ", with no indication that sage pip is usable. 

The documentation for flatsurf.<a href="/TranslationSurface">TranslationSurface</a>.delaunay_single_join is somewhat lacking. 


## Link to Pad

We used to coordinate using a pad on <a href="https://mensuel.framapad.org/">https://mensuel.framapad.org/</a> that is now closed. 
