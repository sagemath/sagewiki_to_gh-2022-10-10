= Sage 3.2.2 Release Tour =

Sage 3.2.2 was released on FIXME. For the official, comprehensive release notes, see [[http://www.sagemath.org/src/announce/sage-3.2.2.txt|sage-3.2.2.txt]].

== Algebra ==

 * Using Python's (version 2.5) pickling protocols (Burcin Erocal) -- Changed {{{sage.structure.element.Element}}} to use Python's pickling protocol via {{{__getstate__()}}} and {{{__setstate__()}}}. The previous pickling implementation in {{{sage.structure.element.make_element}}} is retained for backward compatibility.

== Basic Arithmetic ==

 * Fraction fields (Burcin Erocal) -- Updated the {{{sage.rings.fraction_field.FractionField_generic}}} class to the new coercion model, and Cythonize the {{{sage.rings.fraction_field_element.FractionFieldElement}}} class. Homomorphisms of fraction fields now work, and the {{{random_element()}}} method of fraction fields returns sensible results. 
