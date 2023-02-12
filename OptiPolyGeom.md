

# A Roadmap for Optimization and Polyhedral Geometry softwares interactions


## (around Sage, (PyQ)Normaliz, SCIP, e-antic, Polymake, and others)

This page is being moved to <a href="https://trac.sagemath.org/wiki/SagePolyhedralGeometry">https://trac.sagemath.org/wiki/SagePolyhedralGeometry</a> 


## Progress Report Timeline


### August 2019

Here are improvements realized up to the Sage Days 100 in Bonn 


#### Sage

The following are quite advanced and many are under review: 

* Implement is_pyramid, is_bipyramid, is_prism for polytopes <a class="https" href="https://trac.sagemath.org/ticket/27689">#27689</a> 
* Implement wedge over a face of Polyhedron <a class="https" href="https://trac.sagemath.org/ticket/27973">#27973</a> 
* Implement center of a <a href="/HyperplaneArrangement">HyperplaneArrangement</a> <a class="https" href="https://trac.sagemath.org/ticket/28245">#28245</a> 
* Normal cone of faces of polyhedra <a class="https" href="https://trac.sagemath.org/ticket/17215">#17215</a> 
* Implement facets method for Polyhedron <a class="https" href="https://trac.sagemath.org/ticket/27974">#27974</a> 
* ehrhart_polynomial should be made available for polytopes defined over QQ <a class="https" href="https://trac.sagemath.org/ticket/18957">#18957</a> 
* Fixed: bug in polyhedron over RDF <a class="https" href="https://trac.sagemath.org/ticket/24877">#24877</a> 
* Fixed: Make outer normal fans readily available <a class="https" href="https://trac.sagemath.org/ticket/27993">#27993</a> 
* Fixed: py3: polyhedron folder with optional packages <a class="https" href="https://trac.sagemath.org/ticket/28235">#28235</a> 
* Fixed: Move rational methods of the backend normaliz to the `_QQ` class <a class="https" href="https://trac.sagemath.org/ticket/28240">#28240</a> 
* Fixed: add .is_self_dual method for polytopes <a class="https" href="https://trac.sagemath.org/ticket/28256">#28256</a> 
* Fixed: Add .boundary_complex() method for simplicial polytopes <a class="https" href="https://trac.sagemath.org/ticket/28248">#28248</a> 
* Fixed: repr of <a href="/NumberFields">NumberFields</a> (the parents) should indicate its embedding if there is one <a class="https" href="https://trac.sagemath.org/ticket/21161">#21161</a> 
The following tickets have been created and should be worked on: 

* Thematic Tutorial on algebraic polytopes in Sage using Normaliz <a class="https" href="https://trac.sagemath.org/ticket/28230">#28230</a> 
* Add the 0/1-hypercube to the library of polytopes <a class="https" href="https://trac.sagemath.org/ticket/28247">#28247</a> 

### April/May 2019

Here are improvements realized during the Research in Pairs at MFO 


#### Sage

The following are quite advanced and many are under review: 

