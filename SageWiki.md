= Sage Wiki =

This is the wiki for the [[https://www.sagemath.org|Sage - Mathematics Software System]] project. This is mainly used by developers for organization of e.g. SageDays and discussion of long-term projects. Since it ''is'' a wiki, pages should be made to last over many, and frequent, changes. If an external link is made, please attach relevant files/content to avoid broken links.

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

The [[devel|development wiki]] also contain some (currently out-of-date) information on Sage development. See also this recent [[CodeSharingWorkflow|discussion on SageMath development workflow]].


= Special Discussion Pages =

 * [[Coding_Theory|Coding Theory in Sage]]
 * [[Debate/Collective infrastructure management]]
 * [[CodeSharingWorkflow|On development models for sharing (experimental) code]]
 * [[Python3-compatible code|Writing Python 3 compatible code]]
 * [[OptiPolyGeom|Optimization and Polyhedral Geometry in Sage]]

 * Supporting the [[Foundation|SageMath Foundation]] 
 * [[GSoC|Google Summer of Code]]

= Demonstrations of Graphical Capabilities =
 * [[art|Art - posters, banners, etc]]
 * [[interact|Interact Demos]]
 * [[K3D-tools|K3D-jupyter 3D visualisation in jupyter notebook]]

= Packages =

For a wiki page about packages, see [[spkg]].

Use the following shell commands below for the newest information:

 * Standard packages: `./sage -standard`
 * Installed packages: `./sage -installed`
 * Optional packages available: `./sage -optional`
 * Experimental packages available: `./sage -experimental`

For some advanced package tools, use `./sage -package`

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

Alphabetical listing of things to do (out-of-date and general organise) - [[mrennekamp]] (as of 2017; see file attatched to see files that I removed)
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
 * [[Chile]] - tiny page for "events in Chile" (update or no?)
 * [[Classify old-style packages]] is a to-do list for the wiki ... I'm (mrennekamp) sure that this is duplicated somewhere
 * [[CodeOfConduct]] not sure why there; would like to see go to official documentation
 * [[CodeSharingWorkflow]] N. Thiery's musings on workflow development. Nothing wrong, but would help to collaborate.
 * [[coercion]]
 * Most [[combinat]] probably
 * [[Comparisons]] .... benchmarks, so will need someone to continue updating or doing, else remove
 * Move [[Cryptography]] to [[Code_Theory]]...?
 * What is [[CUDA]]?
 * [[Debate/Collective infrastructure management]] : we have [[Infrastrucure]], so connect these
 * [[DeformationTheory]] -- I don't know status of progress on this feature
 * [[DenseLinearAlgebra]] -- If not on Trac, then probably should go as a milestone....? Don't know progress of this either
 * [[dev1]] and all their subpages list what was done at "developer days 1", which is same as [[days8.5]]
 * [[DevMapNewPeople]] -- is this needed?
 * [[EasyQuickSageDevelopment]] -- 2011, tiny article on using Sage-NB to contribute. update for SMC?
 * [[ecc2010]] event page for Workshot on Elliptic Curves and Computation
 * [[Emacs]] tips, so move to [[Tips]]
 * figure out what to do with [[EqualityCoercion]]. mostly a bug
 * another unrelated bug: [[EqualityUnhashable]], where "mathematical equality breaks python"
 * [[extcode]] has 2010 contents of spkg that was needing to be merged into Sage (extcode-4.6.spkg)
 * move [[factorization_of_integers_of_special_forms]] to [[Tips]]; but is only mathematical than Sage-specific
 * [[fast_eval]] is 2008 page for a functionality re-doing
 * don't know if [[Fight%20spam%20on%20asksage]] is still relevant, otherwise move to [[contribute]]
 * move [[firefox_trac]] to [[Tips]]
 * [[GitLab]]
 * [[Gmane]] is an alternative mailing list; 2012 suggestion?
 * [[groebner-bases-in-sage-sd2talk]] upload the file from sage.math.washington.edu
 * [[hardware]] probably should remove in favor of [[Infrastructure]]
 * [[healpy]] is it an spkg?
 * [[HeckeAlgebras]] is related to [[combinat]]
 * [[IDE]] should go into [[Tips]]
 * bring [[import]] into a [[guidelines]] page
 * [[Integral%20Calculus]]
 * [[interactive_notebook_software]]
 * [[IpythonNotebook]] -- Missing features for ipython to work within Sage
 * [[K_math_software_survey]] -- Math software in Kindergarten
 * [[LanguagesAndTilings]]
 * [[LanguagesDesign]] -- probably don't need to make a Languages library to compliment a Words library
 * [[Linear_Algebra]]
 * [[magma]] compares magma and sage
 * [[mathbook]] "Mathbook: An XML Application"
 * [[MultivariateGCDBenchmarks]] -- ???? what's this?
 * [[Netbeans]] has been largely forgotten as a [[Tips]] page
 * [[plan/sage-4.0]] release schedule for v 4.0
 * [[PolynomialAPI]] - supposed to unify multi- and univariate types of polynomials in Sage
 * [[Polytopes]] - "Polytopes requests"
 * [[preliminary reading]]
 * remove [[prerequisitesUbuntu]]?
 * keep [[RebaseVsMerge]] as a convention / guideline
 * get rid of [[sage.math]] subpages ([[sage.math/compilers]] and [[sage.math/SageBinaries]])
 * [[sagebeatsmagma]] should go in [[benchmarks]]
 * some pages exist with weird name schemes (ex. [[sagedays46]] should be [[days46]] which should in turn be [[days/46]]
 * [[SageOffice]] 2008 wishlist for full-time "official" SageMath developers (unneeded, but may stay when we start employing more developers)


= Grid of wiki pages to be flattened within sections =
Note: "Contributors" are not necessarily coders/programmers, but "Developers" ''are''. Also, a hint: you can browse pages by looking at system pages such as [[TitleIndex]].
||'''Title'''||'''Description'''||'''Stand Alone?'''||'''Importance (or to whom)'''||'''How to make page better'''||
|| [[art]] || Visuals made with SageMath || Single page, see also [[interact]] || Low || Adding more pictures / animations ||
|| [[bug]] || Archive of Bug Days || Category || Interested (old and new) Contributors || Maintaining Information ||
|| [[buildbot]] || Buildbot and Patchbot || Parent to [[buildbot/owners|owners]] || Contributors || Work with developing Buildbot and Patchbot ||
|| [[cando]] || Features of SageMath || Likely has duplicates || Prospective Users || Add Information and Maintain. New features often. ||
|| [[CodeSharingWorkflow]] || Sharing experimental code || One of many "Conventions" pages || Developers || Merge into a single "Conventions" page or category ||
|| [[Coding_Theory]] || Roadmap and discussions || Stand-Alone || Developers interested in coding theory || Continually update with Trac ||
|| [[coercion]] || Often-referenced topic; deals with integrating set theory || Stand-Alone || Developers ||  ||
|| [[combinat]] || Major group that enhances (SageMath) for algebraic combinatorics || Category || Topic Developers and Researchers || Update and Archive pages ||
|| [[Community]] || List of SageWiki Users, Code Of Conduct || Stand-Alone || Wiki Contributors || Add all accounts to the page ||
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
|| education# || Sage Education Days, where # is digit between 1 and 6 || Category || Low || mrennekamp: rename to scheme "education/#"; keeping for archive ||
|| [[faq]] || Many FAQ's || Page || Users || Visually clean and add FAQ's from [[https://doc.sagemath.org]] ||
|| [[feature_request_guidelines]] || Great attempt at rules for requests || Page, but related to [[CodeOfConduct]] || High || Combine all guideline pages....? ||
|| [[File_formats]] || Types of formats related to Sage || Page || Low || decide if needed ||
|| [[freebsd]] || The discontinued port to FreeBSD || Category || Mid || Archive ||
|| [[FromSageToSageMath]] || Highlights the name transition and when to use each || Page || Mid || Reference often ||
|| [[GrantEurope]] || OpenDreamKit || Page || Low || Remember to express gratitude! ||
|| [[grants/09]] || Grants from 2009 || Category || Low || ||
|| [[graph]] || Graph Theory Project || Category || Mid || Bring up to speed from 2009 ||
|| [[GroupeUtilisateursBordeaux]] || Bordeaux User Groups || Pages || Anyone in France || Also related to [[GroupeUtilisateursParis]] ||
|| [[GSoC]] || Google Summer of Code, which we often participate in || Category || Contributors || Make a formal Category ||
|| [[HowToHostASageDays]] || Tips for hosting events || Page || Anyone planning events...? || ||
|| [[i18n]] || Internationalizing Sage and SageNB || Category || Contributors || Apply to projects ||
|| [[Inbound%20Links]] || Tries to list inbound links to sagemath.org || Page || Contributors || If possible, please expand. Otherwise, the page should be removed.||
|| [[Infrastructure]] || List of what we use to provide services || Page || Developers || Update and promote for mantinence and funding ||
|| [[InstallingGapPackages]] || Instructions for expanding the included GAP || Page || High || Make sure that information is current ||
|| [[InstallingSageOnTheCloud]] || Installing Sage on cloud.sagemath.com || Page || Low || What to do? ||
|| [[interact]] || Interactive examples of SageMath || Category || Promoters, Developers || ||
|| [[Interfaces]] || Using other software in SageMath || Page || High || ||
|| [[jobs]] || Possible jobs for working for us! || Page || ? || ||
|| [[K3D-tools]] || NOT AN SPKG! || Page || Developers || ||
|| [[Letter_to_Python_GHOP]] || Recommended read from early in Sage. || Article || Contributors || Don't change content of the letter, just introduce it. ||
|| [[MathsAuLycee]] || French (also original?) Sage for High School || Page || Contributors || ||
|| [[MercurialQueues]] || Obsolete; we now use Git || Page || Low || Archive ||
|| [[MirrorNetwork]] || Needs to go to [[Infrastructure]] || || || ||
|| [[mpir]] || Library || Category (for BuildFarm subpages) || Med || ? ||
|| [[MPolynomialSystem]] || Class || Page || ? || Figure out who needs this ||
|| [[msri07]] || Interactive Parallel Computation in Support of Research in Algebra, Geometry and Number Theory || Category || ? ||
|| [[MSRItemp]] || Temporary stuff for a presentation..? || Many pages, but not quite category || Mid || ||
|| [[notebook]] || Basically SageNB || Category || Mid || ? ||
|| [[osx64]] || The completed port to OSX || Category || || Keep for archive purposes ||
|| [[padics]] || p-adics and local rings || Category || Contributors || Complete and remove as necessary with Trac ; also see [[padicSageDays]]||
|| [[ParallelMain]] || Distributed Sage || Category || Developers and Users || [[GlennTarbox]] did these small pages in 2009 ||
|| [[po-polsku]] || Resources in Polish || Page || Users || Expand (or put into a "resources in other languages" - sorry, but internet )||
|| [[PortingToPython3]] || matplotlib's experience porting to Python 3 || Page || Developers || reference and/or put on trac (see also [[Python3-compatible code]] ||
|| [[prep]] || 2010 , '11, and '12 MAA PREP Program || Category || Contributors || ? ||
|| [[ps3]] || Fun project porting Sage onto Sony PS3 || Page || Anyone who wants to || Keep it, for now? ||
|| [[Publications_using_SageMath]] || How to properly cite SageMath || Page || Academic Researchers / Users || Expand for formats ||
|| [[quickref]] || Sage Quick Reference Cards || Page (with attatchments) || Users || Move to somewhere not wiki ||
|| [[ReleaseTours]] || Basically more interesting change logs || Category || Mid || Either use changelogs on sagemath.org or bring up to 8 from 4 ||
|| [[reu]] || REU's ('07 and '11) || Category || Low || Update or trash ||
|| review# || Review Days, where # is 1, 2, or 3 || Category || Low || ? ||
|| [[ReviewChecklist]] || How to author or review a ticket || Page || Contributors || Remove from Developer Guide in documentation ||
|| SAGE-intro-Language || Introduces SageMath (in French, German, Italian, Portuguese, and Spanish) || Translated || International Newcomers || Standardize ||
|| [[sage_mode]] || Historical archive for first Emacs mode || Page || Low || Preserve ||
|| [[sage_uw]] || UW Sage Mathematics Software Seminar || Sub-pages || Low || Get rid of if not needed, only '06-'07, update links ||
|| [[SageAppliance]] || Virtual Machine for Sage || Category || HIGH (what we use for Windows distribution) || Coordinate with Trac? ||
|| [[SageEducatorCenter]] || Similar to [[devel]], but for educators || Page || High || Point educators here ||
|| [[SageFinance]] || Quantitative Finance in SageMath || Category || Developers || Move to Trac ||
|| [[SageIndex]] || INDEX OF ALL AVAILABLE SAGE PUBLICATIONS || Page || High || CONTRIBUTE! NEEDS TO GET THROUGH BETA! ||
|| [[SageMagazine]] || Proposal for a publication || Page || Contributors || Revive if we can find someone to do, but we have planet.sagemath.com for blogs ||
|| [[SageLiveUSB]] || Inventory of Live USB's (based on various distros) || Page || Mid || Keep with developers ||
|| [[SageMathLive]] || Instructions for making a live disk image || Page || Developers, Contributors || Have available ||
|| [[SageModeComparison]] || Compare Emacs modes || Page || Developers || Make sure to take down if not updated (or put in a single comparisons page) ||
|| [[sagenb]] || Sage Notebook (predecessor to SageMathCloud) || Page || Users/developers? || Update while SageNB is used ||



= About this wiki =

'''Editing the wiki.''' Page editing uses the MoinMoin syntax. To edit the wiki, log in using your [[https://trac.sagemath.org/sage_trac/|sage-trac]] account. Getting an account involves convincing a human by email that you not a spammer.

'''License and Copyright.''' Contributions to the [[https://www.sagemath.org/|Sage]] wiki and to the [[https://doc.sagemath.org|Sage documentation]] are licensed under the [[https://creativecommons.org/licenses/by-sa/3.0/|Creative Commons 3.0 BY-SA license]]. By contributing, you agree to place your contribution under that license.
