= SAGE Bug Day 15 =

The event will take place on '''Thursday, October 30, 2008''' and officially start at 9 am pacific standard time and go on until people run out of energy.

Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''3.2.?'''
 * For a trac account follow [:TracGuidelines:these] instructions
 * We'll all be on #sage-devel at irc.freenode.net.
{{{
From Linux you can chat via a text console by installing "irssi", running it, and typing
  /SERVER add irc.freenode.net
  /SERVER irc.freenode.net
  /join #sage-devel
}}}

If you are using Konversation (the KDE IRC client), you can set up an auto-replace rule that lets you type #1322 (for trac #1322) and what everyone sees is http://trac.sagemath.org/sage_trac/ticket/1322 (which lets people click on the link and see the bug you are talking about).  To configure this, go to Settings -> Configure Konversation -> Behavior -> Auto Replace and create a rule with Find as "#([0-9]+)" and Replace with as "http://trac.sagemath.org/sage_trac/ticket/%1" (both without the quotes).  You can select whether this rule is applied to incoming posts, your outgoing posts, or both.

= Participants (with area they would like to work on) =

 1. William Stein (number theory bugs; magma/sage interface bugs):
 1. Michael Abshoff (memory leaks, merges, build issues)
 1. Timothy Clemans (notebook)
 1. Robert Bradshaw (coercion bugs, misc)
 1. Craig Citro (morning only -- http://trac.sagemath.org/sage_trac/ticket/4357)
 1. David Joyner (http://trac.sagemath.org/sage_trac/ticket/4383, but I won't have time until late afternoon)
