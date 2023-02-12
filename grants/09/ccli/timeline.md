
Here is a rough timeline, split up into years, and then categories. 

More specific timeline (old yearly timeline is below) 


## Summer 2010

   * Rob: Linear algebra text, Sage code for linear 
   * Tom: abstract algebra text this summer? 
   * Rob, Jason, William: Textbook conversion system 

## Fall 2010

   * Rob: continues work on linear algebra (sabbatical support) 
   * Tom and Rob: work on abstract algebra text (Tom has light load, Rob on sabbatical) 
   * Rob: Sage code for linear and abstract algebra 

## Spring 2011

   * Group 1 test site roster is completed 
   * All:  each investigator pairs with a Group 1 test site 
   * Tom and Rob: abstract algebra text (Tom has light load, Rob on sabbatical) 
   * Rob: Sage code for abstract algebra 

## Summer 2011

   * Five test sites prepare for next year's use 
   * Workshop: 
         * this summer, or Summer 2013? 
         * preparation for Group 1 test sites 
         * open to other interested parties 
   * William: prepare number theory text (now, or earlier? move to suit) 
   * Rob: possibly combinatorics text, associated Sage code, or finish algebras 
   * Jason: Notebook support for textbooks and classroom use; supervise and coordinate student programmers 
   * Jason: polish target subject areas: calculus, graphics, linear algebra, discrete math 

## Fall 2011

   * Test sites:  Group 1 (linear, abstract, number theory available) 

## Spring 2012

   * Test sites:  Group 1 
   * Group 2 test site roster selected 
   * All:  each investigator pairs with a Group 2 test site 

## Summer 2012

   * Workshop: 
         * definitely, both test site groups are now active 
   * Rob: more textbook work, Sage coding, subject are to be determined by available books 
   * Jason: continue work on notebook, target subject areas, and supervise student programmers doing the same.  Also work on administration side (setting up EC2 images, etc.) 

## Fall 2012

   * Test sites:  Group 1 (first year) 
   * Test sites:  Group 2 (second year) 

## Spring 2013

   * Test sites:  Group 1 (first year) 
   * Test sites:  Group 2 (second year) 

## Summer 2013

   * Tom: evaluation work (final wrapup) 
   * Workshop: 
         * this summer, or Summer 2011 
         * one to wrap up everything? 
         * plan future directions? 
         * invite WeBWork, Moodle, representatives, etc? 
   * Jason: continue work on notebook, target subject areas, and supervise student programmers doing the same.  Also work on administration side (setting up EC2 images, etc.).  Also explore WeBWork integration 
== Notebook work during summers ==  

         * cross-worksheet links 
         * interact library 
               * search interface 
               * example contributions in various subject areas 
               * more flexible interact capabilities (better layout, etc.) 
         * tags/folders 
         * usage tracking and statistics 
         * updating evolving notebook technologies 
               * html5 canvas matplotlib graphics 
               * webgl 
               * replacing jsmath with mathjax 
               * websockets (if not done by then) 
               * LDAP and other authentication backends 
         * standalone interacts? 
         * other issues Rob needs solved in the notebook 
         * Ways for students and professors to interact with each other (e.g., submitting and grading assignments, collaborating, make comments on a worksheet, etc.) 
         * (explicit objective) improve the notebook so that it will robustly handle up to 250 simultaneous users viewing worksheets and doing typical computations for an undergraduate course when running on a single high-end server, as demonstrated by a robust automated test suite 
         * (explicit objective) implement management tools so administrators can manage the notebook load and better balance resources 
         * (explicit objective) create tools for educators to get automatic feedback on their students’ use of Sage 

## Math content work

         * Full-scale use of nthiery's <a href="/TestSuite">TestSuite</a> system to make sure that things are consistent across object types with the same parent.  (See, for example, <a href="http://trac.sagemath.org/sage_trac/ticket/6936">http://trac.sagemath.org/sage_trac/ticket/6936</a>) 
         * Gauge the intuitiveness and discoverability of the interfaces.  Make sure the documentation in these areas is friendly to an undergraduate. 
         * Go through a book in each of these areas and make sure that you can do exercises throughout the course with the available commands in an easy and intuitive fashion. 
(old, yearly timeline follows) 


# Year 1


## Textbooks

