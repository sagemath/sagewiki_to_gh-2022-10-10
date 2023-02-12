

# Screenshots

Here are some screenshots: <a href="http://www.flickr.com/photos/sagescreenshots/sets/72157603532209437/">http://www.flickr.com/photos/sagescreenshots/sets/72157603532209437/</a> 


## About

If you want to help, immediately edit this page to say that you're working on one of these, then make a link to the requested screenshot (it can be a url link -- just post a url that goes to the screenshot; no special markup is needed).  

* Typesetting a solution to a cubic equation: 

```txt
  show(solve(x^3 + a*x + b == 0, x)[0])
```
* Used in console mode with the interactive debugger showing 
      * some sort of debugging traceback.  E.g.,   

```txt
  sage: %pdb
  Automatic pdb calling has been turned ON
  sage: EllipticCurve([0,0])
```
* Input showing a worksheet with cells being evaluated with %sagex, %magma, %gp, %python, etc. at the top. 
* An entire worksheet in matlab mode doing some basic things from the matlab tutorial (requires matlab).  Same for an octave worksheet, a gap worksheet, etc.  
* The SAGE notebook showing a plot (e.g., 

```txt
  show(plot(sin(x^2)+x, -pi,pi, hue=0.7, thickness=3))
```
* in each of safari, opera, and firefox, all on one os x desktop. 
* Plotting a mod-2 matrix using Martin Albrecht's function: 

```txt
sage: a = random_matrix(GF(2),500,600).echelon_form()
sage: a.visualize_structure()
```
* Using SAGE under Microsoft Windows via vmware (so a full screenshot that shows the vmware machine running and a web browser that interacts with the SAGE notebook). 
* Drawing a 3d plot of a the 5-dimensional cube in the SAGE notebook: 

```txt
show(graphs.CubeGraph(5).plot3d())
```
Also, do the same in 2d. 

* Using the interactive tutorial, e.g., visiting this page in SAGE: 

```txt
http://localhost:8000/doc_browser?/tut/?node11.html
```
* A screenshot showing five browser tabs each clearly having SAGE's running in them and visible tab having words that explains that one has tabbed browsing between worksheets, inherited from the web browser. 