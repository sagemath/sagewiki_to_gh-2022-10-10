## page was renamed from days4/projects/emacs
= sage-mode for GNU Emacs =

{{{sage-mode}}} depends on GNU Emacs (22?) and its {{{python-mode}}}.

Contact Nick Alexander on {{{sage-devel}}} to request features, report bugs, and submit patches.  (Especially submit patches!)

== Current version ==

'''Warning!'''  This is alpha code.  This might fail horribly and is not (yet) easily customizable.

attachment:sage-mode-0.3.spkg

Use {{{sage -f sage-mode-0.3.spkg}}}.  The following installation instructions are suggested:

{{{
(add-to-list 'load-path (expand-file-name "$SAGE_DATA/emacs"))
(require 'python)
(require 'pyrex "pyrex-mode")
(require 'sage "sage-mode")
(setq sage-command "$SAGE_ROOT/sage")
}}}

== Original version ==

This version was from Sage Days 4.

attachment:sage-mode.el
attachment:pyrex-mode.el

The following files need to go into sage/misc.

attachment:sage_emacs.py
attachment:xreload.py
attachment:sagetest.py
