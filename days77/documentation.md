

# Documentation tools: Sphinx, ...


## Autodoc

Jeroen worked on autodoc and partially "unforked" it. The Sage-specific fixes were kept, but sage_autodoc is now much closer to upstream than before. See <a href="http://trac.sagemath.org/ticket/20359">http://trac.sagemath.org/ticket/20359</a> 


## Upgrading to Sphinx 1.4

Robert worked on generating Sage docs with native Sphinx.  

This should bring: 

* native support parallelism 
* removal of some hacks for Cython support 
* ... 
Sphinx 1.4 now mostly works, but the merging of the final index breaks badly: <a href="http://trac.sagemath.org/ticket/18497">http://trac.sagemath.org/ticket/18497</a> 


## Getting rid of autogenerated .rst stub files

Goals: 

* simpler build system (no need to maintain essentially duplicate information) 
* more robust build w.r.t. deleting python files 
* cleaner, ... 
Robert started implementing the required features in Sphinx master 


## Multidoc

TODO: Florent: status report 

* Since 1.3, Sphinx can also read in parallel. 
* [robert] sphinx-build -j ${NUMBER_OF_SAGE_DOC_PACKAGES} should ideally have the same effect. 
* Original PR: <a href="https://bitbucket.org/birkenfeld/sphinx/pull-requests/108/wip-parallel-build-experimentation/diff">https://bitbucket.org/birkenfeld/sphinx/pull-requests/108/wip-parallel-build-experimentation/diff</a> 

## Analyzis of the memory footprint of Sphinx (Florent, Robert, Julien)

Analysis: 

* A large cache is kept in memory for autofunction and automethods. Since we only use automodule, it could be dropped once the docstring of the module is analysed (TODO Upstream). 
   * The cache is filled with all docstring encoded in UCS32. Some string are 3BM large. 
* Unpickling the environment and doctrees files takes anound 1.6GB that's what we might hope as a measure of peak memory consumption. 
* The parallel compiling doesn't seem to increase significantly the needed memory. 

## Jupyter notebook exporter for Sphinx

Robert pointed to preliminary work by Harald Schilly: <a href="https://github.com/sphinx-doc/sphinx/pull/2117">https://github.com/sphinx-doc/sphinx/pull/2117</a> 


## To be discussed with Robert:

* Error reporting of Sphinx when documenting API. How to locate the error.? 

## Random notes

* Discussion on "inspect" I do not get because I do not know what "inspect" is 
* This is time consuming: each time one has to rebuild the whole documentation. 
* Jeroen is concerned about images in the docs and build times. 

## Notes from Robert (Sphinx Dev)

TODO: merge with the above? 

I have visited the [1]Sage Days 77 in Cernay, France, this week to help them with their Sphinx setup. 

Sage is looking at adopting vanilla Sphinx; autodoc will be a big upstreamer for them, memory might be a show stopper. 

[2]Sage is a distribution of mathematical Python libraries (or "mathematics software system"), currently bundling Sphinx 2.2.x.  Their [3]documentation consists of ~200 plain text files and ~2000 [4]automodule stubs.  This brings a number of [5]interesting challenges. 

First off, they have their own [6]copy of autodoc to support a number of use cases around Cython and wrapped functions.  Since it diverged back around Sphinx 1.0, it is unclear what's required from our side. They have started [7]work to merge forward, and will then approach us with whatever extension points / improvements they'd need.  Most of these fixes should be useful in core Sphinx as well. 

They also have their [8]own poor man's parallelization (splitting up the documentation into multiple Sphinx projects and then building through make -j) based on sphinx-multidoc.  We have experimented with Sphinx's parallel build support, and it seems to give similiar speedups. 

Last but not least, they also have their own [9]copy of apidoc.  We agreed that plain sphinx-apidoc covers them well, with the caveat that it'd be a big advantage for them (and other projects, I believe) if they could spare the stub automodule files.  They suggested putting "automodule:" statements directly into the toctree, which I have a rough draft implementation of. 

Building their apidoc consumes 1.8G in memory for the doctrees alone. Their resource footprint peaks at 2.6G (or at 3+G with extensions enabled); doctrees are 200M in pickled format. I have filed some bugs with the results of our memory forensics.  There are a couple of caches that unnecessarily blow up the memory consumption ([10]<a href="/MemoryAnalyzer">MemoryAnalyzer</a>, [11]sys.modules, and probably linecache.) and quite a few opportunities to reduce the doctree in-memory blowup (see [12]#2426 for Text nodes.) 

I can only recommend other Sphinx developers (to be) to visit user projects like this.  It is a valuable learning opportunity for us. 
