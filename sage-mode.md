## page was renamed from days4/projects/emacs
= sage-mode for GNU Emacs =

{{{sage-mode}}} depends on GNU Emacs (22?) and its {{{python-mode}}}.

Contact Nick Alexander on {{{sage-devel}}} to request features, report bugs, and submit patches.  (Especially submit patches!)

== Current version ==

'''Warning!'''  This is alpha code.  This might fail horribly and is not (yet) easily customizable.

Version 0.5.1 adds Matthias Meulien's sage-view.el and adds sage-rerun, and C-u sage-build, as requested by Nicolas Thiery.  It fixes a small bug with binding in sage-view and now the install instructions are correct.

[[attachment:sage-mode-0.5.1.spkg]]

Use {{{sage -f sage-mode.spkg}}}.  The following installation instructions are suggested:

{{{
(add-to-list 'load-path (expand-file-name "$SAGE_DATA/emacs"))
(require 'python)
(require 'pyrex "pyrex-mode")
(require 'sage "sage-mode")
(setq sage-command "$SAGE_ROOT/sage")

;; If you want sage-view to typeset all your output and have plot()
;; commands inline, uncomment the following line and configure sage-view:
;; (require 'sage-view "sage-view")
;; (add-hook 'sage-startup-hook 'sage-view-always)
}}}

== Old versions ==

[[attachment:sage-mode-0.5.spkg]]

[[attachment:sage-mode-0.4.spkg]]

[[attachment:sage-mode-0.3.1.spkg]]

[[attachment:sage-mode-0.3.spkg]]

[[attachment:sage-mode-0.2.spkg]]

== Original version ==

This version was from Sage Days 4.

[[attachment:sage-mode.el]]
[[attachment:pyrex-mode.el]]

The following files need to go into sage/misc.

[[attachment:sage_emacs.py]]
[[attachment:xreload.py]]
[[attachment:sagetest.py]]
