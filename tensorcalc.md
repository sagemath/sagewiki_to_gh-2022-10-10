= Tensor Calculus in Sage =

This page arose out of [[http://groups.google.be/group/sage-devel/browse_thread/thread/2feef1f0be557585/c2b7095747ebe34d|a thread]] at sage-devel on the use of differential forms in Sage.  Differential forms have been mentioned on the mailing list a few times before, and in the current discussion a number of interesting packages for tensor calculus were mentioned, which are listed here.

This list is by no means complete, so please feel free to edit.

As tensor calculus is a vast subject, at some stage we will want to have a roadmap of which tasks to handle first, benchmarks, and useful applications.  


== Packages ==

=== Forms/Tensor packages ===

 * Maxima seems to have a [[http://www.math.utexas.edu/pipermail/maxima/2006/003179.html|differential forms package]].
 * [[http://grtensor.phy.queensu.ca/|GRTensor]] is a package for Maple (with a port to Mathematica) for geometry computations in general relativity.  From the web page: ''GRTensor II is a computer algebra package for performing calculations in the general area of differential geometry. Its purpose is the calculation of tensor components on curved spacetimes specified in terms of a metric or set of basis vectors.''
 * FriCAS has support for a [[http://axiom-wiki.newsynthesis.org/uploads/chapter-9.13-26.xhtml#sec-9.14|De Rham complex]], which (among others) apparently allows you to represent differential forms.
 * [[http://groups.csail.mit.edu/mac/users/gjs/6946/|Scmutils]] has lots of code to deal with forms, Riemannian geometry, etc. plus lots of cool applications.


=== Related code ===

 * [[http://axiom-wiki.newsynthesis.org/JetBundles|JET]]: Axiom code to deal with jet bundles, geometric ODEs/PDEs, Cartan-Kuranishi prolongations, etc.  See the abstract [[http://iaks-www.ira.uka.de/iaks-calmet/werner/Abstracts/IMACS95.ps.gz|here]]. 
 * [[http://glucat.sourceforge.net/|GluCat]]: ''GluCat is a library of template classes which model the universal Clifford algebras over the field of real numbers, with arbitrary dimension and arbitrary signature. GluCat implements a model of each Clifford algebra corresponding to each non-degenerate quadratic form up to a maximum number of dimensions.''
 
== Related Sage discussions ==

There are a few Sage projects in the works that might be interesting in the context of differential forms and tensor calculus.  A quick search brings up the following.

 * [[http://wiki.sagemath.org/topology|Topology]]: Sage support for topology.
 * [[http://groups.google.be/group/sage-support/browse_thread/thread/3c41a9da1f124763/db705e0620e1af12|Graded Algebras]]
