

# Google Summer of Code 2009 Application

Here is a list of questions we're expected to answer as a part of the application for Google Summer of Code 2009. 

<a href="/GSoC/2009">The list of ideas for 2009.</a> 

The FAQ for the Google Summer of Code 2009 is <a class="http" href="http://code.google.com/opensource/gsoc/2009/faqs.html">here</a>. 

<a class="http" href="http://code.google.com/opensource/gsoc/2009/faqs.html#0_1_org_app_08250740394219425_">Original list of questions</a>  


## Notes:

* We should mention that development processes for the project are well defined, maybe point to trac guidelines, developers guide, mailing lists or <a href="/HowToBeginSageDevelopment">HowToBeginSageDevelopment</a>. - burcin 

### Describe your organization.

Sage is an open-source mathematical software system. It combines numerous software libraries under one umbrella. It's main user interface, besides the command-line, is a dynamic web-interface where worksheets are stored for each user. Python is the main programming language and also the language of choice for all interactions with the built in objects and functions. The goal of Sage is to create an open-source alternative to all other major proprietary mathematical software systems.  


### Why is your organization applying to participate in GSoC 2009? What do you hope to gain by participating?

We hope to gain new contributors to the project who can help out with tasks oriented more towards software engineering. As we do with any contributor, we will also encourage GSoC students to stay as a member of the community and keep working with us even after the GSoC ends. 

While the Sage project tries to make it easy to submit fixes and enhancements (and it is mostly successful at this task with <a class="http" href="http://www.sagemath.org/development-map.html">>140 contributors</a>), most of these fixes are to the mathematical functionality. Since most users and those interested in making Sage better are mathematicians, developers interested in enhancing the user interface or basic functionality are hard to find. Whereas it is relatively easier to find/finance a student to implement new mathematical functionality from research grants. We hope GSoC will be able to fill this gap. 


### Did your organization participate in past GSoCs? If so, please summarize your involvement and the successes and challenges of your participation.

No, the Sage project did not participate in any past GSoCs as a mentor organization. 


### If your organization has not previously participated in GSoC, have you applied in the past? If so, for what year(s)?

Applications of the Sage project as a mentor organization was not accepted for 2006, 2007 and 2008. 


### What license(s) does your project use?

Sage is a collection of <a class="http" href="http://www.sagemath.org/links-components.html">many open source packages</a> most of which provide specialized mathematics functionality, with a library written mostly in Python, Cython with a little C/C++ to glue these together and provide a unified interface as well as implementations of new mathematical functionality.  

Code submitted to the Sage library should be under the GPLv2 or later license. Code written during the GSoC is also expected to be under the GPLv2+. Contributors to Sage are not expected to transfer copyright to anybody or foundation. 

The distribution of Sage, including all the components mentioned above alongside the library, is under the GPLv3 license. Detailed license information about the components can be found in the COPYING.txt file of the corresponding release tarball. 


### What is the URL for your ideas page?

The ideas for GSoC'09 projects are collected at this URL: 

<a class="http" href="http://wiki.sagemath.org/gsoc09">http://wiki.sagemath.org/gsoc09</a> 

<a name="mailinglist"></a> 
### What is the main development mailing list or forum for your organization?

Main development discussions take place on the <a class="http" href="http://groups.google.com/group/sage-devel">sage-devel</a> Google Groups list. 

Support questions are mostly handled through the <a class="http" href="http://groups.google.com/group/sage-support">sage-support</a> list. 

There are also other mailing lists for more specialized Sage related discussions, such as <a class="http" href="http://groups.google.com/group/sage-combinat-devel">sage-combinat-devel</a>, <a class="http" href="http://groups.google.com/group/sage-nt">sage-nt</a>, <a class="http" href="http://groups.google.com/group/sage-edu">sage-edu</a> and <a class="http" href="http://groups.google.com/group/sage-words-dev">sage-words-dev</a>. 

<a name="ircchannel"></a> 
### What is the main IRC channel for your organization?

The official IRC channel of the Sage project is <a class="irc" href="irc://irc.freenode.net/#sage-devel">#sage-devel</a> on <a class="http" href="http://freenode.net">freenode.net</a>. There are usually more than 20 people logged in to the channel at any time. Since Sage developers are distributed around the world, it is possible to get answers to questions any time of day. Support from developers on IRC have received praise on many occasions, and led to many new comers choosing to use Sage instead of the propriety alternatives. 


### Does your organization have an application template you would like to see students use? If so, please provide it now.


### What is your plan for dealing with disappearing students?

Many Sage developers and likely mentors are related to academia, and have extensive experience working with students and keeping them engaged and focused on projects. 

After committing to work on a well defined project with a mentor, there are few reasons for a student to disappear. We can't do anything about personal matters, such as family or health problems. Other possible reasons to give up on a project are lack of feedback from a mentor when one is struggling with technical problems and not being able to move on, or general communication problems between the student and the mentor. 

We plan to avoid running into these problems, first by carefully evaluating the applications and making sure that the student assigned to a task is capable of completing it, then by keeping in close contact with the mentor and the student so that communication problems can be noted and handled promptly.  

We will also encourage students to post their progress reports and questions to the development lists and spend some time hanging out on IRC. Since Sage has a very lively community, and the topics suggested for the Google Summer of Code project are features requested by many developers and users, they will be sure to get feedback and support for their work. 


### What is your plan for dealing with disappearing mentors?

The Sage project tries to keep the bus factor for any component of the library higher than one. This is basically accomplished by asking for formal reviews and approval of submitted code from another developer before any patch is applied. Hence, there is always more than one person knowledgeable about a certain part of the library, and if there are problems with one mentor, someone else can take up the task. 

As also mentioned above, we plan to ask the students to submit progress reports to the development lists. While there will of course be only one official mentor, this way we can make sure that there are lots of eyes studying the work and suggesting improvements and the students progress is not tied to the attentiveness of the mentor during a certain time frame. 


### What steps will you take to encourage students to interact with your project's community before, during and after the program?

Sage has a very active developer community, which communicates mainly through the <a href="/GSoC/2009_application#ircchannel">IRC channel</a> and <a href="/GSoC/2009_application#mailinglist">mailing lists</a> mentioned above. There are also workshops named <a href="/MyStartingPage#sagedays">Sage Days</a> with varying degrees of academic or development focus organized in universities in the US and in Europe. Dates and places of upcoming Sage Days are listed on the <a href="/MyStartingPage#sagedays">front page</a> of this wiki. 

The students working on GSoC projects for Sage will be encouraged to hang out in the IRC channel, and submit their questions and progress reports to the development list. Since the tone of the lists and the IRC channel is very supportive, this will hopefully be enough to get them in close contact with other developers and users interested in their work. Depending on funding, timing and place of Sage Days organizations, students will also be encouraged to attend a workshop where they can meet some developers in person, and join night long coding sprints. :) 


### What will you do to ensure that your accepted students stick with the project after GSoC concludes?

An important factor that makes people contribute to a project after they stop being paid for the work is their ties to the community. As mentioned above, Sage has a very supportive and welcoming community. Giving credit to contributors is regarded as a high importance task, which gives developers a warm and fuzzy feeling when they see their names on the release notes and encourages them to contribute regularly. (Look here for sample <a class="http" href="http://www.sagemath.org/src/announce/sage-3.3.txt">release notes</a> or <a class="http" href="http://mvngu.wordpress.com/2009/02/23/sage-33-released/">release guide</a> with more eye candy.) We hope that by interacting with the community during their project, the students will grow to be a part of it and carry on helping out even after the GSoC. 
