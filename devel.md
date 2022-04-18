= Sage Developer Center =

Welcome to the Sage developer center!

Note:  Developers should check trac.sagemath.org at least one per week. That's where development actually happens.

TODO:

Organize, sage-devel.

 * [[faq | Sage FAQ - Frequently Asked Questions]]
 * [[Tips]]
 * [[data | Put (links to) interesting data you compute using Sage here]]
 * [[pics | Code to make cool images]]
 * [[plot | Sage plotting]]
 * [[art | Art - posters, banners, etc]]
 * [[interact | Interact Demos]]
 * [[http://tug.ctan.org/pkg/sagetex | SageTeX - Put some sage into your TeX]]
 * [[standard_packages_available_for_SAGE | standard packages available for Sage]]
 * [[optional_packages_available_for_SAGE | optional packages available for Sage]]
 * [[experimental_packages_available_for_SAGE | experimental packages available for Sage]]
 * [[Sage_Spkg_Tracking | SPKG changelog and descriptions]]
 * [[OSCAS]]
 * [[SAGE_Reviews | Sage Reviews]]
 * [[Teaching_using_SAGE | Teaching using Sage]]
 * [[Teaching_with_SAGE | Teaching with Sage]]
 * [[DocumentationProject | Documentation Project]]
 * [[Comparisons]]
 * [[SAGE_in_the_News | Sage in the News]]
 * [[Publications_using_SAGE | Publications using Sage]]
 * [[Talks | Talks and Presentations about Sage]]
 * [[http://trac.sagemath.org/sage_trac/|See the TRAC Server]]
 * [[TracGuidelines|Trac guidelines]] by Michael Abshoff
 * [[Software|Ideas for Software to Integrate With Sage]]
 * [[Software_that_may_be_useful]]
 * [[devel/ReleaseManagement|Release Management]]
 * [[SEP|Sage Enhancement Proposals]]
 * [[Software_surveys]]
 * [[debian|Sage in Debian]]
 * [[HowToBeginSageDevelopment|How to begin Sage development]]
 * [[firefox-trac|Cool tricks]] for better Firefox/trac integration
 * [[combinat/HelpOnTheDoc|Docstring Docummentation]] for help on the format (ReSTructured text) used in the docstrings, including special Sage doctest conventions
 * [[JavascriptResources | JavaScript and related resources]]
 * [[PythonResources | Python and Cython resources]]
 * [[SageUsability | Sage Usability Improvements List]]
 * [[SageNotebook | Technical Overview of the Sage Notebook]]
 * [[TracGuidelines|Trac guidelines]] by Michael Abshoff

= Sage developer center =

Welcome to the '''Sage developer center'''!

This wiki page helps in organizing the development of Sage. Information and links to Sage development should be organized under "devel/". For answers to commonly asked questions, see the [[http://www.sagemath.org/doc/faq/ | FAQ]].

Note: The [[http://trac.sagemath.org/sage_trac/ |trac server]] contains patches awaiting review. Michael Abshoff wrote a set of [[http://www.sagemath.org/doc/developer/trac.html | general guidelines]] for using the trac server. See also the [[http://www.sagemath.org/doc/developer/trac.html | Developers' Guide]] for further information on using the trac patch server.

<<TableOfContents>>


= Release management =

Each release cycle of Sage is managed by at least one release manager. For example, a release manager produces the various alpha and rc releases for the `sage-x.y.z` release cycle. Release management is a complex task. The [[devel/ReleaseManagement | release management]] page contains a rough set of guidelines for Sage release management. If you want to help out with release management, please subscribe to the [[http://groups.google.com/group/sage-release | sage-release]] mailing list.


= Sage development =

Much of the Sage library is written in Python. Some performance critical parts of the Sage library is written in Cython. Information is available to help [[devel/BeginSageDevelopment | beginners on developing]] the Sage library. Also consult the list of [[devel/PythonCythonResources | Python and Cython resources]] for beginner to advanced information on the Python and Cython languages. You can also do [[devel/FunctionalProgramming | functional programming with Python and Sage]]. You should avoid as much as possible using non-ASCII characters in a source file. See this page for information on [[devel/nonASCII | avoiding non-ASCII characters]] in source files. However, there are also cases in which you need put such characters in a source file. That page also has tips on specifying the character encoding of a source file. The page on [[combinat/HelpOnTheDoc | docstring documentation]] contains information on the format (ReSTructured text) used in the docstrings of functions, classes, methods and modules. The page also includes special Sage doctest conventions. Before updating the copyright notices in the Sage library, read the page on [[devel/UpdateCopyright | copyright notices]] for a list of files to update as well.

 * [[http://www.sagemath.org/doc/faq/faq-contribute.html | Frequently asked questions regarding Sage development]]

||<#FFFF66>Please write Python3-compatible code (see [[Python3-compatible code]])||


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
