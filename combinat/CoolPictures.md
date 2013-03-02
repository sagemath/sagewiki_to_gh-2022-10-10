= Cool pictures produced with Sage-Combinat =

 * [[attachment:root-system-plots.pdf|Root system plots]]
   (draft of upcoming tutorial, with many pictures)

 * [[attachment:plot-crystal-3d.png|A 3d stereographic plot of a crystal graph]]
   (see above for how to construct this plot)

 * [[attachment:alternating-sign-matrix-poset.pdf|Alternating sign matrix poset]]

 * [[attachment:quantum-Bruhat-graphA2.png|Quantum Bruhat graph for A2]]
   Obtained with:
{{{
    sage: W = WeylGroup(['A',2],prefix='s')
    sage: G = W.quantum_bruhat_graph()
    sage: G.show()
}}}
   [[attachment:parabolic-quantum-Bruhat-graphA3[1].png|Parabolic quantum Bruhat graph for A3 with J={1} ]]
   Obtained with:
{{{
    sage: W = WeylGroup(['A',3],prefix='s')
    sage: G = W.quantum_bruhat_graph([1])
    sage: G.show()
}}}

 * [[attachment:SageCategoryGraph.pdf|Graph of categories in Sage]]
   /* {{attachment:SageCategoryGraph.pdf|Graph of categories in Sage|width=200}} */
   Obtained with:
{{{
    sage: g = sage.categories.category.category_graph()
    sage: g.set_latex_options(format="dot2tex")
    sage: view(g, pdflatex=True, tightpage = True)
}}}

 * Graphs representing the Cartan matrix of the monoid of upper unitriangular boolean nxn matrices. For the second one, I can't resist quoting Tom Denton: "First they tell us we will never need more than 640k of RAM, then they tell us our documents should always be less than the length of a limousine..."
    * [[attachment:UpperTriangularBooleanMatrixMonoid4-cartan-graph.pdf|n=4]]
    * [[attachment:UpperTriangularBooleanMatrixMonoid5-cartan-graph.pdf|n=5]]

 * [[attachment:J-graph-A2.pdf|The J-order on the BiHecke monoid for the symmetric group S_3]]

 * Sage-Combinat T-Shirt for FPSAC 2009:
    * [[attachment:tshirt-fpsac09-front.png|front]]
    * [[attachment:tshirt-fpsac09-back.png|back]]
