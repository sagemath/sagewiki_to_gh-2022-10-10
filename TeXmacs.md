= TeXmacs support for SAGE =
There is a [http://www.texmacs.org/ TeXmacs] plugin for SAGE.  The plugin is based on the TeXmacs Python plugin by Ero Carrera.  It has support for LaTeX display, tab completion, doc string / source support (via ? and ??), and support for displaying plots within TeXmacs.  Examples of the TeXmacs SAGE plugin can be seen below.

attachment:texmacs-sage.png attachment:texmacs-sage2.png

To install, follow the following steps:

 1. Make sure that the SAGE executable is in your $PATH
 1. Download the attachment:texmacs-sage.tar.gz plugin.
 1. Extract the tarball into ~/.TeXmacs/plugins/
When TeXmacs starts, the plugin should be detected automatically.  To add a SAGE session to the current TeXmacs buffer, do Insert -> Session -> SAGE.
