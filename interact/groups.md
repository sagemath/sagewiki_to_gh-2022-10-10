= Sage Interactions - Groups Using the GAP System =

This page was first created for Google Summer of Code 2021 by Alexis Newton, with mentorship by Mckenzie West. 

If you have interactions that you are interested in adding to this page, please do so. You can also contact Alexis Newton at firstname.lastname@emory.edu.  

The main function of this page is to demonstrate the improved capabilities that we have developed for SageMath during the GSOC Summer 2021. The trac ticket for those developments can be found here: https://trac.sagemath.org/ticket/32196#comment:5.

Note that this ticket has not yet been approved, so in many cases we have defined our main function "order_n" in the Sage cell to be a more rudimentary version of the what is contained in the trac ticket. We do this in order to demonstrate how it may be used. Once the ticket has been pushed through the Sage development process, we will update the page to remove this extraneous code.
 

goto [[interact|interact main page]]

<<TableOfContents>>



== Calling Groups from GAP ==


GAP is a system for computational discrete algebra, which provides a programming language, a library of thousands of functions implementing algebraic algorithms written in the GAP language as well as large data libraries of algebraic objects. GAP is used in research and teaching for studying groups and their representations, rings, rings, vector spaces, algebras, combinatorial structures, and more. 

Using Sage, we are able to interface with the GAP System to call groups of different types. This is extremely useful for demonstrating examples in undergraduate abstract algebra courses. Learn more about interfacing with GAP via Sage here: https://doc.sagemath.org/html/en/reference/interfaces/sage/interfaces/gap.html.

We rely heavily on the Small Group and All Small Groups GAP commands within this page. The documentation for these can be found on the GAP System website: https://www.gap-system.org/Manuals/pkg/SmallGrp/doc/chap1.html.

=== Group of Order n ===

Use this interact to call a group of order n from the GAP library.

{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Order n </h1>"))
pretty_print(html("<h>Choose a group order and a group number.<h>"))



@interact
def order_n1(n = input_box(default='10', label="Order:"), m = input_box(default='1', label= "Group Number:")):
    top = len(gap(n).AllSmallGroups())
    print('There are', top, 'groups of order', n ,'in the GAP library.')
    print('Group', m , 'of', top, 'is', gap(gap(n).SmallGroup(m)).StructureDescription())


}}}

=== Group of Order n of a Certain Type ===

Use this interact to specify a type of group to call.

{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Pick a Group</h1>"))
pretty_print(html("<h>Choose a group order, a group type and a group number.<h>"))

@interact
def order_n1(n = input_box(default='10', label="Order:"), Parameter = 
    ["IsGroup","IsAbelian","IsCyclic","IsSolvable","IsNilpotent","IsSimple","IsDihedralGroup",
    "IsSymmetricGroup","IsAlternatingGroup","IsPerfectGroup","IsPolycyclicGroup"], m = input_box(default='1', label= "Group Number:")):
    top = len(gap(n).AllSmallGroups(Parameter))
    print('There are', top, Parameter, 'groups of order', n ,'in the GAP library.')
    print('Group', m , 'of', top, 'is', gap(gap(n).SmallGroup(m)).StructureDescription())


}}}

=== All Groups of Order n ===


Use this interact to call all groups of order n from the GAP library.

{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Order n </h1>"))
pretty_print(html("<h>Choose a group order.<h>"))



@interact
def order_n1(n = input_box(default='10', label="Order:")):
    h = gap(n).AllSmallGroups()
    for x in [1..len(h)]:
	print(h[x].StructureDescription())


}}}

=== All Groups of Order n of a Certain Type ===

Use this interact to specify a type of group to call.

{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Order n </h1>"))
pretty_print(html("<h>Choose a group order and a group type.<h>"))



@interact
def order_n1(n = input_box(default='10', label="Order:"), Parameter = 
    ["IsGroup","IsAbelian","IsCyclic","IsSolvable","IsNilpotent","IsSimple","IsDihedralGroup",
    "IsSymmetricGroup","IsAlternatingGroup","IsPerfectGroup","IsPolycyclicGroup"]):
    h = gap(n).AllSmallGroups(Parameter)
    for x in [1..len(h)]:
	print(h[x].StructureDescription())


}}}

=== Small Group Info ===

Use this interact to learn information about the small groups of order n contained in the GAP library.

{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Order n </h1>"))
pretty_print(html("<h>Choose a group order.<h>"))



@interact
def order_n1(n = input_box(default='32', label="Order:")):
    print(gap(n).SmallGroupsInformation())


}}}



== Calling a List of Groups from GAP ==


The current configuration for calling information from GAP only allows for you to call one group at a time, but we aim to allow for lists of groups which meet certain parameters. The some of the group properties we aim to address include abelian, solvable, nilpotent, given order, dihedral, semi-direct products, alternating, symmetric, and simple.

=== Groups Order Less Than or Equal to n ===


Use this interact to call all groups from the GAP library that have order less than or equal to your desired value.


