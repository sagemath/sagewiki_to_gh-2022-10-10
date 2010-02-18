= Cool pictures produced with Sage-Combinat =

 * [[attachment:SageCategoryGraph.pdf|Graph of categories in Sage]]
   Obtained with:
{{{
    sage: g = sage.categories.category.category_graph()
    sage: g.set_latex_options(format="dot2tex")
    sage: view(g, pdflatex=True, tightpage = True)
}}}

 * Graph representing the Cartan matrix of the monoid of upper unitriangular boolean nxn matrices:
    * [[attachment:UpperTriangularBooleanMatrixMonoid4-cartan-graph.pdf|n=4]]
    * [[attachment:UpperTriangularBooleanMatrixMonoid5-cartan-graph.pdf|n=5]]
    For the second one, I can't resist quoting Tom Denton: ``First they tell us we will never need more than 640k of RAM, then they tell us our documents should always be less than the length of a limousine...''
