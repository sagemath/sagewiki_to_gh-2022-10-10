
There are two dedicated <a href="/emacs">Emacs</a> modes for Sage: <a class="https" href="https://github.com/stakemori/sage-shell-mode">sage-shell-mode</a> and <a class="https" href="https://bitbucket.org/gvol/sage-mode/src">sage-mode</a>. 

Note that `sage-mode` runs only on Sage 7.3 or earlier: Sage 7.4 started shipping IPython 5.0 which completely changes how Emacs can interact with IPython. 

The two Emacs modes are otherwise quite compatible (otherwise this is a bug), and possibly you can even use both together. 

In the feature table below ?? means probably, and blank means probably not. 
                      |  sage-shell-mode          |  sage-mode         
 Installation         |  MELPA                    |  spkg              
 Sage Version         |  any                      |  7.3 or earlier    
 Completion           |  auto-complete            |  pcomplete         
 Helm integration     |  yes                      |  no                
 Cleaner codebase     |  yes                      |  no                
 Other interpreters   |  some support             |  no                
 Cython mode          |                           |  yes               
 flymake integration  |  flymake-python-pyflakes  |  yes               
 flycheck integration |  yes                      |                    
 AUCTeX integration   |  customizable             |  yes               
 Doctesting helps     |                           |  yes               
 Building help        |                           |  yes               
 Inline plots         |  yes                      |  yes               
 Typeset output       |  yes                      |  yes               
 "blocks"             |  yes                      |  yes               
 eldoc-mode           |  yes                      |                    
 Compatibility        |  any                      |  new/old python.el 
