##master-page:HomepageReadWritePageTemplate
##master-date:Unknown-Date
#format wiki
#language en

This page tries to summarize the results of the discussion on [[https://groups.google.com/forum/#!topic/sage-devel/0sYJMlN16bc| sage-devel]]
I formulate everything here as strict rules, but of course every guideline can have a valid use case for not following it, but stating things in a political correct way would just obfuscate the main ideas.
<<TableOfContents(2)>>

= Possible Guide Lines =


== Use relative imports ==
----
==== Opinion on sage-dev ====
Mixed, most think it is not a good idea.
==== Pros ====
 * This might speed up startup time

==== Cons ====
 * A lot of work to change the existing code
 * There is doubt if this will really enhance startup time a lot
 * Absolute imports are not ambigious hence easier to read
 * Volker Braun has a workaround that caches import locations between Sage runs.

== Start making use of __init__.py files ==
----
==== Opinion on sage-dev ====
N/A since this idea has to be developed more first
==== Pros ====
 * Will hopfully make the source code easier maintainable
 * Allows you to use sage as a library (i.e. you no longer have to do from sage.all import *)
 * Might give shorter startup time when you tell sage to startup only with a certain submodule loaded (for example `sage -import_only rings`)
==== Cons ====
 * Just the use of __init__.py files will not make sage useable as a library, more work needs to be done (eg environment variables etc)

==== Related Ideas ====
 * Make it possible to run the doctest suite run only with a certain submodule imported 


== Don't import specific functions or classes from another module ==
----

==== opinion on sage-dev ====
To early to tell.
==== Pros ====
 * Decreases the chance of circular imports and hence increases sourcecode maintainability
==== Cons ====
 * There are definitly valid use cases to importing specific functions and classes.

 * speed 
{{{
import sage.rings.all
}}} 
will force 4? lookups at runtime when later executing 
{{{
sage.rings.all.ZZ(3)
}}}
while
{{{
from sage.rings.all import ZZ
}}}
will cause 1? lookup at runtime when later executing
{{{
ZZ(3)
}}}
==== Solutions to concrete problems ====
To be provided

==== Examples ====
'''bad:'''  {{{import module.a.b.c.d }}}  #slow at runtime

'''good:'''   {{{from module.a.b.c import d}}}

'''bad:'''

{{{from module.sub_module import some_function}}} #cause of problems with possible circular imports

{{{from module.sub_module import some_class}}}  #cause of problems with possible circular imports


'''good:'''

{{{from module.sub_module import some_sub_sub_module}}}

{{{import module}}}


'''valid use case to ignore this guideline:'''
To be provided

= Links/Resources =
 * [[https://wiki.python.org/moin/PythonSpeed/PerformanceTips#Import_Statement_Overhead ]]
 * [[https://docs.python.org/tutorial/modules.html#intra-package-references]]
 * [[http://effbot.org/zone/import-confusion.htm]]
