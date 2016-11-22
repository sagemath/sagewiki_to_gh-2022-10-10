
First step in imperative programming
=====================================

Conditional jump, function and loop
----------------------------------

- In python, conditional jumps can be written with the following syntax :

::

    sage: a = 30
    ....: if( a % 2 == 0 ):
    ....:     print( "a est even." )
    ....: else:
    ....:     print( "a est odd." )
        



Exercise :
----------

Let "a" be the age of an human, give an algorithm that returns :

- "child", if it's age is lesser than 13

- "teenager", if it's age is greater that 13 and lesser than 18

- "adult", if it's age is greater or equal to 18 

- "Alien", otherwise ;).

::

    sage: a = -3
    ....: if a > 0 and a < 13:
    ....:    print('child')
    ....: elif a >= 13 and a< 18:
    ....:    print('teenager')
    ....: elif a>=18:
    ....:    print('adult')
    ....: else:
    ....:    print('alien')


Function :
----------

A function can be declared with the keyword **def**. Come back to the
last exercise and create a function `characteristic(age)` that takes as parameter
the age of an human and returns the previous characteristic.

::

    sage: def characteristic(age):
    ....:    if a > 0 and a < 13:
    ....:        return('child')
    ....:    elif a >= 13 and a< 18:
    ....:        return('teenager')
    ....:    elif a>=18:
    ....:        return('adult')
    ....:    else:
    ....:        return('alien')
    sage: characteristic(12)



**Exercise**: Write a function that takes, in parameter, a real `x`
and then returns the maximum between `x^2` and `2x+1`

::

    sage: 



The Loops
---------


Find in the documentation how to use the function *range()*.

::

    sage: range?

**Exercise** : List, by using the function *range*, all the even values
running from -5 to 21.

::

    sage: 



The loop For :
--------------

In python, we can repeat the execution of some code. We call a loop each run 
of that code.

Writing loop can be done in the following way :

::

    sage: i=2
    ....: n=10
    ....: for i in range(n):
    ....:     print(i)
    ....: print("C est la fin")
    ....: print(i)


    sage: for e in Subsets(4):
    ....:    print( e )


**Exercise**: Write a function `f` that takes an integer `n` and
then returns the value `u_n` defined by `u_n=u_{n-1}+u_{n-1}` with 
`u_{0}=0` and `u_1=1`.

::

    sage: 


The loop WHILE :
----------------

Loops can be written with the following format:

::

    sage: n=10
    ....: i=2
    ....: while i < n:
    ....:     print(i)
    ....:     i = i+1
    ....: print("sortie i : " + str(i))


**Exercise**: Give a function that takes an integer `n` as parameter and return 
the integer part of `\log_2(n)`.

::

    sage: 


The lists
----------

-  In python, lists are written by using with brackets. For example, the list 
[1, 2, 3, 4] can be coded with those lines :

::

    sage: l = [1,2,3,4]
    sage: l
    sage: l.append(10)
    sage: l

-  We can write some lists by using loops :

::

    sage: l = []
    ....: for i in range(10):
    ....:    l.append(i)
    ....: l


-  We can also make it in one line :

::

    sage: [i^2 for i in range(10)]


-  We can create list of different objects. For example, the following code
   generate all the permutations of size 4:

::

   sage: [p for p in Permutations(4)]



-  In fact it is possible to write :

::

    sage: P = Permutations(4)
    sage: P




-  It is possible to use loops and conditional jumps inside lists.
   In the next example, we select all the permutations that finish on a descent.
   We recall that `i` is a descent in a permutation `p` if `p(i) \ge p(i+1)`.

::

   sage: [p for p in Permutations(5) if p(4)>p(5) ]

-  It is possible to obtain the size of a list :

::

   sage: l = [p for p in Permutations(5) if p(4)>p(5)] 
   sage: len( l )






**Exercise**: Write a function to list all fixed points of a given permutation.
Then, write another function that lists all permutations without fixed point.

::

    sage: 


-  We can generate the generating function of all permutations that have no fixed
   points. We will assume that `x` counts the size of the permutations.

