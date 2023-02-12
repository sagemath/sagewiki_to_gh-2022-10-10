
[[_TOC_ 2]] Mailing list: <a href="http://groups.google.com/group/sage-grants">http://groups.google.com/group/sage-grants</a> 

This is the wiki page for the CCLI 2009 proposal that Jason Grout, Rob Beezer, Kiran Kedlaya, and William Stein, are putting together (through AIM) to get support for the Sage project.  

<a class="http" href="http://www.nsf.gov/pubs/2009/nsf09529/nsf09529.html">CCLI Solicitation</a> 

<a class="http" href="http://www.nsf.gov/publications/pub_summ.jsp?ods_key=nsf101">2010 Grant Proposal Guide</a> 


# Supplemental Questions (July 2010)

<a href="/grants/09/ccli/supplemental">NSF Questions, with responses</a> 


# The Actual Proposal

<a href="grants/09/ccli/fastlane-rc2.pdf">Full Proposal with All Forms (fastlane-rc2, 2010/01/12, 9AM PST)</a> -- This is Release Candidate 2 of the proposal. 

<a href="/grants/09/ccli/proposal">The Proposal</a> 

<a href="/grants/09/ccli/timeline">Timeline</a> 


# Next Conference call: Tue 8 Dec 2009, 8AM Pacific Time

Dial:  866 589 0901, passcode:  8227893#  

<a href="/grants/09/ccli/ConferenceCall/18Aug">18 Aug Conference Call</a> 

<a href="/grants/09/ccli/ConferenceCall/25Aug">25 Aug Conference Call</a> 

<a href="/grants/09/ccli/ConferenceCall/02Sep">02 Sep Conference Call</a> 

<a href="/grants/09/ccli/ConferenceCall/22Oct">22 Oct Conference Call</a> 

<a href="/grants/09/ccli/ConferenceCall/29Oct">29 Oct Conference Call</a> 

<a href="/grants/09/ccli/ConferenceCall/12Nov">12 Nov Conference Call</a> 

<a href="/grants/09/ccli/ConferenceCall/13NovNSF">13 Nov Conference Call WITH NSF (Dan Maki)</a> 


# Project Ideas

* applied math FEMHUB: <a href="http://nb.femhub.org/home/pub/5">http://nb.femhub.org/home/pub/5</a> <a href="http://nb.femhub.org/home/pub/6">http://nb.femhub.org/home/pub/6</a> <a href="http://nb.femhub.org/home/pub/7">http://nb.femhub.org/home/pub/7</a> <a href="http://nb.femhub.org/home/pub/8">http://nb.femhub.org/home/pub/8</a> 
* A list of ideas (with cost estimates) coming from a discussion on sage-devel: <a href="grants/09/ccli/stein-ideas.pdf">stein-ideas.pdf</a> 
* Rough draft of Beezer's internal sabbatical proposal 
      * Draft 1 (2009/09/02) <a href="grants/09/ccli/beezer-lantz-1.pdf">beezer-lantz-1.pdf</a> 
      * Draft 2 (2009/09/07) <a href="grants/09/ccli/beezer-lantz-2.pdf">beezer-lantz-2.pdf</a> 
* Beezer's group theory exercises in Sage <a href="grants/09/ccli/m433-sage-exercises-final.pdf">m433-sage-exercises-final.pdf</a> 
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
      * A more organized and polished version of the <a class="http" href="http://wiki.sagemath.org/interact">Sage interacts</a> 
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

# Budget

* <a href="/grants/09/ccli/Budget">Budget Details</a> 

