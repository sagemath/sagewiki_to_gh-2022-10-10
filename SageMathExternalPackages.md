

```rst
#!rst 

==========================
SageMath external packages
==========================

A list of external packages for SageMath (spkg, pip-installable packages, etc).

- Please free to add more packages, links, notes to `Meta-ticket #31164 <https://trac.sagemath.org/ticket/31164>`_, which tracks the task of adding packages to Sage so that they appear in the spkg section of the Sage reference manual.

- Please do not duplicate information
  that is already available in the 
  `spkg section of the Sage reference manual <https://doc.sagemath.org/html/en/reference/spkg/>`_.

- Use this list to add examples to the
  `Code Sharing Workflow <https://wiki.sagemath.org/CodeSharingWorkflow>`_ wiki page.

- Note also Chris Swierczewski's
  `Creating External Sage Packages <https://gist.github.com/cswiercz/c632d920565a2da519b73bd2b79d7920>`_.

- With the `SageMath sample package <https://github.com/sagemath/sage_sample>`_ you
  will find a minimal example of a Sage package.

- See an `April 2020 sage-devel thread <https://groups.google.com/d/msg/sage-devel/jOD5QaGAfHs/og91glYsAwAJ>`_
  on CI infrastructure options for external Sage packages.

- See `Sage Trac: Surveying the mathematical software landscape <https://trac.sagemath.org/wiki/WikiStart#Surveyingthemathematicalsoftwarelandscape>`_

---------------
New-style SPKGs
---------------

The single authoritative source for the packages integrated in the Sage distribution (SPKGs) is
the `SAGE_ROOT/build/pkgs/ <https://git.sagemath.org/sage.git/tree/build/pkgs>`_ directory.  
Each SPKG is represented by a subdirectory. The structure
of these subdirectories is explained in 
the `Developer's Guide <https://doc.sagemath.org/html/en/developer/packaging.html>`_.

Since Sage 9.2, the `spkg section of the Sage reference manual <https://doc.sagemath.org/html/en/reference/spkg/>`_ is automatically generated from the information in ``SAGE_ROOT/build/pkgs/``. (`Trac #29655 <https://trac.sagemath.org/ticket/29655>`_ improves the formatting of this information.)

Use the following shell commands below to access the information from the `SAGE_ROOT/build/pkgs`
directory of your copy of Sage:

 * Standard packages: ``./sage -standard``
 * Installed packages: ``./sage -installed``
 * Optional packages available: ``./sage -optional``
 * Experimental packages available: ``./sage -experimental``
 * Details about an SPKG: ``./sage -info <SPKG>``

For some advanced package tools, use ``./sage -package``

-------------------------
List of external packages
-------------------------

These packages are not (yet?) integrated in the SageMath distribution
as SPKGs and have to be installed separately.

'''See `Meta-ticket #31164 <https://trac.sagemath.org/ticket/31164>`_.'''

See also https://github.com/slel/external-packages
for another collection

--------
See also
--------

- `Packages on PyPI matching 'sagemath'
  <https://pypi.org/search/?q=sagemath>`_
- `Packages on PyPI matching 'sage' and Mathematics <https://pypi.org/search/?q=sage&o=&c=Topic+%3A%3A+Scientific%2FEngineering+%3A%3A+Mathematics>`_
- `Packages on PyPI matching 'sage' and Science <https://pypi.org/search/?q=sage&o=&c=Intended+Audience+%3A%3A+Science%2FResearch>`_

- `Packages on github matching "Sage code" <https://github.com/search?q=%22Sage+code%22>`_
- `Packages on gitlab matching "sagemath" <https://gitlab.com/search?search=sagemath>`_
- `Packages on Google Code Archive with tag "SAGE" <https://code.google.com/archive/search?q=domain:code.google.com%20label:SAGE>`_
- `Packages on Bitbucket matching "sagemath" <https://bitbucket.org/repo/all?name=sagemath>`_

```