* upgrade normaliz to 3.7.2, pynormaliz to 2.5 <a class="https" href="https://trac.sagemath.org/ticket/27731">#27731</a> 
* Almost done with repr of <a href="/NumberFields">NumberFields</a> (the parents) should indicate its embedding if there is one <a class="https" href="https://trac.sagemath.org/ticket/21161">#21161</a> 
* Adjust the new features of the normaliz backend to the latest version <a class="https" href="https://trac.sagemath.org/ticket/25091">#25091</a> 
* Algebraic polytopes now under review <a class="https" href="https://trac.sagemath.org/ticket/25097">#25097</a> 
* Add the H4 polytopes and generalized permutahedron to the library of polytopes <a class="https" href="https://trac.sagemath.org/ticket/27760">#27760</a> 
* Create a variant of the polymake interface using polymake's callable library (polymake::Main) via <a href="/JuPyMake">JuPyMake</a> <a class="https" href="https://trac.sagemath.org/ticket/22704">#22704</a> 
* Add Perles and irrational polytopes to library <a class="https" href="https://trac.sagemath.org/ticket/27728">#27728</a> 
* Fixed: Upgrade polymake to version 3.4 (current interface breaks) <a class="https" href="https://trac.sagemath.org/ticket/24905">#24905</a> 
* Fixed: upgrade normaliz to 3.7.1, pynormaliz to 2.1 and package e-antic <a class="https" href="https://trac.sagemath.org/ticket/27682">#27682</a> 
* Fixed: Refactor backend_normaliz <a class="https" href="https://trac.sagemath.org/ticket/27716">#27716</a> 
* Fixed: Polytope snub_cube should allow exact coordinates <a class="https" href="https://trac.sagemath.org/ticket/26340">#26340</a> 
* Fixed: number_field_elements_from_algebraics should create embedded number field elements <a class="https" href="https://trac.sagemath.org/ticket/20181">#20181</a> 
* Fixed: The attribute _vector of H and V representation is exposed <a class="https" href="https://trac.sagemath.org/ticket/27709">#27709</a> 
* Fixed: Remove old deprecation warning of Minkowski -> minkowski <a class="https" href="https://trac.sagemath.org/ticket/27722">#27722</a> 
* Fixed: Upgrade LiDIA to v2.3.0+latte-patches-2019-05-01 <a class="https" href="https://trac.sagemath.org/ticket/27746">#27746</a> 
* Fixed: <a href="/PolymakeElement">PolymakeElement</a>._sage_: Handle polymake type Polyhedron <a class="https" href="https://trac.sagemath.org/ticket/27742">#27742</a> 

#### PyNormaliz

* Update PyQNormaliz by adding lattice points, integer hull and volume 
* Removal of instabilities (Memory corruption etc.) 
* Added functions 
* Added test framework 
* Interfacing the new Normaliz features 
* Adjustment for Sage signal handling 
* Several improvements to <a href="/JuPyMake">JuPyMake</a> 
* Test implementation of polymake interface for python in cython 
* Alpha implementation of Normaliz.jl, a julia interface to Normaliz, to be used in OSCAR and GAP. 

#### Normaliz

* Inclusion of the computation of automorphism groups for general polytopes and cones, also for algebraic polytopes and cones.  
* Various types of automorphism groups can be computed: combinatorial, rational, integral and (for algebraic data) algebraic.  
* Efficient exploitation of the automorphism group in polyhedral computations has been realized for volumes, Hilbert bases and lattice points in polytopes.  
* Three new releases of Normaliz, namely 3.7.1, 3.7.2 and 3,7.3, that have repared several small bugs and improved weak points.  
* The API libnormaliz has been restructured and enriched by the accessibility of the output function. 

### April 2018


#### Sage

Here are improvements realized during the Coding Sprints at the IMA in Minneapolis to objects related to polyhedron in Sage: 

* Make features of normaliz accessible <a class="https" href="https://trac.sagemath.org/ticket/25091">#25091</a> 
* `number_field_elements_from_algebraics` should create embedded number field elements <a class="https" href="https://trac.sagemath.org/ticket/20181">#20181</a> <a class="https" href="https://groups.google.com/forum/#!topic/sage-devel/iy72Q_EKKFs">Sage-devel discussion</a> 
* Helper functions and improvements in the normaliz backend <a class="https" href="https://trac.sagemath.org/ticket/25097">#25097</a> 
* Improve the output of repr_pretty for Polyhedron <a class="https" href="https://trac.sagemath.org/ticket/24837">#24837</a> 
* Construct <a href="/RationalPolyhedralFan">RationalPolyhedralFan</a> from possibly overlapping cones <a class="https" href="https://trac.sagemath.org/ticket/25122">#25122</a> 
* polygon3d ignores the "alpha" (and equivalent "opacity") argument <a class="https" href="https://trac.sagemath.org/ticket/25095">#25095</a> 
* <a href="/PolyhedralComplex">PolyhedralComplex</a>: preliminary implementation, see <a class="https" href="https://trac.sagemath.org/ticket/20877">#20877</a> 
* Fixed: Change error message in construction of polyhedron object <a class="https" href="https://trac.sagemath.org/ticket/24835">#24835</a> 
* Fixed: Update normaliz 3.5.3 and pynormaliz 1.12 in Sage. <a class="https" href="https://trac.sagemath.org/ticket/22984">#22984</a> 
* Fixed: Thematic tutorial on polyhedron in Sage <a class="https" href="https://trac.sagemath.org/ticket/22572">#22572</a> 
* Fixed: Implement stacking onto a face of a polyhedron <a class="https" href="https://trac.sagemath.org/ticket/24847">#24847</a> 
* Fixed: Implement join of polytopes <a class="https" href="https://trac.sagemath.org/ticket/24848">#24848</a> 
* Fixed: Implement one point suspension and face split of polyhedron <a class="https" href="https://trac.sagemath.org/ticket/24886">#24886</a> 
* Fixed: The polar of a polyhedron should carry the backend used <a class="https" href="https://trac.sagemath.org/ticket/25081">#25081</a> 

