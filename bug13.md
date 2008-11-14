= SAGE Bug Day 13 =

The event will take place on '''Saturday, August 23rd, 2008''' and officially start at 10 am pacific standard time.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is (probably) '''3.1.2.alphaX'''
 * [[/status|STATUS]]
 * [[/irc|IRC log]]
 * For a trac account follow [[TracGuidelines|these]] instructions
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
 1. Michael Abshoff (old bugs, merging patches, portability fixes)
 1. William Stein (fix that Sage's SymbolicRing is slow as molasses): [[http://trac.sagemath.org/sage_trac/ticket/3872|#3872]]
 1. Mike Hansen
 1. Timothy Clemans (Notebook)
 1. Martin Albrecht (I'll drop in late (GMT) and work on random-ish tickets on Trac)
 1. Burcin Erocal (help out with #3872)
 1. Craig Citro (I'll be on a plane from London to LA, but I'll be fixing bugs on the plane)

Many other people will hopefully participate, but didn't yet add themselves here yet.

= Ticket status and reviews needed =
 * NA
