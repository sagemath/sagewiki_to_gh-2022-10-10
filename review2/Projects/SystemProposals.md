

# Revamping Version Control and Code Review

This page reflects our discussions on changing Sage's revision control and code review processes.  If we're successful in coming up with a promising system, we will migrate the best features from this page to a SEP. 


## Options


### Trac and Github

Our initial idea was to try to use Github for source control and inline comments, and to use trac for most other things. 

Sample ticket illustrating some nitty gritty details involved in using github: 

   * <a href="http://trac.sagemath.org/sage_trac/ticket/12685">http://trac.sagemath.org/sage_trac/ticket/12685</a> 

### Trac and Plugins

It turns out that there are two plugins for trac: 

   * <a class="http" href="http://trac-hacks.org/wiki/GitPlugin">GitPlugin</a> 
         * started in 2006 and seems to provide a fairly rich set of features 
         * development has slowed recently, but there's a <a class="http" href="http://trac.edgewall.org/ticket/10594">2 week old ticket</a> on Trac's trac to incorporate it standard into Trac 0.13. 
   * <a class="https" href="https://github.com/Automattic/trac-code-comments-plugin">TracCodeCommentsPlugin</a> 
         * started in November 2011 
         * development is quite active, but mainly by one developer.  However, this project seems to be used by his company for their own workflow. 
         * Comments are possible on changesets and attachments. 
         * Inline comments are not yet supported, but they're the top feature on the wishlist. 
that can hopefully provide most of the functionality for which we were going to rely on Github. 


## Proposed Workflow

With Trac and the two plugins we have the following outline for how code review would go. 

   * Developers contribute code in the following ways 
         * Have a publicly accessible git repo 
               * Location is stored in user's preferences (could be a Github account for example on which they'd forked Sage) 
               * When an author wants to upload changes to a ticket they push to a branch of their public repo and 
               * Tell trac to fetch all branches listed in the ticket (possibly adding the location of their public branch to the ticket first) 
               * Mark the ticket as "needs review" 
               * Reviewer can pull from the trac repo, add their own comments... 
         * Post a patch on the ticket 
               * If an author just posts a patch, then we require the reviewer to use Git to make the release manager's life better 
               * They create a branch in their public repo using the patch, and publish it as above 
               * Then they review it by making inline comments on their branch or making new commits on top 
         * A reviewer can also review a git-posted branch by just commenting on it and marking as needs work/positive review 
   * Trac has the official repo, which includes: 
         * A "develop" line consisting of merged in positively reviewed tickets 
         * Various "ticket branches" for tickets coming from users repos (possibly multiple branches for a single ticket) 
         * Release branches coming off develop; after being split off from develop by the release manager they can incorporate positively reviewed bugfixes (that are also merged into the develop line) 
         * A "master" line for official releases.  Once a release is ready, the release manager merges its release line into master. 
         * This is somewhat similar to the established "git-flow" workflow described in <a class="http" href="http://nvie.com/posts/a-successful-git-branching-model/">this blog post</a>. 
   * The release manager's role is as follows: 
         * Go through positively reviewed tickets and make sure they're happy having each one merged. 
         * If it's a bug fix and there's a release depending on it, merge it into that release line and then merged the release line back into develop (and potentially into later releases).  If it's a feature, just merge into develop.  If edit conflicts arise (which should be less frequent since authors can rebase frequently off the develop line), mark it as needs work. 
         * When desired, start a new release branch off of develop.  This is basically a feature freeze for a release. 
         * We still need to think about what to do if a ticket should be backed out after it's merged into develop (because it makes Sage fail to build on Solaris for example).  Possibilities include reverting and reopening the ticket, opening a new ticket... 

## Steps to make it happen

   1. Write a script that converts the current sage repositories (ext, bin, root, lib, spkg metadata...) into one repository.  This script can be run at will once we're done with it to convert Sage to a single repository. (This is because it could be sage-5.1, 5.2, etc., before we actually are ready.) 
   1. Write a SEP for our workflow. 
   1. Upgrade trac with the two plugins listed above and start hosting a git repo. 
   1. Implement our workflow in trac.ini and maybe in a custom trac plugin 
   1. Write newbie scripts so that Sage developers don't need to use git. 