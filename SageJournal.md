= Sage Journal - - - P R O P O S A L - - - =

'''Sage Journal''' is some sort of a newsletter about Sage. It is published periodically, monthly or every two month, depending on the number of submissions in the style of a regular journal, but less "formal". Therefore it is a mixture of blog entries and scientific publications. It will feature articles about Sage and explains major changes in Sage since the last issue.

== Topics ==
list of possible topics an issue could/should cover. remember that this journal will still be available years after publishing. therefore it should be "timeless".

 * ''Usage Cases/Examples'': This is probably the biggest topic. It should feature a specific functionality of Sage or emphasize on a specific topic and explain how it could be realized using Sage. This includes:
  * explanation of problem/field/topic
  * Sage code: what has to be typed in to accomplish the task, explain it so that a new user, familiar to math software, understands it, too. (implicitly explain how to use Sage, but never reference other software packages like: "task XY is done in M* with this command - this is now done with that command.")
  * Screenshots, Graphics
 * ''New Features'': It should present new functions and enhancements. Since this Journal started long after Sage started to exist, it could also be about "older" features, but they should be somewhat special to Sage. They should also be already implemented and tested, ready to use for a broader audience. It should not include future features or things in active development (this is something for the discussion group/IRC)
 * ''New Packages'': similar to above, write about new packages and their role in enhancing Sage.
 * ''Algorithms'': Explain some implementation details - since Sage is about "opening algorithms" it should also transport this actively. This would capture the interest of others who are not actively involved in Sage, but are interested in implementing good algorithms. Benchmarks. Link to Source Code.
 * ''Teaching'': Some article about using Sage for education - e.g. how to explain XY to a student, why useful, report your own experiences using Sage in education!
 * ''Developer's Corner'': Here are news from developers to developers, about internals, changes in a process, results from discussions about future issues, changes in the layout, benchmarks, short introduction how mercurial is used in development and its integration as part of sage's commands, ...
 * ''Politics/Philosophy'': what makes sage different to M*, ...
 * ''Community'': about people using sage
 * maybe other topics
topics not to cover:

 * things currently discussed on sage-devel (a year later this information is pointless)
 * all topics without intersection points with sage
== Issues ==
Issues are numbered by the <year>-<month> of their release. Maybe every two month, depending on the number of submissions.

=== Volume 2008-0x ===
possible topics:

 * introduction to the journal
 * general outline about Sage, history, philosophy (why is it important to disclose the algorithms), mission, python, future
 * introduction to using sage: how to setup (or just reference install manual, but explain that it is a server with a notebook interface, e.g. nonstandard), modes of usage (notebook, CLI, script), first steps
 * new features: interact
 * developers corner: ? (something about mercurial in sage?)
=== Volume 2008-xx ===
second issue, possible topics:

 * new features: latex embedding (assuming SageTex is included in the release .. or move it up to the first volume if already released)
== Ideas ==
resources for article ideas:

 * website (talks, linked articles)
 * this wiki
 * blogs
 * own experience
== Copyright ==
as mentioned on the first page of this wiki: contributions are licensed under the [http://creativecommons.org/licenses/by-sa/3.0/ Creative Commons 3.0 license].

== Citation ==
possible style to cite an article

{{{
@ARTICLE{SageJournal:Author:ID,
  author = {Name of Author},
  title = {Title of Article},
  journal = {Sage Jornal},
  year = xxxx,
  volume = x,
  number = x,
  pages = {xx--xx},
  month = {xxxxx},
  url = {http://sagemath.org/journal/},
  pdf = {http://sagemath.org/journal/Sage-Journal-200x-xx.pdf}
}
}}}
== Prerequisites / TODO ==
 * SageJournal.sty latex stylefile: twocolumn, title, TOC, editorial notice, articles are included as separate TeX files, they should have a title (spans over both columns), subtitle, author and automatic formatting.
 * ISSN number?
 * website listing all volumes, links to pdf's, (plus erratum), general explanation, explanation who is behind, explanation how to submit articles
== Organization ==
Before releasing the first volume, we need:

 * articles - submission invitation will be posted on sage-devel
 * layout, development of stylefile
  * stylefile to cover everything
  * example article, to show how to typeset title, author, subtitle, included graphics, source code (latex listing package, references to line numbers, ...) and including links (clickable pdf links)
 * infrastructure - managing submissions, reviews, errors ... and after a release, a sage-trac component "journal" where someone could post an error, correct it, and post an erratum (published pdf is updated + a note on the website)
  * possible workflow:
   1. tell editor about your article idea: topic/short introduction
   1. editor says yes or no, maybe discussion in IRC
   1. write article using template, then submit to editor via email
   1. editor reads, sends feedback, maybe discussion in IRC
   1. editor sends article to others on the editor board
   1. editor decides when to publish a volume, sends document internally to others to check it
   1. document is published on html, as pdf -- document sources are published in the sage repository
   1. trac-issue about an error, edior uploads patched pdf and updates sources in the repository
