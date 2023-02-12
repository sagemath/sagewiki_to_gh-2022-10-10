

# Mike Hansen's Status Report for Sage Days 12


## I fixed the following bugs:


### Notebook

* #3201 - notebook -- bug in parsing \ at end of line in %latex mode 
* #4524 - interact : incomplete default string in the input box 
* #3326 - trailing question marks in %html blocks are mistreated 
* #3820 - notebook -- sometimes published worksheets are listed as being published by pub. 
* #4820 - Syntax error for a comment line, then help query in a notebook cell 
* #4011 - notebook -- copying a worksheet on worksheet listings page results in the new worksheet being listed as running 
* #4245 - notebook -- error clicking editing when there is a < in the html. 
* #4316 - notebook: '%html $x<y$' doesn't work right 
* #4010 - notebook -- Renaming worksheet: clicking OK with a blank text box should revert to worksheet's old name not name it to "null" 
* #313 - Slideshow doesn't update correctly when first cell deleted. 
* #1897 - %latex -- bug in passing in predefined sage variables (serious but probably very easy to fix) 
* #1019 - strange behavior in notebook with %octave 

### Interfaces

* #3294 - GAP interface broken after CTRL-C 
* #3752 - gap.eval -- oddity in parsing multiline input and comments 
* #4590 - sage/interfaces/phc.py writes tmp files into cwd 
* #3268 - Fix GAP interface printing 

### Misc

* #2638 - complex QQbar expressions exceed maximum recursion depth when exact computation is triggered 
* #4405 - double/single quotation marks in docstring 
* #2402 - there should be a hg_examples mercurial wrapper for the examples repository 
* #5051 - tracebacks involving cython (etc.) seriously broken in sage-3.3.alpha0 (probably caused by ipython) 
* #5073 - Update IPython to 0.9.1 
* #4152 - parametric_plot should take the variable range as (var, min, max) like plot 