= Sage developer center =

Welcome to the '''Sage developer center'''!

This wiki page helps in organizing the development of Sage. Information and links to Sage development should be organized under "devel/". For answers to commonly asked questions, see the [[http://www.sagemath.org/doc/faq/ | FAQ]].

Note: The [[http://trac.sagemath.org/sage_trac/ |trac server]] contains patches awaiting review. Michael Abshoff wrote a set of [[http://www.sagemath.org/doc/developer/trac.html | general guidelines]] for using the trac server. See also the [[http://www.sagemath.org/doc/developer/trac.html | Developers' Guide]] for further information on using the trac patch server.

<<TableOfContents>>


= Release management =

Each release cycle of Sage is managed by at least one release manager. For example, a release manager produces the various alpha and rc releases for the `sage-x.y.z` release cycle. Release management is a complex task. The [[devel/ReleaseManagement | release management]] page contains a rough set of guidelines for Sage release management. If you want to help out with release management, please subscribe to the [[http://groups.google.com/group/sage-release | sage-release]] mailing list.


= Sage development =

Much of the Sage library is written in Python. Some performance critical parts of the Sage library is written in Cython. Information is available to help [[devel/BeginSageDevelopment | beginners on developing]] the Sage library. Also consult the list of [[devel/PythonCythonResources | Python and Cython resources]] for beginner to advanced information on the Python and Cython languages. You can also do [[devel/FunctionalProgramming | functional programming with Python and Sage]]. You should avoid as much as possible using non-ASCII characters in a source file. See this page for information on [[devel/nonASCII | avoiding non-ASCII characters]] in source files. However, there are also cases in which you need put such characters in a source file. That page also has tips on specifying the character encoding of a source file. The page on [[combinat/HelpOnTheDoc | docstring documentation]] contains information on the format (ReSTructured text) used in the docstrings of functions, classes, methods and modules. The page also includes special Sage doctest conventions. Before updating the copyright notices in the Sage library, read the page on [[devel/UpdateCopyright | copyright notices]] for a list of files to update as well.

If you have an account on the Sage cluster, ensure that you read the [[devel/SageClusterGuidelines | Sage cluster guidelines]] on using computer resources on the Sage cluster.

 * [[http://www.sagemath.org/doc/faq/faq-contribute.html | Frequently asked questions regarding Sage development]]

||<#FFFF66>Please write Python3-compatible code (see [[Python3-compatible code]])||

= Sage notebook =

The Sage notebook provides a graphical user interface to Sage. To help out with developing the Sage notebook, you need to know how to code in !JavaScript. The page on [[devel/JavascriptResources | JavaScript resources]] contains many resources on !JavaScript and !JavaScript libraries. The Sage [[devel/SageNotebook | notebook technical overview]] provides a technical overview of the Sage notebook server, including how it responds to user requests, delegates tasks, etc. See also the page on [[devel/SageUsability | usability improvements]] for a list of development tasks relating to enhancing the notebook and its usability. See the page on [[i18n | Sage notebook internationalization]] for a list of available locales, and instructions on how to make one.


= Miscellaneous =

 * [[devel/SoftwareToIntegrate | Ideas for software to integrate with Sage]]

 * [[devel/UsefulSoftware | Software that may be useful]]

 * [[devel/SEP | Sage Enhancement Proposals]]

 * [[devel/SoftwareSurveys | Software surveys]]

 * [[devel/DebianSage | Sage in Debian]]

 * [[firefox-trac | Cool tricks]] for better Firefox/trac integration

 * [[devel/SageTasks | Sage usability task list]]

 * [[devel/BuildFarm | Build farm]]

 * [[devel/LatexToWorksheet | Latex document conversion to Sage worksheets]] 

 * [[SharingYourBranch | Sharing your branch of Sage development]]

 * [[prerequisitesUbuntu | List of Ubuntu packages required to build Sage]]
