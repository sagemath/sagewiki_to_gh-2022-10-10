

## Accomplishments

   * Programmatically add, edit tickets on trac 
         * New trac installation 
         * XML-RPC interface, doctests (authenticated and anonymous) 
   * Gitolite server 
         * web portals both through trac and gitweb 
         * programatic authenticated and anonymous access 
         * auto ssh-keys upload 
   * Build system 
         * Works on linux, OS X 10.6 
                  * givaro/gcc issues on 10.7+ 
         * Lots of work on portage system 
                  * also running into OS X errors 
   * Sage combinat queue and mercurial queues import 
         * Prototypical tool to automatically import a Mercurial queue into GIT. 
         * Each patch/ticket is imported in its own branch, with 
               * dependencies handling (from appropriate annotations in the series file) 
         * Most of the Sage-Combinat queue can imported into git 
   * Sage Dev Scripts 
         * Public interface design 
         * Fleshed out docstrings, some testing 
         * Preliminary implementation, integration with external trac/git services. 
         * <a href="https://github.com/sagemath/sage-workflow">https://github.com/sagemath/sage-workflow</a> 
   * Patchbot 
         * Pull patches from git branches on trac. 
         * Update build, plugins, etc. to accommodate new directory structure (work in progress) 
   * Other 
         * New doctesting framework 
         * Tweak export scripts 
         * Created proof-of-concept flow to export Trac tickets and patches to github, mostly to prove that it is possible. 
         * Bugfixes and ticket reviews in anticipation of git switch  
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13031">#13031</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14384">#14384</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6415">#6415</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/3355">#3355</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14379">#14379</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14377">#14377</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14226">#14226</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14376">#14376</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14369">#14369</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14331">#14331</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14385">#14385</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14316">#14316</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14383">#14383</a> 
               * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14328">#14328</a> 
               * ... 
         * Organisation of <a class="http" href="http://wiki.sagemath.org/combinat/FPSAC13">Sage Days 49</a> 
         * Work on the <a class="http" href="http://sagebook.gforge.inria.fr/">French Sage book</a> 

## Migration Plan

      * Sage-5.9 will be last export to git 
            * Simultaneous git/classic sdist, bdist 
      * Sage-5.10[.betaX] merged/cherry picked/rebased atop stable Sage git repo 
            * Tickets worked on in git will be (auto) exported to patches on trac 
            * Last classic release 
      * Sage-6.0 
            * Tickets worked on in hg will be imported into git 
            * Release done from git master 

## Still to be done


### Necessary now

      * Make the git version build on all of Sage's supported platforms 
      * Finish writing, debugging and documenting the basic features in the development scripts.  Command-line version. 
      * Write functions in development scripts for exporting a patch to the old model. 
      * Add features to our trac plugin (dependency-aware diff) and add our trac plugin to the standard trac server 
      * Write documentation of the workflow for a Sage developer: one for people who know Sage's current workflow. 
      * Write something to sage-devel about the plan 
      * Git version of patchbot 
      * Motivate the choice of GIT as DVCS. 

### Necessary before 6.0

      * Write hooks for gitolite and development scripts (whitespace, abandonment, pushing changes to trac, prohibit committing to master) 
      * Switch to trac-info in repo model 
      * Write doctests so that the development scripts can be included into the Sage library. 
      * Add features to our trac plugin (updates to certain ticket fields are pushed to the branch) 
      * Write documentation of the workflow for a Sage developer: one for newbies, one for people who are familiar with git. 
      * Release process scripts 

### Desirable

      * Write additional features for development scripts 