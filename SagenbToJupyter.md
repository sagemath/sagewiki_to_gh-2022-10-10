= Transition issues with Jupyter =

Sage 8.0 is making the transition from the sage notebook (sagenb) to Jupyter. There are still some compatibility issues.

== interact ==

what ?

== rst2ipynb ==

- [[https://trac.sagemath.org/ticket/23361|#23361]]
- [[https://trac.sagemath.org/ticket/23362|#23362]]

== rst format ==

In the Sage notebook it was possible to load a rst file. With Jupyter one first has to use the script `rst2ipynb` and then load the notebook.

== output blocks ==

The Sage notebook used to cut the output when it was too long. In Jupyter this is not working nicely. A loop like
{{{
while True:
    print('hello')
}}}
is likely to freeze the browser. Moreover, after killing the kernel it is impossible to load the worksheet because the output block became too long. All this used to work fine in the Sage notebook.
