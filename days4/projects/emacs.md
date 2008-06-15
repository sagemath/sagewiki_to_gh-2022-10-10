= sage-mode for GNU Emacs =

 ''Warning!''  This is pre-alpha code.

Contact Nick Alexander on {{{sage-devel}}} to request features, report bugs, and submit patches.  (Especially submit patches!)

It depends on GNU Emacs (22?) and its python-mode.

attachment:sage-mode.el
attachment:pyrex-mode.el

The following files need to go into sage/misc.

attachment:sage_emacs.py
attachment:xreload.py
attachment:sagetest.py

The following is a slightly updated version.  It might fail horribly and is not yet customizable.

attachment:sage-mode-0.3.spkg

The following installation instructions are suggested:

{{{
(add-to-list 'load-path (expand-file-name "$SAGE_DATA/emacs"))
(require 'python)
(require 'pyrex "pyrex-mode")
(require 'sage "sage-mode")
(setq sage-command "$SAGE_ROOT/sage")
}}}
