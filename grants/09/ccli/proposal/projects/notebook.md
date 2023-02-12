

```txt
\section{The Sage Notebook}

The Sage notebook is an AJAX application, like Gmail or Google Maps.
It provides an interactive web-based worksheet in which one can enter
arbitrary Sage commands, see beautifully typeset output, create 2-D
and 3-D graphics, publish worksheets, and collaborate with other
users.

[[screen shot]]

Stein, Grout, ... and many undergraduates, together developed the basic
implementation of the current version of the Sage notebook during an
extremely intense three-week coding session in Summer 2007. 
The Sage notebook is a much beloved ``killer application'' of Sage:
\begin{quote}
  ``In my opinion, SAGE's notebook is the real killer feature, which I
  don't recall to have seen in any other (commercial or not)
  software. I mean, this is the only scientific program that I've
  found, allowing such an easy collaborative job within local
  networks.''

 -- Maurizio, the Sage mailing list.
\end{quote}

Professors at dozens of universities around the world are getting
excited about how they can leverage the Sage notebook in their
teaching.
\begin{quote}
With some colleagues in our University (Lyon, France) we have built a
project around Sage for undergraduate students... {\em And the University has
decided to support this project.} Good news.

Now we will be facing the problem to build a Sage configuration which
will work for say 200 students at the same time (students will use the
notebook), and prepare professors for Sage teaching. There are `some'
technical problems to solve...
 
-- T. Dumont, the Sage mailing list.
\end{quote}

Stein has been working fulltime during Fall 2009 funded by University of
Washington on vastly improving the robustness and scalability of the notebook.
This works is coming at the right time, because use of the Sage notebook
is growing rapidly.  Using hardware purchased using an NSF SCREMS
grant (DMS-...), Stein created a free public Sage notebook server at
\url{http://sagenb.org}.  Several hundred students across the country 
have created new accounts at \url{http://sagenb.org} every single day 
during the first few weeks of the Autumn quarter.  On one unusual day
(October 13, 2009), over {\bf 5000 students} created new accounts!

\subsection{Improve the notebook so that it
  will robustly handle up to 1000 simultaneous users when running on a
  single high-end server, as demonstrated by a robust automated test
  suite}

[[Discussion]]

\subsection{Implement management tools so administrators can manage the
  notebook load and better balance resources}

[[Discussion]]

\subsection{Create easy-to-use research tools for educators, so they can
understand how their students use Sage}

[[Discussion]]

\subsection{Make it extremely easy to set up a campus-wide sage server}

Create a nice Virtual Box "Sage notebook server appliance" with a graphical interface, two
virtual machines that provides a rock solid secure Sage notebook server setup.  Users will
be able to very easily install this appliance on Windows, Linux, OS X, and Solaris (x86) servers. 
The management interface will provide clear and easy documentation about setting up
this server, creating new notebook servers for specific classes or instructors,
starting and stopping notebook servers, seeing resource usage, adding users and
authentication frameworks (such as LDAP), and upgrading Sage with minimal user downtime. 

We intend to provide support to get Sage to be used on several new campuses 
(this helps fulfill the ``project is institutionalized'' goal of type II proposals). 
We will create a new mailing list for server administration issues, and in addition
to the help we provide would like to hire a knowledgeable employee for a certain number
of hours per day to answer support questions. 

In summary, we propose to provide high-quality enterprise level software infrastructure
and support to educators.   What we propose is far from free or easy -- it is in fact
expensive.  But if NSF bares the cost of a few hundred thousand dollars now, then 
literally millions of students will benefit with no cost to them.  This is an excellent
investment by NSF. 

[[See what support webwork and moodle offer for setting up campus servers---they probably have good ideas.]]

[[Make it easy to register an official public (or private) sage notebook server: http://moodle.org/sites/]]

```