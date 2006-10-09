Copy cells from wiki-form window in sage worksheet and paste directly into wiki edit.



################################################################################
# Wiki form worksheet: _scratch_
################################################################################



{{{#!python
sage: a = 5
}}}

{{{#!python
sage: a
5}}}

{{{#!python
sage: for i in range(10):
...    print i*i - 2
-2
-1
2
7
14
23
34
47
62
79}}}

{{{#!python
sage: c=0
sage: for i in range(200):
...    a = 2^i -1
...    if a.is_prime():
...        c += 1
...        print str(c)+': '+str(a)
1: 3
2: 7
3: 31
4: 127
5: 8191
6: 131071
7: 524287
8: 2147483647
9: 2305843009213693951
10: 618970019642690137449562111
11: 162259276829213363391578010288127
12: 170141183460469231731687303715884105727}}}

{{{#!python
sage: a.is_prime()
True}}}

{{{#!python

}}}
