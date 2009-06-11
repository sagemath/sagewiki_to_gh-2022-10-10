= Sage-Combinat =

Sage-Combinat is a software project whose mission statement is: '''to improve the open source mathematical system [[http://www.sagemath.org/|Sage]] as an extensible toolbox for computer exploration in algebraic combinatorics, and foster code sharing between researchers in this area'''.

In practice, Sage-combinat is a collection of experimental patches (i.e. extensions) on top of [[http://www.sagemath.org/|Sage]], developed by a community of researchers. The intent is that most of those patches get eventually integrated into sage as soon as they are mature enough, with a typical short life-cycle of a few weeks. In other words: just install Sage, and you will benefit from all the Sage-combinat development, except for the latest bleeding edge features.


----
== NEWS ==
 * [[http://sagetrac.org/sage_trac/wiki/SageCombinatRoadMap|road map and current status]]

 * February 22-26, 2010: [[http://wiki.sagemath.org/daysmarseille|Sage days]] 
   The thematic month [[https://www.lirmm.fr/arith/wiki/MathInfo2010/MathInfo2010|MathInfo 2010]] at CIRM, Marseille will include a Sage days session. FlorentHivert, NicolasThiéry, and FrancoSaliola will be among the organizers, there will be a serious combinatorics slant. 
   
 * July 25-29, 2009: *-Combinat 2009

   We will hold an International Sage Workshop on [[http:/combinat/FPSAC09|Free and Practical Software for Algebraic Combinatorics]] at RISC, Linz, Austria, right after [[http://www.risc.uni-linz.ac.at/about/conferences/fpsac2009/|FPSAC'09]]

 * May 25th, 2009: The Sage-words library demonstrated at the 2nd Canadian Discrete and Algorithmic Mathematics Conference [[http://www.crm.umontreal.ca/CanaDAM2009/index_e.shtml|CanaDAM'09]]
 [[attachment:2009-05-25-CanaDAM.sws|Sage worksheet]], [[attachment:2009-05-25-CanaDAM.pdf|PDF]].

 * April 15th, 2009: Software demonstration accepted for [[http://www.risc.uni-linz.ac.at/about/conferences/fpsac2009/|FPSAC'09]]
 [[attachment:2009-07-20-FPSAC.pdf|PDF]], [[attachment:.2009-07-20-FPSAC.tex|LaTeX Source]] [[attachment:2009-07-20-FPSAC.bbl|LaTeX bibliography]]

 * January 26-30, 2009: [[http:/combinat/SageCombinatWorkshopOrsay|Sage-Combinat Workshop in Orsay]]

 * 2008-06-19: MuPAD-Combinat join forces with Sage

    Sage-combinat was born as a partial port of [[http://mupad-combinat.sf.net|MuPAD-Combinat]]. After months of discussions and experiments, an enthusiastic consensus emerged in the MuPAD-Combinat community to join Sage. Sage-combinat henceforth became the natural successor of {{{MuPAD-Combinat}}}.

   The transition is a massive investment: seven years of hard work to port over! However a lot of experience was gained since 2000, and most of the design is now pretty clear. By sharing the work the transition will hopefuly be relatively quick.

----

== Who are we? ==

 * [[http://wiki.sagemath.org/combinat/Contributors|Contributors]]

 * [[http://wiki.sagemath.org/combinat/Institutions|Institutions and sponsors]]

----

== How to participate and contribute ==


=== Communication ===

 * Join our mailing lists:
    * Announcement mailing list (to come)
    * [[http://groups.google.com/group/sage-combinat-devel|sage-combinat-devel]]: Developpers mailing list
    * [[http://groups.google.com/group/sage-combinat-commits|sage-combinat-commits]]: A low traffic mailing list which receives an automatic notice whenever a sage-combinat related ticket is modified (and eventually whenever a commit is done on the patch server).
 * Check the  [[http://sagetrac.org/sage_trac/wiki/SageCombinatRoadMap|road map and current status]] 
 * Post bug reports, suggestions, patches on the [[http://sagetrac.org/sage_trac/milestone/sage-combinat|Sage-Combinat trac server]] or on the [[http://groups.google.com/group/sage-combinat-devel|mailing list]].
 
 * Cite Sage-Combinat when you use it for research publications (TODO: provide a standard citation here).

=== Code ===

 * The collection of patches is managed using a [[http://combinat.sagemath.org/patches/|patch server]]  (mercurial queues). Use it to try out the latest experimental features, or contribute your own patches! (You may still need to access to the  [[http://sage.math.washington.edu:2144/|old patch server]])

 * Please read the [[http://wiki.sagemath.org/combinat/MercurialStepByStep|Step by step tutorial]]  (in particular, how to '''download Sage-Combinat''')

 * For the curious: [[http://wiki.sagemath.org/combinat/Mercurial|Technical background on the Sage-Combinat patch server (messy)]].

 * For hg lovers: [[http://hgbook.red-bean.com/read/|Mercurial: The Definite Guide]] an e-book by Bryan O'Sullivan

 * [[http://combinat.sagemath.org/misc/file/|Mercurial server for miscelleanous files and documents]]
   To check them out, use {{{hg clone http://combinat.sagemath.org/misc/ Sage-Combinat-misc-file}}}. This will create a subdirectory {{{Sage-Combinat-misc-file}}} in the current directory; you can use any other name for this subdirectory.

=== Design ===

 * Have a look and participate to [[http:/combinat/DesignDiscussion|design discussions]].

 * Contribute to the list of [[http:/combinat/Weirdness|quirks and weirdness issues]] in the {{{*-Combinat}}} design.

=== Documentation ===

 * From sage 3.4 on, the documentation system is based on ReST/Sphinx. Here are some [[combinat/HelpOnTheDoc|help about the new doc system]]
