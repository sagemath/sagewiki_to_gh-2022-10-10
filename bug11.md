= SAGE Bug Day 11 =

The event will take place on '''Saturday, April 5th, 2008''' and officially start at 10 am pacific standard time.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''3.0.alpha1'''
 * [[bug11/status|STATUS]]
 * [[bug11/irc|IRC log]]
 * Write to wstein@gmail.com or michael.abshoff@gmail.com for an account on the bug tracker.
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
 1. Michael Abshoff (memory leaks, ports, merging patches)
 1. Martin Albrecht (Singular 3-0-4-2, PolyBoRi, ginv, M4RI)
 1. Craig Citro (unrefereed patches, modular forms)
 1. Timothy Clemans (notebook doctests)
 1. William Stein (notebook bugfixes mainly)

Many other people will hopefully participate, but didn't yet add themselves here due to the rather tight schedule.

= Ticket status and reviews needed =
