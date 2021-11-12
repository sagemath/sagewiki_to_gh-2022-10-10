{{https://conda.io/docs/_images/conda_logo.svg||width=400px}}

[[https://conda.io/docs/|Conda]] packages for Linux & macOS are available through [[https://conda-forge.github.io/|conda-forge]].

= Setting Up =

In short: Install `sage` from [[https://conda-forge.org|conda-forge]].

 * Download and install [[https://github.com/conda-forge/miniforge/#mambaforge|Mambaforge]].
   i.e., open a Terminal,
     `curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-\$(uname)-\$(uname -m).sh`

     `sh Mambaforge-\$(uname)-\$(uname -m).sh`
 * Create a "sage" environment and pick a version of SageMath, i.e., open a new terminal and `mamba create -n sage sage=9.3`
 * To run SageMath, activate the environment you just created and run SageMath, i.e., `source activate sage` and `sage`

= Maintenance =

The packages necessary to run sage are developed on the github pages of conda-forge. The actual [[https://github.com/conda-forge/sage-feedstock/tree/master/recipe|sage package]] and many of its dependencies are maintained by Isuru Fernando (and a few volunteers).

= Conda for Sage Developers =

You can develop Sage without building any of its dependencies (experimental) --- on my machine this takes 5 minutes. Assume you obtained Sage source tree and changed to its root. 

{{{
$ export SAGE_NUM_THREADS=24 # or whatever the meaningful value for you is - no more than the number of cores.
$ conda install mamba
$ mamba create -n sage-build python=3.9 gettext autoconf automake libtool pkg-config
$ conda activate sage-build
$ ./bootstrap
$ mamba env update -n sage-build -f src/environment.yml
$ conda activate sage-build
$ ./configure --with-python=$CONDA_PREFIX/bin/python --with-system-gcc=force  --enable-download-from-upstream-url
$ pip install -v -v pkgs/sage-conf pkgs/sage-setup pkgs/sagemath-standard
$ sage -c 'print(version())'
SageMath version 9.2, Release Date: 2020-10-24
}}}

= Open Issues =

== General ==

To check whether there are known issues with Conda:

 * https://trac.sagemath.org/query?order=id&desc=1&summary=~conda

== Windows ==

There is likely not going to be a working package in the near future, see https://groups.google.com/d/msg/sage-devel/wyaV8x5qolI/jVS4DKBvCAAJ.
