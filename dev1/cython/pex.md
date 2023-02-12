
<a href="http://pexlang.sourceforge.net/">http://pexlang.sourceforge.net/</a> 

Stuff in Pex not in Cython: 

* Except behavior -> always `except uncommon_value?` by default 
* make flag to do run `__main__` method 
* hook build into `__import__` to compile 
* get rid of cimport (look for `.pxd` file, unless flag) 
* auto-generate `.pxd` from `.pyx` 
* pragmas for compile time flags ( like `# lang=` ) 
* magic methods: 
         * auto-generate `__reduce__` 
                  * native types OK opaque types via property methods 
         * (optional) auto-generate `__str__` and `__cmp__`, provide via `cython.generate.cmp(self)` or something of the stort 