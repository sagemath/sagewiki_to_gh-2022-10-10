

# SQLize the Notebook?

I've started on #3456.  Workflow is: 

* Create schema (done) 
* Create import script (done) 
* Replace object.foo() with object.foo "everywhere" in the notebook directory (done) 
* Replace object._ _foo with object.foo "everywhere" in the notebook directory 
* Refactor worksheet.config, notebook.config, user.config 
* Refactor worksheet.cells, notebook.users, notebook.worksheets 
* Test and fix bugs 
* Document the hell out of everything! 
* Fix bugs uncovered by doctests 
While I'm at it: 

* Add tag system, twist Timothy's arm to design an interface? 
Problems: 

* Patch bomb. 
* Can't test until I'm "done" 

## Other stuff

* Suggested (yet another) data structure to help RLM 
* Reviewed some patches 
* Encouraged a 3-way throw-down between GBill, Glenn, and Yi 