Copy cells from wiki-form window in sage worksheet and paste directly into wiki edit.





################################################################################
# Worksheet: _scratch_
################################################################################



{{{a = 5
}}}

{{{a
# 5}}}

{{{sage.server.notebook.worksheet.Cell.worksheet.im_class.files_html()
# Traceback (most recent call last):
    sage.server.notebook.worksheet.Cell.worksheet.im_class.files_html()
#   File "/home/dorian/sage/sage-1.4/local/lib/python2.5/", line 1, in <module>
# TypeError: unbound method files_html() must be called with Cell instance as first argument (got nothing instead)}}}

{{{_scratch___plain__
# Traceback (most recent call last):
    _scratch___plain__
#   File "/home/dorian/sage/sage-1.4/local/lib/python2.5/", line 1, in <module>
# NameError: name '_scratch___plain__' is not defined}}}

################################################################################
# Wiki form worksheet: _scratch_
################################################################################



{{{sage: a = 5
}}}

{{{sage: a
5}}}

{{{sage: sage.server.notebook.worksheet.Cell.worksheet.im_class.files_html()
Traceback (most recent call last):
...
TypeError: unbound method files_html() must be called with Cell instance as first argument (got nothing instead)}}}

{{{sage: _scratch___plain__
Traceback (most recent call last):
...
NameError: name '_scratch___plain__' is not defined}}}

{{{sage: for i in range(10):
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

{{{
}}}
