

## Introduction

The SAGE <a class="http" href="http://wiki.sagemath.org/graph">Graph Theory Project</a> aims to implement Graph objects and algorithms in <a href="/SAGE">SAGE</a>. 

The purpose of this survey is to compare currently existing Graph Database software.  I am looking for a substantially large database of graphs and their properties, so that users can query properties and efficiently obtain a list of graphs.  I am looking for programs as examples, to gather information, or to potentially wrap into our Graph Theory Package.  Recommendations are welcome.  Please note the section set aside for suggestions. 

Emily Kirkman is working on this project. 

[[_TOC_]] 


## Suggestions

* ??? 

## The Graph Database

* <a class="http" href="http://amalfi.dis.unina.it/graph/">Link</a> 
* Purpose: To provide standard test ground for benchmarking matching algorithims. 
* The graphs have been randomly generated according to six different generation models, each involving different possible parameter settings. As a result, 84 diverse kinds of graphs are contained in the database. Each type is represented by thousands of pairs of graphs for which an isomorphism or a graph-subgraph isomorphism relation holds, for a total of 143,600 graphs.  
* would have to fill dict's with our algorithms, but could use their graphs 
* seems free and open but no license info 

## Pygr

* <a class="http" href="http://www.bioinformatics.ucla.edu/pygr/">Link</a> 
* Pygr is an open source software project to develop graph database interfaces for the popular Python language, with a strong emphasis on bioinformatics applications ranging from genome-wide analysis of alternative splicing patterns, to comparative genomics queries of multi-genome alignment data. We have used Pygr successfully for many projects, but it is prerelease software! 
* might be interesting example, but won't be using the same properties 
* open source 

## GRACE

* <a class="http" href="http://comad2005.persistent.co.in/COMAD2005Proc/pages138-147.pdf">Paper</a> 
* <a class="http" href="http://osl.iiitb.ac.in/oslwiki/index.php/GRACE">Link</a> 
* GRACE is a database management system for managing data that is in the form of labeled undirected graphs.  GRACE introduces a new data model for graph data and a query language called Safari, which supports both attribute and structural searches. The users can add graphs to a database. The graphs can be retrieved based on their properties. The properties of a graph include the attributes associated with a graph and the structure of the graph.  
* appears free and open, but no license info 

## Mathematica Graph Database Package

* <a class="http" href="http://documents.wolfram.com/mathematica/Add-onsLinks/DatabaseLink/Examples/GraphDatabase/index.en.html">Link</a> 
* No info on how many graphs or how they were generated 
* Query-able properties include: graph, order, edges,vertex connectivity, edge connectivity, diameter, girth, number of spanning trees, spectrum length, is simple, is connected, is bipartite, is planar, is regular, is eulerian, is hamiltonian, is tree, is biconnected, is complete, is perfect, is self-complementary 

## MAGMA Graph Database and Graph Generation

* <a class="http" href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text1477.htm">Link</a> 
* A catalogue of strongly regular graphs is available. This catalogue has been put together from various sources by B. McKay and can be found <a class="http" href="http://cs.anu.edu.au/~bdm/data/">here</a>. Graphs in the database are indexed by a sequence of four parameters. They are, in order: the order of the graph, its degree, the number of common neighbours to each pair of adjacent vertices, and the number of common neighbours to each pair of non-adjacent vertices.  
* There link above gives BD McKay's catalogue, which list graphs by category: Simple, Eulerian, Strongly Regular, Ramsey, Hypohamilitonian, Planar 

## Combinatorial Catalogues

* <a class="http" href="http://people.csse.uwa.edu.au/gordon/data.html">Link</a> 
* These are also organized by type, and also (similar to MAGMA) in BD McKay’s graph6 and sparse6 format.  Nauty handles this format, but there is also an open source (no visible copyright or license) C program called readg available at this site.  It gives a couple of text format options:  list, adj matrix, edge list. 
* Here are the headings from Gordon Royle’s database: 
            * Small graphs  
            * Small multigraphs  
            * Cubic graphs  
            * Symmetric cubic graphs (Foster Census)  
            * Vertex-transitive graphs  
            * Cayley graphs (by group)  
            * Vertex-transitive cubic graphs  
            * Cubic Cages and higher valency cages  
            * Planar graphs  
            * Cubic Planar graphs (drawings!)  
            * Strongly regular graphs (parameters)  
            * Self-Complementary Graphs  
            * Constructions of Certain Graphs 

## Graph Database

* <a class="https" href="https://math.byu.edu/~grout/graphs/">Link</a> 
* Web application, query by property 
* will list query results in table next to pictures of graphs, sorted by number of nodes 
* can use  to check properties 
* 13,598 graphs in the database (run empty query) 
* free, but closed source 
Notes from the author (Jason Grout): 

Version 1 (as reviewed above): 

* Includes all graphs having 8 or fewer vertices. 
* Uses MySQL on the backend and PHP scripts to query the database. 
* Most data (graph parameters, subgraphs, etc.) in the first version was generated using a combination of the Mathematica Combinatorica package, Magma, Brendan McKay's pickg program with various options, custom C programs, and shell scripts to translate things into SQL INSERT statements. 
* Pictures were done using the graphviz software. 
* PHP scripts and SQL source available (and usable in SAGE) upon request. 
* Properties include degree sequence properties, spectrum properties, automorphism group properties, induced subgraph and forbidden subgraph properties, complements, standard graph invariants (girth, radius, clique number, connectivity, Eulerian, planar, perfect, etc.).  Each of these is query-able and displayable. 
* Main identifier is BD McKay's graph6 code. 
Version 2 (in progress and almost done as of January 2007): 

* Will include all graphs up through 9 vertices (288,266 graphs). 
* Data is being completely regenerated using Mathematica Combinatorica package, Magma, and other programs.  All programs used to do this are available upon request so they can be inspected for correctness. 
* Database is being moved to SQLite and/or PostgreSQL.  The web interface will probably remain much the same.  A standalone <a class="http" href="http://www.riverbankcomputing.co.uk/pyqt/">PyQT</a> front-end is also being developed (with GPL license by requirement of PyQT). 
* SQLite database and SQL source available (and usable in SAGE) upon request. 