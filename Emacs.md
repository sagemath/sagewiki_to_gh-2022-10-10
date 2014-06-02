= Sage and Emacs =

The purpose of this page is to collect tips and tricks for Sage users
and developpers using the text editor Emacs.

== Sage-mode ==

This emacs mode allows for running a Sage interpreter inside emacs,
and interacting with it sending in chunks of code or doctests,
directly opening the appropriate source files from the help, the
debugger or the tracebacks. It also provides goodies for running
tests, etc.

See: [[sage-mode]] or [[http://bitbucket.org/gvol/sage-mode]]

== EIN: IPython notebook client in Emacs ==

https://github.com/tkf/emacs-ipython-notebook

This is currently non functional due to an incompatibility with the
ipython shipped with Sage. Yet this sounds promising. See:

- https://github.com/tkf/emacs-ipython-notebook/issues/131
- http://trac.sagemath.org/ticket/16053

== Miscellaneous ==

- which-function-mode: this minor mode displays in the status bar the
  name of the class or function being edited. This is a life saver for
  code with nested classes, and in particular category code.

  Setup: M-x customize-variable which-function-mode

- I (NT) have this in my python-mode-hook:
  {{{
  (set-variable 'indent-tabs-mode nil)
  (set-variable 'py-indent-offset 4)
  }}}
  This might not be so relevant with recent versions of emacs.

== See also ==

- This (not sot recent) [[http://www.saltycrane.com/blog/2010/05/my-emacs-python-environment/ blog post]] on customizing emacs for Python
