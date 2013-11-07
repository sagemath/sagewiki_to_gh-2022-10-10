Here are some tentative workflow and naming conventions developed at 

<<TableOfContents(1)>>

TODO:

 1. make sure dummy names are clear
 1. put links to the __new__ dev guide, etc.

= Abstract =

= Rationale =

= First-time setup =

Talk about a sample `~/.gitconfig`.
Talk about a sample `$SAGE_ROOT/.git/config`.

{{{
git remote set-url origin git@trac.sagemath.org:sage.git
}}}

= Basic git commands =

If you have a local branch on your personal computer that you would like to push to trac:
{{{
$ git push --set-upstream origin <mybranch>:public/combinat/<mybranch>
}}}
The first time you pull a branch on trac onto your local computer (in the example you are pulling a branch called 10305-partition
and are calling it <mybranch>; usually it might be good to use the same name):
{{{
$ git remote update origin
$ git checkout -b <mybranch> origin/public/ticket/10305-partition
}}}
After the initial pull or push, this is the workflow to push your local changes to trac:
{{{
$ git checkout <mybranch>
$ git pull
$git push
}}}
If you want to delete a branch:
{{{
$ git checkout <somethingelse>
$ git branch -d mybranch
}}}
This might complain if you are trying to delete a branch that has not been merged yet. If nonetheless you would like
to delete it, try a hard delete:
{{{
$ git branch -D mybranch
}}}
Even in a hard delete this can be undone in the next 30 days (before the commits get garbage collected).

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
$ git ls-remote origin '*combinat*'
5feebdbfa73f64dafe28a5e4fe0144ab36083ab0	refs/heads/public/combinat/15361-branching-rules
7f974aeb3446206c029ac047c31938d55d86e651	refs/heads/u/aschilling/combinat/kschur
}}}
If you want to see what a specific author did on trac within the last day, you do
{{{
$ git remote update origin
$ git log --all --author="Bump" --since=1.day
commit 5feebdbfa73f64dafe28a5e4fe0144ab36083ab0
Author: Daniel Bump <bump@match.stanford.edu>
Date:   Wed Nov 6 09:51:08 2013 -0800

    get_branching_rule for F4=>B3 and G2=>A1 should return vectors of the correct length
}}}
Checking how the ticket branches of author mguaypaq differ from main sage (or origin/master) try
{{{
$ git log --remotes='origin/u/mguaypaq/ticket/*' ^origin/master --oneline
1c7458a #15300: Implement Weyl and Clifford algebras.
fb33147 Merge branch 'master' into ticket/10305
405178b Remove extra chunk from farahat_higman.py and fix related formatting issues.
25ff1fd Split off SymmetricGroupAlgebraCenter to its own file.
9b72574 Add rings for the center of the symmetric group algebras.
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

= References =
