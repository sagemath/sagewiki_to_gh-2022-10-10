
**Warning:** I, Ivan Andrus, often forget to update this page when a new version is released.  The most recent version is always available from <a class="https" href="https://bitbucket.org/gvol/sage-mode/downloads">https://bitbucket.org/gvol/sage-mode/downloads</a>, and often simply installing with  


```txt
sage -i sage_mode
```
and following the instructions to finish the setup is sufficient. 


# sage-mode


## Description

sage-mode provides Emacs Lisp that helps you use Sage in GNU Emacs.  Inspiration was originally provided by ipython.el. 


## License

Copyright (C) 2007, 2008, 2009, 2010, 2011  Nick Alexander 

Author: Nick Alexander <ncalexander [at] gmail.com> 

Maintainer: Ivan Andrus <darthandrus  [at] gmail.com> 

sage-mode is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2, or (at your option) any later version. 

sage-mode is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details. 

You should have received a copy of the GNU General Public License along with sage-mode; see the file COPYING.  If not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA. 


## SPKG Maintainers

* Ivan Andrus 

## Upstream Contact

* Maintainer: Ivan Andrus <darthandrus [at] gmail.com> 
* Bitbucket mercurial repository: <a class="http" href="http://bitbucket.org/gvol/sage-mode">http://bitbucket.org/gvol/sage-mode</a> 

## Dependencies

* sage 
* GNU Emacs with python.el, not python-mode.el.  XEmacs might work but has not been tested. 

## Special Update/Build Instructions

sage-mode (version 0.9.1) is an optional package, so `sage -f sage_mode` should work.  You can also use the latest version <a class="https" href="https://bitbucket.org/gvol/sage-mode/downloads/">https://bitbucket.org/gvol/sage-mode/downloads/</a>, or follow development directly from the repository at <a class="http" href="http://bitbucket.org/gvol/sage-mode">http://bitbucket.org/gvol/sage-mode</a>.  The following installation instructions are printed when installing: 

A basic install might include the following Emacs Lisp in your .emacs: 


```txt
(add-to-list 'load-path (expand-file-name "$SAGE_DATA/emacs"))
(require 'sage "sage")
(setq sage-command "$SAGE_ROOT/sage")

;; If you want sage-view to typeset all your output and have plot()
;; commands inline, uncomment the following line and configure sage-view:
;; (require 'sage-view "sage-view")
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view)
;; You can use commands like
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-output)
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-plots)
;; to enable some combination of features.  Using sage-view requires a
;; working LaTeX installation with the preview package.
```

## Changelog


### sage-mode-0.9.1 (Ivan Andrus, 2013-03-10)

* Fixed some build issues 


### sage-mode-0.9 (Ivan Andrus, 2013-03-10)

* Fixed completion with new ipython * Fixed interaction with new python.el * Fixed recognition of sage-view output * Added sage-attach-this-file * Make sage-view prettier 


### sage-mode-0.8 (Ivan Andrus, 2012-09-12)

* Many improvements and new maintainer. * Not yet released.  Adds incomplete support for new python.el 


### sage-mode-0.7 (Nick Alexander, 2011-10-07)

* Fix a bug reported by Ivan Andrus regarding font-lock and triple-quoted strings. 

* sage-mode is now hosted on bitbucket for easy viewing and cloning: browse to <a class="http" href="http://bitbucket.org/gvol/sage-mode">http://bitbucket.org/gvol/sage-mode</a>. 


### sage-mode-0.6 (Nick Alexander, 2009-05-11)

* `sage-run' no longer waits for a sage: prompt by default.  This can cause problems if `sage-startup-after-prompt-hook' is non-trivial, but doesn't lock up emacs busy waiting for the prompt. 

* `sage-send-doctest' now works with multiline tests and one line function definitions. 

* `sage-rerun' now exits from the debugger if it sees the debugger prompt, and `sage-build' with a prefix argument (build and run sage) should no longer hang. 

* `pyrex-mode' is now autoload-ed and the default for pyx, pxi, and pxd files. 

* `next-error' now jumps between top-level errors, avoiding lower level source files.  Lower level source files are still hyperlinked. 

* `sage-test' with a prefix argument now offers to test without rebuilding. 

* Now `sage-send-doctest' and `sage-send-region' are bound in *Help* buffer. 

