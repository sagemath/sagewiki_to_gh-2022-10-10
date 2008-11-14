= SAGE Bug Day 15 =

The event will take place on '''Thursday, October 30, 2008''' and officially start at 9 am pacific standard time and go on until people run out of energy.

Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''3.2.?'''
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

 1. William Stein (number theory bugs; magma/sage interface bugs):
    Magma:
      * (done) fix [[http://trac.sagemath.org/sage_trac/ticket/4393|#4393: magma related optional doctest failure in sage/structure/element.pyx]]
      * (done) fix [[http://trac.sagemath.org/sage_trac/ticket/4394|#4394: magma related optional doctest failure in sage/rings/polynomial/polynomial_element.pyx]]
      * (done) fix [[http://trac.sagemath.org/sage_trac/ticket/4395|#4395: magma related optional doctest failure in sage/rings/quotient_ring.py]] 
      * (done) fix [[http://trac.sagemath.org/sage_trac/ticket/4397|#4397: optional doctest failure in sage/rings/number_field/number_field.py]]
      * (done) fix [[http://trac.sagemath.org/sage_trac/ticket/4398|#4398: magma related optional doctest failure in sage/sage/modules/free_module.py]]
      * fix [[http://trac.sagemath.org/sage_trac/ticket/4399|#4399: magma related optional doctest failure in sage/matrix/matrix1.pyx]]
      * fix [[http://trac.sagemath.org/sage_trac/ticket/4400|#4400: magma related doctest failures in sage/interfaces/magma.py]]
      * fix [[http://trac.sagemath.org/sage_trac/ticket/4401|#4401: magma related optional doctest failure in sage/crypto/mq/mpolynomialsystem.py]]
      * fix [[http://trac.sagemath.org/sage_trac/ticket/4401|#4402: magma related optional doctest failure in tut.tex]]
      * referee/integrate [[http://trac.sagemath.org/sage_trac/ticket/4290|#4290: function to turn plane curves of genus one into elliptic curves]]
      * fix [[http://trac.sagemath.org/sage_trac/ticket/4236|#4236: boolean ring conversions]]
      * fix [[http://trac.sagemath.org/sage_trac/ticket/4237|#4237: finite field matrix conversions]]
    Misc.
      * fix [[http://trac.sagemath.org/sage_trac/ticket/4396|#4396: make it possible to upgrade to the latest alpha version.]]
      * fix [[http://trac.sagemath.org/sage_trac/ticket/961|#961: sage -standard fails without write permission to $SAGE_LOCAL/tmp]]
      * referee [[http://trac.sagemath.org/sage_trac/ticket/3693|#3693: upgrade moinmoin to 1.7.2]]
    Number Theory:
      * referee [[http://trac.sagemath.org/sage_trac/ticket/4388|#4388: elliptic curves: basis_matrix command totally broken]]
      * referee [[http://trac.sagemath.org/sage_trac/ticket/4062|#4062: Problems with Eisenstein series code]]
      * referee [[http://trac.sagemath.org/sage_trac/ticket/4392|#4392: smallest_integer() is broken]]
      * fix [[http://trac.sagemath.org/sage_trac/ticket/1234|#1234: analytic_rank crashes]]
      * referee [[http://trac.sagemath.org/sage_trac/ticket/4340|#4340: victor miller basis massive speedup]]

 1. Michael Abshoff (memory leaks, merges, build issues)
 1. Timothy Clemans (notebook)
 1. Robert Bradshaw (coercion bugs, misc)
 1. Craig Citro (morning only -- http://trac.sagemath.org/sage_trac/ticket/4357)
 1. David Joyner (http://trac.sagemath.org/sage_trac/ticket/4383, but I won't have time until late afternoon)
 1. John Cremona 
    * fix [[http://trac.sagemath.org/sage_trac/ticket/4392|#4392: smallest_integer() is broken]] -- patch ready for review
    * fix [[http://trac.sagemath.org/sage_trac/ticket/4388|#4388: elliptic curves: basis_matrix command totally broken]] -- patch ready for review
