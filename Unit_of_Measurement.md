

# Unit of Measurement


## Introduction

This is a collection of ideas and discussions about the inclusion of a **Unit of Measurement** package in SAGE that have taken place in the last year (half 2008 - half 2009). Hopefully this can helps developers and other people involved to get a clear image of the current situation. 

The main sources are: 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/3852">Trac ticket 3852</a> 
* <a class="http" href="http://groups.google.com/group/sage-devel/browse_frm/thread/ae18ce618abd66d2/649bd604d0fd20c9?#649bd604d0fd20c9">Sage-devel Group</a> 

## Overview

This is the situation described by the trac ticket at about August 2008. The proposal was to include in SAGE one of the following packages (already existing): 

* <a class="http" href="http://dirac.cnrs-orleans.fr/ScientificPython/ScientificPythonManual/Scientific.Physics.PhysicalQuantities-module.html">PysicalQuantities</a> module form <a class="http" href="http://dirac.cnrs-orleans.fr/plone/software/scientificpython/">Scientific Python</a> 
* <a class="http" href="http://home.scarlet.be/be052320/Unum.html">Unum</a> last updated in 2005 
* <a class="http" href="http://www.cacr.caltech.edu/projects/pyre/">Pyre</a> has a units package. Pyre looks like a Geodynamics framework 
* <a class="http" href="http://code.enthought.com/projects/files/ets_api/enthought.units.html">Units module</a> from the <a class="http" href="http://www.enthought.com/">Enthought</a> suite 
* <a class="http" href="http://packages.python.org/quantities/">Quantities</a> package from Darren Dale. It looks like the most actively developed (news also in 2009) 

### PhysicalQuantities

Comments from <a class="http" href="http://mail.scipy.org/pipermail/ipython-dev/2007-May/002932.html">IPython mailing list</a>: it is supported by ipython, whose _physics_ <a class="http" href="http://ipython.scipy.org/doc/manual/html/config/customization.html">profile</a> is supposed to be used in conjunction with. 


### Unum

<a class="http" href="http://home.scarlet.be/be052320/Unum_tutorial.html">Unum tutorial</a> 

* _License_: GPL 
* Author: Pierre Denis 
* Last update: 2005 - Designed for **Python 2.2** 
* Supported architectures: Linux, Windows, others 
* It boasts <a class="http" href="http://home.scarlet.be/be052320/Unum_tutorial.html#_Integration_with_Numerical_1">integration</a> with <a href="/NumPy">NumPy</a> and some degree of customization.  
* Small size (12.7 Kbytes archived, 119.7 Kbytes installed) and self-consistent. Easy installation. 
* It has been tested to work with basic functionalities in **SAGE 3.4.2** 

```python
#!python 
----------------------------------------------------------------------
| Sage Version 3.4.2, Release Date: 2009-05-05                       |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: from unum.units import *
sage: distance = 50*M
sage: distance
50.0 [m]
sage: volume = distance ^ 3; volume
125000.0 [m3]
sage: duration = 25*S; duration
25.0 [s]
sage: speed = distance/duration; speed
2.0 [m/s]
sage: mass = 1.5*KG; mass
1.50000000000000 [kg]
sage: kinetic_energy = 0.5*(mass*speed^2); kinetic_energy
3.00000000000000 [kg.m2/s2]
```
* _Consistency Checking_ feature which prevents from combining incompatible units.  

```python
#!python 
sage: distance = 50*M
sage: distance + 3*KG
---------------------------------------------------------------------------
DimensionError                            Traceback (most recent call last)
...
DimensionError: [m] incompatible with [kg]
```
* _Unit Conversions_ feature, allowing to combine in the same expression multiple units of the same dimension (i.e.: meters, and millimeters, and inches), getting a consistent result. 

```python
#!python 
sage: TON + 500*KG
1.5 [t]
sage: 5e-8*M - 28*ANGSTROM
472.000000000000 [angstrom]
sage: 3*H + 20*MIN + 15*S
3.3375 [h]
sage: H == 60*MIN
True
sage: 10000*S > 3*H + 15*MIN
False
```
* _as_ statement not working, although the _matchUnits_ function used does still work 

```python
#!python 
sage: (M).as(ANGSTROM)
------------------------------------------------------------
   File "<ipython console>", line 1
     (M).as(ANGSTROM)
          ^
SyntaxError: invalid syntax

sage: M.matchUnits(ANGSTROM)
(10000000000.0 [angstrom], 1.0 [angstrom])
```
* _Integration with mathematical functions_ working for python standard math 

