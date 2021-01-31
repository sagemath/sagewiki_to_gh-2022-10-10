{{https://conda.io/docs/_images/conda_logo.svg||width=400px}}

[[https://conda.io/docs/|Conda]] packages for Linux & macOS are available through [[https://conda-forge.github.io/|conda-forge]].

= Setting Up =

In short: Install `sage` from [[https://conda-forge.org|conda-forge]].

 * Download the latest release of [[https://github.com/conda-forge/miniforge/#mambaforge|Mambaforge]], take the x86_64 one since not everything is packaged for ARM yet
 * Install Mambaforge, i.e., open a Terminal, `cd Downloads` and `sh Mambaforge-MacOSX-x86_64.sh`
 * Create a "sage" environment and pick a version of SageMath, i.e., open a new terminal and `mamba create -n sage sage=9.2`
 * To run SageMath, activate the environment you just created and run SageMath, i.e., `source activate sage` and `sage`

= Maintenance =

The packages necessary to run sage are developed on the github pages of conda-forge. The actual [[https://github.com/conda-forge/sage-feedstock/tree/master/recipe|sage package]] and many of its dependencies are maintained by Isuru Fernando (and a few volunteers).

= Conda for Sage Developers =

You can develop Sage without building any of its dependencies (experimental). On my machine this takes 5 minutes:

{{{
$ export SAGE_NUM_THREADS=24
$ conda install mamba
$ mamba create -n sage-build sage boost-cpp
$ conda activate sage-build
$ mamba uninstall --force sagelib
$ ./configure --prefix=$CONDA_PREFIX
$ cd src
$ python setup.py install
$ sage -c 'print(version())'
SageMath version 9.2, Release Date: 2020-10-24
}}}

= Open Issues =

== General ==

To check whether there are known issues with Conda:

 * https://trac.sagemath.org/query?order=id&desc=1&summary=~conda

== Windows ==

There is likely not going to be a working package in the near future, see https://groups.google.com/d/msg/sage-devel/wyaV8x5qolI/jVS4DKBvCAAJ.
