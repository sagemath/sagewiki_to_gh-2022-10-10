##master-page:HomepageTemplate
#format wiki
#language en
== Ahmed Fasih Aldebran ==

=== Personal ===
I'm getting my PhD in electrical engineering at Ohio State University.
 * Web 1.0 presence: http://ece.osu.edu/~fasiha
 * Web 2.0 presence: http://sites.google.com/site/aldebrn/Research
My academic research interests are in statistical signal processing and reconstruction, applied mathematics, and scientific computing. My personal research interests include my academic ones but also molecular evolutionary biology, Pyrrhonian skepticism and decision-making under natural uncertainty, business and management, and ancient literature.

Although I strongly dislike Matlab for writing complex archival-quality software, it's good for prototyping, and I use it almost as much as Sage in my daily research. Unlike Matlab, Sage and Python make writing high-quality, extensible, self-aware, and parallelizable code ''easy''. As of now, beyond minor technical support (mainly in helping fellow Matlab refugees adjust to their new lives), I have not contributed to the Sage project. I state this fact to spur me (via shame) into adding to the codebase.

Email: <<MailTo(fasih.1 AT SPAMFREE osu DOT edu)>>

=== Sage stand-alone GUI versus web-based Notebook ===
Here's a conversation that news of Google Chrome OS triggered, where William Stein outlines his reasons for strongly preferring developing a web-based interface for Sage, rather than stand-alone graphical interfaces. 

 * <aldebrn> I was somewhat put off by this line in the Google Chrome OS release: 'For application developers, the web is the platform' but then I remembered the intense Sage Notebook experience and now am optimistic
 * <wstein> the web is the platform -- drink the coolaide :-)
 * <wstein> I'm excited about Google Chrome OS, since I'm curious to see how Google compares to Apple at taking a UNIX OS and making it mainstream.
 * <aldebrn> Something Alan Kay said influenced my attitude towards webapps: in the 50s, it was a big breakthrough to realize that one could ship code with data that knew how to work with it. The markup languages of the 80s to today represent a huge regression because we're back to shipping just data without any code, instead relying on the recipient's browser to interface with it
 * <Dcoder> amen
 * <aldebrn> Though I guess a modern day answer, Java VM, isn't that great (for various reasons)
 * <wstein> I personally like web apps.   I don't know if they are a regression or not.
 * <wstein> I just know there are a *lot* of "everyday people" out there who don't know anything about computers, but really like
 * <wstein> using webapps too.  A big plus is that collaboration and community features are much easier to implement.
 * <wstein> When I started using computers a lot -- in the 80's it was all PCs (atari, commodore).  Then things got a lot better
 * <wstein> and exciting when I went to university and got to to use VAX and U
 * <wstein> Solaris servers + gopher, archie, etc.
 * <aldebrn> Of course. I just wonder if Alan Kay's hunch was right, maybe the web would be a whole lot cooler if somehow data was shipped with custom code that interacted with the data, much more than JavaScript/CSS maybe
 * <wstein> The software looked a lot less pretty (plain text screens), but was way more social.
 * <aldebrn> The Notebook is amazing, and I really wonder how much effort went into making it work as well as it did
 * <Dcoder> i dislike webapps and the whole cloud sense in the sense that they relinquish the control of what one runs back to whoever owns the site
 * <wstein> Not entirely.
 * <wstein> The sage notebook is a webapp, but you can run it 100% locally.
 * <wstein> Of course, there are very few examples of this.
 * <wstein> The vast majority of webapps have exactly the problem you point out.
 * <wstein> I would like gmail a lot more if it had a 100% offline open source version that used IMAP (or something) to synchronize with a server.
 * <wstein> Oh well.
 * '''<aldebrn> Would it have been easier (time-wise, maintenance-wise) to write an internet-aware stand-alone Notebook that interfaced with a local/remote Sage, and did all kinds of cool display/visualization/programming things than relying on IE/Firefox/Chrome/Safari?
 * <aldebrn> Stand-alone as in, an executable app that you downloaded and connected to sagenb.org or localhost:8000
 * <wstein> aldebrn -- definitely not.
 * <wstein> It would have been vastly harder to write a standalone app.
 * <aldebrn> Ok I'll take your word for it
 * <wstein> I've put a grand total of just over 6 weeks fulltime work on the notebook, since it started.
 * <wstein> And I did most of the work.'''
 * <wstein> Try developing that sophisticated of a GUI app that has a native look on OS X, Linux, and Windows, and interfaces with a network server in that
 * <wstein> amount of time.  I think it is not possible.
 * <aldebrn> Incredible, and that's inclusive of all the great tab-completion, AJAX action, etc.?
 * <wstein> At least it isn't for me, and since I did the work, that says something.
 * <wstein> Yes.
 * <wstein> The Sage notebook is a web app simply because it was by far the easiest thing to write.   (At least for us developers.)
 * <wstein> And I do have a lot of experience with writing traditional GUIs.  That was part of why I didn't do it again.
 * <wstein> Probalby the closest thing to the Sage notebook for math software using a traditional GUI is
 * <wstein> wxmaxima: http://wxmaxima.sourceforge.net/wiki/index.php/Screenshots
 * <wstein> Also, Google funded a Google Summer of Code in 2005 to write an "Ipython notebook" as a traditional GUI.
 * <wstein> Two studnets + 1 enthougt mentor worked all summer on it, and the result was a bad broken notebook-like thing that only worked on OS X.
 * <wstein> Robert Kern gave a talk about this at Sage Days 1.  It really scared me off from taking that approach.
 * <wstein> There were many other people who did a lot of work on the Sage notebook -- and I don't think I clearly indicated that at all above.
 * <wstein> So just let me say that though i wrote a lot of it, so did many other people (e.g., Alex Clemesha, Tom Boothby, etc.).
 * <aldebrn> No I understand. That's a very valuable piece of insight, it should be somewhere on the wiki
 * <wstein> But the total time wasn't very much.
 * <wstein> I'm not at all opposed to having a traditional GUI interface.  It's just that it's too hard to do given limited time.
 * '''<aldebrn> I thought that getting it all to work well in IE/Firefox/etc. would take much longer than writing a GUI interface
 * <wstein> Well it takes time, but it is *easy to parallelize*.
 * <wstein> E.g., for getting the notebook to work with IE, I just asked Tom Boothby to work on it, and he spent one week and did it (for pay).'''
 * <wstein> wxmaxima seems to have been improved a bit since when I looked at it 3 years ago (when the sage notebook project started); I'll have to try out the new version..
 * <aldebrn> Especially when I started using the HTML cells in the Notebook to annotate my code
 * <wstein> aldebrn -- last summer at ISSAC the directory of development at Maple gave a talk about the new features in Maple 11.
 * <wstein> One of the "major new features" was that tables could have colored backgrounds.
 * <wstein> That's the sort of thing that just comes for free to the sage notebook.
 * <aldebrn> So skills in webapp development is definitely important, ok, I'll brush up my JS/Ajax. If Sage Notebook had zoom-pan-trace features for the plots it generated, it'd be just about as useable as the Matlab GUI
 * <wstein> aldebrn -- we could add such plotting very nicely with Geogebra or maybe FLOT.
 * <wstein> Geogebra wold be the java way, and FLOT the javascript way.
 * <wstein> wxmaxima has improved over the years -- I just tried it out.
 * <wstein> If somebody were serious about making a local GUI-based sage notebook, I would suggest they start with improving wxmaxima
 * <wstein> to work with more than just maxima....
 * <wstein> (for the record)   
 * aldebrn was thinking about some incredibly lightweight GUI tools like Shoes: http://shoooes.net/
 * <aldebrn> I also come from the numerical world where large-scale data visualization is normally not done in web languages. I am content to wait and see what Sage throws up regarding this; given the pace of development, I won't have to wait long
 * <wstein> My impression is that large-scale data visualization in the numerical world is already done by Sage users using VTK/mayavi and also some Enthought tools.
 * <wstein> And matplotlib for 2d.
 * <wstein> But doing something like that over the web is a good challenge!
 * <wstein> Right now there is a lot of discussion on the SPD list (basically numerical version of sage) about doing offscreen rendering
 * <wstein> using vtk of 3d images then displaying them in the sage notebook.
 * <wstein> This is mainly for applications to fluid dynamics (I think).
 * <aldebrn> Our radar datsets are gigabytes large and we form 10K by 10K pixel frames that we zoom in and out while playing
 * <aldebrn> It would be great to replace the propreitary software we use now with a webapp
 * <wstein> It's got to be possible.  Google maps is super good at visualizing similarly complicated data (the whole world)!
 * <wstein> It would certainly be possible to have something like Google maps for visualizing 2d-ish data in the sage notebook.

(2009-07-08, after 1030 EST.)
----
CategoryHomepage