```python
#!python 
sage: from math import cos
sage: cos(180*ARCDEG)
-1.0
sage: sin(180*ARCDEG)
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
...
TypeError: cannot coerce type '<class 'unum.Unum'>' into a SymbolicExpression.
sage: f = 440*HZ
sage: cos(f)
---------------------------------------------------------------------------
DimensionError                            Traceback (most recent call last)
...
DimensionError: unit [Hz] unexpected
sage: dt = 0.32*S
sage: cos(2*pi*f*dt)
0.30901699437502272
```
* Automatic simplification between units of the same physical quantity (in **Quantities** this is present but not automatic) 

```python
#!python 
sage: a = 1*MILE
sage: b = 1*M
sage: a/b
1609.34 []
```
* A couple of possible issues from <a class="http" href="http://home.scarlet.be/be052320/Unum_diary.html">Unum Diary</a> about release 4.0 (the last available): 

```txt
- Note that the issue of Celsius conversions is not addressed in this version, i.e. Unum assumes that all quantities are relative, in particular, 1°C is considered as equivalent to 1 K, which is not false if we talk about a raise of temperature. Debates are still on-going on possible Unum evolution to cope with absolute temperatures and offsets, to get at last 1°C = 274.15 K. I am afraid that there is no simple solution to this because it is impossible to guess, without further information from the user, when the offset is needed or not.
- I have another idea for further development, which is more technical. It is to remove the unit dictionary stored as Unum's class attributes (which is the cornerstone of the current design !). Currently, the unit symbol strings are used as keys for this dictionary; numerous dictionary lookups may occur at unit normalization or unification. The idea now is that each unum contains direct references to other unums representing its inner units. More precisely, basic units (as meter, second, etc) are, by definition, terminal unums (without references); derived units (as Newton, Joule, etc) have a dictionary with, as keys, unums representing basic/derived units, and, as values, their exponents; finally, any quantity may be derived with the same idea. The big picture at the end is that all quantities, units and conversion rules boils down to a single connected graph where each node is a unum. This redesign should save a lot in time and memory consumption. It requires however to rewrite almost all Unum's methods. I wrote a small prototype to validate the concept, with promising results.
```

### Enthought's Units

<a class="https" href="https://svn.enthought.com/enthought/ticket/1524">Enthought ticket</a>: the Enthought suite provides two units modules (the second one seems to be Physical Quantities from <a href="/ScientificPython">ScientificPython</a>), so the unification has been proposed, but seems still not completed. As a workaround, both the units package have been <a class="https" href="https://mail.enthought.com/pipermail/enthought-dev/2008-July/015717.html">deprecated</a> in favor of a unification/refactoring. This was happening in July 2008 


### Quantities

<a class="http" href="http://packages.python.org/quantities/user/tutorial.html">Quantities tutorial</a> 

* License: _BSD License_ (revised)  
* Author: Darren Dale 
* **Requires**: <a href="/NumPy">NumPy</a> 1.2 
* Born as refactoring and joining of the two Enthought packages.  
* **Actively developed**, the target is the inclusion in <a href="/NumPy">NumPy</a> 1.3. 
* It has been tested in SAGE. It is not natively compatible with SAGE numerical types.  
* In <a class="https" href="https://mail.enthought.com/pipermail/enthought-dev/2007-September/009130.html">this discussion</a> from the Enthought mailing list, they claim that: _"The units package is very stable, but perhaps lacking in documentation."_ 
* Small size (746 Kbytes) and self-consistent. Easy installation. 
* At a first look, the package has a quite complex structure, which may comes from careful investigation of pros and cons and software design of other packages, to provide a well designed system. The code is harder to read for a newbie, which may stand for code coming from an experienced programmer. 
* Its documentation is already provided in **ReST** 
* It has been tested to work with basic functionalities in **SAGE 3.4.2**: its heavy use of <a href="/NumPy">NumPy</a> is representing an obstacle, provided that SAGE still doesn't play completely nicely with <a href="/NumPy">NumPy</a> 

```python
#!python 
----------------------------------------------------------------------
| Sage Version 3.4.2, Release Date: 2009-05-05                       |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: import quantities as pq
sage: q = pq.Quantity([1,2,3],'J')
sage: q
array([1, 2, 3], dtype=object)*J
sage: import numpy as np
sage: q = np.array([1,2,3])*pq.J
---------------------------------------------------------------------------
AttributeError                            Traceback (most recent call last)
...
AttributeError: 'NotImplementedType' object has no attribute '_dimensionality'
```
* The workaround to make it work is to provide Python buil-in numerical types: 
```python
#!python 
sage: q = 1*pq.m
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
...
TypeError: unsupported operand parent(s) for '*': 'Integer Ring' and '<class 'quantities.unitquantity.UnitLength'>'
sage: q = 1r*pq.m
sage: q
array(1.0)*m
```
* Modify quantity's unit: 

