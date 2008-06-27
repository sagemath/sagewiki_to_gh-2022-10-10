## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:CategoryTemplate
##master-date:Unknown-Date
#format wiki
#language en

= DsageNg Scatter Gather Alpha Edition =

This is not an official release or anything close... but it seems to work.

Also, you're entirely off the reservation here.  This is just for those few who want to play around with the simplest of simple first cases of DsageNg.  All comments should come to me for the time being...  sage-devel ain't gonna help you with this one

GlennTarbox has the usual contact information

= High Level Architecture =

There are a few key elements in the proposed architecture
 * Twisted for asynchronous communications, event management, scheduling
 * PyProcessing for spawning local processes and IPC
 * Foolscap for Remote Procedure Call (RPC) abstraction over Twisted

== Architecture Diagram ==
[[ImageLink(DOC.png, height=500)]]

The client itself, now has 2 processes.  In the example above, the notebook layer supports the browser view into Sage.  In Scatter Gather, another process is spawned using PyProcessing and communications between the two processes is maintained through Queues.

 1. The Client Child is passed a set of url's identifying the remote processes for execution.  While this is a very general capability, for ''Scatter Gather'', it simply means a process which takes a block of work and returns a result.
 1. The Client Parent generates a ''Task'' which in its simplest case (for scatter gather) is simply the argument set of a function call.  Fortunately, since we're using Python, this simply means we need to generate an args list and kargs dict for each Task.  A ''Scatter Set'' is simply a list of args, kargs tuples.

{{{#!python
""" Create list of args, kargs for remote method """
inList[]
for x in range(100):
    inList.append(([x,3.14159,'hello'],{'distribution':'normal',
                           'loc':1,'scale':1,'bins':10}))
}}}


 1. This list is simply inserted in the downward queue in the figure.  The result of the function call is returned in the upward queue.  A nice feature is the ability to check for result availability without blocking.  In the case of the notebook, one can continuously add jobs to be processsed while investigating the results of previous jobs.
 1. If desired, you can block waiting for results as well.



The child process is a conventional Twisted process.  A scheduler continuously checks for jobs having been submitted through a queue

== Enhancements Comming Soon ==

First, answers to the questions I expect:

 * Interactive Use - This means to most, tab completion and use from the notebook.  This does work from the notebook, but the meta-data for tab completion needs to be added.  The good news is it appears straightforward
 * Dynamic Code Migration - This is also likely straightforward.  Numerous approaches exist:
  1. Send a block of code in a string and have it compiled and resident on the servers
  1. Pickle a python function and send it over (gfurnish has this capability coded up)
  1. Task Objects - send over an object with a well-known interface (this is easily extended to be very general)

= Installation =

You'll need foolscap and PyProcessing

{{{
source SAGE_ROOT/local/bin/sage-env
cd /tmp
hg clone http://foolscap.lothar.com/repos/trunk foolscap-trunk
cd foolscap-trunk
./setup.py install
sage -i processing-0.52
}}}

Then grab the tarball (or the repo... but the tarball is easier) from the Distributed branch

http://noc2.tarbox.org:8080/?p=sage-finance/.git;a=shortlog;h=refs/heads/distributed

Unwind the tarball into SAGE_ROOT/devel/sage-finance

{{{
sage -b finance
}}}

Now you're mostly good to go.

Insert useful instructions here...


----
CategoryDsageNg
