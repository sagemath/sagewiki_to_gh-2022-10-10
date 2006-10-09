Copy cells from wiki-form window in sage worksheet and paste directly into wiki edit.




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
sage: for i in range(20):
...    a = 2^i -1
...    if a.is_prime():
...        print str(c + 1)+': '
...        print a
1: 
3
1: 
7
1: 
31
1: 
127
1: 
8191
1: 
131071
1: 
524287}}}

{{{#!python
sage: a.is_prime()
True}}}

{{{#!python

}}}


{{{#!python
sage: a = 5
}}}

{{{#!python
sage: a
5}}}

{{{#!python
sage: sage.server.notebook.worksheet.Cell.worksheet.im_class.files_html()
Traceback (most recent call last):
...
TypeError: unbound method files_html() must be called with Cell instance as first argument (got nothing instead)}}}

{{{#!python
sage: _scratch___plain__
Traceback (most recent call last):
...
NameError: name '_scratch___plain__' is not defined}}}

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

}}}
