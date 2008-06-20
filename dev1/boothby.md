= SQLize the Notebook? =

I've started on #3456.  Workflow is:

 * Create schema (done)
 * Create import script (done)
 * Replace object.foo() with object.foo "everywhere" in the notebook directory (done)
 * Replace object.__foo with object.foo "everywhere" in the notebook directory
 * Refactor worksheet.config, notebook.config, user.config
 * Refactor worksheet.cells, notebook.users, notebook.worksheets
 * Document the hell out of everything!


While I'm at it:

 * Add tag system, twist Timothy's arm to design an interface?
