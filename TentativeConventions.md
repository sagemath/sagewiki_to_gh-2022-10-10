<<TableOfContents(3)>>

== Abstract ==

Here are some tentative workflow and naming conventions developed at [[days54|Sage Days 54]], together with some FAQs about using git.

== Rationale ==

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
 * If your branch is related to combinat, feel free to call it `u/<username>/combinat/<topic>`. If you have an associated Trac ticket number, you can append it to the name: `u/<username>/combinat/<topic>-<number>`, but please keep the `<topic>` part of the name next to the `/combinat/` part of the name.
 * If you are working on a combinat branch with some collaborators, a good central place to push and pull from (in addition to your personal `u/<username>/combinat/<topic>`) would be the public branch name `public/combinat/<topic>`.
 * If your branch corresponds to a non-combinat ticket, a good default name may be `public/ticket/<ticket>-<whatever>`, like `public/ticket/10305-farahat-higman`.

These conventions make it easy to:
 * Browse through the list of all branches on Trac (or all combinat branches) and get an idea of what is there.
 * [[http://wiki.sagemath.org/TentativeConventions#searching|Search]] through the list of all branches on Trac (or all combinat branches) using grep or other automated tools.
 * Find the corresponding Trac tickets easily.
 * Use tab-completion for branch names. For combinat features, both `public/combinat/<topic>` and `public/combinat/<topic>-<number>` start the same way, and then the number is a convenient pointer to the Trac ticket, if any. For non-combinat features with a Trac ticket, the user is more likely to know the `<number>` part of `public/ticket/<number>-<topic>` than the particular choice of `<topic>`.

In summary:
{{{
u/<username>/wip/<mystuff>          # for a single-author, unstable personal branch
u/<username>/combinat/<topic>       # for personal progress on a combinat branch
public/combinat/<topic>             # for public progress on a combinat branch
public/combinat/<topic>-<number>    # for a combinat-related branch with an associated Trac ticket
public/ticket/<number>-<topic>      # for a generic public branch with an associated Trac Ticket
}}}

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

== First-time setup ==

There is some scattered documentation on how to install and configure the git version of Sage. For convenience, we compile all of the correct (as of November 7, 2013) steps here.

Sources:
 * [[http://trac.sagemath.org/wiki/QuickStartSageGit]]
 * [[http://sagemath.github.io/git-developer-guide/]]
 * [[http://sagemath.org/doc/installation/source.html]]
 * [[http://git-scm.com/book]]

=== Step 1: make sure git is installed on your computer ===

This step is different for different people, but is described in [[http://sagemath.github.io/git-developer-guide/git_setup.html|the git setup section of the new developer guide]]. Note that to use git with sage, you must always be somewhere in the sage tree (in `$SAGE_ROOT`, which may be something like `/opt/sage-git` on your computer) when running any `git ...` commands.

 Note:: If you want to set up tab completion for git (which is very useful), check out the nice instructions at [[http://git-scm.com/book/ch2-7.html|the tips and tricks section of the Pro Git book]].

=== Step 2: tell Trac about your ssh key ===

Follow the excellent directions at [[http://sagemath.github.io/git-developer-guide/trac.html#authentication|the authentication section of the new developer guide]] (everything starting at the heading "Authentication" and ending before the heading "Reporting bug"). This is necessary if you want to actually push your code changes to the Trac server using git.

 Note:: When you copy your public key information to Trac (in your user preferences page), make sure you don't copy and paste extra line breaks in your key! Trac allows you to have more than one public key, as long as you put each key on a separate line. Conversely, this means that you cannot spread a single key across multiple lines. To check that you don't have extra line breaks, you can try resizing the textbox on your user preferences page.

=== Step 3: clone the git repository from Trac ===

Get a copy of the whole sage tree from the Trac server using git. In the following example, we are working in my home directory (denoted by `~`), and we choose to put the sage tree in the `~/sage-git` sub-directory.
{{{
~$ git clone git@trac.sagemath.org:sage.git sage-git
Cloning into 'sage-git'...
remote: Counting objects: 205444, done.
remote: Compressing objects: 100% (36317/36317), done.
remote: Total 205444 (delta 137341), reused 205055 (delta 137070)
Receiving objects: 100% (205444/205444), 57.55 MiB | 11.18 MiB/s, done.
Resolving deltas: 100% (137341/137341), done.
~$ cd sage-git
~/sage-git$ ls
build  COPYING.txt  Makefile  README.txt  sage  src  VERSION.txt
}}}

 Important note:: If you have any aliases or symbolic links set up for running the `sage` command on your machine, now would be a very good time to update them. Otherwise, be careful to always run `./sage` instead of just plain `sage`!

<<Anchor(gitconfig)>>
=== Step 4: make sure your git configuration is correct ===

Git stores some information about default command options and remote repositories in a few places on your computer. For sage, there are two relevant places:
 * Your global configuration options, in `$HOME/.gitconfig`, which apply to all your git projects (not just sage). Mine looks like this. The `[user]` section is the most important, and contains my real name and my real email address. The `[push]` section also contains an important setting, which makes `git push` behave in the most expected way by default (update the current branch when pushing to the Trac git server). The other sections are really optional, but you can simply copy and paste them:
   * The `[core]` section has an option that sets my favorite text editor.
   * The `[alias]` section defines some shortcut commands (like `git lg` for a very pretty history graph).
   * The `[merge]` section has an option that makes for more informative merge commit messages.
{{{
~/sage-git$ cat $HOME/.gitconfig
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
~/sage-git$ cat .git/config
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
~/sage-git$ ./sage -i ccache
}}}
The result should look something like:
{{{
~/sage-git/src/bin/sage-spkg: line 310: cd: ~/sage-git/upstream: No such file or directory
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
~/sage-git/local/var/tmp/sage/build/ccache-3.1.9
touch: cannot touch `~/sage-git/local/lib/sage-force-relocate.txt': No such file or directory
Finished installing ccache-3.1.9.spkg
}}}

=== Step 6: build sage and/or the sage documentation ===

Now we must compile sage for the first time. This will likely take a long time, but subsequent times (such as when reviewing tickets or developing the sage library or upgrading to the latest version of sage) should be much faster.

 Note:: Whenever you run the `git` or `make` commands, make sure you are in the sage directory.

Still, there are two things you can do to significantly speed up building sage:
 * If you already have Atlas libraries built somewhere, you can tell sage to re-use them instead of re-building them. This is controlled by the `SAGE_ATLAS_LIB` environment variable.
 * If you have a computer with many cores and you want to use them to build sage in parallel, you can tell it to do so.
Both of these options (and many more) are documented in [[http://sagemath.org/doc/installation/source.html#environment-variables|the "environment variables" section of the sage installation guide]], but below are some of the salient points.

You can also tell sage to skip building the documentation by giving an option to the `make` command, as follows:
{{{
~/sage-git$ make start    # build sage without documentation and make sure it runs
~/sage-git$ make build    # build sage without documentation
~/sage-git$ make doc      # build the sage documentation
~/sage-git$ make          # build sage and the documentation
}}}

I have a pre-compiled version of Atlas in my `/opt/atlas-sage` directory, containing the following files:
{{{
~/sage-git$ ls /opt/atlas-sage
libatlas.a   libcblas.so   libf77blas.so  libptcblas.a
libatlas.so  libclapack.a  liblapack.a    libptf77blas.a
libcblas.a   libf77blas.a  liblapack.so   libtstatlas.a
}}}

Note that by default, sage will only download the packages it needs when it tries to install each one. If you want to download everything at once (maybe because you intend to compile sage without an internet connection), you can simply say:
{{{
~/sage-git$ make download    # download all the latest standard spkg files
}}}

Combining all of this, probably the fastest way to build sage is something like:
{{{
~/sage-git$ export SAGE_ATLAS_LIB=/opt/atlas-sage    # this is where my pre-compiled Atlas libraries live
~/sage-git$ export MAKE='make -j6'                   # use many cores (6 in this case)
~/sage-git$ make start                               # build only sage
}}}

== Quick reference guide: I want to... ==

Here are some common things you might want to do, together with the relevant git commands.

 Note:: If you want to know the details of a given git command, use:
{{{
$ git help <command>
}}}
where `<command>` is something like `push`, `pull`, `commit`, etc.

<<Anchor(upgrade)>>
=== Get the latest official development version of Sage ===

First, check if you have any unsaved changes by running the command:
{{{
~/sage-git$ git status
}}}
If you do have unsaved changes, they will be lost! [[#save|Save them first]], then run the following commands:
{{{
~/sage-git$ git fetch origin           # get the latest repository information from Trac
~/sage-git$ git reset --hard master    # make all your files correspond to the local master branch
~/sage-git$ git clean -d -f            # get rid of any untracked files or directories
~/sage-git$ git pull --ff-only         # move the local master branch forward to match the information from Trac
~/sage-git$ make start                 # rebuild the parts of Sage that changed
}}}

The option `--ff-only` for the `git pull` command makes sure that if there are big merge conflicts with the new changes on trac, you can handle them manually without messing up your entire branch and your local changes. The `make start` command is analogous to the usual `sage -b` command, but is more comprehensive.

=== Start working on a new feature ===

To start work on a new feature, you should first [[#upgrade|get latest official development version of Sage]], and use that as the base of your work. Then create a new local branch (named `<localname>` here, but please pick a better name) to hold your code changes:
{{{
~/sage-git$ git checkout master -b <localname>    # create a new branch <localname> based at the current master branch
}}}
Then, you can go ahead and start making your code changes. Be sure to [[#save|save your work]] when you are done!

<<Anchor(save)>>
=== Save my work ===

See [[http://git-scm.com/book/en/Git-Basics-Recording-Changes-to-the-Repository|this tutorial on making commits]] or [[http://git-scm.com/book/en/Git-Tools-Stashing|this tutorial on stashing changes]] for lots of details on how to save your code changes, but here are the basic commands you need. If your code is in a coherent state, use some combination of the commands:
{{{
~/sage-git$ git status                                      # see what files you have changed
~/sage-git$ git add <filename>                              # if you have created a new file
~/sage-git$ git commit -a -m 'this is my commit message'    # save changes to any modified files
}}}
If your code is in a very dirty state, you can instead use a combination of the commands:
{{{
~/sage-git$ git stash save 'this is a note to self'    # create a temporary stash of code changes
~/sage-git$ git stash list                             # show a list of existing stashes
~/sage-git$ git stash pop                              # apply the most recent stash to the sage tree
~/sage-git$ git stash drop                             # discard the most recent stash
}}}

=== Continue working on a feature ===

=== I made a mistake! I want to undo something I just did ===

=== Make my code available on the Trac git server ===

If you have a local branch `<localname>` on your own computer that you would like to push to Trac under the name `<remotename>`, use the command:
{{{
~/sage-git$ git push --set-upstream origin <localname>:<remotename>
}}}
For some advice on what `<remotename>` should be, see the [[#nameontrac|section on branch naming conventions]].

Note that with the `--set-upstream` option, the previous command sets up a mapping on your computer between the names `<localname>` and `origin/<remotename>`. This only needs to be done once, and then the following shortcuts should work:
{{{
~/sage-git$ git checkout <localname>    # make sure you are on the <localname> branch
~/sage-git$ git pull --ff-only          # get any changes from the Trac git server
~/sage-git$ git push                    # push your changes from the Trac git server
}}}
(But see the [[#gitconfig|section on git configuration]] if `git push` doesn't work.)

=== Get someone else's code from the Trac git server ===

If there is a branch `<remotename>` on Trac and you would like to have a corresponding branch called `<localname>` on your own computer, use the commands:
{{{
~/sage-git$ git fetch origin                                   # get the latest repository information from Trac
~/sage-git$ git checkout origin/<remotename> -b <localname>    # create the <localname> branch
}}}
For some clues on what `<remotename>` may mean, see the [[#nameontrac|section on branch naming conventions]].

The previous command sets up a mapping on your computer between the names `<localname>` and `origin/<remotename>`. This only needs to be done once, and then the following shortcuts should work:
{{{
~/sage-git$ git checkout <localname>    # make sure you are on the <localname> branch
~/sage-git$ git pull --ff-only          # get any changes from the Trac git server
~/sage-git$ git push                    # push your changes from the Trac git server
}}}
(But see the [[#gitconfig|section on git configuration]] if `git push` doesn't work.)

=== Move/delete/rename a local branch ===

=== Move/delete/rename a branch on the Trac git server ===

=== Change the mapping between my local branches and branches on the Trac git server ===

If you have a local branch named `<localname>` on your own computer which is currently set up to map to the branch `<oldremotename>` on the Trac git server, and you would rather that it map to the branch `<newremotename>`, use the following command:
{{{
~/sage-git$ git branch <localname> --set-upstream-to origin/<newremotename>
}}}

 Note:: You may have an older version of git, in which case you will get an error message like
{{{
error: unknown option `set-upstream-to'
usage: git branch [options] [-r | -a] [--merged | --no-merged]
   or: git branch [options] [-l] [-f] <branchname> [<start-point>]

*** more output ***
}}}
In that case, use the following command instead:
{{{
~/sage-git$ git branch <localname> --set-upstream origin/<newremotename>
}}}

 Note:: You can also see (and edit) the information about the mapping between local branch names and remote branch names in the file `$SAGE_ROOT/.git/config`.

=== Collaborate with others on a combinat feature ===

=== See what other people are doing ===

=== Review a ticket ===

=== Test out many features together (tornado branch) ===

=== Convert a mercurial patch to a git branch ===

=== Move a patch from the combinat queue to git ===

== Basic git commands ==

=== Getting the latest version of Sage ===

First get the latest information about all the branches published on trac
{{{
$ git remote update origin
}}}

Then get the latest version of Sage itself
{{{
$ git checkout master
$ git pull --ff-only
$ make start
}}}
The option --ff-only for the pull command makes sure that if there are big merge conflicts with the
new changes on trac, you can handle them manually without messing up your entire branch and your local changes.

=== Pushing and pulling branches to and from trac ===

If you have a local branch on your personal computer that you would like to push to trac, there are four options:
{{{
$ git push --set-upstream origin <mybranch>:u/<mytracname>/<mybranch>
$ git push --set-upstream origin <mybranch>:public/combinat/<mybranch>
$ git push --set-upstream origin <mybranch>:public/combinat/<ticketnumber>-<mybranch>
$ git push --set-upstream origin <mybranch>:public/ticket/<ticketnumber>-<mybranch>
}}}
Use the first option for code you personally work on. The second option is for collaborative code with other combinat people.
Use the third option if you already have a ticket number for combinat-related code. The fourth option is for tickets unrelated to combinat.

The first time you pull a branch from trac onto your local computer:
{{{
$ git remote update origin
$ git checkout -b 10305-partition origin/public/ticket/10305-partition
}}}
The -b option builds the remote branch locally.

After the initial pull or push, this is the workflow to push your local changes to trac:
{{{
$ git checkout <mybranch>
$ git pull --ff-only
$ git status
$ git add '<your file>'
$ git commit -m '<your commit message>'
$ git push
}}}
The 'git status' command will tell you which files have changed. Then use the 'git add' command to add the files whose changes you want to push to trac.  

If the pull command produces an error, you can use these commands:
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

== Branch naming conventions ==

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

To see all unmerged branches
{{{
$ git branch --no-merged=master 
  public/combinat/15361-branching-rules
* public/combinat/rigged_configurations/13872-bijections
  ticket/15300
  u/aschilling/combinat/kschur
}}}
To see all merged branches
{{{
$ git branch --merged=master 
  master
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

== Example workflow ==

=== Basic collaboration example ===

Suppose developers A and B collaborate on branch `branch_AB`. Developer A wants to work on the project and does
{{{
$ git checkout branch_AB
$ git pull
}}}
then edits files in the sage file system. Once finished A makes a commit
{{{
$ git commit -a -m"changed everything"
}}}
and pushes to Trac
{{{
$ git push
}}}

B has been working at the same time and wants to base her work on A's, but is not sure whether there will
be conflicts. She only wants to commit changes in file.py for now. So she does
{{{
$ git add file.py
$ git commit -m"changed everything as well"
}}}
Then she pulls using
{{{
$ git pull --ff-only
}}}
If there was no problem she can push her changes
{{{
$ git push
}}}

== Moving a ticket from patches to git ==

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

== Moving a patch from the combinat queue to git ==

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
