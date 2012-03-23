== Projects ==

=== Line Comments ===

Set up a system that allows line by line comments (like Google's internal Mondrian system, or the open source versions Rietveld or Review Board)

[[/SystemRequirements | Requirements and desired features]] of a new workflow.

[[/SystemProposals | Proposals]] for new workflows.

=== Require reviewer ===

Implement a system requiring authors of tickets to suggest a reviewer (while providing defaults)

=== Stopgaps (formerly, "bandaids") ===

Come up with a way to ensure that critical tickets [[http://trac.sagemath.org/sage_trac/ticket/11358|like this]] don't get lost beneath the radar.
  * Here's what we're doing: http://trac.sagemath.org/sage_trac/ticket/12691
  * For an example, see http://trac.sagemath.org/sage_trac/ticket/12509 and its stopgap http://trac.sagemath.org/sage_trac/ticket/12692

=== Patchbot ===

Fix patchbot so that it doesn't timeout on unbroken code.

=== Doctesting ===

Finish the new doctesting code: [[http://trac.sagemath.org/sage_trac/ticket/12415|#12415]]

=== Better Reports ===

There is now a [[http://trac.sagemath.org/sage_trac/wiki/TicketReports | trac wiki page]] that's linked to by the "View Tickets" button that organizes the reports in a more useful way.

=== Useful Trac Plugins/Macros ===

I'm going through the plugins on [[http://trac-hacks.org/ | Trac-Hacks]] to see if any would be useful to us.

  * [[http://trac-hacks.org/wiki/DuplicateTicketSearchPlugin | Duplicate ticket detection]] -- looks really useful
  * [[http://trac-hacks.org/wiki/TracBuildbotIntegration | Trac-Buildbot integration]]
  * Nice code blocks:
    * [[http://trac-hacks.org/wiki/CodeExampleMacro | Code Example Macro]]
    * [[http://trac-hacks.org/wiki/LinenoMacro | Lineno Macro]]
  * Rendering math:
    * [[http://trac-hacks.org/wiki/TracMathJaxPlugin | Rendering math using mathjax]]
    * [[http://trac-hacks.org/wiki/TracMathPlugin | Rendering math using latex serverside]]
  * Custom SQL queries for non-admins -- looks cool, but I haven't looked into the security implications.
    * [[http://trac-hacks.org/wiki/SqlQueryMacro | User generated SQL queries]]
    * [[http://trac-hacks.org/wiki/WikiTableMacro | Another option]]
  * Status displays:
    * [[http://trac-hacks.org/wiki/TracTicketStatsPlugin | Graphical ticket statistics views]]
    * [[http://trac-hacks.org/wiki/TicketStatsMacro | A macro version]]
  * [[http://trac-hacks.org/wiki/TocMacro | Tables of contents for wiki pages]]
  * Subtickets:
    * [[http://trac-hacks.org/wiki/ChildTicketsPlugin | Child Tickets]] -- One option
    * [[http://trac-hacks.org/wiki/MasterTicketsPlugin | Master Tickets]] -- Another option
    * [[http://trac-hacks.org/wiki/SubticketsPlugin | Subtickets]] -- A third option
    * [[http://trac-hacks.org/wiki/TracTicketDepgraphPlugin | Visualization]] -- uses Master Tickets
  * Code Review Plugins:
    * [[http://trac-hacks.org/wiki/CodeReviewPlugin | Code Review Plugin]]
    * [[http://trac-hacks.org/wiki/PeerReviewPlugin | Peer Review Plugin]]
    * [[http://trac-hacks.org/wiki/GitPlugin | Trac Code Comments]]
      * started in November 2011
      * development is quite active, but mainly by one developer. However, this project seems to be used by his company for their own workflow.
      * Comments are possible on changesets and attachments.
      * Inline comments are not yet supported, but they're the top feature on the wishlist.
  * [[http://trac-hacks.org/wiki/InputfieldTrapPlugin | Anti-botnet feature]] -- might prevent botnets from filling in the preferences form.
  * Edit navigation bars
    * [[http://trac-hacks.org/wiki/NavAddPlugin | Add links]]
    * [[http://trac-hacks.org/wiki/NavControlPlugin | Add a new bar]]
  * [[http://trac-hacks.org/wiki/TicketModifiedFilesPlugin | List files modified by a ticket]]
