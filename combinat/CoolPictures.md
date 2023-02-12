

# Cool pictures produced with Sage-Combinat

* <a href="combinat/CoolPictures/root-system-plots.pdf">Root system plots</a> 
      * (draft of upcoming tutorial, with many pictures) 
* <a href="combinat/CoolPictures/plot-crystal-3d.png">A 3d stereographic plot of a crystal graph</a> 
      * (see above for how to construct this plot) 
* <a href="combinat/CoolPictures/alternating-sign-matrix-poset.pdf">Alternating sign matrix poset</a> 
* <a href="combinat/CoolPictures/quantum-Bruhat-graphA2.png">Quantum Bruhat graph for A2</a> 
      * Obtained with: 

```txt
    sage: W = WeylGroup(['A',2],prefix='s')
    sage: G = W.quantum_bruhat_graph()
    sage: G.show()
```
      * <a href="combinat/CoolPictures/parabolic-quantum-Bruhat-graphA3[1].png">Parabolic quantum Bruhat graph for A3 with J={1}</a> Obtained with: 

```txt
    sage: W = WeylGroup(['A',3],prefix='s')
    sage: G = W.quantum_bruhat_graph([1])
    sage: G.show()
```
* <a href="combinat/CoolPictures/SageCategoryGraph.pdf">Graph of categories in Sage</a> 
      * <span style="display:none">[[!inline pages="/combinat/CoolPictures/SageCategoryGraph.pdf" feeds="no" raw="yes"]]Graph of categories in Sage</span> Obtained with: 

```txt
    sage: g = sage.categories.category.category_graph()
    sage: g.set_latex_options(format="dot2tex")
    sage: view(g, pdflatex=True, tightpage = True)
```
* Graphs representing the Cartan matrix of the monoid of upper unitriangular boolean nxn matrices. For the second one, I can't resist quoting Tom Denton: "First they tell us we will never need more than 640k of RAM, then they tell us our documents should always be less than the length of a limousine..." 
         * <a href="combinat/CoolPictures/UpperTriangularBooleanMatrixMonoid4-cartan-graph.pdf">n=4</a> 
         * <a href="combinat/CoolPictures/UpperTriangularBooleanMatrixMonoid5-cartan-graph.pdf">n=5</a> 
* <a href="combinat/CoolPictures/J-graph-A2.pdf">The J-order on the BiHecke monoid for the symmetric group S_3</a> 
* Sage-Combinat T-Shirt for FPSAC 2009: 
         * <a href="combinat/CoolPictures/tshirt-fpsac09-front.png">front</a> 
         * <a href="combinat/CoolPictures/tshirt-fpsac09-back.png">back</a> 