

```rst
#!rst 

BLAD integration in Sage
========================

This wiki page is about the integration of the `Bibliothèques Lilloises d'Algèbre Différentielle <http://www.lifl.fr/~boulier/pmwiki/pmwiki.php/Main/BLAD>`_ in Sage.

It will in particular help organize the coding sprint on December 13th.

Here is a list of tasks; please sign in to the task you would want to participate to.

Before December 13th:

- Have Sage 4.7.2 installed on everyone's laptop, together with the usual developers tools.

  Test: the following command (creating a new branch for blad's development within Sage) should work:

  ``sage -clone blad``

- For everyone: get acquainted with Sage's basic usage:

  - `The Sage tutorial <http://www.sagemath.org/doc/tutorial/>`_
  - `Calcul Mathématique avec Sage <http://sagebook.gforge.inria.fr/>`_

- For everyone: get acquainted with Sage's workflow, and in particular `Sage's ticket server <http://www.sagemath.org/doc/developer/trac.html>`_

- For everyone: get acquainted with the version control system Mercurial:

  - `The Mercurial Tutorial <http://mercurial.selenic.com/wiki/Tutorial>`_

- Build/choose a couple examples, from trivial to complex, showing how libBLAD is to be called from C, and the equivalent call from Maple

  - François?

- Choose a sample of calculations involving BLAD of increasing
  complexity that would be of interest in applications, and in
  particular in control theory

On December 13th:

- Quick demo of BLAD, from C and Maple

  - François

- Sketch of the would-be high level user interface

  - Everybody

- For everyone: get a trac account. That will be easiest on December 13th, since Nicolas can create them. Otherwise you can request one right away as described above. Once you have such an account, you can edit this wiki.

- Create a ticket for the integration of BLAD in Sage.

- Create other tickets as appropriate describing the related projects of the participants.

- Write down a test file and a tutorial on using BLAD from Sage, in
  ReST (Sage's and Python's documentation & tests format), taking
  inspiration from Maple's documentation.

  Expand it with a section `BLAD in control theory` with the examples above.

  - ??? with help from Florent

  See also:

  - `Sage developers's guide on writing documentation <http://www.sagemath.org/doc/developer/conventions.html#documentation-strings>`_

  - `Quick introduction to ReST <http://docutils.sourceforge.net/docs/user/rst/quickref.html>`_

- Build a Sage package (aka spkg) allowing for the installation of libBLAD in the Sage installation

  This should be straightforward since BLAD uses the standard autotools (1/2 hour to get a prototype?).

  - François, Nicolas, ...

  See also:

  - `The developers guide <http://www.sagemath.org/doc/developer/producing_spkgs.htm>`_

  - `An example of spkg <trac.sagemath.org/sage_trac/raw-attachment/ticket/10333/lrcalc-1.1.5b.spkg>`_ from `#10333 <http://trac.sagemath.org/sage_trac/ticket/10333>`_

- Translate (some of) the C examples to Cython, and call them from Sage (without input/output)

  - François, Nicolas, ...

- Low level interface: work progressively on date conversions
  Sage<->C, so that the input and output for the C examples can be
  respectively specified and retrieved from Sage's command line (in
  whatever format)

  - François, Nicolas, ...

  See also:

  - `Cython's web site <http://cython.org/>`_

  - `Cython's basic tutorial <http://docs.cython.org/src/userguide/tutorial.html>`_

  - `Sage with Cython tutorial <http://sagemath.blogspot.com/2010/11/getting-started-with-cython.html>`_

- Write the high level interface (parents, categories, ...)

- Bind together the high and low level interfaces

- Call it a day :-)

```