{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Upper Bound on Order </h1>"))
pretty_print(html("<h>Choose an upper bound for the order.<h>"))


def order_n(n, *parameter, start=1):
    below_order_n = gap('EmptyPlist(1)') 
    #documentation on AllSmallGroups command and Structure description
    #is in the GAP System reference guide 
    for i in range(start,n+1):
        g=gap(i).AllSmallGroups(*parameter)
        for x in range(1,len(g)+1):  
            r=gap(g[x]).StructureDescription()
            gap.Add(below_order_n,r)
    #convert gap object to python string
    below_order_n = libgap(below_order_n).sage()
   
    return below_order_n

@interact
def order_n1(n = input_box(default='10', label="Upper Bound:")):
    print(order_n(n))

}}}

=== Groups Order Between m and n ===


Use this interact to call all the groups from the GAP library that have order between m and n


{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Upper and Lower Bound on Order</h1>"))
pretty_print(html("<h>Choose an upper bound and a lower bound for the order.<h>"))


def order_n(n, *parameter, start=1):
    below_order_n = gap('EmptyPlist(1)') 
    #documentation on AllSmallGroups command and Structure description
    #is in the GAP System reference guide 
    for i in range(start,n+1):
        g=gap(i).AllSmallGroups(*parameter)
        for x in range(1,len(g)+1):  
            r=gap(g[x]).StructureDescription()
            gap.Add(below_order_n,r)
    #convert gap object to python string
    below_order_n = libgap(below_order_n).sage()
   
    return below_order_n

@interact
def order_n1(m = input_box(default='1', label="Lower Bound:"), n = input_box(default='10', label="Upper Bound:")):
    print(order_n(n,start=m))

}}}


=== Groups of a Certain Type ===


Use this interact to call all groups of a certain type from the GAP library that have order between m and n


{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Group Type</h1>"))
pretty_print(html("<h>Select a group type, an upper bound and a lower bound.<h>"))


def order_n(n, *parameter, start=1):
    below_order_n = gap('EmptyPlist(1)') 
    #documentation on AllSmallGroups command and Structure description
    #is in the GAP System reference guide 
    for i in range(start,n+1):
        g=gap(i).AllSmallGroups(*parameter)
        for x in range(1,len(g)+1):  
            r=gap(g[x]).StructureDescription()
            gap.Add(below_order_n,r)
    #convert gap object to python string
    below_order_n = libgap(below_order_n).sage()
   
    return below_order_n

@interact
def order_n1(m = input_box(default='1', label="Lower Bound:"), n = input_box(default='10', label="Upper Bound:"), Parameter = 
    ["IsGroup","IsAbelian","IsCyclic","IsSolvable","IsNilpotent","IsSimple","IsDihedralGroup",
    "IsSymmetricGroup","IsAlternatingGroup","IsPerfectGroup","IsPolycyclicGroup"]):
    print(order_n(n,Parameter,start=m))

}}}



=== Direct or Semidirect Product Groups ===

Use this interact to specify groups that contain direct or semidirect products.

{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Direct or Semidirect</h1>"))
pretty_print(html("<h>Check a box to limit the results<h>"))

def _directprod(order_n):
    new_order_n = []
    for i in range(0,len(order_n)):
        word=order_n[i].split(' ')
        if 'x' in word:
            new_order_n.append(order_n[i])
    return new_order_n


def _semidirectprod(order_n):
    new_order_n = []
    for i in range(0,len(order_n)):
        word=order_n[i].split(' ')
        if ':' in word:
            new_order_n.append(order_n[i])
    return new_order_n

def order_n(n, *parameter, start=1,directproduct=False, semidirectproduct=False):
    below_order_n = gap('EmptyPlist(1)') 
    #documentation on AllSmallGroups command and Structure description
    #is in the GAP System reference guide 
    for i in range(start,n+1):
        g=gap(i).AllSmallGroups(*parameter)
        for x in range(1,len(g)+1):  
            r=gap(g[x]).StructureDescription()
            gap.Add(below_order_n,r)
    #convert gap object to python string
    below_order_n = libgap(below_order_n).sage()
   
     #only print out direct or semi direct prod if asked
    if directproduct == True:
        below_order_n = _directprod(below_order_n)
    if semidirectproduct == True:
        below_order_n = _semidirectprod(below_order_n)

    return below_order_n

@interact
def order_n1(m = input_box(default='1', label="Lower Bound:"), n = input_box(default='10', label="Upper Bound:"), Parameter = 
    ["IsGroup","IsAbelian","IsCyclic","IsSolvable","IsNilpotent","IsSimple","IsDihedralGroup",
    "IsSymmetricGroup","IsAlternatingGroup","IsPerfectGroup","IsPolycyclicGroup"], Direct = checkbox(default = False),
    Semidirect = checkbox(default = False)):
    
    
    if (Direct == True) and (Semidirect == True):
        print(order_n(n,Parameter,start=m,directproduct=true, semidirectproduct=true))
    if Direct == True and Semidirect == False:
        print(order_n(n,Parameter,start=m,directproduct=true))
    if Direct == False and Semidirect == True:
        print(order_n(n,Parameter,start=m,semidirectproduct=true))

}}}
