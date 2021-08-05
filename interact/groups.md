= Sage Interactions - Groups =



This page was first created for Google Summer of Code by Alexis Newton, with mentorship by Mckenzie West. 

If you have group-related interactions that you are interested in adding to this page, please do so. You can also contact Alexis Newton at firstname.lastname@emory.edu.  

goto [[interact|interact main page]]

<<TableOfContents>>



== Calling Groups from GAP ==

explanation

=== Group of Order n ===

Call group order n

{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Order n </h1>"))
pretty_print(html("<h>Choose a group order.<h>"))



@interact
def foo(n = input_box(default='10', label="Order:"), m = input_box(default='1', label= "Group Number:")):
    top = len(gap(n).AllSmallGroups())
    print('There are', top, 'groups of order', n ,'in the GAP library.')
    print('Group', m , 'of', top, 'is', gap(gap(n).SmallGroup(m)).StructureDescription())


}}}

=== Group of Order n that is ...===

=== All Groups of Order n ===

=== All Groups of Order n that are ...===




== Calling a List of Groups from GAP ==

explanation

=== Groups Order Less Than or Equal to n ===


You can use this interact to call all the lists from the GAP library that are order less than or equal to your desired value.


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
def foo(n = input_box(default='10', label="Upper Bound:")):
    print(order_n(n))

}}}

=== Groups Order Between m and n ===


You can use this interact to call all the lists from the GAP library that have order between m and n


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
def foo(m = input_box(default='1', label="Lower Bound:"), n = input_box(default='10', label="Upper Bound:")):
    print(order_n(n,start=m))

}}}


=== Groups Meeting Selected Parameters ===


You can use this interact to 


{{{#!sagecell
#Last edited 8/5/21 2:45pm
pretty_print(html("<h1>Group Type</h1>"))
pretty_print(html("<h>Select a parameter.<h>"))


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
def foo(m = input_box(default='1', label="Lower Bound:"), n = input_box(default='10', label="Upper Bound:"), Parameter = 
    ["IsGroup","IsAbelian","IsCyclic","IsSolvable","IsNilpotent","IsSimple","IsDihedralGroup",
    "IsSymmetricGroup","IsAlternatingGroup","IsPerfectGroup","IsPolycyclicGroup"]):
    print(order_n(n,Parameter,start=m))

}}}



=== Direct or Semidirect Groups ===


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
def foo(m = input_box(default='1', label="Lower Bound:"), n = input_box(default='10', label="Upper Bound:"), Parameter = 
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
