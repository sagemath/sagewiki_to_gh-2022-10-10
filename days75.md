Sage Days 75 will be held from August 22-26, 2016 at [[https://www.inria.fr/en/centre/saclay|Inria Saclay]], France.

= Organizers =

Daniel Augot, David Lucas, Johan S. R. Nielsen, Clément Pernet.

Please contact David Lucas (david.lucas[at]inria.fr) for any question.

= Focus & Topics =

The overall theme of this Sage Days is coding theory and exact linear algebra related to it, but there will be lots of general hacking.
Even if you don't have any particular interest in coding theory, you should participate! 
Similarly, even if don't know Sage at all but are interested in coding theory, you should also participate!
There will be an installation session, introductory talks to Sage and its development workflow.

The aim of this Sage Days is to:

 * Introduce Sage to coding theorists.

 * Have presentations about the enhancements we made to Sage's coding theory library during Inria's [[https://bitbucket.org/lucasdavid/sage_coding_project/wiki/Home|ACTIS]] project

 * Help people to work on their own projects.

We plan on having talks on the mornings, and coding sprints on the afternoons.
The first 3 days' talks will be focused on basic functionalities of our library, the last 2 days
on advanced functionalities, with an emphasis on Sage development.

== Schedule ==

Disclaimer: This is a preliminary schedule which is subject to change!

||<#AFEFEF:> Plenary talks ||<#D0FFD0:> Coding sprints ||

||<5%>              ||<15% #FFFFAA:> Monday, 22nd August ||<15%  #FFFFAA:> Tuesday, 23rd August ||<15%  #FFFFAA:> Wednesday, 24th August ||<15%  #FFFFAA:> Thursday, 25th August  ||<15%  #FFFFAA:> Friday, 26th August ||
||Room              ||<:> Gilles Kahn  ||<:> Gilles Kahn ||<:> Gilles Kahn ||<:> Gilles Kahn ||<:> Gilles Kahn ||
||<#FFFFAA> 9am     ||<:|3> Welcome and install session||<#D0FFD0:|4>Coding sprints session||<#D0FFD0:|4>Coding sprints session||<#D0FFD0:|4>Coding sprints session||<#D0FFD0:|4>Coding sprints session||
||<#FFFFAA> 9.30am  ||
||<#FFFFAA> 10am    ||
||<#FFFFAA> 10.30am ||<#AFEFEF:|2>Introduction to Sage||
||<#FFFFAA> 11am    ||<#AFEFEF:|2>Presentation of LinBox||<#AFEFEF:|2>Decoding techniques for algebraic codes: algorithmic and implementation||<#AFEFEF:|2>Rank-metric codes in Sage||<#AFEFEF:|2>TBA||
||<#FFFFAA> 11.30am ||Hands-on Sage (tutorials, ...)||
||<#FFFFAA> 12am    ||Lunch break||Lunch break||Lunch break||Lunch break||Lunch break||
||<#FFFFAA> 1.30pm  ||<#AFEFEF:|2>Introduction to coding theory in Sage||<#D0FFD0:|6>Coding sprints session||<#D0FFD0:|6>Coding sprints session||<#D0FFD0:|6>Coding sprints session||<#D0FFD0:|6>Coding sprints session||
||<#FFFFAA> 2pm     ||
||<#FFFFAA> 2.30pm  ||Break||
||<#FFFFAA> 3pm     ||<#AFEFEF:>Status report on ACTIS||
||<#FFFFAA> 3.15pm  ||<#AFEFEF:>Brainstorming on coding sprints||
||<#FFFFAA> 3.30pm  ||<#D0FFD0:|2>Coding sprints session||
||<#FFFFAA> 5.30pm  ||<#D0FFD0:>Status report on coding sprints||<#D0FFD0:>Status report on coding sprints||<#D0FFD0:>Status report on coding sprints||<#D0FFD0:>Status report on coding sprints||
||<#FFFFAA> 6pm     ||<:> End ||<:> End ||<:> End ||<:> End ||<:> End ||

We also expect to have informal lightning talks by the participants throughout
the week on any subject that comes up.

== Ideas for coding sprints ==

Feel free to add your own ideas here.

* Review any open coding theory ticket, see [[http://trac.sagemath.org/ticket/18846|#18846]].

* Fix any open issue with `linear_code.py` as noted on the [[https://bitbucket.org/lucasdavid/sage_coding_project/issues/155/problems-with-linear_codepy|ACTIS Bitbucket wiki]].

* Improve documentation of sage.coding

* Improve integration of finite field non-prime basis representation introduced in [[http://trac.sagemath.org/ticket/20284|#20284]].

* Port implementation of asymptotically fast (GF(q)[x])[y] root-finding from [[https://bitbucket.org/jsrn/codinglib|Codinglib]].

* Improve integration of the (GF(q)[x])[y] root-finding so that it is tab-expansion-available for any such polynomial (a reasonably fast implementation of such root-finding was introduced in [[http://trac.sagemath.org/ticket/19666|#19666]])

* Fix and review [[http://trac.sagemath.org/ticket/16742|#16742]] regarding faster F[x] matrix reduction.

* Link to advanced fast polynomial arithmetic library functions such as multi-point evaluation and Lagrange interpolation.

* Link to fast GF(2)[x] library (currently used is NTL generic GF(p)[x]).

* Link to new features of new LinBox release.

* Implement the Hartmann-Tzeng bound for cyclic codes.

* Implement Goppa codes.

* Cython implementation of the Brouwer-Zimmermann algorithm for computing the minimum distance of a linear code.


= Logistics =

== Lodging ==

We booked a holiday cottage ([[http://www.cernayvacances.com/en/stay/de-toren/|The Tower]]
and [[http://www.cernayvacances.com/en/stay/le-grenier-royal/|Le grenier royal]] and will provide
free lodging.
As there is a limited number of rooms, please contact David Lucas (david.lucas[at]inria.fr) if you
want to stay at the cottage.

== Transportation ==

See directions [[http://www.lix.polytechnique.fr/cryptologie/directions|here]].
We will provide transportation by cars between the cottage and Inria Saclay.

== Participants ==

Please add you name to the list if you want to attend this Sage Days.

 * Daniel Augot (Inria Saclay - LIX)
 * David Lucas (Inria Saclay - LIX)
 * Johan S. R. Nielsen (DTU)
 * Clément Pernet (U. Grenoble Alpes, U. de Lyon - LIP)
 * Luca De Feo (U. Versailles)
 * Miguel Marco (U. de Zaragoza)
 * Irene Márquez (Inria)
 * Vincent Neiger (ENS Lyon) (to be confirmed)
 * Julien Lavauzelle (LIX & Inria Saclay)
 * Xavier Caruso (IRMAR) (to be confirmed)
 * Jean-Pierre Flori (ANSSI) (I'll show up randomly and will be commuting from Paris)
 * Arpit Merchant (IIIT-H, India)
 * Bruno Grenet (U. Montpellier)
 * Alain Couvreur (Inria Saclay - LIX)
 * Tania Richmond (U. de Toulon)
 * Razvan Barbulescu (IMJ - PRG)
 * Ricardo Alfaro (U. of Michigan - Flint)
 * Charles Bouillaguet (U. Lille 1) 
 * Nicholas Coxon (Inria Saclay - LIX)
 * Joe Fields (SCSU - New Haven, CT, USA)
