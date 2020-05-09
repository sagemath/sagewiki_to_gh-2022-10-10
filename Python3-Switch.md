{{https://www.python.org/static/community_logos/python-powered-w-100x40.png||width=100px}}

== Summary of the Python 3 switch ==

!SageMath has been running on top of '''Python 2''' since the beginning, until version 8.9, released in September 2019.

Starting from [[ReleaseTours/sage-9.0|Sage 9.0]], released in January 2020, !SageMath is running on top of '''Python 3'''.

The change from Python 2 to Python 3 has already been made by all major scientific software based on Python, including !NumPy, !SciPy and Jupyter. It becomes more and more common for scientific Python software to work only under Python 3. Moreover, the official end of life for Python 2 was the end of 2019.

Python 3 has some major backward incompatibilities with Python 2, and adapting !SageMath code from Python 2 to Python 3 takes some care and some work. Some basic instructions for doing that can be found in the following wiki pages:

 * [[Python3-compatible code]] (for developers)
 * [[Python3-user]] (for users)

More complete instructions for porting code can be found in the official [[https://docs.python.org/dev/howto/pyporting.html|Python documentation]].

Some more specific details follow.

== Old notebooks ==

The "legacy notebook", which was used by !SageMath for a long time, has been replaced by the Jupyter notebook since 2015. Because the legacy notebook is no longer maintained, it is not compatible with Python 3 and will not be available in versions 9.0 and higher of !SageMath.

All people that still have old-style notebooks are urged to migrate them to Jupyter notebooks (using !SageMath 8.9 or previous releases), by running the command
{{{
sage -n export
}}}

== Compiling with Python 2 ==

For '''version 9.0''' and the upcoming [[ReleaseTours/sage-9.1|SageMath 9.1]], if you really want so, you can still build and use !SageMath with '''Python 2''', as follows.
{{{
make configure
./configure --with-python=2
make build
}}}
Beware that you will need to call the second line again if you ever call "make distclean".

In the development versions after version 9.1 leading to [[ReleaseTours/sage-9.2|SageMath 9.2]], support for Python 2 will be removed ([[https://trac.sagemath.org/ticket/29141|Meta-ticket #29141: Remove Python 2 support for Sage 9.2; upgrades enabled by the removal]])
