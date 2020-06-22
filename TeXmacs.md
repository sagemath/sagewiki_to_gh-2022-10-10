= TeXmacs support for Sage =

There is a [[https://www.texmacs.org/|TeXmacs]] plugin for Sage.

After starting !TeXmacs, try to add a Sage session to the current !TeXmacs buffer,
by doing `Insert ⇒ Session ⇒ Sage`.

If this does not work, you might need to

  * modify your PATH so that Sage can be found
  * install the plugin from https://github.com/texmacs/SageMath.tm

The plugin is based on the !TeXmacs Python plugin by Ero Carrera.  It has support
for LaTeX display, tab completion, doc string / source support, and support for displaying plots within !TeXmacs.

A screenshot from the !TeXmacs Sage plugin (as of June 2020) can be seen below.

{{attachment:sage_9.2_texmacs.png}}
