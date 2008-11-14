= SAGE Bug Squash Day 8 =

The event will take place on '''Wednesday, January 2, 2008''' and officially start at 9 am pacific standard time.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''2.9.2.alphaX'''.
 * [[bug8/status|STATUS]]
 * [[bug8/irc|IRC log]]
 * Write to wstein@gmail.com for an account on the bug tracker.
 * We'll all be on #sage-devel at irc.freenode.net.
{{{
From Linux you can chat via a text console by installing "irssi", running it, and typing
  /SERVER add irc.freenode.net
  /SERVER irc.freenode.net
  /join #sage-devel
}}}

If you are using Konversation (the KDE IRC client), you can set up an auto-replace rule that lets you type #1322 (for trac #1322) and what everyone sees is http://trac.sagemath.org/sage_trac/ticket/1322 (which lets people click on the link and see the bug you are talking about).

To configure this, go to Settings -> Configure Konversation -> Behavior -> Auto Replace and create a rule with Find as "#([0-9]+)" and Replace with as "http://trac.sagemath.org/sage_trac/ticket/%1" (both without the quotes).  You can select whether this rule is applied to incoming posts, your outgoing posts, or both.

= Participants (with area they would like to work on) =
 1. Michael Abshoff (merging patch, build issues in general)
 1. Robert Bradshaw (jmol and other 3d stuff)
 1. Tom Boothby (IE7 compatability for notebook)
 1. David Joyner (coding theory, calculus, documentation)
 1. William Stein (misc quality control; bug fixes; jmol and 3d)

Many other people will hopefully participate, but didn't yet add themselves here due to the rather tight schedule.
