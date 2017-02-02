= SAGE Bug Day 14 =

The event will take place on '''Thursday, October 23, 2008''' and officially start at 9 am pacific standard time and go on until people run out of energy.

Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''3.1.4'''
 * For a trac account follow [[TracGuidelines|these]] instructions
 * We'll all be on #sage-devel at irc.freenode.net.
{{{
From Linux you can chat via a text console by installing "irssi", running it, and typing
  /SERVER add irc.freenode.net
  /SERVER irc.freenode.net
  /join #sage-devel
}}}

If you are using Konversation (the KDE IRC client), you can set up an auto-replace rule that lets you type #1322 (for trac #1322) and what everyone sees is http://trac.sagemath.org/sage_trac/ticket/1322 (which lets people click on the link and see the bug you are talking about).  To configure this, go to Settings -> Configure Konversation -> Behavior -> Auto Replace and create a rule with Find as "#([0-9]+)" and Replace with as "http://trac.sagemath.org/sage_trac/ticket/%1" (both without the quotes).  You can select whether this rule is applied to incoming posts, your outgoing posts, or both.

= Participants (with area they would like to work on) =

 1. Michael Abshoff (Merges, memory leaks, reviews)
 1. Craig Citro
 1. William Stein (number theory bugs; magma/sage interface bugs):
    * Magma
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/4241|4241 -- massive magma interface memory leaks]]
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/2171|2171 -- magma matrix conversion; probably just a rebase]]
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/1997|1997 -- magma control-c too aggressive]]
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/4348|4348 -- get magma interface to 100% coverage]]
    * Number theory
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/4347|4347 -- generalized bernoulli numbers]]
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/3901|3901 -- automated doctesting elementary number theory book]]
      * [[http://trac.sagemath.org/sage_trac/ticket/4337|4337 -- Hecke operators on q-expansions of Gamma_1(N) modular forms]]
    * Other
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/3900|3900 -- pickle jar]]
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/3765|3765 -- parallel option for "sage -br"]]
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/4346|4346 -- weird linear algebra segfault]]; but note this led to 4350 and 4351...
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/4350|4350]] 
      * (done) [[http://trac.sagemath.org/sage_trac/ticket/4351|4351]] -- issues related to 4346

 1. DanDrake (notebook documentation, reviews...starting about 23:30 UTC)
 1. Alex Ghitza (ssmod bugs, modular forms)
 1. Mike Hansen
    * Templating the Notebook
    * [[http://trac.sagemath.org/sage_trac/ticket/4330|4330 -- interfaces function_call(...) function is a total MESS]]
Many other people will hopefully participate, but didn't yet add themselves here.
