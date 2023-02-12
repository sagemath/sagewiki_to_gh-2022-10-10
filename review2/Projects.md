

## Projects


### Line Comments

Set up a system that allows line by line comments (like Google's internal Mondrian system, or the open source versions Rietveld or Review Board) 

<a href="/review2/Projects/SystemRequirements">Requirements and desired features</a> of a new workflow. 

<a href="/review2/Projects/SystemProposals">Proposals</a> for new workflows. 


### Require reviewer

Implement a system requiring authors of tickets to suggest a reviewer (while providing defaults) 


### Stopgaps (formerly, "bandaids")

Come up with a way to ensure that critical tickets <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11358">like this</a> don't get lost beneath the radar. 

   * Here's what we're doing: <a href="http://trac.sagemath.org/sage_trac/ticket/12691">http://trac.sagemath.org/sage_trac/ticket/12691</a> 
   * For an example, see <a href="http://trac.sagemath.org/sage_trac/ticket/12509">http://trac.sagemath.org/sage_trac/ticket/12509</a> and its stopgap <a href="http://trac.sagemath.org/sage_trac/ticket/12692">http://trac.sagemath.org/sage_trac/ticket/12692</a> 

### Patchbot

Fix patchbot so that it doesn't timeout on unbroken code. 


### Doctesting

Finish the new doctesting code: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12415">#12415</a> 


### Better Reports

There is now a <a class="http" href="http://trac.sagemath.org/sage_trac/wiki/TicketReports">trac wiki page</a> that's linked to by the "View Tickets" button that organizes the reports in a more useful way. 


### Useful Trac Plugins/Macros

I'm going through the plugins on <a class="http" href="http://trac-hacks.org/">Trac-Hacks</a> to see if any would be useful to us. 

   * <a class="http" href="http://trac-hacks.org/wiki/DuplicateTicketSearchPlugin">Duplicate ticket detection</a> -- looks really useful 
   * <a class="http" href="http://trac-hacks.org/wiki/TracBuildbotIntegration">Trac-Buildbot integration</a> 
   * Nice code blocks: 
         * <a class="http" href="http://trac-hacks.org/wiki/CodeExampleMacro">Code Example Macro</a> 
         * <a class="http" href="http://trac-hacks.org/wiki/LinenoMacro">Lineno Macro</a> 
   * Rendering math: 
         * <a class="http" href="http://trac-hacks.org/wiki/TracMathJaxPlugin">Rendering math using mathjax</a> 
         * <a class="http" href="http://trac-hacks.org/wiki/TracMathPlugin">Rendering math using latex serverside</a> 
   * Custom SQL queries for non-admins -- looks cool, but I haven't looked into the security implications. 
         * <a class="http" href="http://trac-hacks.org/wiki/SqlQueryMacro">User generated SQL queries</a> 
         * <a class="http" href="http://trac-hacks.org/wiki/WikiTableMacro">Another option</a> 
   * Status displays: 
         * <a class="http" href="http://trac-hacks.org/wiki/TracTicketStatsPlugin">Graphical ticket statistics views</a> 
         * <a class="http" href="http://trac-hacks.org/wiki/TicketStatsMacro">A macro version</a> 
   * <a class="http" href="http://trac-hacks.org/wiki/TocMacro">Tables of contents for wiki pages</a> 
   * Subtickets: 
         * <a class="http" href="http://trac-hacks.org/wiki/ChildTicketsPlugin">Child Tickets</a> -- One option 
         * <a class="http" href="http://trac-hacks.org/wiki/MasterTicketsPlugin">Master Tickets</a> -- Another option 
         * <a class="http" href="http://trac-hacks.org/wiki/SubticketsPlugin">Subtickets</a> -- A third option 
         * <a class="http" href="http://trac-hacks.org/wiki/TracTicketDepgraphPlugin">Visualization</a> -- uses Master Tickets 
   * Code Review Plugins: 
         * <a class="http" href="http://trac-hacks.org/wiki/CodeReviewPlugin">Code Review Plugin</a> 
         * <a class="http" href="http://trac-hacks.org/wiki/PeerReviewPlugin">Peer Review Plugin</a> 
         * <a class="https" href="https://github.com/Automattic/trac-code-comments-plugin">Trac Code Comments</a> 
               * started in November 2011 
               * development is quite active, but mainly by one developer. However, this project seems to be used by his company for their own workflow. 
               * Comments are possible on changesets and attachments. 
               * Inline comments are not yet supported, but they're the top feature on the wishlist. 
   * <a class="http" href="http://trac-hacks.org/wiki/InputfieldTrapPlugin">Anti-botnet feature</a> -- might prevent botnets from filling in the preferences form. 
   * <a class="http" href="http://trac-hacks.org/wiki/GitPlugin">Enable Git in the Source browser</a> 
   * Edit navigation bars 
         * <a class="http" href="http://trac-hacks.org/wiki/NavAddPlugin">Add links</a> 
         * <a class="http" href="http://trac-hacks.org/wiki/NavControlPlugin">Add a new bar</a> 
   * <a class="http" href="http://trac-hacks.org/wiki/TicketModifiedFilesPlugin">List files modified by a ticket</a> 
   * <a class="http" href="http://trac-hacks.org/wiki/EmailtoTracScript">Allow modification of tickets, etc via e-mail</a> 