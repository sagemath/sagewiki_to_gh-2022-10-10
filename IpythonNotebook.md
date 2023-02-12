
_**Do not edit this page; the discussion has been moved to the ticket <a class="https" href="https://trac.sagemath.org/ticket/29889">#29889</a>**_ 


## Missing features for ipython to work within sage

This page aims to list which features of the Sage notebook (sagenb) are missing in the ipython notebook (ipynb). For each point we should think whether it is possible to directly work upstream (U), or if it is a sage-specific task (S). 


### Single user

   * interoperability 
         * import and export .ipynb <-> .rst (U), **DONE**, see <a class="https" href="https://trac.sagemath.org/ticket/21514">#21514</a> and <a class="https" href="https://trac.sagemath.org/ticket/23416">#23416</a> 
         * import from .sws (or perhaps the current sws2rst is enough) (S) 
         * fetch and import sage notebooks from a http link to a html webpage. 
   * live documentation: the reference manual and tutorials can be accessed as if they are worksheets (S?U) **DONE**, see <a class="https" href="https://trac.sagemath.org/ticket/20690">#20690</a> 
   * packages 
         * zeromq, pyzmq should become standard spkg (S) **DONE**, see <a class="https" href="https://trac.sagemath.org/ticket/16455">#16455</a> 
         * include a mathjax spkg (instead of bulk stuff within sagenb spkg) and let ipynb point to it. (S) **DONE**, see <a class="https" href="https://trac.sagemath.org/ticket/17288">#17288</a> 
   * have a function that tells whether Sage is currently running ipython console, ipython notebook, sage notebook, sage cell. (S) 
   * have an option to launch ipynb with Sage preparsing without having to add the `%load_ext sage.misc.sage_extension` command. (S) (William: I think they more or less had something like this in 1.x, but removed any potential to do this sort of thing with 2.x, and when users complained refused to change it.  So we might have to fork or monkey patch the code slightly.) (Jason: it seems like we should be able to do this pretty easily with a custom profile.) **DONE**, see <a class="https" href="https://trac.sagemath.org/ticket/16996">#16996</a> 
   * have the equivalent of `automatic_names(True)` to automatically define undefined names as symbols. 
   * interact : 
         * adapt the @interact decorator to work with <a class="http" href="http://nbviewer.ipython.org/github/ipython/ipython/blob/2.x/examples/Interactive Widgets/Index.ipynb">ipython notebook interactive widgets</a> (S) 
         * or directly work with what is shipped with ipynb, without adding the @interact layer (which will need to be updated at each ipython improvement) (U) (William: but there is a LOT of code out there using @interact.) 
         * For what it is worth, I rewrote @interact from scratch for <a href="/SageMathCloud">SageMathCloud</a> in 3 days.  So it's not a huge amount of work adapting @interact to work with whatever framework.  
         * Jason Grout: I helped write the IPython widget framework, and tried to build in enough flexibility so it would be fairly straightforward to get the widgets working in Sage.  As a result, the Sage Cell server supports the framework and most of the widgets (though we're missing some of the client-side components some widgets assume, like bootstrap).  To support widgets, basically you'd need to write a compatibility layer emulating the lower-level IPython Comm infrastructure providing 2-way communication between python and javascript, and then write a much simpler emulator for the widgets on top of that.  This already is done for the Sage Cell server. 
   * plotting 
         * sagenb plots .png images, while ipynb prefers .svg images which can be nicely included within .ipynb (json) files (S); (William: this is a little misleading.  It's equally easy to get Sage to output png or svg with both 100% supported; also IPython is very good at embedding *both* png or svg files, where they embed the png's using some ascii embedding.  Sage just generates matplotlib plots behind the scenes, as does ipython.)  
         * can we import jmol within ipynb ? is it better to use 3D libs that work out of the box within ipython (e.g. matplotlib). See also <a class="http" href="http://trac.sagemath.org/ticket/16004">#16004</a> (S).  (William: I'm very unimpressed with mpl3d, even after 6 years of work.  Also, we have a huge amount of code to create 3d scenes, which wouldn't get rendered using mpl3d unless somebody wrote a renderer.)    
         * actually, very good interact and plotting libs already work with ipython (see for example <a class="https" href="https://github.com/ipython/ipython/wiki/A-gallery-of-interesting-IPython-Notebooks">this list</a>, so maybe should we just switch to them. (S) 
         * Jason Grout: Students and I have been working on an IPython widget-based solution to 3d plotting that wraps three.js and allows interactivity (e.g., picking points, dynamically changing attributes, textures, objects, etc.).  We have a basic framework done and we've also written a converter for Sage graphics.  See <a href="https://github.com/jasongrout/pythreejs">https://github.com/jasongrout/pythreejs</a>.  Part of the reason we've done this is because there is no good 3d render support for the IPython notebook. 

### Multi user

This should be developed within ustream, it is part of their plans (U) 

   * serve notebooks on the lan 
   * user management, account creation (Jason: I don't think they are planning to do much with this.  Last I knew, they were planning on just using the normal unix accounts for security, and relying on admins to create the necessary unix accounts) 
   * have all notebooks stored in a single place (per user), with possibility to manage and publish them 

### Fundamental Design Issues

List any fundamental design issues with IPython that people maybe don't notice at first glance, which are done much better/differently in the Sage notebook.  This should be a short list.  

   * If you start a calculation with output slowly appearing, then kill your browser and check back later, the output is not saved anywhere.    With sagenb (and <a href="/SageMathCloud">SageMathCloud</a>) the state of notebooks is saved in the server as well as the browser, whereas in IPython it exists only in the browser. 
   * IPython depends on Tornado -- we would have to include a whole new async server framework (much like twisted) in Sage.  This requires a package vote, thoughts about maintainability, etc.  (William: I think Tornado is the best easy-to-maintain Python option for an async web server, so I'm happy they use it.) (Thierry: tornado is now a standard spkg of Sage, the only missing packages are zeromq and pyzmq, which are optional spkgs). 
   * IPython depends on ZMQ -- we would also have to include that.  This is more nontrivial regarding maintenance, and build time. 
   * The Sage notebook used to cut the output when it was too long. In Jupyter this is not working nicely. A loop like 

```txt
while True:
    print('hello')
```
      * is likely to freeze the browser. Moreover, after killing the kernel it is impossible to load the worksheet because the output block became too long. All this used to work fine in the Sage notebook. 
   * In the Sage notebook it was possible to load a rst file. With Jupyter one first has to use the script `rst2ipynb` and then load the notebook. 

### Compatibility with rst format

* <a class="https" href="https://trac.sagemath.org/ticket/23361">#23361</a> 
* <a class="https" href="https://trac.sagemath.org/ticket/23362">#23362</a> 
* <a class="https" href="https://trac.sagemath.org/ticket/23401">#23401</a> 
* <a class="https" href="https://trac.sagemath.org/ticket/23415">#23415</a> 


---

 


### Using sagenb mathjax for ipynb (DEPRECATED, works out of the box)

Not completely related, but i put it here because it can be of some help. 

Mathjax is not shipped with ipynb, and the way to install it locally is <a class="http" href="http://ipython.org/ipython-doc/stable/install/install.html">to install it on the user's config directory</a>, which is not an optimal place for distribution. A quick workaround is to do a symlink from sagenb mathjax to user's ipython config dir (which i use in the sagedebianlive USB key). For this, open a shell as the user and type: 


```txt
IPYTHON_VERSION=$(sage -c 'from IPython import version_info ; print(".".join([str(i) for i in version_info[:-1]]))')
IPYTHON_STATIC_DIR="${HOME}/.sage/ipython-${IPYTHON_VERSION}/profile_default/static/"
mkdir -p ${IPYTHON_STATIC_DIR}
cd ${IPYTHON_STATIC_DIR}
ln -s ${SAGE_ROOT}/local/lib/python2.7/site-packages/sagenb-*.egg/sagenb/data/mathjax
```