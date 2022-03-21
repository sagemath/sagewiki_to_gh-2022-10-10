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

You can develop Sage without building any of its dependencies (experimental) --- on my machine this takes 5 minutes. Assume you obtained Sage source tree and changed to its root. These instructions have been updated for [[https://trac.sagemath.org/ticket/30845|#30845]]

{{{
$ export SAGE_NUM_THREADS=24                             # or whatever the meaningful value
                                                         # for your machine is - no more than 
                                                         # the number of cores.
$ conda install mamba

$ mamba create -n sage-build python=3.9 \
      gettext autoconf automake libtool pkg-config       # or replace 3.9 by another version

$ conda activate sage-build

$ ./bootstrap                                            # this generates src/environment.yml
                                                         # used in the next step

$ mamba env update -n sage-build -f src/environment.yml  # alternatively, use 
                                                         # src/environment-optional.yml 
                                                         # for some additional packages
$ conda activate sage-build

$ ./configure --with-python=$CONDA_PREFIX/bin/python             \
              --prefix=$CONDA_PREFIX                             \
              $(for pkg in $(./sage -package list :standard:     \
                               --has-file spkg-configure.m4      \
                               --has-file distros/conda.txt); do \
                    echo --with-system-$pkg=force;               \
                done)

$ pip install --no-build-isolation -v -v --editable pkgs/sage-conf pkgs/sage-setup 

$ pip install --no-build-isolation -v -v --editable src

$ sage -c 'print(version())'
SageMath version 9.6.beta5, Release Date: 2022-03-12
}}}

By using `pip install --editable`, the Sage library is installed in editable mode.
This means that when you only edit Python files, there is no need to rebuild the library; 
it suffices to restart Sage.

After editing any Cython files, rebuild by repeating the command
{{{
$ pip install --no-build-isolation -v -v --editable src
}}}

= Open Issues =

== General ==

To check whether there are known issues with Conda:

 * https://trac.sagemath.org/query?order=id&desc=1&summary=~conda

== Windows ==

There is likely not going to be a working package in the near future, see https://groups.google.com/d/msg/sage-devel/wyaV8x5qolI/jVS4DKBvCAAJ.
