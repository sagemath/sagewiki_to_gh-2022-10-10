<<TableOfContents(1)>>

TODO:

 1. make sure dummy names are clear

= Abstract =

Here are some tentative workflow and naming conventions developed at [[days54|Sage Days 54]], together with some FAQs about using git.

= Rationale =

 * Currently, the dev scripts are in a state of flux, and it's easy for a user to get their sage tree into a state where they are not working properly, or not working at all. They will eventually stabilize, and at that point they will be reliable in addition to being useful. Until then, it's important to know how to work with git directly.
 * As noted by [[http://www.mail-archive.com/dri-devel@lists.sourceforge.net/msg39091.html|Linus on the meaning of "clean history"]], it's important to make a distinction between which parts of the development history are private to a single user, and which parts are considered public.
   * If a branch in the git tree is "private" to a single user, then they are free to experiment, merge many unrelated changes together, rebase things around, or simply abandon code. The compromise is that other users should '''not''' use such a "private" branch as the basis for developing their own code. If another user does this anyway, then the onus is on them to fix whatever merging problems (or rejections from the release manager) happen down the line. Of course, one way to fix this is to simply communicate (say by email) with the "owner" of the branch and work out an agreement.
   * Conversely, if a branch in the git tree is considered "public", then other people are justified in using it as the basis for developing their own code (provided that they accept the dependency this creates). At this point, the "public" branch should only ever be modified in a fast-forward way. Note that this still allows "undoing changes" in a way that preserves the public history, for example by using `git revert`.
   * If a user has a local branch on their own machine, of course that is "private".
   * Even though branches on Trac are world-visible, it would be useful to be able to use Trac as a kind of Dropbox for "private" sage branches. It seems that the natural place for this would be the "user" set of branches (which are named like `u/[username]/[whatever]`, e.g., `u/mguaypaq/farahat-higman`).
   * Once a branch is listed on a Trac ticket, it should definitely be considered "public".
   * It's ok for the "branch" field on a Trac ticket to change once or twice, but any workflow that requires changing this field very frequently is probably doing something wrong. The "branch" field should say what the "official" version of the work on the ticket is, and the easiest way to let people work on this is to have it be in the "public" set of branches (which are named like `public/[whatever]`, e.g., `public/ticket/10305-farahat-higman` or `public/combinat/15361-branching-rules`).

= First-time setup =

Talk about a sample `~/.gitconfig`.
Talk about a sample `$SAGE_ROOT/.git/config`.

{{{
git remote set-url origin git@trac.sagemath.org:sage.git
}}}

= Basic git commands =

== Latest version of Sage itself ==

Getting the latest version of Sage
{{{
$ git checkout master
$ git pull --ff-only
}}}

== Latest status of everything on Trac ==

Getting the latest information about all the branches published on Trac
{{{
$ git remote update origin
}}}

== Pushing and pulling branches to and from trac ==

If you have a local branch on your personal computer that you would like to push to trac, there are three options:
{{{
$ git push --set-upstream origin <mybranch>:u/<mytracname>/<mybranch>
$ git push --set-upstream origin <mybranch>:public/combinat/<mybranch>
$ git push --set-upstream origin <mybranch>:public/ticket/<ticketnumber>-<mybranch>
}}}
You would use the first one for code you personally work on. The second option is for collaborative code with other combinat people.
If you already have a ticket number, use
{{{
$ git push --set-upstream origin <mybranch>:public/combinat/<ticketnumber>-<mybranch>
}}}
The third option is for tickets unrelated to combinat.

The first time you pull a branch from trac onto your local computer (in the example you are pulling a branch called 10305-partition
and are calling it <mybranch>; usually it might be good to use the same name):
{{{
$ git remote update origin
$ git checkout -b <mybranch> origin/public/ticket/10305-partition
}}}
After the initial pull or push, this is the workflow to push your local changes to trac:
{{{
$ git checkout <mybranch>
$ git pull --ff-only
$ git push
}}}
The option --ff-only for the pull command makes sure that if there are big merge conflicts with the
new changes on trac, you can handle them manually without messing up your entire branch and your local changes.
If there are big changes, you can use these commands:
{{{
$ git checkout <mybranch>
$ git pull --ff-only
*git complains*
$ git fetch
$ git merge FETCH_HEAD
...
*resolve any merge conflicts*
*or give up and say: "git merge --abort"*
...
$ git status
...
*some output???*
...
$ git commit -a -m '<some message>'
$ git push
}}}

== Deleting branches ==

If you want to delete a local branch:
{{{
$ git checkout <somethingelse>
$ git branch -d <mybranch>
}}}
This might complain if you are trying to delete a branch that has not been merged yet. If nonetheless you would like
to delete it, try a hard delete:
{{{
$ git branch -D <mybranch>
}}}
Even in a hard delete this can be undone in the next 30 days (before the commits get garbage collected).

To delete a remote branch:
{{{
$ git push origin :u/aschilling/<something>
}}}
The syntax here may look confusing, so here is a little explanation: it is actually a special case of the syntax
{{{
$ git push origin <localbranch>:<remotebranch>
}}}
which updates `<remotebranch>` on the remote server to be the same as `<localbranch>`. To delete a branch, we make `<remotebranch>` be completely blank.

== Resetting unwanted changes ==

If you accidentally edited master and want to undo your change
{{{
$ git branch -m master <mybranch>
$ git branch master origin/master
}}}
If you do not care about the changes you can do a hard reset
{{{
$ git reset --hard origin/master
}}}

= Branch naming conventions =

=== Local machine ===

On your local machine you can call your branches however you like. However, it might be useful to use the
same names that you use on trac.
{{{
<mystuff>
}}}

=== Trac with single author ===

If you are working on a branch yourself, then it is best to put your patches on trac in your personal space
{{{
u/<myname>/<mystuff>
}}}

=== Trac with collaboration ===

If you collaborate on a branch with others or have already a ticket number, then please put your branch on the
public space and mark it as combinat
{{{
public/combinat/<mystuff>
}}}

=== Naming and searching ===

The branch name should be descriptive. If you have a ticket number (say 10305) that should be the first part of the name.
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
$ sage --dev import-patch --local-file </Applications/sage-5.13.beta2/devel/sage-combinat/.hg/patches/kschur-as.patch>
}}}
 * Now we create a branch on trac
{{{
$ git push --set-upstream origin <combinat/kschur>:<u/aschilling/combinat/kschur>
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

 * [[http://www.mail-archive.com/dri-devel@lists.sourceforge.net/msg39091.html|Linus on the meaning of "clean history"]]
 * [[http://sagemath.github.io/git-developer-guide|The new sage developer guide]]
