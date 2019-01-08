## page was renamed from SageJournal
= Sage Magazine - - - P R O P O S A L - - - =
The '''Sage Magazine''' is a periodic and numbered publication about Sage. It is published monthly or every two month, depending on the number of submissions in the style of a regular journal - but less "formal". Therefore it is something in between of blog entries and scientific publications. It will feature articles about Sage and explains major changes in Sage since the last issue.

'''Naming''' possible candidates for a Name, because "Sage Journal" got "-2" or less:
 * Sage News
 * Sage Newsletter 
 * Sage Letters
 * Sage in the Print
 * Sage Reader
 * Sage eLetters
 * Sage eNews
 * '''Sage Magazine''' - possibly the best

== Topics ==
'''list of possible topics''' an issue could/should cover.

remember that this magazine will still be available years after publishing. therefore it should be "timeless".

 * ''Usage Cases/Examples'': This is probably the biggest topic. It should feature a specific functionality of Sage or emphasize on a specific topic and explain how it could be realized using Sage. This includes:
  * explanation of problem/field/topic
  * Sage code: what has to be typed in to accomplish the task, explain it so that a new user, familiar to math software, understands it, too. (implicitly explain how to use Sage, but never reference other software packages like: "task XY is done in M* with this command - this is now done with that command.")
  * Screenshots, Graphics
 * ''New Feature'': It should present new functions and enhancements. Since this magazine started long after Sage started to exist, it could also be about "older" features, but they should be somewhat special to Sage. They should also be already implemented and tested, ready to use for a broader audience. It should not include future features or things in active development (this is something for the discussion group/IRC)
 * ''Changes'': new and different since last volume of this magazine
  * until now, task XY was done this way, but we decided to do it now that way.
  * there is a new feature called XY, it does this.
  * just very short in the style of release notes.
 * ''New Packages'': similar to above, write about new packages and their role in enhancing Sage.
 * ''New Users'': Explain Sage to a new user, help with first steps, something which is not obvious by just reading the manual. Maybe a broader explanation to a bigger topic in sage-support!
 * ''Algorithms'': Explain some implementation details - since Sage is about "opening algorithms" it should also transport this actively. This would capture the interest of others who are not actively involved in Sage, but are interested in implementing good algorithms. Benchmarks. Link to Source Code + papers.
  . ''"Research papers generally only cover the idea of the algorithm, but an implementation has a lot of other fundamental issues."'' (Tim Daly @ sage-devel, 2008-03-13)
 * ''Teaching'': Some article about using Sage for education - e.g. how to explain XY to a student, why useful, report your own experiences using Sage in education!
 * ''Developer's Corner'': Here are news from developers to developers, about internals, changes in a process, results from discussions about future issues, changes in the layout, benchmarks, short introduction how git is used in development and its integration as part of sage's commands, ... or developing applications which use sage (bigger python script, analyzing data or something, importing sage commands)
 * ''Politics/Philosophy'': what makes sage different to M*, ...
 * ''Community'': about people using sage
 * ''Events'': Sage somewhere in the wild? a conference? exhibition booth? what has happened? pictures!
 * maybe other topics, also of course hybrids between these topics.
'''topics not to cover:'''

 * things currently discussed on sage-devel (a year later this information is pointless)
 * all topics without intersection points with sage
== Issues ==
Issues are numbered by the <year>-<month> of their release. Maybe every two month, depending on the number of submissions.

== Submissions ==
 * Submissions on a continuous base, email them to the Editor: <<MailTo(harald DOT schilly AT SPAMFREE gmail DOT com)>>
 * Announcements on sage-devel

=== Volume 2008-0x ===
possible topics:

 * introduction to the magazine
 * general outline about Sage, history, philosophy (why is it important to disclose the algorithms), mission, python, future
 * introduction to using sage: how to setup (or just reference install manual, but explain that it is a server with a notebook interface, e.g. nonstandard), modes of usage (notebook, CLI, script), first steps
 * new features: interact
 * help: check sage-support
 * developers corner: ? (something about mercurial in sage?)
=== Volume 2008-xx ===
second issue, possible topics:

 * new features: latex embedding (assuming SageTex is included in the release .. or move it up to the first volume if already released)
== Ideas ==
resources for article ideas:

 * website (talks, linked articles)
 * this wiki
 * sage google groups
 * blogs
 * own experience
== Copyright ==
as mentioned on the first page of this wiki: contributions are licensed under the [[http://creativecommons.org/licenses/by-sa/3.0/|Creative Commons 3.0 license]].

== Citation ==
possible style to cite an article

{{{
@ARTICLE{SageMagazine:Author:ID,
  author = {Name of Author},
  title = {Title of Article},
  journal = {Sage Magazine},
  year = xxxx,
  volume = x,
  number = x,
  pages = {xx--xx},
  month = {xxxxx},
  url = {http://sagemath.org/magazine/},
  pdf = {http://sagemath.org/magazine/Sage-Journal-200x-xx.pdf}
}
}}}
== Prerequisites / TODO ==
 * SageMagazine.sty latex stylefile: twocolumn, title, TOC, editorial notice, articles are included as separate TeX files, they should have a title (spans over both columns), subtitle, author and automatic formatting.
 * [[http://www.loc.gov/issn/e-serials.html|ISSN number]]
 * website listing all volumes, links to pdf's, (plus erratum), general explanation, explanation who is behind, explanation how to submit articles
== Organization ==
Before releasing the first volume, we need:

 * articles - submission invitation will be posted on sage-devel, in general continuous submissions
 * editor board
 * layout, development of stylefile
  * stylefile to cover everything
  * example article, to show how to typeset title, author, subtitle, included graphics, source code (latex listing package, references to line numbers, ...) and including links (clickable pdf links)
 * infrastructure - managing submissions, reviews, errors ... and after a release, a sage-trac component "magazine" where someone could post an error, correct it, and post an erratum (published pdf is updated + a note on the website)
 * possible workflow:
  1. tell editor about your article idea: topic/short introduction, via email, editor sends feedback that he got it.
  1. editor says yes or no, avoid duplications (tell each other to be co-authors), maybe discussion on IRC
  1. write article using template, then submit to editor via email
  1. editor reads, sends feedback, maybe discussion in IRC
  1. editor sends article to others on the editor board - more eyes see more
  1. editor decides when to publish a volume, sends document internally to others to check it
  1. document is published on html, as pdf, with article title and author -- document sources are published in the sage repository (or only webserver?)
  1. if trac-issue mentions an error, editor uploads patched pdf and a small text file called "erratum" and updates sources in the repository

== Links ==
 * this reminds me a bit of Haskell's [[http://www.haskell.org/haskellwiki/The_Monad.Reader|The Monad Reader]]. --DanDrake
 * similar project is R's Newsletter [[http://www.r-project.org/doc/Rnews/index.html|R News]]
 * Blender Art Magazine for the open source 3D software: [[http://www.blenderart.org/|BlenderArt Magazine]]

== Comments ==
write here general comments or edit errors above ...
