<<TableOfContents(1)>>

= Abstract =

Here are some tentative workflow and naming conventions developed at [[days54|Sage Days 54]], together with some FAQs about using git.

= Rationale =

== Why does this page give instructions using git directly instead of the dev scripts? ==

Currently, the dev scripts are in a state of flux, and it's easy for a user to get their sage tree into a state where the dev scripts are not working properly, or not working at all. The situation will eventually stabilize, and at that point the scripts will be reliable in addition to being useful. Until then, it's important to know how to work with git directly.

== What is a git branch? ==

In the git model (see [[http://eagain.net/articles/git-for-computer-scientists/|Git for computer scientists]] for a nice description), there is a history graph (that is, a directed acyclic graph), which contains every change to the sage code together with descriptions of these changes. A node in this graph is called a "commit", and in general the history graph only ever grows (gets more nodes/commits). A "branch" is just a movable label to a particular point in the history graph. We think of a branch as pointing to a particular commit, together with all of its ancestors in the history graph.

== What should I name my branch on Trac? ==

First, it should be noted that the name of a branch on your computer does not have to match the name of the (corresponding) branch on Trac. Git has the ability to keep track of a mapping between local branch names and remote branch names for convenience. However, some people prefer to keep the same name for local and remote branches, to avoid confusion. Now, the question is: what should you name your remote branches on Trac?

This is mainly important because different people have different permission for reading and writing branches on Trac:
 * Everyone can see/read everyone else's branches on Trac.
 * Everyone can create/move/write any branch named `public/<whatever>`, where `<whatever>` is (almost) any string. We may refer to these branches as being in the Trac "public" space.
 * The user `mguaypaq` can create/move/write any branch named `u/mguaypaq/<whatever>`. No one else can do this. We may refer to these branches as being in a Trac "user" space.
 * However, any user can take any branch named `u/mguaypaq/<whatever>` and create a copy of it in the "public" space or in their own "user" space.

Given this, the discussions at Sage Days 54 settled on some suggestions:
 * In your user space, feel free to call your branches `u/<username>/<whatever>`, where `<username>` is your user name, and `<whatever>` is practically any string, including characters like `/-_`.
 * If your branch is related to combinat, feel free to call it `public/combinat/<ticket>-<whatever>` or `public/combinat/<whatever>`, where `<ticket>` is the associated Trac ticket, if applicable, and `<whatever>` may be a description and may contain keywords like `partitions` or `tableaux`.
 * If your branch corresponds to a non-combinat ticket, a good default name would be `public/ticket/<ticket>-<whatever>`, like `public/ticket/10305-farahat-higman`.

These conventions make it easy to:
 * Browse through the list of all branches on Trac (or all combinat branches) and get an idea of what is there.
 * Search through the list of all branches on Trac (or all combinat branches) using grep or other automated tools.
 * Find the corresponding Trac tickets easily.

== If a branch is on Trac, who does it belong to? ==

Suppose Alice creates a branch `aardvarks` starting from `origin/master`. Then Bob sees this and creates a further branch `bowling` starting from the branch `aardvarks`. Later, Alice decides (whether rightly or wrongly) to rebase the branch `aardvarks` on a more recent version of `origin/master`, without consulting Bob. This creates a conflict between the new history of `aardvarks` and the current history of `bowling`. Who is now responsible for fixing the conflict? (See RebaseVsMerge for more details about this situation.)

Based on discussions at Sage Days 54, the following statements should not be controversial:

 * If `aardvarks` is a local branch on Alice's computer, then it belongs only to Alice, and she is free to rebase it. Bob could never even see it to use as a base for his work.
 * If `aardvarks` lives on Trac in Alice's user space (branches starting with `u/alice/`) and it is marked as a "work-in-progress" (abbreviated "wip", for example, `u/alice/wip/aardvarks` or `u/alice/aardvarks-wip`), then it belongs only to Alice, and she is free to rebase it. In this case, Bob could technically see the branch and use it as a base for his work, but then Bob has full responsibility for the consequences. Two reasons for this:
   * The user space branches on Trac may be a convenient way for Alice to synchronize her personal messy development work between her own laptop and her own desktop computer.
   * The user space branches on Trac may be a convenient way for Alice to share her personal messy development work with her colleague Carl.
 * If `aardvarks` is listed as the official branch on a Trac ticket (in the "branch" field), then it belongs to the community, and Alice should not rebase it. This is true even if the branch is in Alice's user space (for example, `u/alice/aardvarks`). Two reasons for this:
   * At this point, Bob may well find the branch by browsing Trac and see that it fixes a bug that is crucial to his feature. If he could not reuse Alice's code as a base, he would have to duplicate Alice's work and likely create merge conflicts for Alice.
   * Bob may also decide to review the patch, and give it a positive review after adding a reviewer patch.
 * If `aardvarks` lives on Trac in the public space (branches starting with `public/`, like `public/combinat/aardvarks`), then it belongs to the community, and Alice should not rebase it. This is true even if there is no associated Trac ticket.

This leaves the following question unanswered, because there is currently no consensus. It may be best to avoid such ambiguities for now when naming branches on Trac:

 * If `aardvarks` lives on Trac in Alice's user space, is not marked "wip", and has never been in the "branch" field of a Trac ticket (so: `u/alice/aardvarks`), does it belong to Alice only, or to the community?

There is also the following corollary:

 * If `aardvarks` is marked as work-in-progress (say `u/alice/wip/aardvarks`), then it should not also be in the "branch" field of a Trac ticket. Before setting it in the "branch" field of a ticket, the branch should be renamed.

= First-time setup =

How to get sage-git.

Setup RSA keys (no linebreaks?)

Talk about a sample `~/.gitconfig`.
Talk about a sample `$SAGE_ROOT/.git/config`.

{{{
git remote set-url origin git@trac.sagemath.org:sage.git
git config --global push.default upstream
}}}

Talk about make? Certainly mention that git should be run inside $SAGE_ROOT.

= Basic git commands =

=== Latest version of Sage itself ===

Getting the latest version of Sage
{{{
$ git checkout master
$ git pull --ff-only
}}}

=== Latest status of everything on trac ===

Getting the latest information about all the branches published on trac
{{{
$ git remote update origin
}}}

=== Pushing and pulling branches to and from trac ===

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

The first time you pull a branch from trac onto your local computer:
{{{
$ git remote update origin
$ git checkout -b 10305-partition origin/public/ticket/10305-partition
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

=== Deleting branches ===

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
which updates `<remotebranch>` on the remote server to be the same as `<localbranch>`. To delete a branch, we make `<localbranch>` be completely blank and push it onto `<remotebranch>`.

=== Resetting unwanted changes ===

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

=== Tornado branches ===

Sometimes you might want to share certain features that are not yet in main-sage with a collaborator
who is not a developer. Suppose these features are in two different branches on trac.
Then you can create a tornado branch by merging the two. Note, that you want to make sure that
other developers will not base other code on those, so please label them as tornado branches!

Go to one of the two branches you would like to merge
{{{
$ git checkout kschur
$ git branch
  combinat/kschur
  master
* public/combinat/15361-branching-rules
  ticket/15300
}}}
From there create your new tornado branch
{{{
$ git checkout -b tornado-kschur-branching
$ git branch
  combinat/kschur
  master
  public/combinat/15361-branching-rules
  ticket/15300
* tornado-kschur-branching
}}}
Now merge in the other branch
{{{
$ git merge combinat/kschur
$ git log
commit 510520a52e44bace997784370cacbfdd75ae4473
Merge: 5feebdb 7f974ae
Author: Anne Schilling <anne@lolita-4.local>
Date:   Wed Nov 6 21:59:20 2013 -0800

    Merge branch 'combinat/kschur' into tornado-kschur-branching
}}}
Finally push to trac
{{{
$ git push --set-upstream origin tornado-kschur-branching:u/aschilling/tornado-kschur-branching
Counting objects: 44, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 523 bytes | 0 bytes/s, done.
Total 5 (delta 4), reused 0 (delta 0)
To git@trac.sagemath.org:sage.git
 * [new branch]      tornado-kschur-branching -> u/aschilling/tornado-kschur-branching
Branch tornado-kschur-branching set up to track remote branch u/aschilling/tornado-kschur-branching from origin.
}}}

= Example workflow =

= Moving a ticket from patches to git =

=== Import patch from a local file ===

if your patch is on your local computer at `/pathname/patchname.patch`
{{{
$ sage --dev import-patch --local-file /pathname/patchname.patch
}}}

if your patch is on trac or on the internet at a url
{{{
$ sage --dev import-patch --url http://trac.sagemath.org/raw-attachment/ticket/12345/trac_12345-patchname.patch
}}}


= Moving a patch from the combinat queue to git =

All patches in the queue will soon be merged from the sage-combinat queue to git branches on trac.
Authors who want to do this themselves are encouraged to do so. The script will by default
put the branches to `public/combinat/`''branchname'' and might loose author information if the
patch does not have the appropriate meta information.

Here is a sample workflow on how to transform your patch to git:

=== Export hg patch ===

First make sure that your patch has the correct meta data by exporting it.

=== Create new local branch ===

Make a new branch on your local machine:
{{{
$ git checkout -b combinat/kschur master
$ git branch
* combinat/kschur
  master
  ticket/15300
}}}

=== Import patch from queue ===

Next import the patch from the queue
{{{
$ sage --dev import-patch --local-file /Applications/sage-5.13.beta2/devel/sage-combinat/.hg/patches/kschur-as.patch
}}}

=== Create branch on trac ===

Now we create a branch on trac
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

=== Mark patch in series file ===

Mark the patch in the sage-combinat series file as moved to git by changing
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
