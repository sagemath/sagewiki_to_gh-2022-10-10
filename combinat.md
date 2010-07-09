= Sage-Combinat =

Sage-Combinat is a software project whose mission statement is: '''to improve the open source mathematical system [[http://www.sagemath.org/|Sage]] as an extensible toolbox for computer exploration in algebraic combinatorics, and foster code sharing between researchers in this area'''.

In practice, Sage-combinat is a collection of experimental patches (i.e. extensions) on top of [[http://www.sagemath.org/|Sage]], developed by a community of researchers. The intent is that most of those patches get eventually integrated into Sage as soon as they are mature enough, with a typical short life-cycle of a few weeks. In other words: just install Sage, and you will benefit from all the Sage-combinat development, except for the latest bleeding edge features.

----

'''[[http://wiki.sagemath.org/combinat/Installation|Installation instructions]]'''

----

== NEWS ==

 * [[http://sagetrac.org/sage_trac/wiki/SageCombinatRoadMap|Road map and current status]]

 * July 10, 2010: First release of [[http:/combinat/AffineSchubertCalculusWorkshop|Calcul Mathématique avec Sage]]
   A free book on Sage, in French, with a large section on combinatorics

 * July 7-15, 2010: [[http:/combinat/AffineSchubertCalculusWorkshop|Affine Schubert Calculus workshop and summer school in Toronto]]
   It includes several Sage and Sage-Combinat sessions

== Past news ==

 * June 14-18, 2010: [[http:/combinat/SageCombinatChevieWorkshopOrsay2010|Joint Sage-Combinat and Chevie Workshop in Orsay]]

 * May 3-7, 2010: [[http://www.fields.utoronto.ca/programs/scientific/09-10/sage/|Sage Days 20.5 in Toronto]]
   Organized by Nantel Bergeron, FrancoSaliola and Mike Zabrocki,
   again with a serious algebraic combinatorics slant

 * February 22-26, 2010: [[http://wiki.sagemath.org/daysmarseille|Sage days 20]]
   The thematic month [[https://www.lirmm.fr/arith/wiki/MathInfo2010/MathInfo2010|MathInfo 2010]] at CIRM, Marseille included a Sage days week. FlorentHivert, NicolasThiéry, and FrancoSaliola were among the organizers and there was a serious combinatorics slant.

 * July 25-29, 2009: [[combinat/FPSAC09|*-Combinat 2009]]

   We held an International Sage Workshop on [[combinat/FPSAC09|Free and Practical Software for Algebraic Combinatorics]] at RISC, Linz, Austria, right after [[http://www.risc.uni-linz.ac.at/about/conferences/fpsac2009/|FPSAC'09]]

 * May 25th, 2009: The Sage-words library demonstrated at the 2nd Canadian Discrete and Algorithmic Mathematics Conference [[http://www.crm.umontreal.ca/CanaDAM2009/index_e.shtml|CanaDAM'09]]
 [[attachment:2009-05-25-CanaDAM.sws|Sage worksheet]], [[attachment:2009-05-25-CanaDAM.pdf|PDF]].

 * April 15th, 2009: Software demonstration accepted for [[http://www.risc.uni-linz.ac.at/about/conferences/fpsac2009/|FPSAC'09]]
 [[attachment:2009-07-20-FPSAC.pdf|PDF]], [[attachment:.2009-07-20-FPSAC.tex|LaTeX Source]] [[attachment:2009-07-20-FPSAC.bbl|LaTeX bibliography]]

 * January 26-30, 2009: [[http:/combinat/SageCombinatWorkshopOrsay|Sage-Combinat Workshop in Orsay]]

 * 2008-06-19: MuPAD-Combinat join forces with Sage

    Sage-combinat was born as a partial port of [[http://mupad-combinat.sf.net|MuPAD-Combinat]]. After months of discussions and experiments, an enthusiastic consensus emerged in the MuPAD-Combinat community to join Sage. Sage-combinat henceforth became the natural successor of {{{MuPAD-Combinat}}}.

   The transition was a massive investment (and is not yet completely
   over): seven years of hard work to port over! However a lot of
   experience was gained since 2000, and most of the design was pretty
   clear, and we could *share* the work.

----

== Who are we? What is Sage-Combinat used for? ==

 * [[http:/combinat/Contributors|Contributors]]

 * [[http:/combinat/Institutions|Institutions and sponsors]]

 * [[http://www.sagemath.org/library-publications-combinat.html|Publications citing Sage-Combinat]]

----

== How to participate and contribute ==


=== Communication ===

 * Join our mailing lists:
    * Announcement mailing list (to come)
    * [[http://groups.google.com/group/sage-combinat-devel|sage-combinat-devel]]: Developers' mailing list
    * [[http://groups.google.com/group/sage-combinat-commits|sage-combinat-commits]]: A low traffic mailing list which receives an automatic notice whenever a sage-combinat related ticket is modified (and eventually whenever a commit is done on the patch server).
    * [[http://groups.google.com/group/sage-combinat-days|sage-combinat-days]]: Mailing list for the organisation of Sage-Combinat days
 * Check the  [[http://sagetrac.org/sage_trac/wiki/SageCombinatRoadMap|road map and current status]]
 * Post bug reports, suggestions, patches on the [[http://sagetrac.org/sage_trac/milestone/sage-combinat|Sage-Combinat trac server]] or on the [[http://groups.google.com/group/sage-combinat-devel|mailing list]].

 * [[http:/combinat/CiteSageCombinat|Cite Sage-Combinat]] when you use it for research publications.
 * Plume's review pages on Sage-Combinat: [[http://www.projet-plume.org/en/relier/sage-combinat-0|English]] and [[http://www.projet-plume.org/fr/relier/sage-combinat|French]]
 * [[http:/combinat/CoolPictures|Cool pictures we produced with Sage-Combinat for our research]]

=== Code ===

 * The collection of patches is managed using a [[http://combinat.sagemath.org/patches/|patch server]]  (mercurial queues). Use it to try out the latest experimental features, or contribute your own patches!

 * Browse the [[http://combinat.sagemath.org/code/file/tip/sage/|Sage sources with the Sage-combinat patches applied]]

 * Please read the [[http:/combinat/MercurialStepByStep|Step by step tutorial]]  (in particular, how to '''download Sage-Combinat''')

 * For the curious: [[http:/combinat/Mercurial|Technical background on the Sage-Combinat patch server (messy)]].

 * For hg/mercurial lovers: [[http://hgbook.red-bean.com/read/|Mercurial: The Definite Guide]] an e-book by Bryan O'Sullivan

=== Design ===

 * Have a look and participate to [[http:/combinat/DesignDiscussion|design discussions]].

 * Contribute to the list of [[http:/combinat/Weirdness|quirks and weirdness issues]] in the {{{*-Combinat}}} design.

=== Documentation ===

 * Browse the [[http://combinat.sagemath.org/doc/|Sage documentation with the Sage-combinat patches applied]]

 * [[http://combinat.sagemath.org/misc/file/|Mercurial server for miscelleanous files and documents]] ([[http:/combinat/MiscServer|Usage instructions]])

 * [[http:/combinat/HelpOnTheDoc|Some tips and tricks about the documentation system]]
