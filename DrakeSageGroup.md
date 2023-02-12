

# Drake Sage Group

[[_TOC_]] 

This page documents activities of the <a class="http" href="http://www.drake.edu">Drake University</a> Sage group.  We regularly meet on Fridays, 11:30-12:20, in Howard 111 (at Drake University, Des Moines, Iowa, USA) 

Our initial work is on a <a class="http" href="http://groups.google.com/group/sage-notebook/browse_thread/thread/02db9861b755c61d/4150e558c418ba30?#4150e558c418ba30">single-cell compute server</a>, which basically is a webpage that can execute an arbitrary block of Sage code. 

For more information, please contact Jason Grout at `jason#grout@drake.edu` (replace the # with a .) 


# Getting Started

         * install Sage or <a class="http" href="http://www.python.org/">Python</a>, <a class="http" href="http://ipython.scipy.org/moin/">ipython</a>, <a class="http" href="http://mercurial.selenic.com/">mercurial</a> 
         * install <a class="http" href="http://www.mongodb.org/">mongodb</a> 
         * install <a class="http" href="http://api.mongodb.org/python/1.9%2B/index.html">PyMongo</a> and <a class="http" href="http://flask.pocoo.org/">Flask</a> python modules: ```txt
# from within python
from setuptools.command import easy_install
easy_install.main(["flask"])
easy_install.main(["pymongo"])
```
         * configure mercurial: put this in your ~/.hgrc file ```txt
[ui]
username = YOUR NAME <YOUR EMAIL>

[extensions]
record=
convert=
hgext.mq=
hgext.extdiff=
hgk=
transplant=
fetch=
```
         * Create a <a class="http" href="http://code.google.com/">Google code</a> account 
         * clone the <a class="http" href="http://code.google.com/p/simple-python-db-compute/">simple-db-compute</a> repository (either just clone it locally, or clone it on google code and then pull from your clone) 

# Projects


## Single Cell Server

Here are some project ideas for simple-db-compute, along with some hopefully helpful pointers to resources. 

   * A: ZeroMQ COMMUNICATION/IPYTHON: Implement a zeroMQ-based device (using zeromq to communicate between a worker process and the device).  This makes it easier to support workers in a virtual machine, for example, or on a different computer or across multiple computers.  Good articles about zeromq and messaging are: <a class="http" href="http://www.imatix.com/articles:whats-wrong-with-amqp">http://www.imatix.com/articles:whats-wrong-with-amqp</a>, <a class="http" href="http://www.zeromq.org/whitepapers:multithreading-magic">http://www.zeromq.org/whitepapers:multithreading-magic</a>.  William has already implemented a thing close to what we want: <a href="http://code.google.com/p/sage-device/">http://code.google.com/p/sage-device/</a>.  In fact, it's probably even better to just use IPython 0.11 and the built-in 0MQ communication capabilities of the IPython server. 
         * ```txt
Here is a complete execute request in the current IPython html notebook

CLIENT->DB->DEVICE

{
"header":{"msg_id":"DB_ID","username":"","session":""},
"msg_type":"execute_request",
"content":{"code":"CODE USER TYPES IN",
           "silent":false,
           "user_variables":[],
           "user_expressions":{}},
"parent_header":{}}

Hereonafter, PARENT_HEADER={"msg_id":"DB_ID","username":"","session":""}, the original message header.

DEVICE->DB->CLIENT

UNNECESSARY: status of kernel---we will only ever have one busy, then one idle.  For now, don't send this.  When we use ipython 0.11, have the device just ignore this.

{"content":{"execution_state":"busy"},
"header":{"username":"","msg_id":0,"session":""},
"parent_header":PARENT_HEADER,
"msg_type":"status"
"msg_counter":0}

UNNECESSARY: code input---Since we are storing also the original computation request, we don't need this.  

{
"content":{"code":"1+2"},
"header":{"username":"","msg_id":1,"session":"",
          "msg_counter":1},
"parent_header":PARENT_HEADER,
"msg_type":"pyin"}

COMPUTATION REPLY:

{
"content":{"execution_count":1,"data":{"text/plain":"3"}},
"header":{"username":"",
          "msg_id":MSG_COUNTER,
          "session":"",
          "msg_counter":3},
"parent_header":PARENT_HEADER,
"msg_type":"pyout"}

    (EXAMPLE FOR A PLOT COMPUTATION:)
    
    {
    "content":{"source":"Matplotlib Plot",
               "data":{"image/svg+xml":"SVG_DATA",
               "application/x-url":"file_id"},
               "metadata":{}},
    "header":{"username":"","msg_id":8,"session":"",
              "msg_counter":2},
    "parent_header":PARENT_HEADER,
    "msg_type":"display_data"}


    (EXAMPLE FOR A FORMATTING MESSAGE, which uses the *same* message protocol, just with our message wrapped inside the 'content' block with an outside msg_type of 'extension':)

    {
    "content":{"msg_type": "formatting", 
               "content": {"data": "Start Table"}},
    "header":{"username":"","msg_id":8,"session":""},
    "parent_header":PARENT_HEADER,
    "msg_type":"extension"}



END OF COMPUTATION MARKER:

{
"content":{"status":"ok",
           "execution_count":1,
           "payload":[],
           "user_expressions":{},
           "user_variables":{}},
"header":{"username":"","msg_id":3,"session":""},
"parent_header":PARENT_HEADER,
"msg_type":"execute_reply"}


UNNECESSARY: signify the kernel is idle.

{
"content":{"execution_state":"idle"},
"header":{"username":"","msg_id":4,"session":""},
"parent_header":PARENT_HEADER,
"msg_type":"status"}

```
         * Instead of a single output like now, have multiple outputs stored in the database as separate records, but with a pointer to the parent execution request headers (index the parent msg id field).  Is this faster than having a single db document with an output field that contains a list of messages that keeps being updated and parsed? 
         * Make an index on {'parent_header'} so that it is easy to retrieve messages that are in reply to a given execution request.  For us, this parent_header will virtually always be basically an ID instance; will it be a lot slower than just using an id instance? 
   * A: IPYTHON HTML NOTEBOOK: Examine the ipython html work and see if we should use some of that code. See <a href="/DrakeSageGroup#IPythonInstructions">instructions for ipython</a> 
   * A: LOAD TESTING: (Ira has worked on Tsung, Jason has worked on Multi-mechanize):    
               * Goal: 500 requests per second, with a total computation time of 1 second or less (I just pulled these numbers out of the air) 
   * FRONT END 
               * A: Differentiate between stdout lines, stderr lines, and pyout lines (lines generated from the python system display) lines.  Here, we might as well follow the <a class="http" href="http://ipython.github.com/ipython-doc/dev/development/messaging.html">IPython messaging spec</a> to transfer these to the client. 
               * A: Implement the side-channel messaging scheme we discussed at Sage Days 29 with Fernando Perez, Rado Kirov, Robert Bradshaw, Ira Hanson, and Jason Grout (see one of those people).  This would replace the current encapsulation of stdout/pyout streams in content-aware JSON containers with interleaved formatting messages and lines from stdout or pyout 
               * A: Change the JSON protocol to be the <a class="http" href="http://ipython.github.com/ipython-doc/dev/development/messaging.html">ipython messaging protocol</a>.  Our custom messages would be sent with message type 'extension'.  The work done on the IPython html frontend might contain useful code for doing this.  We should possibly use their code for some of it or contribute our code upstream (BSD-licensed). 
               * A: Encapsulate all of the input/output functionality in a single self-contained javascript object so that it is easy to have multiple textareas representing different single-cell blocks on a page.  Converting a textarea to a single-cell server should just involve something like `SingleCellBlock(element)` where `element` is a textarea DOM node. 
               * B: Web frontend should handle these types of streams 
                        * [ X ] Text: `{'type'='text', 'content'='...'}`: put the content in a `<pre>` element 
                        * [ X ] Image: `{'type'='image', 'file'='filename.png'}`: Make an `<img src='filename.png' />` element 
                        * [  ] Html: `{'type'='html', 'content'='...'}`: put the content (as html) in a `div` element. 
                        * [  ] Table: (nested streams which specify a table begin/end, row begin/end, and cell begin/end). 
               * B: Use <a href="/CodeMirror">CodeMirror</a> for the textbox 
               * B: Help finish the <a class="https" href="https://groups.google.com/forum/?pli=1#!topic/codemirror/3OuVlGivzGE">python mode</a> for <a href="/CodeMirror">CodeMirror</a> 2 and use <a href="/CodeMirror">CodeMirror</a> 2 instead 
               * Use <a href="/MathJax">MathJax</a> to format the output (set a switch to toggle using <a href="/MathJax">MathJax</a> or seeing it plain; the switch would have to communicate to the backend to tell it to send text or latex; or maybe the backend could automatically use the displayhook to send *both* text and latex) 
   * FILE STORES 
         * A: Make the SQLAlchemy filestore (defaulting to a sqlite files.db database which stores the files as BLOBs) 
         * B: If a file was referenced in another stream object (maybe a plot?), then maybe the file shouldn't be added to this stream object, or maybe there should be two stream objects---one for files that were referenced in another stream, and one for files that weren't referenced in another stream. 
         * C: Make a filesystem filestore, which stores the files on the filesystem so that nginx can serve them up directly without having to go through flask.  This will likely be much faster than going through flask and a <a href="/FileStore">FileStore</a> object and database. 
   * B: DOWNLOAD STREAMING: Make the client tell the server what it has already (maybe a message number if implementing the IPython messaging spec) so that the server doesn't have to send all messages every time the client asks for more output. 
   * B: SECURITY: Understand security issues with running Python code (see <a class="http" href="http://stackoverflow.com/questions/3688708/python-safe-sandbox">http://stackoverflow.com/questions/3688708/python-safe-sandbox</a> or <a class="http" href="http://codepad.org/">http://codepad.org/</a> or <a class="http" href="http://pts-mini-gpl.googlecode.com/svn/trunk/uevalrun/doc/uevalrun.html">http://pts-mini-gpl.googlecode.com/svn/trunk/uevalrun/doc/uevalrun.html</a>, for example.  Maybe we should support running code under user mode linux?) 
         * Here is a possible design. 
      * ```txt
1. Device queries the database and gets a computation
2. Device queues up an Execution object with the computation in a multiprocessing Pool 
   (can multiprocessing queues take objects rather than just functions?).  The device opens up a queue for messages with the Execution object.
3. The execution object runs the code, uploads any files into the filestore, 
   and continually feeds output and formatting messages into the queue.
4. The device picks up the output from the queue and puts it back in the database
5. A Sage-cleaner-like process cleans up the Execution object if needed after the object disappears.  See the Sage-Cleaner system already in Sage.
```
         * The execution object is flexible in how it can execute code.  It may: 
               * Fork an existing Sage process running under a nobody user, then change to a temporary directory, execute the code.  Then examine the directory to upload created files into the filestore and parse the output to be a JSON description of the streams 
               * Communicate with a program in a VM to do this. 
               * Change to a temporary directory, exec the code, then upload the created files and parse the output to be a JSON description of the streams. 
   * B: Write <a class="http" href="http://pypi.python.org/pypi/unittest2">unittest2</a> suite of tests which exercise the protocol 
   * C: Look at <a class="https" href="https://github.com/acleone/sageserver">Alex Leone's new notebook code</a> for what improvements we should merge with our work. 
   * C: LONG POLLING: Look at running flask and uwsgi in async mode to do long-polling (i.e., comet) instead of the current normal polling.  See <a href="http://projects.unbit.it/uwsgi/wiki/AsyncSupport">http://projects.unbit.it/uwsgi/wiki/AsyncSupport</a> 
   * C: WINDOWS: Figure out what needs to happen to get this all working on Windows and write up a "Getting started to developing simple-db-compute on Windows" page.  For example, make a start_mongo.bat file or something. 
   * C: CELERY: Look at using <a class="http" href="http://celeryproject.org/">Celery</a> for managing device workers. 
   * C: THREADS: Start reading/experimenting with threads and gunicorn and gevent to serve up the simple-db-compute. 

## Parts that are done

These projects are done.  They may still be able to be improved, though. 

         * DONE (Jason, Ira, Ryan): Output streams---Write a Python library to make output "streams" which could represent different objects.  For example, one stream could be a stdout (text), while another stream could be html code.  The workers can call the functions to make a new stream of a specific type.  The function inserts into the stdout some marker indicating a new stream is starting.  The device recognizes that marker and inserts the stream information into the database.  The web front end also recognizes the streams and has special code to handle each type (for example, text streams are put inside of a <pre>, while html streams are just added to the document, maybe inside of a div.  For a longer explanation of this, see the <a href="/Notebook%20design">Notebook design</a> page. 
   * DONE: Make flask assign a random computation id to each incoming request, return that computation id to the browser as a return value in the ajax call.  Then make the browser keep asking the server for the results of that particular computation id.  When results exist, send the result back to the browser.  Otherwise, send back some message that the results are not computed yet. 
   * DONE: Make the web interface use AJAX to send a computation and display a result.  Helpful resources: <a class="http" href="http://api.jquery.com/jQuery.ajax/">Jquery AJAX</a>, google for numerous jquery ajax tutorials.  You will probably want to create a javascript file in the static/ directory and add it to templates/base.html (follow the examples already there adding jquery, for example).  I would suggest using something like JSON to send and receive messages with the server.  Maybe using long polling (see <a href="https://github.com/RobertFischer/JQuery-PeriodicalUpdater/">https://github.com/RobertFischer/JQuery-PeriodicalUpdater/</a> for example) 
   * DONE (Ira): Make the AJAX and computation ID stuff work in sqlite (it works in mongodb right now). 
   * DONE:  Configure apache, nginx, or lighttpd to serve up simple-db-compute.  Test its scalability compared to the default really simple python http server.  It looks like nginx with uwsgi might be a interesting option to explore. 
   * DONE: On the backend, write a device that keeps a pool of workers (maybe using the python multiprocessing library) and keeps those workers busy with computations from the database.  Ideally, the polling of the database should not be blocked by worker computations.  Instead, on each poll, workers that are finished should have output put into the database, and new computations should be pulled out of the database.  It seems like a good idea to avoid trying to put each output in the database as it happens.  Rather, batch up the database updates to happen once in a polling interval. 
   * DONE: Port the sqlite backend to actually use sqlalchemy so that it can also talk with mysql and postgresql, etc. 
   * DONE: Make the output be dynamically updated, rather than only updated at the end of the output.  To do this, the device needs to be continuously updating the database with the output and the AJAX part needs to be downloading parts of the output. 
   * WONTFIX: Try using callbacks in the device process rather than 0-time polling.  Are there race conditions with callbacks?  EDIT: Queuing the output like is currently done is a better idea than polling for output anyway. 
   * WONTFIX: Make the new_stream functions recognize any files created and automatically make new streams for each file (this may involve copying the files to a temporary directory so they can be inserted into the database).  REASON: We won't do snapshotting of files in between streams; it is too complicated, time-wasting, and somewhat confusing. 
   * DONE: Filestores: 
               * Changing the worker processes to execute the block of code in a temporary directory, then have the device look in that directory for files that were created 
               * Making the device store the created files in a filestore, as well as generate a stream object for the list of files.   
         * Make flask be able to create a URL resource for each file (following the format `http://localhost:5000/files/<cell_id>/<filename>`, maybe), which fetches the file from the filestore and sends it to the browser when needed.  Again, see design walkthrough in <a href="/Notebook%20design">Notebook design</a>. 

# Interact Snippet Website

Goal: Design an online library of interacts and other snippets of Sage code.  This library should allow: 

   * syntax-highlighting of snippets of code 
   * multiple files in a snippet 
   * logged-in users to upload or "fork" other people's snippets 
   * anyone to run a single-cell in the same directory as the files in the snippet (you can import things from the snippets) 
   * if the snippet is just a single file, anyone to run a single-cell after the contents of the file have been executed (this means that if no command is specified, it's as if I've typed the snippet into the command line) 
   * live interacts (available after the person has pressed "Run") 
   * tags on snippets, along with autocomplete on tags, etc. 
   * Comments on snippets or line-level comments (ala google code reviews or github commit comments) 
   * searching full-text or tags 
   * hierarchical browsing of tags/filtering system 
   * thumbnail screenshots maybe? 
   * some sort of rating system 
   * place for short blurb and title of the snippet 
   * links to relevant other snippets and tags 
   * Credit lines for primary author, contributors, and committers 
   * permalink to snippet 
   * link to view snippet as raw text, download snippet (zip if multiple files) 
   * community rating system 
   * "like this/email" links to various online sites (facebook, twitter, etc.) 
   * ability to view the entire commit tree of the snippet and related forks.  Ability to see from any snippet the recent activity on another branch.  Hmmm...but we don't want to just reimplement gitorious/bitbucket/github here; that's too big of a project 
We could use Mercurial or git to manage the snippets, but that might become pretty unwieldy for just single files (for example, how would we store the repositories on disk?  How would locking work?).  We could also just do records in a database (one record for each version of a snippet; locking is easier, but having multi-file snippets becomes more unwieldy).  Mercurial seems like it would be more efficient space-wise for the sorts of things that we want to do, and there is a nice python api for interacting with mercurial. 


## More Details

We use Mercurial (because it has a stable and complete python API) and maintain one repository per fork.  The database has this info for each repository: 

   1. Which object it was forked from 
   1. Which user owns the object 
   1. tags for the object 
   1. Comments on the repository (comments should contain the version number the comment was made on) 
   1. Where on disk the repository is located 
The repositories are stored in a directory structure that looks like: 


where the ## are the first two characters of a hash generated from the user name and the repository fork name.  The XXXXXX are the remaining 38 characters of the hash. 


# Regular Meetings


## 03 Feb 2010

Meet in Howard Hall 308 at 2pm (room reserved from 1:30-3, so come early if you want). 

   * Introductions 
   * What Sage is 
   * Overview of the simple-db-compute project and its architecture 
   * Resources 
         * <a href="/DrakeSageGroup">DrakeSageGroup webpage</a> 
         * <a class="http" href="http://code.google.com/r/jasongrout-db-compute/">Google code repository</a> 
         * <a class="http" href="http://groups.google.com/group/sage-notebook">Sage Notebook</a> mailing list -- subscribe to this 
   * Installfest--get the simple compute server up and running on as many people's computers as possible 
   * First goal of project 
         * familiarize yourself with the simple-db-compute source code 
         * add a "compute id" that is returned to the user.  The answers page then queries for just that computation's result. 
         * add necessary files to get this running on Windows (for example, a .bat file to start mongodb) 
         * Look at making the device more parallel/scalable.  See <a class="http" href="http://docs.python.org/library/multiprocessing.html">multiprocessing</a> (which includes functionality for pools of worker processes), or maybe use the <a class="http" href="http://hg.sagemath.org/sage-main/file/tip/sage/parallel">parallel code from Sage</a>.  The new experiments in <a class="https" href="https://groups.google.com/forum/#!topic/sage-devel/64dI4v_wtz0">forking Sage to start it up</a> also seem relevant. 
   * Next meeting time 

## 11 Feb 2011

   * Status reports 
   * Get people set up who weren't able to get everything installed and running last time 
   * Further discuss the design   

## 18 Feb 2011

   * Status reports 
   * Further discuss the design   

## 25 Feb 2011

   * Status reports 
   * Further discuss the design   
   * Follow up with people going to Sage Days 

## 04 Mar 2011

   * Status reports 
         * Code sprint last week 
   * Discuss design of the `FileStore` class  

# Group Code Sprints


## Tue, 01 Mar 2011 (2pm, Howard 235)

   * Done: Implement a simple streams functionality that lets a person do something like: 

```txt
print "hi"
new_stream('text')
print "bye"
```
and the "hi" and "bye" appear in separate "pre" html blocks. 


## Mon, 07 Mar 2011 (3:30pm, Howard 235)

   * Get the `FileStore` class working  
         * Make the device recognize any files created and automatically make new streams for each file.  This involves: 
               * Changing the worker processes to execute the block of code in a temporary directory, then have the device look in that directory for files that were created 
               * Making the device store the created files in a filestore, as well as generate a stream object for the list of files.  If a file was referenced in another stream object (maybe a plot?), then maybe the file shouldn't be added to this stream object, or maybe there should be two stream objects---one for files that were referenced in another stream, and one for files that weren't referenced in another stream. 
         * Make flask be able to create a URL resource for each file (following the format `http://localhost:5000/files/<cell_id>/<filename>`, maybe), which fetches the file from the filestore and sends it to the browser when needed.  Again, see design walkthrough in <a href="/Notebook%20design">Notebook design</a>. 
         * Make the SQLAlchemy filestore (defaulting to a sqlite files.db database which stores the files as BLOBs) 

## Tue, 08 Mar 2011 (2pm, Howard 235)


# IPythonInstructions

   1. Install pyzmq: `easy_install pyzmq` 
   1. Clone the <a class="https" href="https://github.com/ipython/ipython">ipython repository</a>.  Install IPython: `python setup.py develop`.  Make sure that the new ipython works: `ipython-qtconsole` 
   1. Install tornado: `easy_install tornado` 
   1. Check out the html branch: `git checkout origin/htmlnotebook` 
   1. Run `python IPython/frontend/html/notebook/ipythonhttp.py` 