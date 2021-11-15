{{https://avatars.githubusercontent.com/u/1284937?s=200&v=4||width=80px}}

In order to use [[https://github.com/spyder-ide | Spyder]] for writing Sage scripts you have to use the version of Python which comes with Sage within the IDE. To change it apply the following steps:

 * In '''`Tools -> Preferences`''' go to '''`Console -> Advanced settings -> Python executable`'''
 * choose '''`SAGE_ROOT/local/bin/python`''' as the interpreter
 * go to '''`Run -> Configure (F6)`'''
 * choose '''`Console -> Execute in a new dedicated Python console`'''
 * optional: check '''`Interact with the Python console after execution`''' (convenient for debugging)
 
Now you can run your scripts with '''`Run (F5)`''' in Spyder's built-in console.

Tested with Spyder 2.3.8 and Sage 7.1.

==== Open Issues ====
 * only works if the extension is .py
 * no integration of the Sage class/function documentation