# Past CCLI Awards

   * <a class="http" href="http://www.nsf.gov/awardsearch/afSearch.do?ProgEleCode=7494&amp;page=4&amp;QueryText=&amp;SearchType=afSearch&amp;PIFirstName=&amp;PILastName=&amp;COPILastName=&amp;COPIFirstName=&amp;IncludeCOPI=&amp;PIInstitution=&amp;PIState=&amp;PIZip=&amp;PICountry=&amp;ProgOrganization=&amp;ProgOfficer=&amp;ProgProgram&amp;ProgRefCode=&amp;ProgFoaCode=&amp;CongDistCode=&amp;AwardNumberOperator=&amp;AwardNumberFrom=&amp;AwardNumberTo=&amp;StartDateOperator=&amp;ExpDateOperator=&amp;StartDateFrom=&amp;StartDateTo=&amp;ExpDateFrom=&amp;ExpDateTo=&amp;AwardAmount=&amp;AwardInstrument=&amp;Search=Search#results">Past CCLI Phase I Awards</a> 
   * <a class="http" href="http://www.nsf.gov/awardsearch/afSearch.do?ProgEleCode=7492&amp;page=4&amp;QueryText=&amp;SearchType=afSearch&amp;PIFirstName=&amp;PILastName=&amp;COPILastName=&amp;COPIFirstName=&amp;IncludeCOPI=&amp;PIInstitution=&amp;PIState=&amp;PIZip=&amp;PICountry=&amp;ProgOrganization=&amp;ProgOfficer=&amp;ProgProgram&amp;ProgRefCode=&amp;ProgFoaCode=&amp;CongDistCode=&amp;AwardNumberOperator=&amp;AwardNumberFrom=&amp;AwardNumberTo=&amp;StartDateOperator=&amp;ExpDateOperator=&amp;StartDateFrom=&amp;StartDateTo=&amp;ExpDateFrom=&amp;ExpDateTo=&amp;AwardAmount=&amp;AwardInstrument=&amp;Search=Search#results">Past CCLI Phase II Awards</a> (<a class="http" href="http://www.nsf.gov/awardsearch/afSearch.do?SearchType=afSearch&amp;page=4&amp;QueryText=software&amp;PIFirstName=&amp;PILastName=&amp;PIInstitution=&amp;PIState=&amp;PIZip=&amp;PICountry=&amp;ProgOrganization=&amp;ProgOfficer=&amp;ProgEleCode=7492&amp;BooleanElement=false&amp;ProgRefCode=&amp;BooleanRef=false&amp;ProgProgram=&amp;ProgFoaCode=&amp;OriginalAwardDateOperator=&amp;OriginalAwardDateFrom=&amp;OriginalAwardDateTo=&amp;StartDateOperator=&amp;StartDateFrom=&amp;StartDateTo=&amp;ExpDateOperator=&amp;ExpDateFrom=&amp;ExpDateTo=&amp;AwardNumberOperator=&amp;AwardNumberFrom=&amp;AwardNumberTo=&amp;AwardAmount=&amp;AwardInstrument=&amp;Search=Search#results">CCLI-II grants containing the word "software" in title or abstract</a>) 
   * <a class="http" href="http://www.nsf.gov/awardsearch/afSearch.do?ProgEleCode=7493&amp;page=4&amp;QueryText=&amp;SearchType=afSearch&amp;PIFirstName=&amp;PILastName=&amp;COPILastName=&amp;COPIFirstName=&amp;IncludeCOPI=&amp;PIInstitution=&amp;PIState=&amp;PIZip=&amp;PICountry=&amp;ProgOrganization=&amp;ProgOfficer=&amp;ProgProgram&amp;ProgRefCode=&amp;ProgFoaCode=&amp;CongDistCode=&amp;AwardNumberOperator=&amp;AwardNumberFrom=&amp;AwardNumberTo=&amp;StartDateOperator=&amp;ExpDateOperator=&amp;StartDateFrom=&amp;StartDateTo=&amp;ExpDateFrom=&amp;ExpDateTo=&amp;AwardAmount=&amp;AwardInstrument=&amp;Search=Search#results">Past CCLI Phase III Awards</a> 
   * <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0535327">http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0535327</a> -- this type II past award was for developing flash libraries for math education.  I've heard Doug Ensley (the co-pi) talk about this work at national meetings.  They also had a PREP workshop helping people learn how to develop flash applets for math education. 
   * <a class="http" href="http://www.nsf.gov/awardsearch/afSearch.do?SearchType=afSearch&amp;page=4&amp;QueryText=web&amp;PIFirstName=&amp;PILastName=&amp;PIInstitution=&amp;PIState=&amp;PIZip=&amp;PICountry=&amp;ProgOrganization=&amp;ProgOfficer=&amp;ProgEleCode=7492&amp;BooleanElement=false&amp;ProgRefCode=&amp;BooleanRef=false&amp;ProgProgram=&amp;ProgFoaCode=&amp;OriginalAwardDateOperator=&amp;OriginalAwardDateFrom=&amp;OriginalAwardDateTo=&amp;StartDateOperator=&amp;StartDateFrom=&amp;StartDateTo=&amp;ExpDateOperator=&amp;ExpDateFrom=&amp;ExpDateTo=&amp;AwardNumberOperator=&amp;AwardNumberFrom=&amp;AwardNumberTo=&amp;AwardAmount=&amp;AwardInstrument=&amp;Search=Search#results">Type II grants with the word "web" in title or abstract</a>.  Some relevant awards dealing with software and curricula are: 
         * <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0918271">Interactive web activities for a statics course</a> -- there were actually more than 5 awards, all having the same title, but for different amounts. 
         * <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0816783">Web-based Interactive Organic Chemistry Homework</a> 
         * <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0935049">Bio-Organic Reaction Animations</a>, see also another award for this at <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0717133">http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0717133</a> 
         * <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0716952">Exploring Earth's Volcanic Environment: Development of Virtual Reality Education Modules(Phase 2)</a> 
         * <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0618456">Collaborative Research-Collaborative Research-Creating Exemplary Curricula and Supporting Faculty Development in Using Social Explorer to Teach with Demographic Data Maps</a> 
         * <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0618744">Biofilms: The Hypertextbook--A Web-Based Active-Learning Approach for Rapid Infusion of Emerging Knowledge into Undergraduate STEM Curricula</a> 
         * <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0206571">The Web-based ARTIST Project</a> 
         * <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0231083">MathDL Books Online</a> 

