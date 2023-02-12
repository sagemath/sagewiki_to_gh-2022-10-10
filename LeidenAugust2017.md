

# Workshop on Algorithms in Number Theory and Arithmetic Geometry

This wiki is intended for projects related to <a href="/SageMath">SageMath</a> during the workshop _Algorithms in Number Theory and Arithmetic Geometry_ (Leiden, 31 July-4 August 2017). 

Workshop webpage: <a href="https://www.universiteitleiden.nl/en/events/2017/07/workshop-on-algorithms-in-number-theory-and-arithmetic-geometry">https://www.universiteitleiden.nl/en/events/2017/07/workshop-on-algorithms-in-number-theory-and-arithmetic-geometry</a> 

CoCalc project for discussion/coding sessions (not necessarily <a href="/SageMath">SageMath</a>-related): <a href="https://cocalc.com/projects/24e6bfa2-6cc4-425e-95e4-7a2c92ce446f/">https://cocalc.com/projects/24e6bfa2-6cc4-425e-95e4-7a2c92ce446f/</a> (please send an e-mail to <a href="mailto:P.J.Bruin@math.leidenuniv.nl">P.J.Bruin@math.leidenuniv.nl</a> to be added to this project) 


## Projects

* **Put your project here!** 
* Finish tickets related to $p$-adic fields from Sage Days 87 (<a href="https://wiki.sagemath.org/days87/projects">https://wiki.sagemath.org/days87/projects</a>) 
* Access new PARI functionality from <a href="/SageMath">SageMath</a> 
* Review open tickets (<a href="https://trac.sagemath.org/">https://trac.sagemath.org/</a>): 
      * Shioda invariants for hyperelliptic curves with genus 3: <a href="https://trac.sagemath.org/ticket/22173">https://trac.sagemath.org/ticket/22173</a> 
* <a href="/PariDevInSage">How to use PARI/GP development version inside Sage</a> 
* Update the <a href="/SageMath">SageMath</a> version of Denis Simon's GP scripts (<a href="http://www.math.unicaen.fr/~simon/">http://www.math.unicaen.fr/~simon/</a>) to the latest version 
* <a href="/SageMath">SageMath</a> 8.0 has now `sage.schemes.riemann_surfaces.riemann_surface.RiemannSurface` for numerical computation of period matrices. See August 1 presentation <a href="LeidenAugust2017/RiemannMatrixPresentation.ipynb">RiemannMatrixPresentation.ipynb</a>. Perhaps this is more easily viewed via the (slightly broken) <a class="https" href="https://nbviewer.jupyter.org/url/www.cecm.sfu.ca/%7Enbruin/Leiden_presentation.ipynb">https://nbviewer.jupyter.org/url/www.cecm.sfu.ca/%7Enbruin/Leiden_presentation.ipynb</a>. Integrate this code better into the rest of sage, e.g.: 
      * put a method on plane algebraic curves to get the corresponding Riemann surface? 
      * Improve the Gauss-Legendre integrator to compute the integration nodes in a more efficient way? 
      * There is already code to compute a $\mathbb{Z}$-basis for the endomorphism ring numerically. Perhaps support computations of isogenies as well? 
      * Make the Rosati involution available? 