::

    sage: def nb_without_fp(n):
    ....:     return len(
    ....:         [ 
    ....:             p 
    ....:             for p in Permutations(n)
    ....:             if len(fixed_points(p))==0
    ....:         ] 
    ....:     )
    sage: S = sum( nb_without_fp(n)*x^n for n in range(8) )
    sage: S


-  We can collect the sequence and obtain information about that sequence with
   OEIS.

::

    sage: oeis([ nb_sans_pf(n) for n in range(8) ])

Exercises
---------

-  By using the previous examples, write a program that gives the list of all 
   even integers that are lesser than 30.

::

    sage: 


-  Propose an algorithm that computes the binomial `\binom{n}{k}` by using
   the Pascal triangle : `\binom{n+1}{k}=\binom{n}{k}+\binom{n}{k-1}`.

::

    sage: 

-  In fact, the function *binomial* exists in Sage. Find that function.

::

    sage: 


The dictionaries
----------------

- Dictionaries are data structures that allow to associate an object called key 
to another object called value.
In a dictionary, all keys are different. In fact a dictionary is a map with
finite support. 

::

    sage: D = {1:4, 2:6, 3:6, 8:6}
    sage: D
    {1: 4, 2: 6, 3: 6, 8: 6}

::

    sage: D.keys()





**Question**: How do you proceed to :

- determine if a dictionary contains a particular key;

- get a value associated to a key;

- get the number of keys.

::

    sage:

**Exercise** Write a function that takes as parameter a list of integers and 
then returns a dictionary where 

- keys are all the integers present inside the list

- values, associated with the key, are the number of key repetitions inside the list.

::

    sage:

The generators
---------------

-  Generators are programs that are useful to enumerate objects on demand.
   For example, `Permutations(3)` contains a generator of permutations of size 3.
   We obtain that generator by typing :

::

    sage: generator = iter( Permutations(3) )

-  We can enumerate those permutations by writing :

::

    sage: print( next( generator ) )
    sage: print( next( generator ) )
    sage: print( next( generator ) )
    sage: print( next( generator ) )
    sage: print( next( generator ) )
    sage: print( next( generator ) )

-  An error is raised when iterator reach the end of the iterator function.

::

    sage: print( next( generator ) )

-  Generators allow to obtain object one by one without
   computing a list of all the elements.
   This is useful when the list is big or infinite.
   For example, we can compute a generator for all the permutations:

::

    sage: generator = iter(Permutations())
    sage: print( next(generator) ) 
    sage: print( next(generator) ) 
    sage: print( next(generator) ) 
    sage: print( next(generator) ) 
    sage: print( next(generator) ) 
    sage: print( next(generator) ) 
    sage: print( next(generator) ) 
    sage: print( next(generator) )

-  It is possible to use iterators inside a loop :

::

    sage: gen = iter( Permutations(3) )
    ....: for p in gen:
    ....:     print( p )

-  You can implement your own generator. It suffices, during the enumeration, 
   to return the current value by using the keyword *yield*.
   At the first use of yield, python will create a generator that stores in
   memory all the states of the calculus. At each *next* the generator will
   continue the calculus and will return the next value of the enumeration.

::

    sage: def generator( n ):
    ....:      for i in range(n):
    ....:          yield i**2
    sage: gen = generator( 30 )
    ....: print( next(gen) )
    ....: print( next(gen) )
    ....: print( next(gen) )
    ....: print( next(gen) )
    ....: print( next(gen) )
    ....: print( next(gen) )

Exercises : 
-----------

-  Write a generator that enumerates all permutations of size `n` (without using 
   the Sage generator of *Permutations*).

::

    sage:


-  Write a generator that enumerates all the compositions of an integer.
   A composition of `n` is a list `l_1, l_2, \ldots, l_k`  of integers such 
   that `l_1 + l_2 + \ldots + l_n = n`.

::

    sage:


-  Find in the Sage documentation a composition generator.

::

    sage:

Euler project
-------------

-  Train yourself by solving problems from the Euler Project Website :

https://projecteuler.net/