```python
#!python 
sage: q.units = pq.ft
sage: print q
3.28083989501 ft
```
* Dimensional analysis check: 

```python
#!python 
sage: q2 = q.rescale(pq.watt)
---------------------------------------------------------------------------
ValueError                                Traceback (most recent call last)
...
ValueError: Unable to convert between units of "ft" and "W"
```
* Seems to have problems with power in SAGE 

```python
#!python 
sage: q = (10r*pq.meter)**2
---------------------------------------------------------------------------
AssertionError                            Traceback (most recent call last)

/media/LaCie/Software/sage-3.4.2-sage.math-only-x86_64-Linux/<ipython console> in <module>()

/media/LaCie/Software/sage-3.4.2-sage.math-only-x86_64-Linux/local/lib/python2.5/site-packages/quantities-0.5b2-py2.5.egg/quantities/quantity.pyc in __pow__(self, other)
    319             raise ValueError('Quantities must be raised to a single power')
    320 
--> 321         dims = self._dimensionality**other.min()
    322         ret = super(Quantity, self).__pow__(other)
    323         ret._dimensionality = dims

/media/LaCie/Software/sage-3.4.2-sage.math-only-x86_64-Linux/local/lib/python2.5/site-packages/quantities-0.5b2-py2.5.egg/quantities/dimensionality.pyc in __pow__(self, other)
    132 
    133     def __pow__(self, other):
--> 134         assert isinstance(other, (int, float))
    135         new = Dimensionality(self)
    136         for i in new:

AssertionError: 
```
* Per designer's choice doesn't automatically simplify in ambiguous situations 

```python
#!python 
sage: q
array(10.0)*m
sage: q2 = q/(1r*pq.ft)
sage: q2
array(10.0)*m/ft
sage: qs = q2.simplified
sage: print qs
32.8083989501 dimensionless
```
* Supports quantities with uncertainty  

#### Darren Dale comments

Darren Dale is the developer of **Quantities**. From the sage-devel <a class="http" href="http://groups.google.com/group/sage-devel/msg/151133f4e35eaee9">discussion</a>: 


```txt
"Let me explain my background and that of quantities. I am a scientist at the Cornell High Energy Syncrotron Source (CHESS), and have been a developer on the matplotlib project for several years. I have been interested in having a units package for python for a long time. I have considered all the units packages discussed so far in this thread, but did not find one that suited my needs. I make heavy use of numpy arrays for my work, and wanted a numpy subclass that handled physical quantities. It has taken several iterations but I finally found an appropriate abstraction for such a package. Quantities is already in pretty good shape, in large part because it does not try to do too much. I am currently trying to improve Quantities interaction with numpy's builtin functions, however, I have run into some limitations in numpy, mainly in the implementation of ufuncs. If you are interested, please search the numpy archives for my name. I have suggested on that list how things could be improved, but the devs are busy preparing to release numpy-1.3. I will try to engage them again after 1.3 is out.

I have been spending most of my effort on Quantities recently improving the unit tests. This uncovered a few bugs in numpy that have been fixed in time for the 1.3 release. If you run pq.test() with numpy-1.2, you will encounter errors that have been fixed in 1.3.

I would be willing to consider how quantities can be improved so it can be used in the sage environment, but it sounds like there are some existing issues with the interaction of sage types and numpy arrays which need to be worked out first."
```
The author of this document (Maurizio) made a comment in post #16 of that discussion: 


```txt
"provided that the system is SI, you should get the result as a multiplier (bigger than one) of the closest classic unit representation
ex: meters -> nm - um - mm - m - km - ecc ecc
ex:

x1 = 10cm
x2 = 1m
x1 + x2 = 1.1m

y1 = 1V (Volt)
y2 = 0.5 V
y1 - y2 = 500 mV

z1 = 500 mA [milliAmperes]
k = 3
z1 * k = 1.5 A 

Two optional features could be very important, in my opinion:
1) locking one object unit representation to a certain order of magnitude and/or metric system

ex:
x1 = 1 cm
x1.lock('cm')
x2 = x1 + 1 m [x2 can inherit the lock property]
x2 = 101 cm
x2.lock('inches')
x2 = 39.76 inches
x2.unlock()
x2 = 1.01 m

PS: locking property could also be specified when instantiating an object

2) changing the standard metric system (imperial / SI / any other) so that by default each value is scaled as previously proposed "
```
This is Darren Dale's comment about it: 


