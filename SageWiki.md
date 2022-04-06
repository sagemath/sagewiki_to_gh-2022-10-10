= SageMath Wiki =

This is the wiki for the [[https://www.sagemath.org|Sage - Mathematics Software System]] project. There are other [[ThingsCalledSage]].

This wiki is mainly used by developers for organization of e.g. SageDays and discussion of long-term projects. Since it ''is'' a wiki, pages should be made to last over many, and frequent, changes. If an external link is made, please attach relevant files/content to avoid broken links.

||<tablestyle="font-size: 0.8em;">||<#F7819F>❤ || You can help by becoming a [[https://github.com/sponsors/sagemath|sponsor]]||


||<tablestyle="font-size: 0.8em;">||<#74DF00>Information || Since version 9.0, Sage is using '''Python 3'''. See [[Python3-Switch]] for more information.||

<<TableOfContents>>

= SageDays, Sage Workshops, other activities =
<<Anchor(sagedays)>>
== Past and future Workshops ==
 * Upcoming Workshops
 <<Include(Workshops, , from="^##start-include$", to="^----$")>>
 * [[Workshops | All Workshops]], including past and future Sage Days, Bug Days, Doc Days, Review Days, Education Days, and some other Sage-related events.

== Sage Release Tours (version 9.0 and later) ==

 * [[ReleaseTours]]

== Google Summer of Code ==

 * [[GSoC|Google Summer of Code]]

== Hosting a workshop ==
 * [[HowToHostASageDays|How To Host A Sage Days]] --- Advice to future hosts
 * [[HowToSpreadSageDuringAWorkshop|How to Spread Sage During a Workshop]] --- Advice to future hosts
= Major external (editable) related pages =
||'''URL'''||'''Description'''||
||[[https://www.sagemath.org/]]||Official homepage of SageMath||
||[[https://trac.sagemath.org/]]||Where development happens||
||[[https://pypi.org/project/sagemath/]]||dummy package on PyPi||
||[[https://wiki.archlinux.org/index.php/SageMath]]||Arch Linux wiki||


= People =
The most up-to date list of Sage developers is on our [[https://trac.sagemath.org/sage_trac/wiki#AccountNamesMappedtoRealNames|list of developers on the Sage trac wiki]].

[[https://www.sagemath.org/development-map.html|Overview of (many) Sage developers on a world map]]

<<Anchor(messagingsites)>>
= Mailing Lists / Chat Rooms =
[[https://groups.google.com/group/sage-support|sage-support]], [[https://groups.google.com/group/sage-devel|sage-devel]], [[https://groups.google.com/group/sage-release|sage-release]], [[https://groups.google.com/group/sage-announce|sage-announcements]], [[https://groups.google.com/group/sage-edu|sage-edu]] for teaching using Sage, [[https://groups.google.com/group/sage-finance|sage-finance]] for finance, [[https://groups.google.com/group/sage-coding-theory|sage-coding-theory]] for coding theory, [[https://groups.google.com/group/sage-nt|sage-nt]] for number theory, and [[https://groups.google.com/group/sage-combinat-devel|sage-combinat-devel]].

[[https://zulip.sagemath.org | Zulip]] group chat server for realtime collaboration on Sage (like Slack).  Fairly low-activity but more than IRC.

[[IRC]] channel: {{{#sagemath}}} on [[https://freenode.net/|freenode ]] (`chat.freenode.net`)

The Sage website contains links to [[https://www.sagemath.org/development-groups.html | other discussion mailing lists]].

= Development =

Development is handled using "tickets" on the [[https://trac.sagemath.org/sage_trac/|trac server]].

The main developer doc is the [[https://www.sagemath.org/doc/developer/ | Developers' Guide]].

Release notes (higher level than change logs) are collaboratively prepared at [[ReleaseTours]].

[[Infrastructure|Development/project infrastructure]]

= Special Discussion Pages =

 * [[Coding_Theory|Coding Theory in Sage]]
 * [[Debate/Collective infrastructure management]]
 * [[Python3-compatible code|Writing Python 3 compatible code]]
 * [[OptiPolyGeom|Optimization and Polyhedral Geometry in Sage]]
 * [[asksage retagging]]
 * [[Conda|Using Conda to build SageMath]]


= Features =

 * [[http://www.sagemath.org/tour.html|sagemath.org: SageMath Feature Tour]]
 * [[Interfaces|Sage wiki: SageMath interfaces to and from other software]]

== Demonstrations of Graphical Capabilities ==
 * [[art|Art - posters, banners, etc]]
 * [[interact|Interact Demos]]
 * [[K3D-tools|K3D-jupyter 3D visualisation in jupyter notebook]]

= Packages =

== New-style SPKGs ==

There is a single authoritative place to learn about the 
specific set of packages (new-style SPKGs) that Sage uses: The 
[[https://github.com/sagemath/sage/tree/develop/build/pkgs|SAGE_ROOT/build/pkgs/]] directory
in the Sage distribution.  Each SPKG is represented by a subdirectory. The structure
of these subdirectories is explained in 
the [[https://doc.sagemath.org/html/en/developer/packaging.html|Developer's Guide|]].

Since Sage 9.2, the [[https://doc.sagemath.org/html/en/reference/spkg/|spkg section of the Sage reference manual]] is automatically generated from the information in `SAGE_ROOT/build/pkgs/`. ([[https://trac.sagemath.org/ticket/29655|Trac #29655]] improves the formatting of this information.)

Use the following shell commands below to access the information from the `SAGE_ROOT/build/pkgs`
directory of your copy of Sage:

 * Standard packages: `./sage -standard`
 * Installed packages: `./sage -installed`
 * Optional packages available: `./sage -optional`
 * Experimental packages available: `./sage -experimental`
 * Details about an SPKG: `./sage -info <SPKG>`

For some advanced package tools, use `./sage -package`

== External packages ==

 * SageMathExternalPackages
 * [[CodeSharingWorkflow|On development models for sharing (experimental) code]]

= About this wiki =

'''Editing the wiki.''' Page editing uses the MoinMoin syntax. To edit the wiki, log in using your [[https://trac.sagemath.org/sage_trac/|sage-trac]] account. Getting an account involves convincing a human by email that you not a spammer. If you edit an existing page with a long history, a key question is: "If someone opens this page tomorrow, will they be able to tell which information is current and which is outdated?" Edit accordingly.

'''SageWiki maintenance.''' The [[SageWikiMaintenance page]] attempts to reorganize the wiki, which has accumulated many outdated pages.

'''License and Copyright.''' Contributions to the [[https://www.sagemath.org/|Sage]] wiki and to the [[https://doc.sagemath.org|Sage documentation]] are licensed under the [[https://creativecommons.org/licenses/by-sa/3.0/|Creative Commons 3.0 BY-SA license]]. By contributing, you agree to place your contribution under that license.