#### (Q)Normaliz

<a href="http://normaliz.uni-osnabrueck.de">http://normaliz.uni-osnabrueck.de</a> 

* Upgrade normaliz to 3.5.4 and pynormaliz to 1.16 <a class="https" href="https://trac.sagemath.org/ticket/25090">#25090</a>: Ehrhart series and triangulation of polytope also for inhomogeneous input 
* Algebraic polytopes in Qnormaliz using e-antic <a class="https" href="https://trac.sagemath.org/ticket/25097">#25097</a>: convex hull computation completed, improvement of Qnormaliz input and output, control of interrupts and parallelization via libQnormaliz, lattice points, integer hull and volume added. Qnormaliz should be essentially complete now. 
* General getters for cone properties. The getters can be used in future interfaces to make access to Normaliz cone properties easier 
* resetGrading method for cone: Can be used to replace the grading and redo certain Normaliz computation without having to delete 
   * degree indepenent properties, such as hilbert bases. 
* documentation of QNormaliz written 
* extensive tests of QNormaliz 
* link from libQnormaliz to libnormaliz in preparation for lattice point computation in algebraic polytopes 
* further attempts to improve QNormaliz output (not yet complete) 
* work on the C++ wrapper of e-antic 
* fixed: Upgrade normaliz to 3.5.3 and pynormaliz to 1.12 <a class="https" href="https://trac.sagemath.org/ticket/22984">#22984</a>: repair of performance loss 
* fixed: getProjectionCone might segfault <a class="https" href="https://github.com/Normaliz/Normaliz/issues/180">https://github.com/Normaliz/Normaliz/issues/180</a> 
* fixed: <a href="/BadInputException">BadInputException</a> for <a href="/ProjectCone">ProjectCone</a> <a class="https" href="https://github.com/Normaliz/Normaliz/issues/181">https://github.com/Normaliz/Normaliz/issues/181</a> 
* fixed: Normaliz 3.5.4 released 

#### Py(Q)Normaliz

<a href="https://pypi.python.org/pypi/PyNormaliz">https://pypi.python.org/pypi/PyNormaliz</a> <a href="https://github.com/Normaliz/PyNormaliz">https://github.com/Normaliz/PyNormaliz</a> 

<a href="/PyNormaliz">PyNormaliz</a> (last version is 1.17): 

* All computation goals and output properties from Normaliz 3.5.4 are supported 
* It is possible to give functions <a href="/RationalHandler">RationalHandler</a>, <a href="/VectorHandler">VectorHandler</a>, and <a href="/MatrixHandler">MatrixHandler</a> to <a href="/NmzResult">NmzResult</a> to construct rationals, vectors, and matrices 
* Some documentation in the sources of <a href="/NormalizModule">NormalizModule</a>.cpp 
* Functionality to copy cone 
* Functionality to reset grading of a cone in <a href="/PyNormaliz">PyNormaliz</a> 
PyQNormaliz (current beta is 0.2, not available on PIPy): 

* All QNormaliz compute targets can be accessed 
* Input of number_field data as string 
* Input of number_field elements as list of 2-tuples, or as string 
* Ouput handlers <a href="/RationalHandler">RationalHandler</a>, <a href="/NumberfieldElementHandler">NumberfieldElementHandler</a>, <a href="/VectorHandler">VectorHandler</a>, and <a href="/MatrixHandler">MatrixHandler</a> 
* See example worksheet: <a href="https://nbviewer.jupyter.org/github/sebasguts/PyQNormaliz/blob/master/examples/Dodecahedron.ipynb">https://nbviewer.jupyter.org/github/sebasguts/PyQNormaliz/blob/master/examples/Dodecahedron.ipynb</a> 
* Upgraded pynormaliz to 1.16 <a class="https" href="https://github.com/Normaliz/PyNormaliz">https://github.com/Normaliz/PyNormaliz</a> 
* Started PyQNormaliz. <a class="https" href="https://github.com/sebasguts/PyQNormaliz">https://github.com/sebasguts/PyQNormaliz</a> 

