= SAGE Bug Day 10 =

The event will take place on '''Saturday, February 16th, 2008''' and officially start at 8 am pacific standard time.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''2.10.2.alpha0''', but be sure to apply the patch here:
     * http://trac.sagemath.org/sage_trac/attachment/ticket/1963/Sage-2.10.2.alpha1-fix-import-issue.patch
     * and make sure to apply the fix from [http://trac.sagemath.org/sage_trac/ticket/2172 #2172].
 * [:bug10/status:STATUS]
 * [:bug10/irc:IRC log]
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
 1. William Stein (everything)
 2. Michael Abshoff (memory leaks, ports)
 3. David Joyner (minor Bessel function bug, minor tutorial edits, maybe coding theory improvements)
 4. Burcin Erocal (PolyBoRi interface problems - 0.2 package, infinity, special functions) 
 5. Yi Qiang (Getting dsage doctest integration in)
 6. Clément Pernet (linear algebra related bugs, memleaks)
 7. Timothy Clemans (Mathematica interface, notebook, cryptography)
 8. Craig Citro (cool stuff)
 9. Carl Witty (skim the reference manual, fix things that look wrong or badly-LaTeXed)

Many other people will hopefully participate, but didn't yet add themselves here due to the rather tight schedule.

= Ticket status and reviews needed =
