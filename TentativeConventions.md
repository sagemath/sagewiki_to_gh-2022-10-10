= First-time setup =

= Basic git commands =

= Branch naming conventions =

= Example workflow =

= Moving a ticket from patches to git =

= Moving a patch from the combinat queue to git =

All patches in the queue will soon be merged from the sage-combinat queue to git branches on trac.
Authors who want to do this themselves are encouraged to do so. The script will by default
put the branches to `public/combinat/`''branchname'' and might loose author information if the
patch does not have the appropriate meta information.

Here is a sample workflow on how to transform your patch to git:

 * First make sure that your patch has the correct meta data by exporting it.
 * Make a new branch in your local machine. For this it is important that you are in the master branch
{{{
$ git branch
  master
* ticket/15300
}}}
  To change to the master branch type
{{{
$ git checkout master
$ git branch 
* master
  ticket/15300
}}}
