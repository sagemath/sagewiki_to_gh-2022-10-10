#acl acl_hierarchic: True
#acl was:read,write,admin jason:read,write,admin rbeezer:read,write,admin KiranSKedlaya:read,write,admin KiranKedlaya:read,write,admin ThomasJudson:read,write,admin DavidFarmer:read,write,admin

<<TableOfContents(2)>>
Mailing list: http://groups.google.com/group/sage-grants

This is the wiki page for the CCLI 2009 proposal that Jason Grout, Rob Beezer, Kiran Kedlaya, and William Stein, are putting together (through AIM) to get support for the Sage project. 

[[http://www.nsf.gov/pubs/2009/nsf09529/nsf09529.html|CCLI Solicitation]]

[[http://www.nsf.gov/publications/pub_summ.jsp?ods_key=nsf101|2010 Grant Proposal Guide]]

= The Actual Proposal =

[[/proposal|The Proposal]]

[[/timeline|Timeline]]

= Next Conference call: Thu 19 Nov 2009, 11AM Pacific Time =
Dial:  866 589 0901, passcode:  8227893# 

[[/ConferenceCall/18Aug|18 Aug Conference Call]]

[[/ConferenceCall/25Aug|25 Aug Conference Call]]

[[/ConferenceCall/02Sep|02 Sep Conference Call]]

[[/ConferenceCall/22Oct| 22 Oct Conference Call]]

[[/ConferenceCall/29Oct| 29 Oct Conference Call]]

[[/ConferenceCall/12Nov| 12 Nov Conference Call]]

[[/ConferenceCall/13NovNSF| 13 Nov Conference Call WITH NSF (Dan Maki)]]

= Project Ideas =
 * applied math FEMHUB: http://nb.femhub.org/home/pub/5 http://nb.femhub.org/home/pub/6 http://nb.femhub.org/home/pub/7 http://nb.femhub.org/home/pub/8


 * A list of ideas (with cost estimates) coming from a discussion on sage-devel: [[attachment:stein-ideas.pdf]]

 * Rough draft of Beezer's internal sabbatical proposal
   * Draft 1 (2009/09/02) [[attachment:beezer-lantz-1.pdf]]
   * Draft 2 (2009/09/07) [[attachment:beezer-lantz-2.pdf]]

 * Beezer's group theory exercises in Sage [[attachment:m433-sage-exercises-final.pdf]]

 * Textbooks
   * Finish Rob Beezer's system for easily creating worksheets from textbook source files
   * Make several textbooks
     * Beezer's linear algebra textbook
     * Judson's algebra textbook
     * Bogart's problem book in combinatorics
   * Translate other textbooks' MMA/Matlab/Maple code/appendices to Sage
   * Get a community of people writing textbooks or course notes using Sage and converting them to folders of worksheets.
     * Sponsor a workshop on this (via AIM?)
     * Sponsor Joint Meetings workshop/Mathfest workshop on this
     * Mini-grants for people to convert textbooks and course notes to Sage
     * Mini-grants for people to write course materials for Sage (e.g., interacts)
 * Webwork integration
   * Make it possible to use Sage to help answer webwork problems
   * Make it possible to use sage interacts, for example, to experiment with an idea while answering a webwork problem
   * Make it possible to use Sage to help write webwork questions (e.g., Find the integral of \sage{diff(x^2,x)}, where Sage takes the answer and makes a question)
 * Moodle integration
 * Make it extremely easy to set up a campus-wide sage server
   * GUI interface (VMWare appliance-like?) to:
     * Create a new notebook server for a new class or instructor
     * Start/stop notebook servers; see the resources consumed by a notebook server
     * Add users, or use LDAP or something else for authentication
     * Upgrade Sage
   * Clear and easy documentation about setting up a campus-wide server
   * Get sage to be used on several new campuses (this helps fulfill the "project is institutionalized" goal of type II proposals)
   * New mailing list for server administration issues
   * make a list of suggested hardware requirements
   * See what support webwork and moodle offer for setting up campus servers---they probably have good ideas
 * Make Sage "Classroom-ready" (i.e., polishing that needs to be done)
   * Go through linear algebra; make interfaces consistent and implement anything else an undergrad course in linear algebra would need
   * Finish Robert Miller's fast C graph backends
   * Polish graphics
     * Make 2d graphics have transformations (i.e., rotate, translate, etc.)
     * Expose matplotlib better, so we don't have to just duplicate everything that matplotlib has.
   * Polish any issues in calculus (e.g., see recent sage-devel posts about differentation)
 * Documentation
   * Mini-grants for people to write subject-specific tutorials, aimed at undergrad education
 * Library of interacts distributed with Sage, with organization (see MMA Demonstrations website)
   * A more organized and polished version of the [[http://wiki.sagemath.org/interact|Sage interacts]]
 * Windows port
   * Finish whatever is left to make the Cygwin port run
 * Notebook enhancements
   * System for getting information from the Sage notebook on how it is being used, feedback, etc.
   * Input widgets in the notebook cell-- I think this requires the cells to be content-editable divs, so it would probably be a summer project
     * Javascript equation editor (maybe fund Davide Cervone to finish his excellent start of one?)
     * Integrate Rado's graph editor
     * Matrix widget
     * Geogebra widget
   * @interact improvements
     * Be able to specify the layout of controls and output
     * 2d locator (pick a point in a plot)
     * interacts within interacts
     * interacts that run on published pages
   * Interactive 2d plots
     * Javascript 2d plots (flot?)
     * html5 matplotlib backend (some initial work already done by matplotlib people)
   * Tags for worksheets
   * Be able to zipped collections of worksheets with accounts=True
   * Be able to publish worksheets to a subgroup of people (e.g., a class)
   * Embed 2d geogebra
   * Get Codenode up to the level of the Sage notebook, and possibly switch?
 * Standalone version using Enthought's Envisage framework, with 3d graphics by Mayavi and 2d graphics by Chaco.  This would lead to MMA-like response times for @interacts with an industry-standard 3d OpenGL graphics toolkit (VTK).  The standalone version would interact with Sage servers, letting a user push and pull worksheets, etc.

= Budget =

 [[/Budget|Budget Details]]

= Past CCLI Awards =


  * [[http://www.nsf.gov/awardsearch/afSearch.do?ProgEleCode=7494&page=4&QueryText=&SearchType=afSearch&PIFirstName=&PILastName=&COPILastName=&COPIFirstName=&IncludeCOPI=&PIInstitution=&PIState=&PIZip=&PICountry=&ProgOrganization=&ProgOfficer=&ProgProgram&ProgRefCode=&ProgFoaCode=&CongDistCode=&AwardNumberOperator=&AwardNumberFrom=&AwardNumberTo=&StartDateOperator=&ExpDateOperator=&StartDateFrom=&StartDateTo=&ExpDateFrom=&ExpDateTo=&AwardAmount=&AwardInstrument=&Search=Search#results|Past CCLI Phase I Awards]]

  * [[http://www.nsf.gov/awardsearch/afSearch.do?ProgEleCode=7492&page=4&QueryText=&SearchType=afSearch&PIFirstName=&PILastName=&COPILastName=&COPIFirstName=&IncludeCOPI=&PIInstitution=&PIState=&PIZip=&PICountry=&ProgOrganization=&ProgOfficer=&ProgProgram&ProgRefCode=&ProgFoaCode=&CongDistCode=&AwardNumberOperator=&AwardNumberFrom=&AwardNumberTo=&StartDateOperator=&ExpDateOperator=&StartDateFrom=&StartDateTo=&ExpDateFrom=&ExpDateTo=&AwardAmount=&AwardInstrument=&Search=Search#results|Past CCLI Phase II Awards]] ([[http://www.nsf.gov/awardsearch/afSearch.do?SearchType=afSearch&page=4&QueryText=software&PIFirstName=&PILastName=&PIInstitution=&PIState=&PIZip=&PICountry=&ProgOrganization=&ProgOfficer=&ProgEleCode=7492&BooleanElement=false&ProgRefCode=&BooleanRef=false&ProgProgram=&ProgFoaCode=&OriginalAwardDateOperator=&OriginalAwardDateFrom=&OriginalAwardDateTo=&StartDateOperator=&StartDateFrom=&StartDateTo=&ExpDateOperator=&ExpDateFrom=&ExpDateTo=&AwardNumberOperator=&AwardNumberFrom=&AwardNumberTo=&AwardAmount=&AwardInstrument=&Search=Search#results|CCLI-II grants containing the word "software" in title or abstract]])

  * [[http://www.nsf.gov/awardsearch/afSearch.do?ProgEleCode=7493&page=4&QueryText=&SearchType=afSearch&PIFirstName=&PILastName=&COPILastName=&COPIFirstName=&IncludeCOPI=&PIInstitution=&PIState=&PIZip=&PICountry=&ProgOrganization=&ProgOfficer=&ProgProgram&ProgRefCode=&ProgFoaCode=&CongDistCode=&AwardNumberOperator=&AwardNumberFrom=&AwardNumberTo=&StartDateOperator=&ExpDateOperator=&StartDateFrom=&StartDateTo=&ExpDateFrom=&ExpDateTo=&AwardAmount=&AwardInstrument=&Search=Search#results|Past CCLI Phase III Awards]]

  * [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0535327]] -- this type II past award was for developing flash libraries for math education.  I've heard Doug Ensley (the co-pi) talk about this work at national meetings.  They also had a PREP workshop helping people learn how to develop flash applets for math education.

  * [[http://www.nsf.gov/awardsearch/afSearch.do?SearchType=afSearch&page=4&QueryText=web&PIFirstName=&PILastName=&PIInstitution=&PIState=&PIZip=&PICountry=&ProgOrganization=&ProgOfficer=&ProgEleCode=7492&BooleanElement=false&ProgRefCode=&BooleanRef=false&ProgProgram=&ProgFoaCode=&OriginalAwardDateOperator=&OriginalAwardDateFrom=&OriginalAwardDateTo=&StartDateOperator=&StartDateFrom=&StartDateTo=&ExpDateOperator=&ExpDateFrom=&ExpDateTo=&AwardNumberOperator=&AwardNumberFrom=&AwardNumberTo=&AwardAmount=&AwardInstrument=&Search=Search#results|Type II grants with the word "web" in title or abstract]].  Some relevant awards dealing with software and curricula are:
    * [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0918271|Interactive web activities for a statics course]] -- there were actually more than 5 awards, all having the same title, but for different amounts.
    * [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0816783| Web-based Interactive Organic Chemistry Homework]]
    * [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0935049| Bio-Organic Reaction Animations ]], see also another award for this at [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0717133]]
    * [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0716952| Exploring Earth's Volcanic Environment: Development of Virtual Reality Education Modules(Phase 2) ]]
    * [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0618456|Collaborative Research-Collaborative Research-Creating Exemplary Curricula and Supporting Faculty Development in Using Social Explorer to Teach with Demographic Data Maps]]
    * [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0618744| Biofilms: The Hypertextbook--A Web-Based Active-Learning Approach for Rapid Infusion of Emerging Knowledge into Undergraduate STEM Curricula ]]
    * [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0206571| The Web-based ARTIST Project ]]
    * [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0231083| MathDL Books Online ]]

= Studies about Technology and Teaching =
  * http://cm.math.uiuc.edu/studies -- Calculus and Mathematica is a book/course using Mathematica to teach calculus.  This is a page talking about studies related to this course.
    * Beezer taught a course with these materials in 1992, if that experience is relevant.

  * http://media.wolfram.com/documents/fowler/  -- Wolfram has put some time into compiling research that supports using technology and math software in teaching.

  * http://www.maa.org/columns/launchings/launchings_04_09.html  -- References some studies about the effectiveness of webwork.



= Open Textbooks in Mathematics =

 * Candidates for conversion to Sage notebooks or supplements- open licenses, TeX source
   * [[http://linear.pugetsound.edu/|A First Course in Linear Algebra, Beezer]]
   * [[http://abstract.ups.edu/|Abstract Algebra, Theory and Applications, Judson]]
   * [[http://www.math.dartmouth.edu/news-resources/electronic/kpbogart/|Combinatorics Through Guided Discovery, Bogart]]
   * [[http://www.mecmath.net/|Vector Calculus, Michael Corral]]  Supplement with multivariate calc interacts
   * [[http://mecmath.net/trig/|Trigonometry, Michael Corral]] Student project - supplement with interacts
   * Maybe more at [[http://linear.ups.edu/curriculum.html|Open Math Curriculum]]

 * Presentation at Sage Days 15
   * [[http://wiki.sagemath.org/days15?action=AttachFile&do=get&target=beezer-authoring-SD15.pdf|Authoring Interactive Worksheets (Slides, PDF)]]
   * [[http://wstein.org/sagedays15/M2U00404-beezer-interactive_sage_worksheets.MPG|Video of Presentation (MPEG)]]

 * Demonstration Project
   * Make a new account at [[http://sagenb.org|sagenb.org]]
   * Login and click on "Upload" in upper-left
   * Into second box cut/paste the URL:  `http://buzzard.ups.edu/sage/sage-group-theory-primer.sws`
   * Click on "Upload Worksheet" button
   * Experiment running Sage cells (click in cell, then click "evaluate" below)
   * Search on the phrase "default=12" to find interactive Sage cell
   * Evaluate the cell, then vary group order to see all subgroups of a cyclic group
   * This tutorial was authored in LaTeX, then converted with software tools to a Sage worksheet
   * PDF version of worksheet, and more, at [[http://abstract.ups.edu/sage-aata.html|Abstract Algebra textbook site]]
   * Most of the translation is via [[http://www.cse.ohio-state.edu/~gurari/TeX4ht/|tex4ht]], an NSF funded project
   * Rendering in Sage is via [[http://www.math.union.edu/~dpvc/jsMath/|jsMath]]


= WebWork =
 * MAA wiki on !WebWork.  Note NSF funding.  http://webwork.maa.org/wiki/Main_Page
 * National Problem Library for !WebWork (12,000 problems)  http://webwork.maa.org/wiki/National_Problem_Library

= Moodle =

 * [[http://moodle.org/stats/|Statistics about Moodle]]--Seems like Moodle has a huge number of users.

= MAA Resources =

 * PREP Workshops for dissemination? Especially for community colleges?  Done virtually, there would be no travel expenses for participants.  http://www.maa.org/prep/
 * Michael Pearson, MAA Director of Programs and Services, http://www.maa.org/aboutmaa/pearsonbio.html


= Random advice =
[[/nathan_carter_advice|Advice from Nathan Carter about writing a CCLI grant]]
