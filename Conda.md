
![https://conda.io/docs/_images/conda_logo.svg](https://conda.io/docs/_images/conda_logo.svg) 

<a class="https" href="https://conda.io/docs/">Conda</a> packages for Linux & macOS are available through <a class="https" href="https://conda-forge.github.io/">conda-forge</a>. 


# Setting Up

In short: Install `sage` from <a class="https" href="https://conda-forge.org">conda-forge</a>. 

* Download and install <a class="https" href="https://github.com/conda-forge/miniforge/#mambaforge">Mambaforge</a>. 
      * i.e., open a Terminal, 
            * `curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-\$(uname)-\$(uname -m).sh` `sh Mambaforge-\$(uname)-\$(uname -m).sh` 
* Create a "sage" environment and pick a version of <a href="/SageMath">SageMath</a>, i.e., open a new terminal and `mamba create -n sage sage=9.3` 
* To run <a href="/SageMath">SageMath</a>, activate the environment you just created and run <a href="/SageMath">SageMath</a>, i.e., `source activate sage` and `sage` 
The above instructions are being added to the Sage documentation in <a href="https://trac.sagemath.org/ticket/33655">https://trac.sagemath.org/ticket/33655</a> 


# Conda for Sage Developers

You can develop Sage without building any of its dependencies (experimental) --- on my machine this takes 5 minutes. Assume you obtained Sage source tree and changed to its root. These instructions have been updated for <a class="https" href="https://trac.sagemath.org/ticket/30845">#30845</a> and are being added to the Sage installation guide in <a class="https" href="https://trac.sagemath.org/ticket/33426">#33426</a> 


```txt
$ export SAGE_NUM_THREADS=24                             # or whatever the meaningful value
                                                         # for your machine is - no more than 
                                                         # the number of cores.

$ conda install mamba                                    # This is a recommended optional step.
                                                         # If you skip it, replace "mamba" by
                                                         # "conda" in the following steps.

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
```
By using `pip install --editable`, the Sage library is installed in editable mode. This means that when you only edit Python files, there is no need to rebuild the library;  it suffices to restart Sage. 

After editing any Cython files, rebuild by repeating the command 
```txt
$ pip install --no-build-isolation -v -v --editable src
```

# More information

see <a href="https://trac.sagemath.org/wiki/Distribution#CondaAnacondaMinicondaCondaForge">https://trac.sagemath.org/wiki/Distribution#CondaAnacondaMinicondaCondaForge</a> 
