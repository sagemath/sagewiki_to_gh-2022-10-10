

# Sage 2.10.1

Sage 2.10.1 was released on 2 Feb 2008.  For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release.  

Michael Abshoff were the release managers for this Sage release. 

For the latest changes see <a class="http" href="http://www.sagemath.org/mirror/src/announce/sage-2.10.1.txt">sage-2.10.1.txt</a>. In addition to many bug fixes, integration of new packages, and speedups, we have the following cool new features.  This list is incomplete; see the release notes for more details. 

* Typeset output easily accessible in the notebook: There is now a checkbox at the top of each worksheet which enables or disables typeset output in the worksheet.  When the box is checked, new output is typeset.  When the box is unchecked, new output is returned in its usual form. 
* Graph isomorphism works for graphs containing multiple edges: The graph isomorphism testing has been extended to handle graphs with multiple edges.  
* Vertex objects: Arbitrary objects can now be associated with the vertices of a graph. 
* Tremendous speedups in evaluating functions: If a function is being used for plotting, an extremely fast version of the function is automatically used. 
* Plotting vectors now has several different options, including automatically plotting arrows if the vector is 2 or 3 dimensional and plotting a step function of the components for higher dimensions. 
* Showing lists of graphics: Now calling show() on a list will automatically tile the graphics in a customizable array.  Defaults for graphics plotted in a list can also be provided.  Try doing show(graphs(4)), for example, which nicely plots all undirected graphs on 4 vertices. 
* Unifying 2d and 3d graphics: You can mix 2d and 3d graphics together and the system handles the combination intelligently. 