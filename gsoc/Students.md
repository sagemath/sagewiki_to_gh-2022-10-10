= Google Summer of Code (GSoC) Student Application Guide =

Hello and welcome to SageMath's (or Sage for short) GSoC guide for students!

We are glad that you are interested in participating in [[GSoC | GSoC with Sage]] and we look forward to working with you. On this page, you will find numerous application details and links to resources that can help you quickly set up Sage and get started.

You can also explore the [[GSoC/2017|GSoC 2017 Ideas Page]] for information on potential projects.

<<TableOfContents()>>


== What is GSoC? ==

[[https://summerofcode.withgoogle.com/|Google Summer of Code]] is a program for university students aimed at introducing them to world of open source. Students typically begin by browsing the Ideas Pages of various participating open source organisations (orgs) such as Sage and communicate with mentors to write and submit well-defined project proposals. These proposals are reviewed by the respective orgs as well as Google and the selected students then spend 12 weeks in the summer writing code and receive a stipend from Google for their work.

Please ensure that you satisfy the [[https://developers.google.com/open-source/gsoc/faq#what_are_the_eligibility_requirements_for_participation | Eligibility Criteria]] before applying and note the [[https://developers.google.com/open-source/gsoc/timeline | GSoC Timeline]].


== What is Sage? ==

[[http://www.sagemath.org/|Sage]] is a GPL open-source mathematical software system. It is designed to be not just a computer algebra system, but more like a complete environment for doing mathematics and related calculations. It is based on a vast collection of existing open-source software tools and libraries and ties them together via Python.  Python is also the primary interface language for the user and its object-oriented way of expressing concepts is used to express calculations - of course, there are also many “normal” functions available. Behind the scenes, the Sage library executes the commands and calculations by its own algorithms or by accessing appropriate routines from the included software packages. On top of that, there are various ways for users to interact with Sage, most notably via a dynamic web-site called “Notebook”. Sage works hand-in-hand with other computational mathematics software systems, such as SymPy, GAP, etc, and can serve as an umbrella organisation for GSOC for those sister projects.

Please see the [[faq|FAQ]] for more details.


== Contacting Us ==

Sage maintains three primary mailing lists namely:
 * [[https://groups.google.com/forum/?fromgroups#!forum/sage-gsoc | sage-gsoc]] - discussions specific to the GSoC program
 * [[https://groups.google.com/forum/#!forum/sage-devel | sage-devel]] - primary discussion group for development pertaining to all of Sage
 * [[https://groups.google.com/forum/?fromgroups#!forum/sage-support | sage-support]] - help in running/using Sage

Apart from these, there are numerous other lists dedicated to specific modules of Sage such as [[https://groups.google.com/forum/#!forum/sage-coding-theory | sage-coding-theory]]. For further support in using Sage, there is also a vibrant Question-Answer forum at [[https://ask.sagemath.org/questions/ | ask.sagemath.org]].

All prospective students must join the [[https://groups.google.com/forum/?fromgroups#!forum/sage-gsoc | sage-gsoc]] mailing list.

== Interacting with the Sage Community ==

Sage, as an open source project, depends on a diverse community of volunteers to contribute and help move it forward. The mentors are here to help you and the rest of the community is eager to provide support as well. Please respect the time and efforts of the community and be courteous at all times. Following are some tips to keep in mind.

 * '''Set up Sage on your system''' - If you are planning on applying to Sage for GSoC or if you wish to contribute, first make sure that you've installed Sage on your personal system and that you've completed the rest of the pre-requisites before posting to the mailing list. The Getting Started section below provides a checklist and links to detailed documentation.
 * '''Don't Send Generic Introductory Emails''' -  Posts such as "I am interested in open source. How can I get started with Sage?", "How can I proceed?", "How do I use this module?" are very time-consuming to answer and can get ignored. At best, these will get a response containing a link to the documentation and request for further information. Save yourself the time and do your homework. Briefly describe your background and ask easily answerable questions by indicating the field and project you are interested in.
 * '''Be Specific and Precise''' - Spend a little time in crafting good emails with helpful titles. Provide context to the problem you are facing and include relevant details such as describing what you have done so far, the error message, development environment, etc. Make it easy for the reader to understand what you are asking for.
 * '''Do Your Homework''' - Please check the information pages and past discussions on forums to ensure that you are not reposting or crossposting the same question. Attempt to first resolve the problem yourself before asking and demonstrate willingness and capability to help yourself. This will go a long way in creating a positive impression. ([[http://www.catb.org/~esr/faqs/smart-questions.html | How To Ask Questions The Smart Way?]] is a wonderful read on how to ask questions in a way more likely to get you a satisfactory answer.)
 * '''Don't Ask to Ask''' - Don't hesitate to ask questions but when you do, don't ask questions of the type "Can anyone help me?". Simply go ahead and state the issue you are facing.

You may also want to peruse the [[https://opensource.googleblog.com/2011/03/dos-and-donts-of-google-summer-of-code.html | The DOs and DON’Ts of Google Summer of Code]] published on GSoC's official blog.

== Getting Started ==

Its always a good idea to get started early, even before the complete project ideas list is out. By becoming actively involved, you can significantly improve your GSoC proposal and also help us in deciding how you stand out from the rest of the applicants. But first, you should complete the checklist below to ensure that you are ready to contribute.

 1. '''Obtain Sage's Source Code''' - Sage uses Git for version control and the online repository at [[http://git.sagemath.org/sage.git/tree/ | git.sagemath.org]] is a good way to study the code online. It is also available on [[https://github.com/sagemath/sage | Github]]. The developer version can be downloaded from [[ http://www.sagemath.org/download-source.html | here]].
 2. '''Read the Sage Guide''' - [[http://doc.sagemath.org/html/en/developer/index.html | Developer Documentation]] is the single best resource for everything related to Sage development and as such should be considered as required reading. 
 3. '''Install Sage on your local system''' - Ensure that you have the [[http://doc.sagemath.org/html/en/installation/source.html#prerequisites | prerequisites]] installed on your system and then start the [[http://doc.sagemath.org/html/en/installation/source.html | installation procedure]] on the developer version (Note, running ''make'' the first time will take a few hours).
 4. '''Set up Trac''' - Sage uses Trac to create tickets, report bugs and manage every change that happens in Sage. You can read more about [[trac.sagemath.org | Trac]] and [[http://doc.sagemath.org/html/en/developer/trac.html#chapter-sage-trac | how to obtain a Trac account]] (which you will first need before contributing anything). Then make sure to link your Git with your Trac account to enable [[http://doc.sagemath.org/html/en/developer/git_trac.html | collaborative development]].
 5. '''Read Sage's Conventions and Browse Tutorials''' - Sage follows various [[http://doc.sagemath.org/html/en/developer/index.html#section-writing-code-for-sage | conventions and guidelines]] for writing code, building documentation and running automated tests. Please make sure to follow them. Further, there are numerous [[http://doc.sagemath.org/html/en/tutorial/index.html | tutorials]] available for a guided view of various Sage modules.

Lastly, learn about the [[http://doc.sagemath.org/html/en/developer/walk_through.html#branching-out | development workflow]] followed here at Sage. There is also a lovely one-page cheat sheet of Git and Trac commands needed while contributing available [[http://github.com/sagemath/git-trac-command/raw/master/doc/git-cheat-sheet.pdf | here]]. 

== First Contributions ==

There are two primary ways to contribute and acquaint yourself with the various aspects of Sage development namely, writing a ticket and reviewing a ticket.  [[https://trac.sagemath.org/report/38 | Beginner Tickets]] are issues that are interesting yet simple enough to complete and will take very little time. You should first figure out which module(s) of Sage you are interesting in contributing to (possibly through the list of available project ideas) and then find a suitable open easy ticket to resolve. Alternatively, if you don't find something specific, you can always ask on the ''sage-gsoc'' mailing list.

 1. '''Writing A Ticket''' - Developers, to put it simply, report on a bug or feature or enhancement that they wish to help and open a ticket on Trac. Then they discuss potential solution ideas through comments and based on that write code and submit it. If you are writing a ticket, you should follow [[http://doc.sagemath.org/html/en/developer/git_background.html#section-git-tutorials | standard git practices]].
 2. '''Reviewing A Ticket''' - Once a developer submits code to resolve the ticket, it is reviewed independently by other developer(s) who may comment changes as deemed necessary. All recommendations must be incorporated before the new code can be merged into Sage. This is a very important component of Sage development which helps ensure quality control as well as constructive feedback. If you are reviewing a ticket, please complete the [[http://doc.sagemath.org/html/en/developer/reviewer_checklist.html | Reviewer's Checklist]] and ask for assistance if you are not sure how to evaluate items from the list. [[https://trac.sagemath.org/report/75 | Tickets needing review]] are a good place to start.

== GSoC Application Proposal ==

The Project Proposal is the most vital component of your application process and the primary resource available to the organization to judge your suitability for the program. Please spend time on crafting a detailed and well-thought proposal. It is a great idea to share your proposal with the respective mentors of the project you are applying to and obtain their feedback before the application deadline. Determining the scope and planning a schedule in particular, can be tricky tasks. The more you think about these and the more you discuss with the mentors, the easier it will be later on when the coding period begins. Please use the following application template and make sure to be as precise and detailed as possible.

Personal:
 * Name
 * Contact Information (email, instant messaging, …)
 * Location/Timezone
 * University
Background:
 * What are your technical skills, education, experience, etc. Especially make sure to explain with what level of mathematics you are comfortable with and on what level you would like to program.
 * Who are you? What makes you the best person to work on this particular project? Your personal motivation?
 * What platform and operating-system are you using on your computer? (Sage development is done best on Linux and OSX)
 * Are you or have you been engaged in other open-source projects?
 * Do you code on your own pet projects?
 * Are you a Sage user, how long do you know Sage?
Project:
 * Title, Project Synopsis: a short description and summary of its aim and scope.
 * What is your personal involvement or relationship with your proposed project?
 * Details: describe all the details and explain modules or parts of your whole project. Break down the whole project into individual tasks - as good as possible - and describe deliverable and quantifiable results for each of them. It also helps if you have already discussed this with a possible mentor.
 * Schedule: A timetable, including special circumstances like exams or holidays, for the individual tasks.
 * Risk Management: Try to anticipate potential problems and explain, how to mitigate them. Propose alternative scenarios, if a particular milestone isn't reached, to still successfully complete the project.

Note: All final applications must be submitted on the official [[https://summerofcode.withgoogle.com/| GSoC]] website.