# Studies about Technology and Teaching

   * <a href="http://cm.math.uiuc.edu/studies">http://cm.math.uiuc.edu/studies</a> -- Calculus and Mathematica is a book/course using Mathematica to teach calculus.  This is a page talking about studies related to this course. 
         * Beezer taught a course with these materials in 1992, if that experience is relevant. 
   * <a href="http://media.wolfram.com/documents/fowler/">http://media.wolfram.com/documents/fowler/</a>  -- Wolfram has put some time into compiling research that supports using technology and math software in teaching. 
   * <a href="http://www.maa.org/columns/launchings/launchings_04_09.html">http://www.maa.org/columns/launchings/launchings_04_09.html</a>  -- References some studies about the effectiveness of webwork. 
   * <a class="http" href="http://books.google.com/books?id=HDjOijkHXSwC&amp;pg=PA103&amp;lpg=PA103&amp;dq=K.+Heid+math+education&amp;source=bl&amp;ots=lLpq8w2NXF&amp;sig=hzrzGj7aECGKWZWCFQLHCQSo4d0&amp;hl=en&amp;ei=hr0eS7m9NI7UnAeb4qTWDQ&amp;sa=X&amp;oi=book_result&amp;ct=result&amp;resnum=1&amp;ved=0CAgQ6AEwAA#v=onepage&amp;q=K.%20Heid%20math%20education&amp;f=false">http://books.google.com/books?id=HDjOijkHXSwC&pg=PA103&lpg=PA103&dq=K.+Heid+math+education&source=bl&ots=lLpq8w2NXF&sig=hzrzGj7aECGKWZWCFQLHCQSo4d0&hl=en&ei=hr0eS7m9NI7UnAeb4qTWDQ&sa=X&oi=book_result&ct=result&resnum=1&ved=0CAgQ6AEwAA#v=onepage&q=K.%20Heid%20math%20education&f=false</a> 
   * 

