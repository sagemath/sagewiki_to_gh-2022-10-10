= SAGE Bug Day 12 =

The event will take place on '''Saturday, May 10th, 2008''' and officially start at 9 am pacific standard time.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is (probably) '''3.0.1'''
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
 1. Michael Abshoff (old bugs)
 1. William Stein (notebook bugs)
 1. Craig Citro (current queue: #2535, unfiled enhancement for GammaH, #2329)
 1. David Harvey (not sure if I can make it; if I show up, I'll start by slaying #2943)
 1. Burcin Erocal
 1. Carlo Hämäläinen (#3150)
 1. Bjarke Hammersholt Roune (#1440, #2932)

Many other people will hopefully participate, but didn't yet add themselves here yet.

= Ticket status and reviews needed =

= Notebook bugs for bug day 12 =

I have put a bundle against 3.0.1 of everything below here:
  http://sage.math.washington.edu/home/was/patches/bugday12.hg

[[/changelog| Here's the changelog in the bundle, which gives the dependencies...]]

          

Here are the issues:
     * (done; invalid) [[http://trac.sagemath.org/sage_trac/ticket/245|#245: [kitchen sink]] a bunch of random notebook improvement ideas]  

     * (done; needs nontrivial review) [[http://trac.sagemath.org/sage_trac/ticket/336|#336 Create an option to clear all cell output]]
     * (done; needs easy review)  [[http://trac.sagemath.org/sage_trac/ticket/2636|#2636: #2636: changing a cell without evaluate should put the red line back to the left]]

     * (done; already fixed a while ago) [[http://trac.sagemath.org/sage_trac/ticket/408|#408: Notebook glitch in Safari]]
     * (done; patch ready for review) [[http://trac.sagemath.org/sage_trac/ticket/1230|#1230: Quit worksheet behaviour]]
     * (done; already done before) [[http://trac.sagemath.org/sage_trac/ticket/1351|#1351: notebook -- for person users admin is usually the only user -- in such ...]]
     * (done; needs trivial review) [[http://trac.sagemath.org/sage_trac/ticket/1557|#1557: notebook -- usability improvement after uploading file]]
     * (closed; can't replicate anymore) [[http://trac.sagemath.org/sage_trac/ticket/2605|#2605: Notebook tab-backspace-(shift enter) gives bug]]


     * (done; important significant patch) [[http://trac.sagemath.org/sage_trac/ticket/406|#406: notebook -- improve support for other system modes]]
     * (done; fixed; easy to referee) [[http://trac.sagemath.org/sage_trac/ticket/1733|#1733: notebook bug -- %foo (or anything else) in a cell by itself (with nothing ...]]
     * (done; dupe of #336) [[http://trac.sagemath.org/sage_trac/ticket/2118|#2118 "Delete all output" function on notebook]] (dup of #336?)
     * (done; with patch now) [[http://trac.sagemath.org/sage_trac/ticket/3008|#3008: first cell in notebook is undeletable]]

     * (done; easy) [[http://trac.sagemath.org/sage_trac/ticket/3136|#3136: the readme for osx should be changed to delete the line about inotebook()]]

     * (done; patch posted) [[http://trac.sagemath.org/sage_trac/ticket/3053|#3053: notebook -- new cell_resize doesn't respect %hide at the beginning of a ...]]


     * (done with help from jason grout) [[http://trac.sagemath.org/sage_trac/ticket/3121|Finalize #3121]]
     * (done; patch that needs review) [[http://trac.sagemath.org/sage_trac/ticket/637|#637: notebook improvement -- upload allow txt worksheets.]]
     * (closed as invalid since NOBODY else observed the same thing, so it's unfixable by anybody by Jaap) [[http://trac.sagemath.org/sage_trac/ticket/2935|#2935: notebook: internal server error sage-3.0.alpha5]] (possibly close as invalid)
     *  (patch posted; needs review) [[http://trac.sagemath.org/sage_trac/ticket/2992|#2992: notebook -- help(foo) in the notebook should not word wrap]]
     * [[http://trac.sagemath.org/sage_trac/ticket/1498|#1498: notebook -- bug in keeping track of date of last edit of worksheets maybe]]
     * (closed as invalid; new ticket opened for "delete published worksheets" enhancement item) [[http://trac.sagemath.org/sage_trac/ticket/1751|#1751: Notebook revision information leakage]]
     * (done; with easy to referee patch) [[http://trac.sagemath.org/sage_trac/ticket/1864|#1864: simple notebook bug -- typing ? in a comment yields introspection but ...]]
     * (done; fixed a few weeks ago as part of js.py cleanup) [[http://trac.sagemath.org/sage_trac/ticket/1865|#1865: notebook -- after restart output of first evaluation is not displayed]] (I think I already fixed this!)
     * (done; very easy patch) [[http://trac.sagemath.org/sage_trac/ticket/1892|#1892: notebook -- uploading a data file should give some help about the DATA ...]]
     * (done; turns out to be already fixed) [[http://trac.sagemath.org/sage_trac/ticket/2496|#2496: bug in introspection (probably easy to fix)]]
     * (done; closed since it seems to be fixed and is impossible to replicate) [[http://trac.sagemath.org/sage_trac/ticket/2278|#2278 notebook -- when uploading a new worksheet be sure to set the permissions]]
     * (done; yi's advice worked well; plus a bonus of fixing "control-c twice to quit") [[http://trac.sagemath.org/sage_trac/ticket/2359|#2359: notebook -- make it so when you send a kill signal to the notebook server ...]]
     * (done; patch posted awaiting review) [[http://trac.sagemath.org/sage_trac/ticket/2860|#2860: #2860: easy-to-fix bug in html.py]]
     * (done; it's a dupe) [[http://trac.sagemath.org/sage_trac/ticket/3147|#3147: "Quit Worksheet" in notebook doesn't seem to work anymore]]
     * (done; interesting but easy patch) [[http://trac.sagemath.org/sage_trac/ticket/3024|#3024: notebook -- parses tracebacks in the output of docstrings of help command (see #2992 below also)]]

     * (done; seems completely invalid.  I shouldn't have reported this in the first place without checking it) [[http://trac.sagemath.org/sage_trac/ticket/3139|#3139: typos in notebook tutorial in typesetting of sage_notebook]]
     * (done; a surprisingly easy 1-liner that stumped me for a while) [[http://trac.sagemath.org/sage_trac/ticket/2884|#2884: notebook -- bug; @interact cell eval doesn't clear out the old html output ...]]

     * (done; surprisingly easy to fix) [[http://trac.sagemath.org/sage_trac/ticket/3069|#3069: notebook -- typeset checkbox doesn't work after save/reload]]

     * (done; it works) [[http://trac.sagemath.org/sage_trac/ticket/2926|#2926: [with patch; needs review]] notebook -- Minimalistic change password page ...(referee this patch)]

= notebook change log =
Merged:
{{{
changeset:   9689:5e2689f219d0
user:        William Stein <wstein@gmail.com>
date:        Sun May 11 01:40:38 2008 -0700
summary:     trac #3069 -- notebook -- typeset checkbox doesn't work after save/reload

changeset:   9688:83531e2a029e
user:        William Stein <wstein@gmail.com>
date:        Sun May 11 01:21:50 2008 -0700
summary:     trac #2884 -- notebook -- bug; @interact cell eval doesn't clear out the old html output (easy to fix?)

changeset:   9687:3e870d7bb733 
user:        William Stein <wstein@gmail.com>
date:        Sun May 11 01:04:53 2008 -0700
summary:     trac #3024 -- notebook -- parses tracebacks in the output of docstrings of help command

changeset:   9686:64bab8c54fd1
user:        William Stein <wstein@gmail.com>
date:        Sun May 11 00:49:30 2008 -0700
summary:     trac #2860 -- easy-to-fix bug in html.py

changeset:   9683:5886085a5d53
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 23:06:18 2008 -0700
summary:     trac #1864 -- simple notebook bug -- typing ? in a comment yields introspection but shouldn't (easy to fix in worksheet.py, probably)

changeset:   9682:bf1d49c9c7de
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 22:44:16 2008 -0700
summary:     trac #2992 -- help(foo) in the notebook should not word wrap

changeset:   9681:491affdce3fa
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 22:02:38 2008 -0700
summary:     trac #637 -- notebook improvement -- upload allow txt worksheets.

changeset:   9690:8f33be1ff9de
tag:         tip
user:        Timothy Clemans <timothy.clemans@gmail.com>
date:        Tue Apr 15 11:15:04 2008 -0700
summary:     Add change password functionality

changeset:   9685:19807feec306
user:        William Stein <wstein@gmail.com>
date:        Sun May 11 00:11:22 2008 -0700
summary:     trac #2359 -- notebook -- make it so when you send a kill signal to the notebook server it saves state

changeset:   9684:b457320c962f
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 23:19:11 2008 -0700
summary:     trac #1892: notebook -- uploading a data file should give some help about the DATA variable

changeset:   9680:eec6e44c279a
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 19:54:01 2008 -0700
summary:     trac #3121 -- slight followup doc patch

changeset:   9679:265aef329367
user:        Jason Grout <jason-sage@creativetrax.com>
date:        Wed May 07 20:28:30 2008 -0500
summary:     [mq]: trac-3121-input-grid.patch

changeset:   9678:e062908ea727
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 18:58:48 2008 -0700
summary:     trac #3053 --  new cell_resize doesn't respect %hide at the beginning of a cell

changeset:   9677:0d7a666209ea
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 18:01:43 2008 -0700
summary:     trac #1230; part 3; change a button from "quit" to "stop"

changeset:   9676:8410ad6b8435
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 16:50:40 2008 -0700
summary:     sage-1230 follow up based on referee remark (add back an error message).

changeset:   9675:397c8fa28b53
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 16:12:39 2008 -0700
summary:     Fix trac #3008 -- Fix delete first cell bug. Also:

changeset:   9674:86cd4f04b3fd
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 15:55:48 2008 -0700
summary:     # Trac 1733 -- %foo cells in the notebook

changeset:   9673:efd67c0fc8f8
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 15:13:06 2008 -0700
summary:     Trac #406:

changeset:   9672:d70d9c5e2db1
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 14:13:44 2008 -0700
summary:     trac #1557 -- trivial change "Use" --> "Worksheet"

changeset:   9671:7593840775c0
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 14:03:51 2008 -0700
summary:     Trac #1230: fix all the issues listed at trac #1230:

changeset:   9670:f851683c53b3
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 13:27:51 2008 -0700
summary:     Fix trac #2636.  Pretty straightforward.

changeset:   9669:3a645bc3f57d
user:        William Stein <wstein@gmail.com>
date:        Sat May 10 12:51:03 2008 -0700
summary:     Fix trac #336 -- "delete all output" for the Sage notebook worksheets.  Also:

}}}

With the currently merged tickets I am seeing the following doctest failure:
{{{
mabshoff@sage:/scratch/mabshoff/release-cycle/sage-3.0.2.alpha1$ ./sage -t -long devel/sage/sage/server/simple/twist.py
sage -t -long devel/sage/sage/server/simple/twist.py        
**********************************************************************
File "/scratch/mabshoff/release-cycle/sage-3.0.2.alpha1/tmp/twist.py", line 81:
    sage: nb.dispose()
Exception raised:
    Traceback (most recent call last):
      File "/scratch/mabshoff/release-cycle/sage-3.0.2.alpha1/local/lib/python2.5/doctest.py", line 1228, in __run
        compileflags, 1) in test.globs
      File "<doctest __main__.example_0[20]>", line 1, in <module>
        nb.dispose()###line 81:
    sage: nb.dispose()
      File "/scratch/mabshoff/release-cycle/sage-3.0.2.alpha1/local/lib/python2.5/site-packages/sage/server/notebook/notebook_object.py", line 195, in dispose
        p.expect("Press control-C again to exit")
      File "/scratch/mabshoff/release-cycle/sage-3.0.2.alpha1/local/lib/python2.5/site-packages/pexpect.py", line 912, in expect
        return self.expect_list(compiled_pattern_list, timeout, searchwindowsize)
      File "/scratch/mabshoff/release-cycle/sage-3.0.2.alpha1/local/lib/python2.5/site-packages/pexpect.py", line 978, in expect_list
        raise EOF (str(e) + '\n' + str(self))
    EOF: End of File (EOF) in read_nonblocking(). Very pokey platform.
    <pexpect.spawn instance at 0x2ac40cda4e60>
    version: 2.0 ($Revision: 1.151 $)
    command: /scratch/mabshoff/release-cycle/sage-3.0.2.alpha1/sage
    args: ['/scratch/mabshoff/release-cycle/sage-3.0.2.alpha1/sage', '-twistd', '--pidfile=tmps8UgZ2/twistd.pid', '-ny', 'tmps8UgZ2/twistedconf.tac']
    patterns:
        Press control-C again to exit
    buffer (last 100 chars):
    before (last 100 chars): 2008-05-12 05:19:19-0700 [-] Main loop terminated.
    2008-05-12 05:19:19-0700 [-] Server Shut Down.

    after: <class 'pexpect.EOF'>
    match: None
    match_index: None
    exitstatus: 0
    flag_eof: 1
    pid: 1622
    child_fd: 3
    timeout: 30
    delimiter: <class 'pexpect.EOF'>
    logfile: None
    maxread: 2000
    searchwindowsize: None
    delaybeforesend: 0.1
**********************************************************************
1 items had failures:
   1 of  21 in __main__.example_0
***Test Failed*** 1 failures.
For whitespace errors, see the file /scratch/mabshoff/release-cycle/sage-3.0.2.alpha1/tmp/.doctest_twist.py
         [38.6 s]
exit code: 1024

----------------------------------------------------------------------
The following tests failed:


        sage -t -long devel/sage/sage/server/simple/twist.py
Total time for all tests: 38.6 seconds
mabshoff@sage:/scratch/mabshoff/release-cycle/sage-3.0.2.alpha1$  
}}}
Since this might be caused by some dependency being not merged yet I will wait until all tickets are reviewed before opening a ticket.