#### PyScipOpt

<a href="https://github.com/SCIP-Interfaces/PySCIPOpt">https://github.com/SCIP-Interfaces/PySCIPOpt</a> 

Sage devel <a class="https" href="https://groups.google.com/forum/#!topic/sage-devel/QH_E14WHQ70">discussion</a> 

* Upgrade scipoptsuite to 5.0.1 <a class="https" href="https://trac.sagemath.org/ticket/24662">#24662</a> 
* Add SCIP backend using PySCIPOpt <a class="https" href="https://trac.sagemath.org/ticket/21003">#21003</a> 

#### Polymake

<a href="https://polymake.org/doku.php">https://polymake.org/doku.php</a> 

* Upgrade polymake to version 3.4 (current interface breaks) <a class="https" href="https://trac.sagemath.org/ticket/24905">#24905</a> 

## A list of other Polyhedral Geometry softwares

What are other softwares dealing with polyhedral geometry? Here is a non-exhaustive list. 

* Bensolve: 
      * <a href="http://bensolve.org/">http://bensolve.org/</a> 
* Maple: 
      * <a href="https://www.maplesoft.com/support/help/Maple/view.aspx?path=PolyhedralSets%2fPolyhedralSet">https://www.maplesoft.com/support/help/Maple/view.aspx?path=PolyhedralSets%2fPolyhedralSet</a>   (seems to be only rational and implemented in 2015). 
      * <a href="http://qhull.org/">http://qhull.org/</a>     (seems old?) 
      * <a href="https://www.maplesoft.com/products/maple/new_features/Maple2018/ComputationalGeometry.aspx">https://www.maplesoft.com/products/maple/new_features/Maple2018/ComputationalGeometry.aspx</a> 
      * <a href="https://www.maplesoft.com/support/help/Maple/view.aspx?path=PolyhedralSets">https://www.maplesoft.com/support/help/Maple/view.aspx?path=PolyhedralSets</a> 
* CGAL: 
      * <a href="https://doc.cgal.org/latest/Triangulation/index.html#Chapter_Triangulations">https://doc.cgal.org/latest/Triangulation/index.html#Chapter_Triangulations</a> 
* A paper: 
      * Jing & Maza <a href="https://dl.acm.org/citation.cfm?id=3177798">https://dl.acm.org/citation.cfm?id=3177798</a> 
* Matlab: 
      * <a href="https://www.mathworks.com/help/matlab/ref/convhulln.html">https://www.mathworks.com/help/matlab/ref/convhulln.html</a> 
      * <a href="https://www.mathworks.com/matlabcentral/fileexchange/48509-computational-geometry-toolbox">https://www.mathworks.com/matlabcentral/fileexchange/48509-computational-geometry-toolbox</a> 
      * <a href="https://www.mathworks.com/help/optim/ug/linprog.html">https://www.mathworks.com/help/optim/ug/linprog.html</a> 
      * <a href="https://www.mathworks.com/discovery/linear-programming.html">https://www.mathworks.com/discovery/linear-programming.html</a> 
      * <a href="https://www.mathworks.com/help/optim/ug/example-linear-programming.html">https://www.mathworks.com/help/optim/ug/example-linear-programming.html</a> 
* Matematica: 
      * <a href="http://reference.wolfram.com/language/MultivariateStatistics/ref/Polytope.html">http://reference.wolfram.com/language/MultivariateStatistics/ref/Polytope.html</a> 
      * <a href="http://reference.wolfram.com/language/PolyhedronOperations/tutorial/PolyhedronOperations.html">http://reference.wolfram.com/language/PolyhedronOperations/tutorial/PolyhedronOperations.html</a> 
* Visualizations 
      * <a class="https" href="https://polyhedra.tessera.li/">Polyhedra Viewer</a> by <a class="https" href="https://www.tessera.li/">Nat Alison</a>. 
            * Sage should have such a GUI with all the animations for the different operations, at least for the catalog. 