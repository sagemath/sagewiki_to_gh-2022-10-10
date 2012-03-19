== Projects ==

=== Line Comments ===

Set up a system that allows line by line comments (like Google's internal Mondrian system, or the open source versions Rietveld or Review Board)

Sample ticket illustrating some nitty gritty details involved in using git:

  * http://trac.sagemath.org/sage_trac/ticket/12685

[[/SystemRequirements | Requirements and desired features]] of a new workflow.

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
