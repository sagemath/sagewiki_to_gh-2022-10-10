

# Sage 3.2.2 Release Tour

Sage 3.2.2 was released on December 30, 2008. For the official, comprehensive release notes, see <a class="http" href="http://www.sagemath.org/src/announce/sage-3.2.2.txt">sage-3.2.2.txt</a>. 


## Algebra

* Using Python's (version 2.5) pickling protocols (Burcin Erocal) -- Changed `sage.structure.element.Element` to use Python's pickling protocol via `__getstate__()` and `__setstate__()`. The previous pickling implementation in `sage.structure.element.make_element` is retained for backward compatibility. 
* Method `injvar()` is deprecated (John Palmieri) -- The method `injvar()` in `sage/structure/category_object.pyx` is now deprecated. One should instead use `inject_variables()` in order to make variable names available for interactive use. 

## Basic Arithmetic

* Fraction fields (Burcin Erocal) -- Updated the `sage.rings.fraction_field.FractionField_generic` class to the new coercion model, and Cythonize the `sage.rings.fraction_field_element.FractionFieldElement` class. Homomorphisms of fraction fields now work, and the `random_element()` method of fraction fields returns sensible results.  

## Build

* Controlling the number of threads used for parallel testing (Dan Drake) -- Added the `NUM_THREADS` variable to the file `SAGE_ROOT/makefile` to make it easier to control the number of threads used during parallel testing. Previously the number of threads was hard coded into `SAGE_ROOT/makefile` at various places, which made the file rather difficult to maintain. 

## Calculus

* Derivative of a vector and a matrix (Jason Grout) -- Given a vector or matrix of differentiable expressions, the entries in that vector or matrix can be differentiated. This is handy for working with differential equations when we want to do differentiation and integration of matrices and vectors, with the exact same answer as obtained by using the `apply_map` method. 
* Cleaned up implementation of piecewise-defined functions (Mike Hansen, Paul Butler) -- Some updating of the class `sage/functions/piecewise.py`. This includes not explicitly using Maxima where not necessary in order to take advantage of pynac in the future. When differentiating piecewise functions where some piece uses multiplication, the expression that is passed to Maxima is properly formatted for Maxima to work with that expression. 

## Coercion

* A factory and pickling framework (Robert Bradshaw) -- Uniqueness of parents makes Sage operate much more smoothly. This leads to an enormous amount of nearly identical caching code scattered throughout the library. This factory handles all the caching and also provides a good pickling mechanism. 

## Words

* A library for studying and manipulating words (Arnaud Bergeron, Amy Glen, Sebastien Labbe, <a class="http" href="http://www-igm.univ-mlv.fr/~saliola/">Franco Saliola</a>) -- This adds lots of functionality for combinatorics on words. The new features are highlighted in this <a href="ReleaseTours/sage-3.2.2/WordsWorksheet.sws">Sage worksheet</a> (<a href="ReleaseTours/sage-3.2.2/WordsWorksheet.pdf">PDF version</a>). 