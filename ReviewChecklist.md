

# Review Checklist

This is a checklist that can be consulted when authoring or reviewing a ticket. 


## Read the ticket

* Most importantly, have a look at the ticket and see what it does. 

## General

* The ticket should apply cleanly on top of the latest <a class="https" href="https://www.sagemath.org/download-latest.html">development release</a>. 
* There should be no trailing whitespace on any line touched by the ticket. 
* The commits should have a sensible commit message. 
* `make ptestlong` should pass with the ticket applied. 
* If the ticket could impact any optional packages or tests, install those optional packages and run the optional tests using `sage -t -only_optional=package`. See #6329 for what *not* to do. 
* Run an interactive sage session, and manually exercise the affected code.  Try in particular some corner cases or stuff not mentioned in the EXAMPLES section. 

## Documentation

* Documentation should be formatted according to the <a class="https" href="https://doc.sagemath.org/html/en/developer/coding_basics.html">developer's guide</a>. 
* Run `sage --docbuild reference html` to rebuild the reference docs. View any affected pages. You can use the extra option `--warn-links` as in `sage --docbuild --warn-links reference html` to see if all links are properly resolved. 
* View affected documentation from within a sage session. 
* All variables in documentation should be enclosed in backticks (for example ``x``). 

### Doctests

* All new code should be doctested. Use `sage --coverageall` to make sure the doctest coverage has not gone down. 
* If the ticket fixes a defect, there should be a doctest checking that the defect is fixed, and the comment should mention the trac ticket number. You can use the special sphinx markup `:trac:`12314`` for that. 
* Add a `TESTS::` section to test corner cases or (for a bugfix ticket) cases fixed by the ticket. 
* Also doctest exceptions.  For example, when writing a function for division, test that dividing by zero yields a reasonable exception (as opposed to a crash of Sage). 

### New Functions

* _All_ new functions should have `INPUT:`, `OUTPUT:`, `EXAMPLES::`, and `TESTS::` sections where applicable. `.. SEEALSO::` section is highly recommended.   
* New files should have a heading as shown in the <a class="https" href="https://doc.sagemath.org/html/en/developer/coding_basics.html">developer's guide</a>. 

### Trac

* Add the real name of the Author(s) and Reviewer(s) of the ticket on Trac. 
* Add youself to <a class="https" href="https://trac.sagemath.org/sage_trac/#AccountNamesMappedtoRealNames">Account Names Mapped to Real Names</a> 