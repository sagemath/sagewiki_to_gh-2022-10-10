= Sage Interactions =

Post code that demonstrates the use of the interact command in Sage here.    It should be easy for people to just scroll through and paste examples out of here into their own sage notebooks.   

We'll likely restructure and reorganize this once we have some nontrivial content and get a sense of how it is laid out. 

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

attachment:cuspgroup.png
