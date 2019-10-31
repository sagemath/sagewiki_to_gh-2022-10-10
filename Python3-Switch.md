== Summary of the Python 3 switch ==

!SageMath has been running on top of '''Python 2''' since the beginning, until version 8.9, released in september 2019.

Starting from version 9.0 (to be released later in 2019 or early 2020), !SageMath will be running on top of '''Python 3'''.

The change from Python 2 to Python 3 has already been made by all major scientific software based on Python, including !NumPy, !SciPy and Jupyter. It becomes more and more common for scientific Python software to work only under Python 3. Moreover, the official end of life for Python 2 is the end of 2019 (see the [[https://pythonclock.org/|countdown]])

Python 3 has some major backward incompatibilities with Python2, and adapting !SageMath code from Python 2 to Python 3 takes some care and some work. Some basic instructions for doing that can be found in the following wiki pages

 * [[Python3-compatible|write Python 3 compatible code]] (for developers)
 * [[Python3-user|basic of Python 2 to Python3 transition] (for users)

More complete instructions for porting code can be found in the official [[https://docs.python.org/dev/howto/pyporting.html|Python documentation]].

Some more specific details follow.

== Old notebooks ==

The "legacy notebook", which was used by !SageMath for a long time, has been replaced by the Jupyter notebook since 2014 ????. Because the legacy notebook is no longer maintained, it is not compatible with Python 3 and will not be available in versions 9.0 and higher of !SageMath.

All people that still have old-style notebooks are urged to migrate them to Jupyter notebooks now.

== Compiling with Python 2 ==

After version 9.0, if you really want so, you can still build and use !SageMath with '''Python 2''', as follows.
{{{
make configure
./configure --with-python=2
make build
}}}
Beware that you will need to call the second line again if you ever call "make distclean".

This will work until version 9.1 at least. Then the backward compatibility with Python 2 will no longer be ensured.