* `sage-send-{buffer, region doctest}' now either automatically (`sage-quit-debugger-automatically') or after a prompt quit the debugger before sending input to the sage slave. 

* In the debugger, very short history items are not remembered.  (No more looping through u/d in the history.) 

* *sage-test* buffers now search for test status rather than relying on the exit codes that incorrectly say tests failed all the time. 

* SPKG.txt and spkg-install now print paths in the install instructions. 

* C-u RET no longer sends input to the sage slave with output to *sage-output*.  Use `sage-move-output-to-buffer' instead, or `comint-write-output' to save to a file. 


### sage-mode-0.5.4 (Nick Alexander, 2009-03-13)

* Fixed errors in `sage-build' and `sage-test' autoloads; made sage-mode.el provide 'sage-mode. 


### sage-mode-0.5.3 (Nick Alexander, 2009-03-12)

* Updated `sage-view' to new version. 

* Completely reworked keymaps and added preliminary menus. 

* Completely reworked customize interface and added autoload interface through `sage.el' and autogenerated `sage-load.el'. 

* Added some documentation and additional customization options. 


### sage-mode-0.5.2 (Nick Alexander, 2009-02-19)

* Made individual parts of `sage-view' toggleable, fixed bugs with plots and multiple outputs. 


### sage-mode-0.5.1 (Nick Alexander, 2009-02-11)

* Added `sage-startup-hook' and made `sage-view' actually usable. 


### sage-mode-0.5 (Nick Alexander, 2009-01-31)

* Incorporated Matthias Meulien's sage-view.el.  To enable, try sage-view or 

   * (add-hook 'inferior-sage-mode-hook 'sage-view). 
* Added sage-rerun to restart sage and made C-u C-c C-b (sage-build with a 

   * prefix argument) build and restart sage. 

### sage-mode-0.4 (Nick Alexander, 2008-06-16)

I honestly can't remember. 


### sage-mode-0.3 (Nick Alexander, 2008-06-15)

Add sage-build command. Make sage-default-test-* more robust, and add `sage-send-all-doctest-lines-in-file'. 

* sage-build.el: new module for building (sage-build) and running (sage-build with prefix argument) sage. 

* sage-test.el (sage-send-all-doctest-lines): new function. Runs all sage: doctest lines in a file in sequence. Use with pdb to reproduce errors found only after sage -t. 

* sage-test.el (sage-default-test-command, sage-default-test-new-command): cleaned up to use sage-build. 


### sage-mode-0.2 (Nick Alexander, 2008-06-14)

First alpha version, for Mike Hansen to use and test. 


### sage-mode-0.1 (Nick Alexander)

First internal version. 


## Old versions

<a href="sage-mode/sage-mode-0.7.spkg">sage-mode-0.7.spkg</a> 

<a href="sage-mode/sage-mode-0.6.spkg">sage-mode-0.6.spkg</a> 

<a href="sage-mode/sage-mode-0.5.4.spkg">sage-mode-0.5.4.spkg</a> 

<a href="sage-mode/sage-mode-0.5.2.spkg">sage-mode-0.5.2.spkg</a> 

<a href="sage-mode/sage-mode-0.5.1.spkg">sage-mode-0.5.1.spkg</a> 

<a href="sage-mode/sage-mode-0.5.spkg">sage-mode-0.5.spkg</a> 

<a href="sage-mode/sage-mode-0.4.spkg">sage-mode-0.4.spkg</a> 

<a href="sage-mode/sage-mode-0.3.1.spkg">sage-mode-0.3.1.spkg</a> 

<a href="sage-mode/sage-mode-0.3.spkg">sage-mode-0.3.spkg</a> 

<a href="sage-mode/sage-mode-0.2.spkg">sage-mode-0.2.spkg</a> 


## Original version

This version was from Sage Days 4. 

<a href="sage-mode/sage-mode.el">sage-mode.el</a> <a href="sage-mode/pyrex-mode.el">pyrex-mode.el</a> 

The following files need to go into sage/misc. 

<a href="sage-mode/sage_emacs.py">sage_emacs.py</a> <a href="sage-mode/xreload.py">xreload.py</a> <a href="sage-mode/sagetest.py">sagetest.py</a> 
