= Alex Ghitza's Status Report for Sage Days 12 =

== I fixed the following bugs: ==

=== Modular Symbols (with [[days12/statusreports/craigcitro|Craig Citro]]) ===

 * #1127 - modularSymbol complement fails for E=128a

 * #2535 - Problem with cuspidal_subspace and new_subspace for modular symbols

NOTE: We used a naive approach to solving both of these issues, but there is more to be done about complement() and dual_free_module() for submodules of modular symbols, see for instance the new #5080 that was uncovered by Robert Bradshaw and Craig Citro.

