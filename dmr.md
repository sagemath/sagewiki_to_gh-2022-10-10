== Dorian Raymer ==
email:
deldotdr@gmail

I am working on a notebook version of the SAGE Documentation. So far I have a navigable and evaluatable doc browser that can be launched from a sage notebook. The doc browser grabs a doc page (initially index.html) from devel/doc-1.4/html/ directory and seperates the textual content from the example sage code, all of which become cells in a special 'doc browser' worksheet.

Things in question:

 * Every time a new page of documentation is opened, a worksheet named 'doc_browser' is re-created (if one exists it is deleted and then re created). I'm not sure exactly how this works, but, concerning spawning sage processes, I think I need to do this a beter way. It also takes a few seconds for each new page to open.
 * I need to implement removal of the 'sage:' prompts in the input cells. I think its just a matter of cell input processing some where.
 * I am playing with different ways to get the actual documentation html to display.
  * One way is to just put %html at the begining of every block of documentation text and evaluate it as cell input. This leaves ugly and unnecessary input cells everywhere.
  * Another thing I tried was to kind of trick the Cell class by making a hack function that simply returns the documentation html where a cell would go. This is nice because the documentation blocks and the cell blocks stay in order, but it makes the cell_id_list screwy and it causes issues with typesetting using jsMath.
 * I'm wondering if we should try to implement a more general Cell. In the Mathematica notebook you can designate a cell as input(default) or as text or as one of many other things (including section dividers, which are nice). This would make it a lot cleaner to implement the help browser, and would be a good feature in general for organizing notebooks. (Maybe somebody already suggested this, I haven't been keeping up with the idea list; also, I know Cell.py already has functions to format the output to html (and I am hacking them up while trying figure out how to use them) but my main concern is: should the documentation be a cell in the woorksheet, or just embeded between evaluatable cells?)
 * How should the pre-printed outputs of the example sage evaluations be displayed? At first, it seems like you wouldn't want to keep them in the input cell (meaning they could be thrown away by the documentation html processor) because they will cause evaluation syntax errors. But you need them as a check, so maybe they can be printed as a seperate cell, or routed to the output cell directly when the page is loaded...
[[BR]][[BR]]
'''Other things:'''[[BR]]
wiki-formated output of a sage notebook (a built in notebook function).[[BR]]
 * ["dmr/notebookwiki"]: notebook wiki
 * [:dmr/example:examples]
