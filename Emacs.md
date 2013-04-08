= Sage in Emacs =
'''THIS PAGE IS OUTDATED - PLEASE GOTO [[sage-mode]] or [[http://bitbucket.org/gvol/sage-mode]]'''

There is support for using SAGE interactively from within emacs, and editing Python code in emacs:

 * Download [[attachment:sage.el]] and byte compile it, or download [[attachment:sage.elc]] .
 * Download [[attachment:python-mode.el]] and byte compile it, or download [[attachment:python-mode.elc]] . This is highly recommended since it is a vast improvement over editing Python code without a special mode.
(NOTE: Recent versions of Emacs have their own major mode for Python called http://cvs.savannah.gnu.org/viewvc/emacs/lisp/progmodes/python.el?root=emacs&view=log. So those with GNU Emacs 22 or 23 shouldn't need [[attachment:python-mode.el]] . The modifications to your .emacs file suggested below will be the same, except you can remove or comment out {{{(load "python-mode")}}}.)

 * Download [[attachment:pyrex-mode.el]] and byte compile it, or download [[attachment:pyrex-mode.elc]] .
 * Put the .elc files all in a directory, e.g., {{{/home/was/.emacs-scripts}}}.
 * Add the following to your {{{.emacs}}} file, where you replace {{{/home/was/.emacs-scripts}}} with the directory where you put those elc files.
{{{
(add-to-list 'load-path (expand-file-name "/home/was/.emacs-scripts/"))
(load "pyrex-mode")
(load "python-mode")
(setq ipython-command "~/bin/sage")  ;; depends on where your sage is.
(load "sage")
(require 'ipython)
(fset 'py-shell-fullscreen
   [?\M-x ?p ?y ?- ?s ?h ?e ?l ?l return ?\C-x ?1])
(define-key esc-map "i" 'py-shell-fullscreen)
(setq auto-mode-alist (cons '("\\.pyx\\'" . pyrex-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pxd\\'" . pyrex-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pxi\\'" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sage\\'" . python-mode) auto-mode-alist))
}}}
 * Start emacs. Now Python code and pyrex files are colored correctly, and there are a bunch of extra commands.
 * Start emacs.  Type Alt-i.  A SAGE window should appear.  Colors and tab completion should work.  If you are in debugging mode (%pdb), then when an error occurs, an emacs window opens taking you to that point in the source code!  (Note: Tab completion does not work when you run emacs with "emacs -nw".)
== Hints ==
If when running SAGE, the screen gets cluttered up, e.g., by the output of help, just type Ctrl-[_], i.e., Ctrl-Shift-[- key] to undo, which will remove the last chunk of output completely.

There is also an [[attachment:doctest-mode.el]]
