== Accomplishments ==

  * Programmatically add, edit tickets on trac
    * New trac installation
    * XML-RPC interface, doctests (authenticated and anonymous)

  * Gitolite server
    * programatic authenticated and anonymous access
    * auto ssh-keys upload

  * Build system
    * Works on linux, OS X 10.6
       * givaro/gcc issues on 10.7+
    * Lots of work on portage system
       * also running into OS X errors

  * Sage combinat queue
    * Entire queue imported into git
    * separate branches with dependencies

  * Sage Dev Scripts
    * Public interface design
    * Fleshed out docstrings, some testing
    * Preliminary implementation, integration with external trac/git services.

  * Patchbot
    * Pull patches from git branches on trac.
    * Update build, plugins, etc. to accommodate new directory structure (work in progress)

  * Other
    * New doctesting framework
    * Tweak export scripts
    * Bugfixes and ticket reviews in anticipation of git switch

== Migration Plan ==

   * Sage-5.9 will be last export to git
     * Simultaneous git/classic sdist, bdist
   * Sage-5.10[.betaX] merged/cherry picked/rebased atop stable Sage git repo
     * Tickets worked on in git will be (auto) exported to patches on trac
     * Last classic release
   * Sage-6.0
     * Tickets worked on in hg will be imported into git
     * Release done from git master
