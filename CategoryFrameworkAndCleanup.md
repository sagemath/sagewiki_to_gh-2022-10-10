= Category framework and cleanup =

While expanding the category framework I found in sage and in particular in the file {{{parent.pyx}}} many things that are done in a programatic way and that I think will be much better if done in a mathematical declarative way. I put rather than on the mailing list because it should be referenced and modified... Eventually all these should end as trac ticket. 

Note that this will raise many problems because inheriting from Parent (a class) has the priority from inheriting from a category.  


 * {{{an_element}}}, {{{some_element}}} should be handled by the category {{{Sets()}}}

 * mathematical comparison (see mailing lists discussion about < and sys-order) should be handled by a category {{{OrderedSets()}}} and {{{TotallyOrderedSets()}}} (or {{{OrderedSets()}}} and {{{PartialyOrderedSets()}}} whether it sounds more familiar to the english native people or not (remember non-negative :-) )

 * {{{list}}} and {{{__iter__}}} through a set should be handled by {{{EnumeratedSets()}}}