# Open Textbooks in Mathematics

* Candidates for conversion to Sage notebooks or supplements- open licenses, TeX source 
      * <a class="http" href="http://linear.pugetsound.edu/">A First Course in Linear Algebra, Beezer</a> 
      * <a class="http" href="http://abstract.ups.edu/">Abstract Algebra, Theory and Applications, Judson</a> 
      * <a class="http" href="http://www.math.dartmouth.edu/news-resources/electronic/kpbogart/">Combinatorics Through Guided Discovery, Bogart</a> 
      * <a class="http" href="http://www.mecmath.net/">Vector Calculus, Michael Corral</a>  Supplement with multivariate calc interacts 
      * <a class="http" href="http://mecmath.net/trig/">Trigonometry, Michael Corral</a> Student project - supplement with interacts 
      * Maybe more at <a class="http" href="http://linear.ups.edu/curriculum.html">Open Math Curriculum</a> or <a class="http" href="http://mathbooks.110mb.com/mylist.php">http://mathbooks.110mb.com/mylist.php</a> 
* Presentation at Sage Days 15 
      * <a class="http" href="http://wiki.sagemath.org/days15?action=AttachFile&amp;do=get&amp;target=beezer-authoring-SD15.pdf">Authoring Interactive Worksheets (Slides, PDF)</a> 
      * <a class="http" href="http://wstein.org/sagedays15/M2U00404-beezer-interactive_sage_worksheets.MPG">Video of Presentation (MPEG)</a> 
* Demonstration Project 
      * Make a new account at <a class="http" href="http://sagenb.org">sagenb.org</a> 
      * Login and click on "Upload" in upper-left 
      * Into second box cut/paste the URL:  `http://buzzard.ups.edu/sage/sage-group-theory-primer.sws` 
      * Click on "Upload Worksheet" button 
      * Experiment running Sage cells (click in cell, then click "evaluate" below) 
      * Search on the phrase "default=12" to find interactive Sage cell 
      * Evaluate the cell, then vary group order to see all subgroups of a cyclic group 
      * This tutorial was authored in LaTeX, then converted with software tools to a Sage worksheet 
      * PDF version of worksheet, and more, at <a class="http" href="http://abstract.ups.edu/sage-aata.html">Abstract Algebra textbook site</a> 
      * Most of the translation is via <a class="http" href="http://www.cse.ohio-state.edu/~gurari/TeX4ht/">tex4ht</a>, an NSF funded project 
      * Rendering in Sage is via <a class="http" href="http://www.math.union.edu/~dpvc/jsMath/">jsMath</a> 
* <a href="http://opened.creativecommons.org/Main_Page">http://opened.creativecommons.org/Main_Page</a> 

# WebWork

* MAA wiki on WebWork.  Note NSF funding.  <a href="http://webwork.maa.org/wiki/Main_Page">http://webwork.maa.org/wiki/Main_Page</a> 
* National Problem Library for WebWork (12,000 problems)  <a href="http://webwork.maa.org/wiki/National_Problem_Library">http://webwork.maa.org/wiki/National_Problem_Library</a> 

# Moodle

* <a class="http" href="http://moodle.org/stats/">Statistics about Moodle</a>--Seems like Moodle has a huge number of users. 

# MAA Resources

* PREP Workshops for dissemination? Especially for community colleges?  Done virtually, there would be no travel expenses for participants.  <a href="http://www.maa.org/prep/">http://www.maa.org/prep/</a> 
* Michael Pearson, MAA Director of Programs and Services, <a href="http://www.maa.org/aboutmaa/pearsonbio.html">http://www.maa.org/aboutmaa/pearsonbio.html</a> 

# Random advice

<a href="/grants/09/ccli/nathan_carter_advice">Advice from Nathan Carter about writing a CCLI grant</a> 