* [Jason and William] Iron out the infrastructure issues with Rob's book, and whatever writing we do on our own subject-specific tutorials.  
   * Adapt notebook to collections of worksheets 
               * Grouping worksheets (folders?) 
               * Format for posting/moving (ie zipped, tar'ed) 
   * Cross-worksheet links 
               * Must be portable, ie stable/functional after a move 
               * Then needs support in tex4ht 
   * Define new Latex environments for... 
               * Inline sage code 
               * Live Sage code blocks (w/, w/out corresponding output) 
               * Interacts 
               * Coordinate this with Dan Drake's SageTeX 
   * Create a tex4ht mode to support above 
               * Goal: run tex4ht on Latex souce, output is zipped-up worksheets 
               * tex4ht now has a project page, Karl Berry is a TeX expert 
               * <a href="http://gna.org/projects/tex4ht/">http://gna.org/projects/tex4ht/</a> 
   * Make a tex4ht spkg for others to use easily 
* [William] William's number theory book. 
* [Rob] Rob's Linear algebra textbook.  Do this first because (a) already has some Sage, (b) already has been designed to include "computational notes," (c) linear algebra in Sage is fairly mature, (d) I'm most familiar with the source for this one. 

## Making Sage Classroom Ready

* Target subject areas: linear algebra, undergraduate abstract algebra, discrete math, graphics, and calculus (then, as time permits, ODE, statistics?) 
      * Full-scale use of nthiery's <a href="/TestSuite">TestSuite</a> system to make sure that things are consistent across object types with the same parent.  (See, for example, <a href="http://trac.sagemath.org/sage_trac/ticket/6936">http://trac.sagemath.org/sage_trac/ticket/6936</a>) 
      * Evaluate the intuitiveness and discoverability of the interfaces.  Make sure the documentation in these areas is friendly to an undergraduate. 
      * Go through a book in each of these areas and make sure that you can do exercises throughout the course with the available commands in an easy and intuitive fashion. 
* Notebook features: 
         * Ways for students and professors to organize their work (like tags on the the worksheets) 
         * Ways for students and professors to interact with each other (e.g., submitting and grading assignments, collaborating, make comments on a worksheet, etc.) 
               * A grading and annotating system for grading student worksheets. 
         * interactive javascript input widgets (hopefully we can do something with mathjax!) 
         * flexible layout of interact controls and output 
* Have a Sage Days for working on all of this sometime during the summer.  

## Dissemination

   * Talk up the work that we're doing at Mathfest, Joint Meetings, and regional MAA meetings. 
   * Set up a booth at the Joint meetings 
   * Have a special session at Joint meetings 
   * Advertise for the Sage Days and workshops in Summer 2  
   * Minicourse on Sage at Joint meetings and/or mathfest 

## Formative evaluation

   * Survey people about barriers to classroom use 
   * Sign up a few people to use Sage in the classroom.  List a few names, and have a mechanism to advertise for more people.  Give people a stipend to write a report of using Sage in a class for a semester.  We will offer them technical support. 

# Year 2


## Textbooks

   * [Rob] Augment Tom's abstract algebra book, with Tom's assistance/involvement.  I have a pile of stuff now on group theory, and ideas for new Sage functionality here.  I expect to generate a lot for rings and fields Spring 2010 when I teach that material from Tom's book. 

## Subject-specific tutorials

   * Have a Sage <a href="/EduDays">EduDays</a> (maybe at the very beginning of summer) where we invite several people to do projects over the summer to be class-tested after summer 2, before summer 3. 

## Making Sage classroom-ready

      * Make any needed changes to the code/goals from Summer 1, based on feedback from classroom use during the intervening year, and ongoing feedback from people writing texts/tutorials in Summer 2. 
      * Make it easy to set up a campus/personal sage server 
               * Document the hardware requirements for various scenarios 
               * Make the virtualbox image very polished, including graphical buttons to create and start/stop multiple servers (with full security options), backup notebook servers and restore notebook servers, upgrade Sage (maybe on only selected servers?), etc. 
               * Carefully document any things that people need to understand about setting up the network for common scenarios. 
               * Explore the option of a cloud instance (like an Amazon EC2 instance) that instructors could trivially start.  See <a class="http" href="http://groups.google.com/group/sage-notebook/browse_frm/thread/620f9a40e5e9e488">http://groups.google.com/group/sage-notebook/browse_frm/thread/620f9a40e5e9e488</a>. 
         * Build the infrastructure for a library of curricula materials.  This includes a library of interacts that you can browse/search, etc. 
         * Have another Sage Days focused on these goals (separate from the <a href="/EduDays">EduDays</a> focused on writing materials)  

## Dissemination

   * Talk up the work that we're doing at Mathfest, Joint Meetings, and regional MAA meetings. 
   * Set up a booth at the Joint meetings 
   * Advertise for the Sage Days and workshops in Summer 3; get people from Summer 2 to tell people to apply for the workshops in Summer 3 :) . 
   * Publish articles; in each of these, mention the workshops coming up in Summer 3 
         * Publish an article in LOCI (<a href="http://mathdl.maa.org/mathDL/23/;">http://mathdl.maa.org/mathDL/23/;</a> they've wanted us to write an article for a while; this would probably be a second article). 
         * Publish an AMS editorial (or something) on open-source technology-enhanced textbooks, like William, et al., published a few years ago on open-source software. 
   * Minicourse on Sage at Joint meetings and/or mathfest 

# Year 3


## Textbooks

   * [Rob] Add Sage hints/experiments to Bogart's combinatorics problem book.  Despite a GFDL license the source is not posted, and my one request has seen no answer.  So I don't know how much work it will be to "clean-up" the source, etc.  A former student, now on the faculty at Seattle U may be interested in being involved with this (I'm not suggesting adding him to the grant). 

## Subject-specific tutorials

   * Have another Sage <a href="/EduDays">EduDays</a> where we invite some people back from the summer 2 <a href="/EduDays">EduDays</a> to help teach a larger group about writing subject-specific curricula using Sage.  

## Making Sage Classroom-ready

      * Make any needed changes to the code/goals from Summer 1 and Summer 2, based on feedback from classroom use during the intervening year, and ongoing feedback from people writing texts/tutorials and starting campus Sage servers in Summer 3.  My guess is that this will occupy most of the time spent in this area, as we will probably get lots and lots of feedback. 
      * Have another Sage Days focused on these goals 
      * Have a Sage Days for writing more CCLI grants or other education grants! Maybe a Sage Days with the Moodle and <a href="/WebWork">WebWork</a> people to talk about Sage integration plans and grants for that.  

## Dissemination

   * Talk up the work that we're doing at Mathfest, Joint Meetings, and regional MAA meetings. 
   * Set up a booth at the Joint meetings 
   * (try to get a) PREP workshop or workshop at Mathfest/Joint Meetings on writing technology-enhanced curricula materials.  
   * Minicourse on Sage at Joint meetings and/or mathfest 