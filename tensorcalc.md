= Tensor Calculus in Sage =

{{{#!wiki red/solid
'''''NB:''''' '''this page is obsolete''': tensor calculus is now fully implemented in Sage, see the [[http://doc.sagemath.org/html/en/reference/manifolds/|Manifolds section]] of the reference manual. Examples of use are [[http://sagemanifolds.obspm.fr/examples.html|here]]; see also the [[http://nbviewer.jupyter.org/github/sagemanifolds/SageManifolds/blob/master/Worksheets/v1.1/SM_tutorial.ipynb|tutorial]].
}}}

This page arose out of [[http://groups.google.be/group/sage-devel/browse_thread/thread/2feef1f0be557585/c2b7095747ebe34d|a thread]] at sage-devel on the use of differential forms in Sage.  Differential forms have been mentioned on the mailing list a few times before, and in the current discussion a number of interesting packages for tensor calculus were mentioned, which are listed here.

This list is by no means complete, so please feel free to edit.

As tensor calculus is a vast subject, at some stage we will want to have a roadmap of which tasks to handle first, benchmarks, and useful applications. See [[http://math.arizona.edu/~atp-mena/conference/proceedings/SalahHaggag-paper.pdf|this paper]] for some real-world applications. 


== Packages ==

=== Forms/Tensor packages ===

 * [[http://grtensor.phy.queensu.ca/|GRTensor]] is a package for Maple (with a port to Mathematica) for geometry computations in general relativity.  From the web page: ''GRTensor II is a computer algebra package for performing calculations in the general area of differential geometry. Its purpose is the calculation of tensor components on curved spacetimes specified in terms of a metric or set of basis vectors.''
 * The [[http://www.math.washington.edu/~lee/Ricci/|Ricci]] package in Mathematica looks terrific, but I don't have Mathematica so I can't experiment with it.
 * [[http://cadabra.phi-sci.com/index.html|Cadabra]] is a tensor package designed for computations in field theory (HEP, GR).  It looks very powerful and versatile, but the syntax is very terse.
 * [[http://www.xact.es/|xAct]] is a suite of free packages for tensor computer algebra in Mathematica. xAct implements state-of-the-art algorithms for fast manipulations of indices and has been modelled on the current geometric approach to General Relativity. 
 * Maxima seems to have a [[http://www.math.utexas.edu/pipermail/maxima/2006/003179.html|differential forms package]].
 * FriCAS has support for a [[http://axiom-wiki.newsynthesis.org/uploads/chapter-9.13-26.xhtml#sec-9.14|De Rham complex]], which (among others) apparently allows you to represent differential forms.
 * [[http://groups.csail.mit.edu/mac/users/gjs/6946/|Scmutils]] has lots of code to deal with forms, Riemannian geometry, etc. plus lots of cool applications.
 * Mathematica also has two more packages for doing differential forms: [[http://library.wolfram.com/infocenter/MathSource/683]] and [[http://library.wolfram.com/infocenter/MathSource/482/]] (the last one has a nice Integral command, for example).


=== Related code ===

 * [[http://sympy.blogspot.com/2007/04/relativitypy-is-working.html|sympy]] has a small relativity example.  See also [[http://www.mail-archive.com/axiom-mail@nongnu.org/msg00314.html|this announcement]].
 * [[http://axiom-wiki.newsynthesis.org/JetBundles|JET]]: Axiom code to deal with jet bundles, geometric ODEs/PDEs, Cartan-Kuranishi prolongations, etc.  See the abstract [[http://iaks-www.ira.uka.de/iaks-calmet/werner/Abstracts/IMACS95.ps.gz|here]]. 
 * [[http://glucat.sourceforge.net/|GluCat]]: ''GluCat is a library of template classes which model the universal Clifford algebras over the field of real numbers, with arbitrary dimension and arbitrary signature. GluCat implements a model of each Clifford algebra corresponding to each non-degenerate quadratic form up to a maximum number of dimensions.''
 

=== Sage code ===

 * [[http://doxdrum.wordpress.com/2011/02/10/sage-tip-creating-a-class-for-non-abelian-forms/]]
 * [[http://doxdrum.wordpress.com/2011/02/07/sage-tip-grmodule-day-04/]]
 * [[http://doxdrum.wordpress.com/2011/02/06/sage-tip-gr-module-day-03/]]
 * [[http://doxdrum.wordpress.com/2011/02/06/sage-tip-gr-module-day-02/]]
 * [[http://doxdrum.wordpress.com/2011/02/05/sage-tip-gr-module-day-01/]]

== Related Sage discussions ==

There are a few Sage projects in the works that might be interesting in the context of differential forms and tensor calculus.  A quick search brings up the following.

 * [[http://osdir.com/ml/sage-devel/2010-02/msg00294.html|GR calculations]]: adding support for GR calculations to Sage.
 * [[http://wiki.sagemath.org/topology|Topology]]: Sage support for topology.
 * [[http://groups.google.be/group/sage-support/browse_thread/thread/3c41a9da1f124763/db705e0620e1af12|Graded Algebras]]

Other discussions:

 * [[http://www.slideshare.net/seenet/d-vulcanov-symbolic-computation-methods-in-cosmology-and-general-relativity-1||Symbolic computation methods in cosmology and general relativity]]
