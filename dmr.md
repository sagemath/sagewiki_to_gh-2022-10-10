

## Dorian Raymer

email: deldotdr@gmail 

I am working on a notebook version of the SAGE Documentation. So far I have a navigable and evaluatable doc browser that can be launched from a sage notebook. The doc browser grabs a doc page from the <SAGE_ROOT>/doc/ directory and processes it so that the examples become evaluatable cells.  
 <a class="http" href="http://sage.math.washington.edu/home/deldotdr/doc-browser">doc-browser bundle</a> 

Some issues with the doc-browser: 

* Big pages take many seconds to load (try A guided Tour in the tutorial). I think the bottle-neck has something to do with the browser rendering. 
* some javascript-cell functionality (e.g. add_new_cell) breaks for examples contained within html tables; 
   * this occurs whenever an example is writen for a function within a class. 
  
 

**Other things:**  
 wiki-formated output of a sage notebook (a built in notebook function).  
 

* <a href="/dmr/notebookwiki">dmr/notebookwiki</a>: notebook wiki 
* <a href="/dmr/example">examples</a> 
<a href="/CategoryHomepage">CategoryHomepage</a> 
