= Sage 2.10.3 Release Tour =
Sage 2.10.3 was released on 11 Mar 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release.For the latest changes see[http://sagemath.org/announce/sage-2.10.3.txt sage-2.10.3.txt]. Among many other things that were done, we have the following cool new features. Of course, this list is incomplete; see the release notes for more details.

== Interactive Functions ==

Sage now has a first version of its "interact" command.  Calling "@interact" before defining a function will construct controls to graphically control the input variables of the function, making it dramatically easier to create interactive functionality that is easy to use.  See [http://wiki.sagemath.org/interact] for details and examples or just type "interact?" in Sage.

== Plotting ==

 * The plot_vector_field function now takes 2-variable functions, allowing for much more complex vector fields.
{{{
sage: plot_vector_field((lambda x,y: x+y, lambda x,y: x^2*y^3), (x,-2,2), (y,-2,2))
}}}

== Linear Algebra ==

 * Matrices now have a jordan_form method which computes the Jordan canonical form.
{{{
sage: a = matrix(ZZ,4,[1, 0, 0, 0, 0, 1, 0, 0, 1, -1, 1, 0, 1, -1, 1, 2]); a
[ 1  0  0  0]
[ 0  1  0  0]
[ 1 -1  1  0]
[ 1 -1  1  2]
sage: a.jordan_form()
[2|0 0|0]
[-+---+-]
[0|1 1|0]
[0|0 1|0]
[-+---+-]
[0|0 0|1]
}}}
