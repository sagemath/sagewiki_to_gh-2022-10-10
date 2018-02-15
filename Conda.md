Experimental [[https://conda.io/docs/|Conda]] packages for Linux & OSX are available through [[https://conda-forge.github.io/|conda-forge]].

= Setting Up =

In short: Install `sage` from conda-forge.

To install sage on your machine (without the need for root permissions):

 * Install [[https://conda.io/miniconda.html|Miniconda for Python 3]] (Python 2 version fails to copy "Hängematte" which comes with rw)
 * export your `PATH` (and `hash -r` or `rehash`)
 * Make sure your locale is UTF-8.
 * Add the `conda-forge` channel: `conda config --add channels conda-forge`
 * Update all packages: `conda update --all` (otherwise you get weird errors due to inconsistencies later)
 * create an environment for sage: `conda create -n sage sagelib future`
 * enter your environment: `source activate sage`
 * enjoy: `sage`

= Development =

The packages necessary to run sage are developed on the github pages of conda-forge. The actual [[https://github.com/conda-forge/sage-feedstock/tree/master/recipe|sage package]] and many of its dependencies are maintained by Isuru Fernando (and a few volunteers).

= Open Issues =

== General ==
There are still some issues with Conda. Not all tests pass and some things don't work:
 * #20382
 * …

== MacOS ==
Packages do not exist yet. --(We are waiting for #12426 to get merged.)--

== Windows ==
There is likely not going to be a working package in the near future, see https://groups.google.com/d/msg/sage-devel/wyaV8x5qolI/jVS4DKBvCAAJ.
