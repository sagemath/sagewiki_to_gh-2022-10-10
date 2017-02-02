= SAGE Bug Squash Day 9 =

The event will take place on '''Saturday, January 19th, 2008''' and officially start at 9 am pacific standard time.

Remember the "Twisted Rule" -- Don't work on '''anything''' unless there is a trac ticket for it.

 * The base version of SAGE we'll start with is '''2.10'''.  This is the current sage release, which you can upgrade to.  Also, many binaries are available. 
 * [[bug9/status|STATUS]]
 * [[bug9/irc|IRC log]]
 * Write to wstein@gmail.com or michael.abshoff@gmail.com for an account on the bug tracker.
 * We'll all be on #sage-devel at irc.freenode.net.
{{{
From Linux you can chat via a text console by installing "irssi", running it, and typing
  /SERVER add irc.freenode.net
  /SERVER irc.freenode.net
  /join #sage-devel
}}}

If you are using Konversation (the KDE IRC client), you can set up an auto-replace rule that lets you type #1322 (for trac #1322) and what everyone sees is http://trac.sagemath.org/sage_trac/ticket/1322 (which lets people click on the link and see the bug you are talking about).

To configure this, go to Settings -> Configure Konversation -> Behavior -> Auto Replace and create a rule with Find as "#([0-9]+)" and Replace with as "http://trac.sagemath.org/sage_trac/ticket/%1" (both without the quotes).  You can select whether this rule is applied to incoming posts, your outgoing posts, or both.

= Participants (with area they would like to work on) =
 1. Michael Abshoff (merging patch, OSX 64 bit build issues, spkg updates)
 1. William Stein (misc)
 1. Carl Witty (make reference manual prettier by adding LaTeX to docstrings)

Many other people will hopefully participate, but didn't yet add themselves here due to the rather tight schedule.

= Ticket status and reviews needed =

 * http://trac.sagemath.org/sage_trac/ticket/652: .sage files destroy existing .py files
 * http://trac.sagemath.org/sage_trac/ticket/980: random_element() for multivariate polynomials
 * http://trac.sagemath.org/sage_trac/ticket/1155: PermutationGroup coercion bug
 * http://trac.sagemath.org/sage_trac/ticket/1217: libfplll error codes - leftover from http://trac.sagemath.org/sage_trac/ticket/1188
 * http://trac.sagemath.org/sage_trac/ticket/1274: modify singular interface to allow for verbose output
 * http://trac.sagemath.org/sage_trac/ticket/1276: incorporate willem's doctest timing code into sage
 * http://trac.sagemath.org/sage_trac/ticket/1294: v.n() function blows up when v is a vector
 * http://trac.sagemath.org/sage_trac/ticket/1418: magma element __floordiv__
 * http://trac.sagemath.org/sage_trac/ticket/1508: axes_label in plot() broken
 * http://trac.sagemath.org/sage_trac/ticket/1575: plotting -- fix vector plotting
 * http://trac.sagemath.org/sage_trac/ticket/1577: .coefficients() and .monomials() differ in order in multivariate polynomial rings
 * http://trac.sagemath.org/sage_trac/ticket/1578: Make polynomial .diff() accept optional argument times for repeated differentiation.
 * http://trac.sagemath.org/sage_trac/ticket/1593: m4ri -- the documentation of the echelon command only lists 1 algorithm but >= 2 algorithms are supported
 * http://trac.sagemath.org/sage_trac/ticket/1604: more locale problems with python exposed by matplotlib
 * http://trac.sagemath.org/sage_trac/ticket/1606: plotting -- add aspect_ratio option to show command
 * http://trac.sagemath.org/sage_trac/ticket/1617: speed problem when factoring polynoms
 * http://trac.sagemath.org/sage_trac/ticket/1651: bug in decode
 * http://trac.sagemath.org/sage_trac/ticket/1652: length of DAGs with loops calculation runs infinite
 * http://trac.sagemath.org/sage_trac/ticket/1704: replace _DivPolyContext by _multiply_point
 * http://trac.sagemath.org/sage_trac/ticket/1713: fix SageElement._sage_
 * http://trac.sagemath.org/sage_trac/ticket/1714: allow keyword arguments for remote sage methods (sage0)
 * http://trac.sagemath.org/sage_trac/ticket/1718: bug in parametric_plot
 * http://trac.sagemath.org/sage_trac/ticket/1737: ctl-c doesn't exit job in parametric_plot3d
 * http://trac.sagemath.org/sage_trac/ticket/1761: Graphviz output for graphs
 * http://trac.sagemath.org/sage_trac/ticket/1766: enhancing latex embedding with plots
 * http://trac.sagemath.org/sage_trac/ticket/1793: Hilbert series, Hilbert polynomial, Laurent series expansion
 * http://trac.sagemath.org/sage_trac/ticket/1794: Gram-Schmidt typo
 * http://trac.sagemath.org/sage_trac/ticket/1795: Adds support for cdef'd and cpdef'd functions to sage-coverage
 * http://trac.sagemath.org/sage_trac/ticket/1804: Factorization.__mul__ assumes that the primes in the factorization commute, which may not be a valid assumption
 * http://trac.sagemath.org/sage_trac/ticket/1805: improve doctest coverage for structure/factorization.py
 * http://trac.sagemath.org/sage_trac/ticket/1810: refactoring to improve finite field reference manual
 * http://trac.sagemath.org/sage_trac/ticket/1812: doctest coverage for finite_field_givaro up to 100%
 * http://trac.sagemath.org/sage_trac/ticket/1814: doctstrings for stream_cipher.py
 * http://trac.sagemath.org/sage_trac/ticket/1816: rename MPolynomialRing.repr_long method to __str__
 * http://trac.sagemath.org/sage_trac/ticket/1817: crypto.mq.sr doctest coverage at 100%
 * http://trac.sagemath.org/sage_trac/ticket/1818: include AES polynomial system generator in reference manual
 * http://trac.sagemath.org/sage_trac/ticket/1820: update documentation for combinat/skew_partition.py
 * http://trac.sagemath.org/sage_trac/ticket/1823: RDF/CDF coverage, consistent hashing
 * http://trac.sagemath.org/sage_trac/ticket/1829: small improvements for term ordering module
 * http://trac.sagemath.org/sage_trac/ticket/1831: 3d docs: add more examples of parametric plots
 * http://trac.sagemath.org/sage_trac/ticket/1832: change how real(...) is defined in Sage
 * http://trac.sagemath.org/sage_trac/ticket/1833: plot3d and parametric_plot3d can be very slow on some inputs
 * http://trac.sagemath.org/sage_trac/ticket/1835: some minor changes to the documentation of basis_is_groebner
 * http://trac.sagemath.org/sage_trac/ticket/1836: return reduced Groebner bases by default
 * http://trac.sagemath.org/sage_trac/ticket/1837: pass through options from groebner_basis
 * http://trac.sagemath.org/sage_trac/ticket/1838: comma in latex lists need a trailing space
 * http://trac.sagemath.org/sage_trac/ticket/1840: Hill cipher addition to crypto package
 * http://trac.sagemath.org/sage_trac/ticket/1843: cputime for gp interface
 * http://trac.sagemath.org/sage_trac/ticket/1844: Get doctest coverage in sage/modular/modform up to 100%
 * http://trac.sagemath.org/sage_trac/ticket/1845: list_plot3d should be able to accept lists of points in arbitrary positions
 * http://trac.sagemath.org/sage_trac/ticket/1854: add more 3d plots to the reference manual
 * http://trac.sagemath.org/sage_trac/ticket/1856: 3d graphics -- bug in setting options via the show command

= Status =
Bug Day 9 Status

Bugs closed or updated and by whom:

http://trac.sagemath.org/sage_trac/ticket/712 -- William -- closed
http://trac.sagemath.org/sage_trac/ticket/1485 -- Michael -- closed by merging patch by David Joyner, Simon King
http://trac.sagemath.org/sage_trac/ticket/1508 -- William -- patch posted
http://trac.sagemath.org/sage_trac/ticket/1525 -- Robert M -- closed
http://trac.sagemath.org/sage_trac/ticket/1616 -- Michael -- Merged Mike Hansen's patches
http://trac.sagemath.org/sage_trac/ticket/1710 -- William -- closed
http://trac.sagemath.org/sage_trac/ticket/1789 -- William -- closed
http://trac.sagemath.org/sage_trac/ticket/1800 -- Carl -- closed
http://trac.sagemath.org/sage_trac/ticket/1801 -- Michael -- closed by merging spkg by Robert Bradshaw
http://trac.sagemath.org/sage_trac/ticket/1813 -- Michael -- closed by merging patch by Martin Albrecht
http://trac.sagemath.org/sage_trac/ticket/1821 -- Michael -- closed
http://trac.sagemath.org/sage_trac/ticket/1846 -- William -- invalid
http://trac.sagemath.org/sage_trac/ticket/1851 -- Robert M -- closed
http://trac.sagemath.org/sage_trac/ticket/1606 -- William Stein -- patch posted (needs review)
http://trac.sagemath.org/sage_trac/ticket/1855 -- William Stein -- 1-line patch posted (needs review)
http://trac.sagemath.org/sage_trac/ticket/1854 -- William Stein -- lots more 3d plotting examples
http://trac.sagemath.org/sage_trac/ticket/187 -- William Stein -- verified not a problem anymore and closed.
http://trac.sagemath.org/sage_trac/ticket/1622 -- Michael Abshoff -- closed by updated spkg
http://trac.sagemath.org/sage_trac/ticket/1627 -- Michael Abshoff -- closed by updated spkg
http://trac.sagemath.org/sage_trac/ticket/1630 -- Michael Abshoff -- closed by updated spkg
http://trac.sagemath.org/sage_trac/ticket/1853 -- Michael Abshoff -- closed by updated spkg
http://trac.sagemath.org/sage_trac/ticket/1856 -- William Stein -- bug setting options in 3d plots
http://trac.sagemath.org/sage_trac/ticket/827 -- Nick Alexander -- closed
http://trac.sagemath.org/sage_trac/ticket/1826 -- Robert Bradshaw, Robert Miller -- closed
http://trac.sagemath.org/sage_trac/ticket/1746 -- Alex Ghitza -- closed
http://trac.sagemath.org/sage_trac/ticket/1850 -- Robert Bradshaw -- closed
http://trac.sagemath.org/sage_trac/ticket/1772 -- Mike Hansen -- closed
http://trac.sagemath.org/sage_trac/ticket/1391 -- Martin Albrecht -- closed
http://trac.sagemath.org/sage_trac/ticket/1653 -- David Harvey - closed
http://trac.sagemath.org/sage_trac/ticket/1858 -- William Stein -- doctest improvements (patch posted)
http://trac.sagemath.org/sage_trac/ticket/1859 -- Robert Bradshaw
