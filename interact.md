= Sage Interactions =

Post code (and screen shots) of the use of interact in Sage here.    We'll likely restructure and reorganize this, or move it out of the wiki (?) once we have some nontrivial content and get a sense of how it is laid out. 

== Graphics ==

== Calculus ==

== Number Theory ==

{{{
html('<h1>Cuspidal Subgroups of Modular Jacobians J0(N)</h1>')
@interact
def _(N=selector([1..8*13], ncols=8, width=10, default=10)):
    A = J0(N)
    print A.cuspidal_subgroup()
}}}
