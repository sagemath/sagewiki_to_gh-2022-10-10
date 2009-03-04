= Sage-Combinat =

Sage-combinat is a collection of experimental patches (i.e. extensions) on top of [[http://www.sagemath.org/|Sage]], developed by a community in algebraic combinatorics. Its main purpose is to improve Sage as an extensible toolbox for computer exploration, and foster code sharing between researchers in this area. The intent is that most of those patches eventually will get integrated into sage as soon as they are mature enough, with a typical short life-cycle of a few weeks. In other words: just install Sage, and you will benefit from all the Sage-combinat development, except for the latest bleeding edge features.


----
== NEWS ==
 * February 22-26, 2010: [[http://wiki.sagemath.org/daysmarseille|Sage days]] 
   The thematic month [[https://www.lirmm.fr/arith/wiki/MathInfo2010/MathInfo2010|MathInfo 2010]] at CIRM, Marseille will include a Sage days session. FlorentHivert, NicolasThiéry, and FrancoSaliola will be among the organizers, there will be a serious combinatorics slant. 
   
 * July 25-29: *-Combinat 2009

   We will hold an International Sage Workshop on [[http:/combinat/FPSAC09|Free and Practical Software for Algebraic Combinatorics]] at RISC, Linz, Austria, right after [[http://www.risc.uni-linz.ac.at/about/conferences/fpsac2009/|FPSAC'09]].

 * 2009-02-20: Submission of a software demonstration request for FPSAC 2009 [[attachment:2009-07-20-FPSAC.pdf|PDF]], [[attachment:.2009-07-20-FPSAC.tex|LaTeX Source]] [[attachment:2009-07-20-FPSAC.bbl|LaTeX bibliography]]


 * January 26-30: [[http:/combinat/SageCombinatWorkshopOrsay|Sage-Combinat Workshop in Orsay]]

 * 2008-06-19: MuPAD-Combinat join forces with Sage

    Sage-combinat was born as a partial port of [[http://mupad-combinat.sf.net|MuPAD-Combinat]]. After months of discussions and experiments, an enthusiastic consensus emerged in the MuPAD-Combinat community to join Sage. Sage-combinat henceforth became the natural successor of {{{MuPAD-Combinat}}}.

   The transition is going to be a massive investment: seven years of hard work to port over! However a lot of experience was gained since 2000, and most of the design is now pretty clear. By sharing the work the transition will hopefuly be relatively quick.

   See the [[http:/combinat/RoadMap|road map and current status]] of the port.

----

== Who are we? ==

 * [[http:/combinat/Contributors|Contributors]]

 * [[http:/combinat/Institutions|Institutions and sponsors]]

----

== How to participate and contribute ==


=== Communication ===
 * Join our mailing list: http://groups.google.com/group/sage-combinat-devel.

 * Post bug reports, suggestions, patches on the [[http://sagetrac.org/sage_trac/milestone/sage-combinat|Sage-Combinat trac server]] or on the [[http://groups.google.com/group/sage-combinat-devel|mailing list]].

 * Cite Sage-Combinat when you use it for research publications (TODO: provide a standard citation here).

=== Code ===

 * The collection of patches is managed using a [[http://combinat.sagemath.org/patches/|patch server]]  (mercurial queues). Use it to try out the latest experimental features, or contribute your own patches! (You may still need to access to the  [[http://sage.math.washington.edu:2144/|old patch server]])

 * Please read the [[http:/combinat/MercurialStepByStep|Step by step tutorial]]  (in particular, how to '''download Sage-Combinat''')

 * For the curious: [[http:/combinat/Mercurial|Technical background on the Sage-Combinat patch server (messy)]].

 * [[http://combinat.sagemath.org/misc/|Mercurial server for miscelleanous files and documents]]
=== Design ===

 * Have a look and participate to [[http:/combinat/DesignDiscussion|design discussions]].

 * Contribute to the list of [[http:/combinat/Weirdness|quirks and weirdness issues]] in the {{{*-Combinat}}} design.

=== Documentation ===

 * From sage 3.4 on, the documentation system is based on ReST/Sphinx. Here are some [[combinat/HelpOnTheDoc|help about the new doc system]]
