
![https://www.gnu.org/software/emacs/images/emacs.png](https://www.gnu.org/software/emacs/images/emacs.png) 


# Sage and Emacs

The purpose of this page is to collect tips and tricks for Sage users and developers using the text editor Emacs as an <a href="/IDE">IDE</a>. 


## sage-shell-mode

<a class="https" href="https://github.com/stakemori/sage-shell-mode">sage-shell-mode</a> is the recommended mode for Sage in Emacs. This mode provides two features: 

1. Run a Sage shell inside Emacs, fully equipped with command history, completion, dynamic help and opening of source files, etc. 

2. A major mode for `.sage` files along with functionality for sending chunks of code to a running Sage shell. 

`sage-shell-mode` allows extensions for `auto-complete`, `helm`, `anything`, and embedding in `org-mode`.  It was written from scratch by Sho Takemori. 

`sage-shell-mode` is most easily installed using the Emacs package manager MELPA. Alternatively, go to <a class="https" href="https://github.com/stakemori/sage-shell-mode">the GitHub page</a>. 

See: <a href="/SageModeComparison">SageModeComparison</a>, <a class="https" href="https://github.com/stakemori/sage-shell-mode">https://github.com/stakemori/sage-shell-mode</a> 


## emacs-jupyter

- See 2020 blog post: <a class="https" href="https://martinralbrecht.wordpress.com/2020/08/23/conda-jupyter-and-emacs/">Martin Albrecht: Conda, Jupyter and Emacs</a> 


## EIN: IPython notebook client in Emacs

<a href="https://github.com/tkf/emacs-ipython-notebook">https://github.com/tkf/emacs-ipython-notebook</a> 

This is currently non functional due to an incompatibility with the ipython shipped with Sage. Yet this sounds promising. See: 

- <a href="https://github.com/tkf/emacs-ipython-notebook/issues/131">https://github.com/tkf/emacs-ipython-notebook/issues/131</a> - <a href="http://trac.sagemath.org/ticket/16053">http://trac.sagemath.org/ticket/16053</a> 


## Sage-mode

Note: `sage-mode` works only for Sage 7.3 and earlier. 

This emacs mode allows for running a Sage interpreter inside emacs, and interacting with it sending in chunks of code or doctests, directly opening the appropriate source files from the help, the debugger or the tracebacks. It also provides goodies for running tests, typesetting output, etc. 

See: <a href="/SageModeComparison">SageModeComparison</a>, <a href="/sage-mode">sage-mode</a>, <a class="http" href="http://bitbucket.org/gvol/sage-mode">http://bitbucket.org/gvol/sage-mode</a> 


## Miscellaneous

* Sage already provides an editor configuration for Emacs, using the file 
``.dir-locals.el``, to use spaces instead of tabs.  To avoid introducing <a class="https" href="https://doc.sagemath.org/html/en/developer/coding_basics.html#general-coding-style-regarding-whitespace">trailing whitespace</a>, see <a href="https://www.emacswiki.org/emacs/DeletingWhitespace">https://www.emacswiki.org/emacs/DeletingWhitespace</a> for various solutions. 

* which-function-mode: this minor mode displays in the status bar the 
      * name of the class or function being edited. This is a life saver for code with nested classes, and in particular category code. Setup: M-x customize-variable which-function-mode 

## See also

- 2010 <a class="http" href="http://www.saltycrane.com/blog/2010/05/my-emacs-python-environment/">blog post</a> on customizing emacs for Python 
