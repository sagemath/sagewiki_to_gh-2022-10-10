= Packaging and Distributing SAGE =

[:days4/projects/: SAGE Days 4 Project]

 * W Stein: Go through all the standard SAGE packages and, when possible, '''add an spkg-check''', which runs some sort of analogue of "make check" when possible.

 * N Alexander: Greatly improve testing infrastructure. 

 * Introduce some form of package sanity checking to sage -upgrade, such as file size checks, CRC checks, or digital signatures.

 * D Deshommes and W Stein: Fully port SAGE to Solaris; improve SAGE's package management system

 * Mike Hansen, Yi Qiang(?): '''Bootable (Cluster) CD for SAGE/DSAGE'''.  Using BCCD ( http://bccd.cs.uni.edu/ ) as a base, create a bootable CD to allow one to easily turn in unused lab into DSAGE cluster.

 * didier deshommes: Improve support for '''SAGE on NexentaOS'''. Several packages need to be patched.

 * sage -optional : It would be useful to list the size of each package together with this. Also when doing sage -i optional, to tell the user about the size of the package.
