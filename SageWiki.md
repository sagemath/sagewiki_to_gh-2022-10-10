= Sage Wiki =

This is the wiki for the [[http://www.sagemath.org|Sage - Mathematics Software System]] project. This is mainly used by developers for organization of e.g. SageDays and discussion of long-term projects. Since it ''is'' a wiki, pages should be made to last over many, and frequent, changes. If an external link is made, please attach relevant files/content to avoid broken links.

<<TableOfContents>>

= SageDays and Sage Workshops =
<<Anchor(sagedays)>>
== Past and future Workshops ==
 * Upcoming Workshops
 <<Include(Workshops, , from="^##start-include$", to="^----$")>>
 * [[Workshops | All Workshops]], including past and future Sage Days, Bug Days, Doc Days, Review Days, Education Days, and some other Sage-related events.

== Hosting a workshop ==
 * [[HowToHostASageDays|How To Host A Sage Days]] --- Advice to future hosts
 * [[HowToSpreadSageDuringAWorkshop|How to Spread Sage During a Workshop]] --- Advice to future hosts

= Major Wiki Pages =
Note: "Contributors" are not necessarily coders/programmers, but "Developers" 'are'.
||'''Title'''||'''Description'''||'''Stand Alone?'''||'''Importance (or to whom)'''||'''How to make page better'''||
|| [[art]] || Visuals made with SageMath || Single page, see also [[interact]] || Low || Adding more pictures / animations ||
|| [[bug]] || Archive of Bug Days || Category || Interested (old and new) Contributors || Maintaining Information ||
|| [[buildbot]] || Buildbot and Patchbot || Parent to [[buildbot/owners|owners]] || Contributors || Work with developing Buildbot and Patchbot ||
|| [[cando]] || Features of SageMath || Likely has duplicates || Prospective Users || Add Information and Maintain. New features often. ||
|| [[CodeOfConduct]] || Moral & Behavior Standards || Stand-Alone || Contributors || Harness to prevent and/or solve conflicts ||
|| [[CodeSharingWorkflow]] || Sharing experimental code || One of many "Conventions" pages || Developers || Merge into a single "Conventions" page or category ||
|| [[Coding_Theory]] || Roadmap and discussions || Stand-Alone || Developers interested in coding theory || Continually update with Trac ||
|| [[coercion]] || Often-referenced topic; deals with integrating set theory || Stand-Alone || Developers ||  ||
|| [[combinat]] || Major group that enhances (SageMath) for algebraic combinatorics || Category || Topic Developers and Researchers || Update and Archive pages ||
|| [[Community]] || List of SageWiki Users || Stand-Alone || Wiki Contributors || Add all accounts to the page ||
|| [[Comparisons]] || Compares SageMath to various competitors || Parent Page || Users and Developers || Make a single page and update often ||
|| [[contribute]] || Ideas for ways to start contributing to SageMath || Only [[contribute/AnswerQuestions]] so far || Prospective Contributors || Add ideas ||
|| [[CorporateIdentity]] || Standardize how SageMath is referenced || Stand-Alone || High || Add information, such as source for making the logo ||
|| [[cyclo]] || Cyclotomic Linear Algebra; old project with solved Trac ticket || Category || Low || Move, maintain, or remove ||
|| days## || (Naming Sage Days) || Category || Mid || (mrennekamp: Would like to rename all to fix name scheme.) Maintain information for archiving. ||
|| [[debian]] || All things related to Debian and SageMath || Category || Mid || Updates as needed ||
|| [[devel]] || "Organize development of SageMath" || Category || HIGH || Link all related pages as it is now ||
|| [[Distribution]] || Gives information for distribution (ex. package management) || Stand-Alone || Contributors || Maintain information ||
|| [[doc]] || Doc Days, which (yes) focused on documentation || Category || Archive, Interested Contributors || Maintain ||
|| [[DocumentationProject]] || Main page for documentation || 'Should be' a Category || Contributors and users || Add info for all internal and external documents ||
|| [[DsageNg]] || SageMath in a distributed environment || Category || Developers || Update often with Trac ||
|| [[dynamics]] || Implementing various algorithms related to dynamics || Category || Developers || Update with Trac ||


= People =
The most up-to date list of Sage developers is on our [[http://trac.sagemath.org/sage_trac/wiki#AccountNamesMappedtoRealNames|list of developers on the Sage trac wiki]].

[[http://www.sagemath.org/development-map.html|Overview of (many) Sage developers on a world map]]

<<Anchor(messagingsites)>>
= Mailing Lists / Chat Rooms =
 * [[http://groups.google.com/group/sage-support|sage-support]]
 * [[http://groups.google.com/group/sage-devel|sage-devel]]
 * [[http://groups.google.com/group/sage-release|sage-release]]
 * [[http://groups.google.com/group/sage-announce|sage-announcements]]
 * [[http://groups.google.com/group/sage-edu|sage-edu]] for teaching using Sage
 * [[http://groups.google.com/group/sage-dsageng|sage-dsageng]] for Distributed and Parallel Sage
 * [[http://groups.google.com/group/sage-finance|sage-finance]] for finance
 * [[http://groups.google.com/group/sage-coding-theory|sage-coding-theory]] for coding theory
 * [[http://groups.google.com/group/sage-nt|sage-nt]] for number theory
 * [[http://groups.google.com/group/sage-combinat-devel|sage-combinat-devel]]
 * IRC channel: {{{#sagemath}}} on [[http://freenode.net/|freenode ]] (`chat.freenode.net`)
 * The Sage website contains links to [[http://www.sagemath.org/development-groups.html | other discussion mailing lists]].

= Development =

Development is handled using "tickets" on the [[http://trac.sagemath.org/sage_trac/|trac server]].

The main developer doc is the [[http://www.sagemath.org/doc/developer/ | Developers' Guide]].

The [[devel | development wiki]] also contain some (currently out-of-date) information on Sage development. See also this recent [[CodeSharingWorkflow|discussion on SageMath development workflow]].


= Special Discussion Pages =

 * [[Coding_Theory|Coding Theory in Sage]]
 * [[Debate/Collective infrastructure management]]
 * [[CodeSharingWorkflow|On development models for sharing (experimental) code]]
 * [[Python3-compatible code|Writing Python 3 compatible code]] see also [[PortingToPython3|matplotlib experience Porting to Python 3]]

= Demonstrations of Graphical Capabilities (mostly out-of-date) =
 * [[art|Art - posters, banners, etc]]
 * [[interact|Interact Demos]]
 * [[http://tug.ctan.org/pkg/sagetex|SageTeX - Put some sage into your TeX]]
 * [[K3D-tools|K3D-jupyter 3D visualisation in jupyter notebook]]

= Packages =

These lists are possibly out-of-date. Use the listed Sage command for the newest information:

 * [[standard_packages_available_for_SAGE|Standard packages available for Sage]] (`./sage -standard`)
 * [[optional_packages_available_for_SAGE|Optional packages available for Sage]] (`./sage -optional`)
 * [[experimental_packages_available_for_SAGE|Experimental packages available for Sage]] (`./sage -experimenta`)
 * [[Sage_Spkg_Tracking|SPKG changelog and descriptions]]

= ''OUT OF DATE! NEEDS UPDATED!'' =
 * [[Tips]]
 * [[UsingSquashFS]]
 * [[SagemathLive]]
 * [[Send corrected worksheets to each student]]
 * [[SageAppliance|Working with the Sage Virtual Machine (VirtualBox)]] (See also: [[SageApplianceV4|previous version of the Sage VM]])
 * [[InstallingGapPackages|Installing GAP packages]]
 * [[faq|Sage FAQ - Frequently Asked Questions (Out-of-date)]]
 * [[SAGE_in_the_News|Sage In the News and Blogs (Out-of-date)]]
 * [[sagenb|List of institutions and projects using Sage]]
 * [[OSCAS]]s
 * [[SAGE_Reviews|Sage Reviews]]
 * [[Teaching_using_SAGE|Teaching using Sage]]
 * [[Teaching_with_SAGE|Teaching with Sage]]
 * [[quickref|Sage Quick Reference Cards]]
 * [[DocumentationProject|Documentation Project]]
 * [[Comparisons]]
 * [[SAGE_in_the_News|Sage in the News]]
 * [[Publications_using_SAGE|Publications using Sage]]
 * [[Talks| Talks and Presentations about Sage]]
 * [[SageForHighSchool|Sage for High school usage]] (see here for [[HighSchoolDesign|development page]])
 * [[dynamics|Dynamical systems with Sage]]
 * [[GSoC|Google Summer of Code]]
 * [[SageLiveUSB|Inventory Live USB running sage]]
 * [[GrantEurope|asking for a european grant]]
 * [[IpythonNotebook|What is missing to use ipython notebook ?]]
 * [[Infrastructure]]
 * [[Fight spam on asksage]]
 * [[Classify old-style packages]]
 * [[SageAppliance|Using Sage within virtualbox]]
 * [[Distribution]]
 * [[Social Networks]]
 * [[CommunityManagement|Collection of stories on Open Source community management]]

Alphabetical listing of things to do (out-of-date and general organise) - mrennekamp
 * [[aix]] which talks of porting sage to AIX
 * All SEP's (Sage Enhancement Proposal) were / need to be removed, as to keep information on Trac
 * [[ams]] booths at AMS / MAA meetings ('08 and '09) and an '09 special session
 * [[art]] duplicates many things, but need to put ALL SAGE ARTWORK EVER MADE into this wiki page ... also broken links
 * [[Tips/bash-completion]] one of many [[Tips]], so not sure what to do with it
 * [[BLAD]] BLAD integration in Sage 'This wiki page is about the integration of the Bibliothèques Lilloises d'Algèbre Différentielle in Sage.' 2011
 * [[bruhat]] project from 2008, S sub n under bruhat order
 * take all Bugdays and put each into ONE page
 * [[buildbot]] -- merge subpages
 * [[bug]] -- add content to describe Bug Days in general
 * [[cando]] documents "What Sage Can Do" -- decide what to do with it. current version is from 2008.
 * (all) Categories - eg [[combinat/categoryframeworkandcleanup]] and [[DsageNg]]
 * [[Chile]] - tiny page for "events in Chile"
 * [[Classify old-style packages]] is a to-do list for the wiki ... I'm (mrennekamp) sure that this is duplicated somewhere
 * [[CodeOfConduct]] not sure why there; would like to see go to official documentation
 * [[CodeSharingWorkflow]] N. Thiery's musings on workflow development. Nothing wrong, but would help to collaborate.
 * [[coercion]]
 * Most [[combinat]] probably
 * [[Comparisons]]
 * Move [[Cryptography]] to [[Code_Theory]]
 * What is [[CUDA]?
 * [[Debate/Collective infrastructure management]] : we have [[Infrastrucure]], so connect these
 * [[DeformationTheory]] -- I don't know status of progress on this feature
 * [[DenseLinearAlgebra]] -- If not on Trac, then probably should go as a milestone....? Don't know progress of this either
 * [[dev1]] and all their subpages list what was done at "developer days 1", which is same as [[days8.5]]
 * [[DevMapNewPeople]] -- is this needed? 


= About this wiki =

'''Editing the wiki.''' Page editing uses the MoinMoin syntax. To edit the wiki, log in using your [[http://trac.sagemath.org/sage_trac/|sage-trac]] account. Getting an account involves convincing a human by email that you not a spammer.

'''License and Copyright.''' Contributions to the [[http://www.sagemath.org/|Sage]] wiki and to the [[http://doc.sagemath.org|Sage documentation]] are licensed under the [[http://creativecommons.org/licenses/by-sa/3.0/|Creative Commons 3.0 BY-SA license]]. By contributing, you agree to place your contribution under that license.
