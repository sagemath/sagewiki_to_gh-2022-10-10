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

Also, before running Sage with your modifications, be sure to rebuild the parts that changed with the command:
{{{
~/sage-git$ make start
}}}

<<Anchor(save)>>
=== Save my work ===

See [[http://git-scm.com/book/en/Git-Basics-Recording-Changes-to-the-Repository|this tutorial on making commits]] or [[http://git-scm.com/book/en/Git-Tools-Stashing|this tutorial on stashing changes]] for lots of details on how to save your code changes, but here are the basic commands you need. If your code is in a coherent state, use some combination of the commands:
{{{
~/sage-git$ git branch                                      # see if you are on the right branch
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
See also [[#push|the section on making your code changes available on the Trac git server]].

<<Anchor(checkout)>>
=== Continue working on a feature ===

First, check if you have any unsaved changes by running the command:
{{{
~/sage-git$ git status
}}}
If you don't have any unsaved changes and you would like to work on the branch `<localname>`, which already exists on your own computer, then do:
{{{
~/sage-git$ git checkout <localname>    # move to the correct branch
~/sage-git$ git pull --ff-only          # get any recent changes from the Trac git server
}}}
Only do the second command if you have set up a corresponding branch on the Trac git server.
If the pull command produces an error, you can use these commands to resolve the conflict between your version of the code, and the version available on Trac:
{{{
~/sage-git$ git checkout <mybranch>    # you already ran
~/sage-git$ git pull --ff-only         # these two commands

*** git complains ***

~/sage-git$ git fetch               # save the changes from Trac to FETCH_HEAD
~/sage-git$ git merge FETCH_HEAD    # combine the changes from Trac with your code

*** resolve any merge conflicts ***
*** or give up and say: "git merge --abort" ***

~/sage-git$ git status

*** some output ***

~/sage-git$ git commit -a -m '<some message>'    # save the result of merging
~/sage-git$ git push                             # tell Trac about the result
}}}

In any case, before running Sage with your modifications, rebuild the parts that changed with the command:
{{{
~/sage-git$ make start
}}}

=== I made a mistake! I want to undo something I just did ===

If you accidentally edited master and want to undo your change, you can:
{{{
~/sage-git$ git branch -m master <mybranch>    # save your current state to a new branch <mybranch>
~/sage-git$ git branch master origin/master    # make a new master branch from the original one
}}}

If you deleted a local branch and you want to get it back, your deletion command should have told you the commit hash (something like `fb33147`) of the deleted branch. To get it back, say:
{{{
~/sage-git$ git branch <oldname> <hash>
}}}

If you want to see what your last few commits were, type:
{{{
~/sage-git$ git reflog
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

<<Anchor(push)>>
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

<<Anchor(pull)>>
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

In any case, before running Sage, rebuild the parts that changed with the command:
{{{
~/sage-git$ make start
}}}

=== Move/delete/rename a local branch ===

If you want to delete a local branch `<localname>`:
{{{
~/sage-git$ git checkout master          # move to a different branch
~/sage-git$ git branch -d <localname>    # delete the branch
}}}
This might complain if you are trying to delete a branch that has not been merged yet. If nonetheless you would like
to delete it, try a hard delete:
{{{
~/sage-git$ git branch -D <localname>
}}}
Even in a hard delete this can be undone in the next 30 days (before the commits get garbage collected).

If you want to rename a local branch `<oldname>` to `<newname>`:
{{{
~/sage-git$ git branch -m <oldname> <newname>
}}}

=== Move/delete/rename a branch on the Trac git server ===

To delete a remote branch `<something>`:
{{{
~/sage-git$ git push origin :<something>
}}}
The syntax here may look confusing, so here is a little explanation: it is actually a special case of the syntax
{{{
~/sage-git$ git push origin <localbranch>:<remotebranch>
}}}
which updates `<remotebranch>` on the remote server to be the same as `<localbranch>`. To delete a branch, we make `<localbranch>` be completely blank and push it onto `<remotebranch>`.

To rename a remote branch, you have to delete the old name, and create the new name. Use these commands:
{{{
~/sage-git$ git fetch origin                             # get the latest info from Trac
~/sage-git$ git checkout origin/<oldname>                # move to the branch to be renamed
~/sage-git$ git push origin HEAD:<newname> :<oldname>    # create <newname> and delete <oldname> on Trac
}}}
Note that this will change which branch you are currently on.

<<Anchor(setupstream)>>
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

Simply use the workflow described in the rest of this document, and [[#nameontrac|pay attention to your naming conventions]]. For a quick example, see the [[#collaboration|basic collaboration example]] below.

<<Anchor(searching)>>
=== See what other people are doing ===

If people use [[#nameontrac|consistent naming conventions]] for their branch names on the Trac git server, then it will be easy to search through them. For example, the following commands search through the branch names on Trac for certain patterns:
{{{
~/sage-git$ git fetch origin                           # get the latest info from Trac
~/sage-git$ git branch -r | grep '/combinat/'          # search for combinat branches
~/sage-git$ git branch -r | grep '/combinat/kschur'    # search for branches on kschur functions
~/sage-git$ git branch -r | grep '/aschilling/'        # search for Anne Schilling's branches
}}}

If you want to see what a specific author did on trac within the last day, you can say:
{{{
~/sage-git$ git fetch origin
~/sage-git$ git log --all --author="Bump" --since=1.day
commit 5feebdbfa73f64dafe28a5e4fe0144ab36083ab0
Author: Daniel Bump <bump@match.stanford.edu>
Date:   Wed Nov 6 09:51:08 2013 -0800

    get_branching_rule for F4=>B3 and G2=>A1 should return vectors of the correct length
}}}

To see how the ticket branches of author mguaypaq differ from main sage (or `origin/master`) try:
{{{
~/sage-git$ git log --remotes='origin/u/mguaypaq/*' ^origin/master --oneline
1c7458a #15300: Implement Weyl and Clifford algebras.
fb33147 Merge branch 'master' into ticket/10305
405178b Remove extra chunk from farahat_higman.py and fix related formatting issues.
25ff1fd Split off SymmetricGroupAlgebraCenter to its own file.
9b72574 Add rings for the center of the symmetric group algebras.
}}}

To see all unmerged branches, say:
{{{
~/sage-git$ git branch --no-merged=master
  public/combinat/15361-branching-rules
* public/combinat/rigged_configurations/13872-bijections
  ticket/15300
  u/aschilling/combinat/kschur
}}}

To see all merged branches, say:
{{{
~/sage-git$ git branch --merged=master
  master
}}}

=== Review a ticket ===

First, consult the "branch" field on the Trac ticket tracker to see the name of the git branch which contains the code changes to be reviewed. Then, [[#pull|get the code from Trac]], and review it as usual. You should be able to easily [[#checkout|switch between the `master` branch and the ticket branch]]. If you have any changes to suggest in a review patch, you can make the changes and [[#push|push them to the Trac git server]]. You may have to check on the Trac ticket that the "branch" field is still up to date, but the "commit" field will be updated automatically. Make any comments or status changes as needed on the Trac ticket, and you're done!

=== Test out many features together (tornado branch) ===

If you want to test out many features together (perhaps to see what merge conflicts will have to be dealt with, or to share the resulting version of Sage with a colleague), you can create a "tornado" branch which includes all of them. Note that you want to make sure that other developers will not base other code intended for the Sage library on those, so please label them clearly as tornado branches!

First make sure you have [[#save|no unsaved modifications]], then create a new branch (called `<tornado>` here) based at one of the branches or `master`:
{{{
~/sage-git$ git checkout master -b <tornado>
}}}

Next, for each branch `<branch1>`, `<branch2>`, etc. that you want to combine, merge them into your tornado branch:
{{{
~/sage-git$ git merge <branch1>

*** solve any merge conflicts ***

~/sage-git$ git merge <branch2>

*** solve any merge conflicts ***

*** etc. ***
}}}

Finally, you can [[#push|push your tornado branch to Trac]], but make sure it is clearly labelled!

<<Anchor(patch)>>
=== Convert a mercurial patch to a git branch ===

Make sure that your file has the header data by doing an `hg export`. Then decide where you want to put your patch: if it is an independent patch, you want to create a new branch:
{{{
~/sage-git$ git checkout master -b <mybranch>
}}}
If you want to import the hg patch on top of another branch, go into this branch first:
{{{
~/sage-git$ git checkout <mybranch>
}}}

If your patch is on your local computer at `/pathname/patchname.patch` then use the Sage development script:
{{{
~/sage-git$ ./sage --dev import-patch --local-file /pathname/patchname.patch
}}}

If your patch is on the Trac ticket tracker or on the internet at a url, then use a command like:
{{{
~/sage-git$ ./sage --dev import-patch --url http://trac.sagemath.org/raw-attachment/ticket/12345/trac_12345-patchname.patch
}}}
If you find that the author field is set to ``unknown user`` then it could be that the patch needs to be exported and modified first.

To see the commit which corresponds to the patch you just imported, do:
{{{
~/sage-git$ git log -1         # view the commit message and information of the most recent commit
~/sage-git$ git diff HEAD^1    # view the actual code modifications
}}}

If you are satisfied with the imported patch, you can [[#push|push your changes to the Trac git server]].

=== Move a patch from the combinat queue to git ===

All patches in the queue will soon be merged from the sage-combinat queue to git branches on trac. Authors who want to do this themselves are encouraged to do so. The script will by default put the branches to `public/combinat/`''branchname'' and might lose author information if the patch does not have the appropriate meta information. To avoid this, use the following workflow.

First make sure that your patch has the correct meta data by exporting it. This step uses the familiar Mercurial workflow, so we will not describe it here.

Then, follow [[#patch|the instructions above for importing a mercurial patch into a git branch]].

When the imported patch looks good, push is to the Trac git server, and make sure you label it as a `/combinat/` branch. For example:
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

Finally, '''mark your patch in the series file''' as moved to git by changing, for example,
{{{
kschur-as.patch
}}}
to 
{{{
kschur-as.patch # git:u/aschilling/combinat/kschur
}}}

<<Anchor(collaboration)>>
== Basic collaboration example ==

Suppose developers Alice and Bob collaborate on branch `branch_AB`. We assume here that both Alice and Bob have [[#setupstream|set up a correspondence between their local branches and the branch on Trac]]. Alice wants to work on the project and does:
{{{
~/sage-git$ git checkout branch_AB    # go to the common branch
~/sage-git$ git pull --ff-only        # get any changes from Trac

*** make changes to Sage ***

~/sage-git$ git commit -a -m "changed everything"    # save any local changes
~/sage-git$ git push                                 # tell Trac about the changes
}}}

Bob has been working at the same time and wants to base his work on Alice's, but he is not sure whether there will be conflicts. He only wants to commit changes in `file.py` for now. So he does
{{{
~/sage-git$ git add file.py
~/sage-git$ git commit -m "changed everything as well"
}}}
When he goes to push his changes to Trac, he will get a notification:
{{{
~/sage-git$ git push

*** git complains ***

~/sage-git$ git pull --ff-only    # this will complain again, but save the changes from Trac to FETCH_HEAD anyway

*** git complains again ***

~/sage-git$ git merge FETCH_HEAD

*** resolve any merge conflicts

~/sage-git$ git push
}}}