```txt
"Dealing with physical quantities can be somewhat thorny, because there are lots of use cases and everybody seems to have their own ideas about how it should behave. Case in point, the proposal in post #16 would keep units the way you like them for scalars, but it would create additional overhead in cases like 1m-0.999999m. In that case, I guess the proposed behavior would be to yield 1um as the result, which means quantities would have to a) determine the appropriate final unit and b) would have to perform additional arithmetic. Quantities is not really designed to handle item a. I've tried to keep the package as simple as possible in order to keep the problem tractable in my limited free time. Item b would be unacceptable to those concerned about speed. Automatically rescaling the result becomes more complicated with arrays, since you would then have to inspect the min, max or mean in order to determine how to rescale the output, and there are plenty of compound operations sqrt(x +y**3/(...)...) where the user would only be interested in rescaling the final result, not the result of each individual step of arithmetic. There are plenty of examples, like operations involving constants for quantum mechanics or astrophysics, where the user wants the result in the units specified by the constants. "
```
And a very brief technical description after a question: 


```txt
"Quantities values are all instances of Quantity or a subclass thereof, and Quantity itself is a subclass of ndarray. It sounds like the first step would be to work out this compatibility issue between sage objects and ndarray. Has anyone brought it up at numpy-discussion? "
```

## Additional information

Robert Dodler <a class="http" href="http://groups.google.com/group/sage-devel/msg/de8e34f884caae22">commented</a> that any Unit of Measurement package should not provide the output expression forced to any chosen measurement system (SI, imperial, ...), because that would prevent the usage of nonstandard combinations (cm/day, liters/km, ...), which occur very often in the US. 

He also <a class="http" href="http://groups.google.com/group/sage-support/msg/b7b1d63d2a19419a">suggested</a> in a recent discussion in sage-support, to write a new package from scratch. He himself has written the <a class="http" href="http://www.math.utexas.edu/pipermail/maxima/2007/007728.html">ezunits</a> for Maxima, making extensive use of symbolic computations. This can provide a source of inspiration. That same discussion evidenced that there is some amount of interest about having this feature in SAGE. 


## Other stuff

As <a class="http" href="http://groups.google.com/group/sage-devel/msg/a293c9a7448e27e7">reported</a> by Carl Witty, fergusnoble was working on a units package for SAGE. He <a class="http" href="http://groups.google.com/group/sage-devel/msg/9ce1e1863c184f90">joined</a> the discussion, with a couple of comments: his approach was to always keep quantities in SI, doing the necessary conversions when needed (as opposed to what happen in **Quantities**). fergusnoble agreed to clean up his code and to make a little demo. 


## Author comments

In the first run, I was very attracted from **Quantities** being actively developed. So, I tried to install it within SAGE, but I was disappointed from having to deal with different numeric types than the built-in ones. Once discussed this with the developers, I was trying to overcome the problem, but I soon discovered that **Quantities** was missing a couple of desired features, like dealing with different units of the same physical quantity. I consider this fundamental to a package like this. The author is certainly nice and kind, but he looks pretty busy, so the amount of help in trying to adapt **Quantities** to my need was too poor. 

In the second run, I have rediscovered **Unum**. From the tutorial it seems to provide the kind of features I'd like to get, so it could be worthwhile to give it a try. I've easily installed it, and it successfully runs in SAGE. Next step is to understand how hard would it be to let the SAGE mathematical functions to accept Unum types. On the other side, it seems that Unum suffers from a simple design, which can cause memory and cpu usage issues. Its author seems to be conscious of the necessity for a refactoring of the code, getting rid of the big amount of dictionaries used. From this point of view, Quantities seems more modern and better designed. 


# Threads

<a href="http://groups.google.com/group/sage-devel/browse_thread/thread/8791448b7a303ce9/807189c979add549">http://groups.google.com/group/sage-devel/browse_thread/thread/8791448b7a303ce9/807189c979add549</a> 

<a href="http://groups.google.com/group/sage-devel/browse_thread/thread/ae18ce618abd66d2/b440d40dd28b8ef2">http://groups.google.com/group/sage-devel/browse_thread/thread/ae18ce618abd66d2/b440d40dd28b8ef2</a> 

<a href="http://groups.google.com/group/sage-support/browse_thread/thread/842c647087271b71/6b398b1f4309bd2e">http://groups.google.com/group/sage-support/browse_thread/thread/842c647087271b71/6b398b1f4309bd2e</a> 

etc.  
