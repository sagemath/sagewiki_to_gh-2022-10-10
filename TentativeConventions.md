<<TableOfContents(3)>>

= Abstract =

Here are some tentative workflow and naming conventions developed at [[days54|Sage Days 54]], together with some FAQs about using git.

= Rationale =

=== Why does this page give instructions using git directly instead of the dev scripts? ===

Currently, the dev scripts are in a state of flux, and it's easy for a user to get their sage tree into a state where the dev scripts are not working properly, or not working at all. The situation will eventually stabilize, and at that point the scripts will be reliable in addition to being useful. Until then, it's important to know how to work with git directly.

=== What is a git branch? ===

In the git model (see [[http://eagain.net/articles/git-for-computer-scientists/|Git for computer scientists]] for a nice description), there is a history graph (that is, a directed acyclic graph), which contains every change to the sage code together with descriptions of these changes. A node in this graph is called a "commit", and in general the history graph only ever grows (gets more nodes/commits). A "branch" is just a movable label to a particular point in the history graph. We think of a branch as pointing to a particular commit, together with all of its ancestors in the history graph.

=== What is Trac? ===

Trac is the server that acts as the git repository (it is also refers to the ticket manager).  In this document the identifier `origin` always refers to Trac.

Since this is confusing, let's say it again: Trac refers to the url `trac.sagemath.org`, which runs two services, namely a git repository (this is our main concern in this document), and a ticket tracker (which is only a secondary concern in this document).

<<Anchor(nameontrac)>>
=== What should I name my branch on Trac? ===

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
 * [[http://wiki.sagemath.org/TentativeConventions#searching|Search]] through the list of all branches on Trac (or all combinat branches) using grep or other automated tools.
 * Find the corresponding Trac tickets easily.

In summary:
{{{
u/<username>/wip/<mystuff>              # for a single-author, unstable personal branch
public/combinat/<ticket>-<description>  # for a combinat-related branch with an associated Trac ticket
public/combinat/<description>           # for a combinat-related branch with no associated Trac ticket
public/ticket/<ticket>-<description>    # for a generic public branch with an associated Trac Ticket
}}}


=== How should the "branch" field on a Trac ticket evolve? ===

This is the only part of the branch naming conventions that has to do with the ticket tracker service of Trac. On every Trac ticket, there is a "branch" field which is blank by default, but which can contain the name of the current "official" branch (on the git repository service of Trac) which records the current state of the code.

The branch itself can move around on the history graph just fine, and the "branch" field on the Trac ticket does not need to change. (In fact, the corresponding "commit" field on the Trac ticket will automatically be updated.) However, the ''name'' of the branch which appears on the Trac ticket should not change very often at all.

Given this, we propose the following conventions:
 * Having a blank "branch" field on a Trac ticket is perfectly fine.
 * If the "branch" field is blank, then anyone can set it to a branch either in their "user" space (like `u/mguaypaq/weyl-clifford`) or in the "public" space (like `public/combinat/partitions` or `public/ticket/10305-farahat-higman`). Using the "public" space should be encouraged, but usin the "user" space may be convenient in certain cases.
 * If the "branch" field is '''not''' blank but '''is''' in a "user" space, then anyone can move/rename the branch to the "public" space.
 * Once the "branch" field is in the "public" space, it should not be changed anymore.

=== If a branch is on Trac, who does it belong to? ===

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

There is some scattered documentation on how to install and configure the git version of Sage. For convenience, we compile all of the correct (as of November 7, 2013) steps here.

Sources:
 * [[http://trac.sagemath.org/wiki/QuickStartSageGit]]
 * [[http://sagemath.github.io/git-developer-guide/]]
 * [[http://sagemath.org/doc/installation/source.html]]

=== Step 1: make sure git is installed on your computer ===

This step is different for different people, but is described in [[http://sagemath.github.io/git-developer-guide/git_setup.html|the git setup section of the new developer guide]]. Note that to use git with sage, you must always be somewhere in the sage tree (in `$SAGE_ROOT`, which may be something like `/opt/sage-git` on your computer) when running any `git ...` commands.

=== Step 2: tell Trac about your ssh key ===

Follow the excellent directions at [[http://sagemath.github.io/git-developer-guide/trac.html#authentication|the authentication section of the new developer guide]] (everything starting at the heading "Authentication" and ending before the heading "Reporting bug"). This is necessary if you want to actually push your code changes to the Trac server using git.

 Note:: When you copy your public key information to Trac (in your user preferences page), make sure you don't copy and paste extra line breaks in your key! Trac allows you to have more than one public key, as long as you put each key on a separate line. Conversely, this means that you cannot spread a single key across multiple lines. To check that you don't have extra line breaks, you can try resizing the textbox on your user preferences page.

=== Step 3: clone the git repository from Trac ===

Get a copy of the whole sage tree from the Trac server using git. In the following example, we are working in the `/tmp` directory, and we choose to put the sage tree in the `/tmp/sage-git` directory.
{{{
mguaypaq@chmmr:/tmp$ git clone git@trac.sagemath.org:sage.git sage-git
Cloning into 'sage-git'...
remote: Counting objects: 205444, done.
remote: Compressing objects: 100% (36317/36317), done.
remote: Total 205444 (delta 137341), reused 205055 (delta 137070)
Receiving objects: 100% (205444/205444), 57.55 MiB | 11.18 MiB/s, done.
Resolving deltas: 100% (137341/137341), done.
mguaypaq@chmmr:/tmp$ cd sage-git
mguaypaq@chmmr:/tmp/sage-git$ ls
build  COPYING.txt  Makefile  README.txt  sage  src  VERSION.txt
}}}

=== Step 4: make sure your git configuration is correct ===

Git stores some information about default command options and remote repositories in a few places on your computer. For sage, there are two relevant places:
 * Your global configuration options, in `$HOME/.gitconfig`, which apply to all your git projects (not just sage). Mine looks like this. The `[user]` section is the most important, and contains my real name and my real email address. The other sections are really optional, but you can simply copy and paste them:
   * The `[core]` section has an option that sets my favourite text editor.
   * The `[alias]` section defines some shortcut commands (like `git lg` for a very pretty history graph).
   * The `[merge]` section has an option that makes for more informative merge commit messages.
   * The `[push]` section contains an option that makes git only update the current branch when pushing to the Trac git server.
{{{
mguaypaq@chmmr:/tmp/sage-git$ cat $HOME/.gitconfig
[user]
  name = Mathieu Guay-Paquet
  email = mathieu.guaypaquet@gmail.com
[core]
  editor = gedit -w -s
[alias]
  ci = commit -a
  co = checkout
  st = status
  br = branch
  wdiff = diff --color-words
  lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)[%an]%Creset' --abbrev-commit --date=relative
[merge]
  log = true
[push]
  default = upstream
}}}
 * Your sage-specific configurations options, in `$SAGE_ROOT/.git/config`. Mine looks like this. The parts that should be copied very exactly are:
   * the `url` option of the `[remote "origin"]` section, which tells git how it should synchronize the information on your local machine with the information on the Trac git server,
   * the `[branch "master"]` section, which tells git how your local `master` branch corresponds to the `master` branch on the Trac git server.
{{{
mguaypaq@chmmr:/tmp/sage-git$ cat .git/config
[core]
  repositoryformatversion = 0
  filemode = true
  bare = false
  logallrefupdates = true
[remote "origin"]
  fetch = +refs/heads/*:refs/remotes/origin/*
  url = git@trac.sagemath.org:sage.git
[branch "master"]
  remote = origin
  merge = refs/heads/master
}}}

=== Step 5: install ccache to speed up future compilations ===

The optional sage package `ccache` makes recompilations of C files much faster, so it is recommended to install it. Thankfully, this is very easy: simply go to the directory containing sage on your computer and say
{{{
mguaypaq@chmmr:/tmp/sage-git$ ./sage -i ccache
}}}
The result should look something like:
{{{
/tmp/sage-git/src/bin/sage-spkg: line 310: cd: /tmp/sage-git/upstream: No such file or directory
Attempting to download package ccache
>>> Checking online list of optional packages.
2013-11-07 17:11:12 URL:http://www.sagemath.org/spkg/optional/list [1139/1139] -> "-" [1]
>>> Found ccache-3.1.9
>>> Trying to download http://www.sagemath.org/spkg/optional/ccache-3.1.9.spkg

*** lots of output ***

real 0m8.544s
user 0m5.328s
sys 0m1.392s
Successfully installed ccache-3.1.9
Deleting temporary build directory
/tmp/sage-git/local/var/tmp/sage/build/ccache-3.1.9
touch: cannot touch `/tmp/sage-git/local/lib/sage-force-relocate.txt': No such file or directory
Finished installing ccache-3.1.9.spkg
}}}

=== Step 6: build sage and/or the sage documentation ===

Now we must compile sage for the first time. This will likely take a long time, but subsequent times (such as when reviewing tickets or developing the sage library or upgrading to the latest version of sage) should be much faster.

 Note:: whenever you run the `git` or `make` commands, make sure you are in the sage directory.

Still, there are two things you can do to significantly speed up building sage:
 * If you already have Atlas libraries built somewhere, you can tell sage to re-use them instead of re-building them. This is controlled by the `SAGE_ATLAS_LIB` environment variable.
 * If you have a computer with many cores and you want to use them to build sage in parallel, you can tell it to do so.
Both of these options (and many more) are documented in [[http://sagemath.org/doc/installation/source.html#environment-variables|the "environment variables" section of the sage installation guide]], but below are some of the salient points.

You can also tell sage to skip building the documentation by giving an option to the `make` command, as follows:
{{{
mguaypaq@chmmr:/tmp/sage-git$ make start    # build sage without documentation and make sure it runs
mguaypaq@chmmr:/tmp/sage-git$ make build    # build sage without documentation
mguaypaq@chmmr:/tmp/sage-git$ make doc      # build the sage documentation
mguaypaq@chmmr:/tmp/sage-git$ make          # build sage and the documentation
}}}

I have a pre-compiled version of Atlas in my `/opt/atlas-sage` directory, containing the following files:
{{{
mguaypaq@chmmr:/tmp/sage-git$ ls /opt/atlas-sage
libatlas.a   libcblas.so   libf77blas.so  libptcblas.a
libatlas.so  libclapack.a  liblapack.a    libptf77blas.a
libcblas.a   libf77blas.a  liblapack.so   libtstatlas.a
}}}

Combining all of this, probably the fastest way to build sage is something like:
{{{
mguaypaq@chmmr:/tmp/sage-git$ export SAGE_ATLAS_LIB=/opt/atlas-sage    # this is where my pre-compiled Atlas libraries live
mguaypaq@chmmr:/tmp/sage-git$ export MAKE='make -j6'                   # use many cores (6 in this case)
mguaypaq@chmmr:/tmp/sage-git$ make start                               # build only sage
}}}

= Basic git commands =

=== Latest version of Sage itself ===

Getting the latest version of Sage
{{{
$ git checkout master
$ git pull --ff-only
$ make start
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
The third option is for tickets unrelated to combinat.
You would use the first one for code you personally work on. The second option is for collaborative code with other combinat people.
If you already have a ticket number, use
{{{
$ git push --set-upstream origin <mybranch>:public/combinat/<ticketnumber>-<mybranch>
}}}

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

The `git fetch` command downloads a list of latest commits for the branch you are on, it does not change the state of your local branch.  The command `git merge FETCH_HEAD` updates your branch to the latest version of the branch on Trac.

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

=== Checking your last few commits ===

If you want to see what your last few commits were, type:
{{{
$ git reflog
5c7e56d HEAD@{0}: commit: fixed some documentation in kr_tableaux.py
d4cc8e0 HEAD@{1}: pull: Merge made by the 'recursive' strategy.
3813946 HEAD@{2}: commit: removed some whitespace in kr_tableaux.py
307fef1 HEAD@{3}: commit: Removed some whitespaces, beautified code
6aae6bf HEAD@{4}: merge origin/public/combinat/rigged_configurations/13872-bijections: Fast-forward
f2491f1 HEAD@{5}: checkout: moving from master to public/combinat/rigged_configurations/13872-bijections
f2491f1 HEAD@{6}: checkout: moving from tornado-kschur-branching to master
510520a HEAD@{7}: checkout: moving from extended_affine_weyl_groups_sd40 to tornado-kschur-branching
f2491f1 HEAD@{8}: checkout: moving from master to extended_affine_weyl_groups_sd40
f2491f1 HEAD@{9}: checkout: moving from tornado-kschur-branching to master
}}}

= Branch naming conventions =

=== On Trac ===

See the section about [[#nameontrac|naming conventions on trac]].

=== Local machine ===

On your local machine you can call your branches however you like. However, it might be useful to use the
same names that you use on trac.

<<Anchor(searching)>>
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

Make sure that your file has the header data by an `hg export`. Then decide where you want to put your patch.
If it is an independent patch, you want to create a new branch
{{{
$ git checkout -b <mybranch> master
}}}
If you want to import the hg patch on top of another branch, go into this branch first
{{{
$ git checkout <mybranch>
}}}
Next import your hg patch.

=== Import patch from a local file ===

If your patch is on your local computer at `/pathname/patchname.patch` then
{{{
$ sage --dev import-patch --local-file /pathname/patchname.patch
}}}

=== Import patch from url ===

If your patch is on trac or on the internet at a url
{{{
$ sage --dev import-patch --url http://trac.sagemath.org/raw-attachment/ticket/12345/trac_12345-patchname.patch
}}}

If you find that the author field is set to ``unknown user`` then it could be that the patch needs to be exported first.

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
