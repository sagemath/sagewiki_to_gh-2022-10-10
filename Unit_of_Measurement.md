= Unit of Measurement =

== Introduction ==

This is a collection of ideas and discussions about the inclusion of a '''Unit of Measurement''' package in SAGE that have taken place in the last year (half 2008 - half 2009). Hopefully this can helps developers and other people involved to get a clear image of the current situation.

The main sources are:
 * [[http://trac.sagemath.org/sage_trac/ticket/3852|Trac ticket 3852]]
 * [[http://groups.google.com/group/sage-devel/browse_frm/thread/ae18ce618abd66d2/649bd604d0fd20c9?#649bd604d0fd20c9|Sage-devel Group]]


== Overview ==

This is the situation described by the trac ticket at about August 2008. The proposal was to include in SAGE one of the following packages (already existing):
 * [[http://dirac.cnrs-orleans.fr/ScientificPython/ScientificPythonManual/Scientific.Physics.PhysicalQuantities-module.html|PysicalQuantities]] module form [[http://dirac.cnrs-orleans.fr/plone/software/scientificpython/|Scientific Python]]
 * [[http://home.scarlet.be/be052320/Unum.html|Unum]] last updated in 2005
 * [[http://www.cacr.caltech.edu/projects/pyre/|Pyre]] has a units package. Pyre looks like a Geodynamics framework
 * [[http://code.enthought.com/projects/files/ets_api/enthought.units.html|Units module]] from the [[http://www.enthought.com/|Enthought]] suite
 * [[http://packages.python.org/quantities/|Quantities]] package from Darren Dale. It looks like the most actively developed (news also in 2009)

=== PhysicalQuantities ===

Comments from [[http://mail.scipy.org/pipermail/ipython-dev/2007-May/002932.html|IPython mailing list]]: it is supported by ipython, whose ''physics'' [[http://ipython.scipy.org/doc/manual/html/config/customization.html|profile]] is supposed to be used in conjunction with.

[[http://home.scarlet.be/be052320/Unum_tutorial.html|Unum]]: it has the ''Unit Conversions'' feature, allowing to combine in the same expression multiple units of the same dimension (i.e.: meters, and millimeters, and inches), getting a consistent result. Moreover it has a ''Consistency Checking'' feature which prevents from combining incompatible units. It also boasts compatibility with NumPy and some degree of customization. ''GPL''.

[[https://svn.enthought.com/enthought/ticket/1524|Enthought]]: the Enthought suite provides two units modules (the second one seems to be Physical Quantities from ScientificPython), so the unification has been proposed, but seems still not completed. As a workaround, both the units package have been [[https://mail.enthought.com/pipermail/enthought-dev/2008-July/015717.html|deprecated]] in favor of a unification/refactoring. This was happening in July 2008

[[http://packages.python.org/quantities/user/tutorial.html|Quantities]]: Quantities was born as refactoring and joining of the two Enthought packages. It is currently developed, and the target is the inclusion in NumPy 1.3.
It has been tested in SAGE. It is not natively compatible with SAGE numerical types. In [[https://mail.enthought.com/pipermail/enthought-dev/2007-September/009130.html|this discussion]] from the Enthought mailing list, they claim that: "The units package is
very stable, but perhaps lacking in documentation." 

=== Darren Dale comments ===

Darren Dale is the developer of '''Quantities'''. From the sage-devel [[http://groups.google.com/group/sage-devel/msg/151133f4e35eaee9|discussion]]:

''"Let me explain my background and that of quantities. I am a scientist at the Cornell High Energy Syncrotron Source (CHESS), and have been a developer on the matplotlib project for several years. I have been interested in having a units package for python for a long time. I have considered all the units packages discussed so far in this thread, but did not find one that suited my needs. I make heavy use of numpy arrays for my work, and wanted a numpy subclass that handled physical quantities. It has taken several iterations but I finally found an appropriate abstraction for such a package. Quantities is already in pretty good shape, in large part because it does not try to do too much. I am currently trying to improve Quantities interaction with numpy's builtin functions, however, I have run into some limitations in numpy, mainly in the implementation of ufuncs. If you are interested, please search the numpy archives for my name. I have suggested on that list how things could be improved, but the devs are busy preparing to release numpy-1.3. I will try to engage them again after 1.3 is out.

I have been spending most of my effort on Quantities recently improving the unit tests. This uncovered a few bugs in numpy that have been fixed in time for the 1.3 release. If you run pq.test() with numpy-1.2, you will encounter errors that have been fixed in 1.3.

I would be willing to consider how quantities can be improved so it can be used in the sage environment, but it sounds like there are some existing issues with the interaction of sage types and numpy arrays which need to be worked out first."''

The author of this document (Maurizio) made a comment in post #16 of that discussion:

''"provided that the system is SI, you should get the result as a multiplier (bigger than one) of the closest classic unit representation
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

2) changing the standard metric system (imperial / SI / any other) so that by default each value is scaled as previously proposed "''

This is Darren Dale's comment about it:

''"Dealing with physical quantities can be somewhat thorny, because there are lots of use cases and everybody seems to have their own ideas about how it should behave. Case in point, the proposal in post #16 would keep units the way you like them for scalars, but it would create additional overhead in cases like 1m-0.999999m. In that case, I guess the proposed behavior would be to yield 1um as the result, which means quantities would have to a) determine the appropriate final unit and b) would have to perform additional arithmetic. Quantities is not really designed to handle item a. I've tried to keep the package as simple as possible in order to keep the problem tractable in my limited free time. Item b would be unacceptable to those concerned about speed. Automatically rescaling the result becomes more complicated with arrays, since you would then have to inspect the min, max or mean in order to determine how to rescale the output, and there are plenty of compound operations sqrt(x +y**3/(...)...) where the user would only be interested in rescaling the final result, not the result of each individual step of arithmetic. There are plenty of examples, like operations involving constants for quantum mechanics or astrophysics, where the user wants the result in the units specified by the constants. "''

And a very brief technical description after a question:

''"Quantities values are all instances of Quantity or a subclass thereof, and Quantity itself is a subclass of ndarray. It sounds like the first step would be to work out this compatibility issue between sage objects and ndarray. Has anyone brought it up at numpy-discussion? "''

== Additional information ==

Robert Dodler [[http://groups.google.com/group/sage-devel/msg/de8e34f884caae22|commented]] that any Unit of Measurement package should not provide the output expression forced to any chosen measurement system (SI, imperial, ...), because that would prevent the usage of nonstandard combinations (cm/day, liters/km, ...), which occur very often in the US.

He also [[http://groups.google.com/group/sage-support/msg/b7b1d63d2a19419a|suggested]] in a recent discussion in sage-support, to write a new package from scratch. He himself has written the [[http://www.math.utexas.edu/pipermail/maxima/2007/007728.html|ezunits]] for Maxima, making extensive use of symbolic computations. This can provide a source of inspiration. That same discussion evidenced that there is some amount of interest about having this feature in SAGE.

== Other stuff ==

As [[http://groups.google.com/group/sage-devel/msg/a293c9a7448e27e7|reported]] by Carl Witty, fergusnoble was working on a units package for SAGE. He [[http://groups.google.com/group/sage-devel/msg/9ce1e1863c184f90|joined]] the discussion, with a couple of comments: his approach was to always keep quantities in SI, doing the necessary conversions when needed (as opposed to what happen in '''Quantities''').
fergusnoble agreed to clean up his code and to make a little demo.

== Author comments ==

In the first run, I was very attracted from '''Quantities''' being actively developed. So, I tried to install it within SAGE, but I was disappointed from having to deal with different numeric types than the built-in ones. Once discussed this with the developers, I was trying to overcome the problem, but I soon discovered that '''Quantities''' was missing a couple of desired features, like dealing with different units of the same physical quantity. I consider this fundamental to a package like this. The author is certainly nice and kind, but he looks pretty busy, so the amount of help in trying to adapt '''Quantities''' to my need was too poor.

In the second run, I have rediscovered '''Unum'''. My next try will be to install it in SAGE. I honestly expect the same numerical type issue obtained with '''Quantities''', but from the tutorial it seems to provide the kind of features I'd like to get, so it could be worthwhile to give it a try.

= Threads =

http://groups.google.com/group/sage-devel/browse_thread/thread/8791448b7a303ce9/807189c979add549

http://groups.google.com/group/sage-devel/browse_thread/thread/ae18ce618abd66d2/b440d40dd28b8ef2

http://groups.google.com/group/sage-support/browse_thread/thread/842c647087271b71/6b398b1f4309bd2e

etc. 

What packages are out there? Pros/cons of each (social as well as technical aspects of the project). 
