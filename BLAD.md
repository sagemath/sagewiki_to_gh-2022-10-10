{{{#!rst

BLAD integration in Sage
========================

This wiki page is about the integration of the `Bibliothèques Lilloises d'Algèbre Différentielle <http://www.lifl.fr/~boulier/pmwiki/pmwiki.php/Main/BLAD>`_ in Sage.

It will in particular help organize the coding sprint on December 13th.

Here is a list of tasks; please sign in to the task you would want to participate to.

- Get everyone acquainted with Sage's workflow, and in particular `Sage's ticket server <http://www.sagemath.org/doc/developer/trac.html>`_

- Open trac accounts for everyone. That will be easiest on December 13th, since Nicolas can create them. Otherwise you can request one right away as described above. Once you have such an account, you can edit this wiki.

- Create a ticket for the integration of BLAD in Sage.

- Create other tickets as appropriate describing the related projects of the participants.

- Build or select a couple examples, from trivial to complex, showing how libBLAD is to be called from C and from Maple

  - François?

- Build a Sage package (aka spkg) allowing for the installation of libBLAD in the Sage installation

  This should be straightforward since BLAD uses the standard autotools (1/2 hour to get a prototype?).

  - François, Nicolas, ...

  See also:

  - `The developers guide <http://www.sagemath.org/doc/developer/producing_spkgs.htm>`_

  - `An example of spkg <trac.sagemath.org/sage_trac/raw-attachment/ticket/10333/lrcalc-1.1.5b.spkg>`_ from `#10333 <http://trac.sagemath.org/sage_trac/ticket/10333>`_

- Translate (some of) the C examples to Cython, and call them from Sage (without input/output)

- Work on conversions, so that progressively the input and output for the C examples can be respectively specified and retrieved from Sage's command line

- Design the high level user interface

}}}
