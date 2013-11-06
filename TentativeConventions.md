= First-time setup =

= Basic git commands =

= Branch naming conventions =

 * On your local machine you can call your branches however you like. However, it might be useful to use the
 same names that you use on trac.
{{{
mystuff
}}}

 * If you are working on a branch yourself, then it is best to put your patches on trac in your personal space
{{{
u/aschilling/mystuff
}}}

 * If you collaborate on a branch with others or have already a ticket number, then please put your branch on the
 public space and mark it as combinat
{{{
public/combinat/mystuff
}}}

 * The branch name should be descriptive. If you have a ticket number (say 10305) that should be the first part of the name.
 The rest should describe what is in the branch, so people can easily search it
{{{
public/combinat/10305-partition-tableaux
}}}

Consistently using these naming conventions among all (sage-combinat) developers will make it easier to search for stuff.
For example, trying to find all branches related to combinatorics can be found as follows
{{{
$ git ls-remote origin *combinat*
5feebdbfa73f64dafe28a5e4fe0144ab36083ab0	refs/heads/public/combinat/15361-branching-rules
7f974aeb3446206c029ac047c31938d55d86e651	refs/heads/u/aschilling/combinat/kschur
}}}

= Example workflow =

= Moving a ticket from patches to git =

= Moving a patch from the combinat queue to git =

All patches in the queue will soon be merged from the sage-combinat queue to git branches on trac.
Authors who want to do this themselves are encouraged to do so. The script will by default
put the branches to `public/combinat/`''branchname'' and might loose author information if the
patch does not have the appropriate meta information.

Here is a sample workflow on how to transform your patch to git:

 * First make sure that your patch has the correct meta data by exporting it.
 * Make a new branch on your local machine:
{{{
$ git checkout -b combinat/kschur master
$ git branch
* combinat/kschur
  master
  ticket/15300
}}}
 * Next import the patch from the queue
{{{
$ sage --dev import-patch --local-file /Applications/sage-5.13.beta2/devel/sage-combinat/.hg/patches/kschur-as.patch
}}}
 * Now we create a branch on trac
{{{
$ git push --set-upstream origin combinat/kschur:u/aschilling/combinat/kschur
Counting objects: 47, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (7/7), 1.27 KiB | 0 bytes/s, done.
Total 7 (delta 6), reused 0 (delta 0)
To git@trac.sagemath.org:sage.git
 * [new branch]      combinat/kschur -> u/aschilling/combinat/kschur
Branch combinat/kschur set up to track remote branch u/aschilling/combinat/kschur from origin.
}}}
 * Mark the patch in the sage-combinat series file as moved to git by changing
{{{
kschur-as.patch
}}}
   to 
{{{
kschur-as.patch # git:u/aschilling/combinat/kschur
}}}
