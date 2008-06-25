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

== Enhancements Comming Soon ==

First, answers to the questions I expect:

 * Interactive Use - This means to most, tab completion and use from the notebook.  This does work from the notebook, but the meta-data for tab completion needs to be added.  The good news is it appears straightforward
 * Dynamic Code Migration - This is also likely straightforward.  Numerous approaches exist:
  1. Send a block of code in a string and have it compiled and resident on the servers
  1. Pickle a python function and send it over (gfurnish has this capability coded up)
  1. Task Objects - send over an object with a well-known interface (this is easily extended to be very general)

= Installation =

You'll need foolscap.

{{{
source SAGE_ROOT/local/bin/sage-env
cd /tmp
hg clone http://foolscap.lothar.com/repos/trunk foolscap-trunk
cd foolscap-trunk
./setup.py install
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
CategoryCategory
