

# The SAGE Notebook

<a href="/days4/projects/">Other SAGE Days 4 Project</a> 

Participants: William Stein, Tom Boothby, Robert Miller, Dorian Raymer, Alex Clemesha, Yi Qiang, Bobby Moretti, and Timothy Clemans. 

* A snapshot of work is posted at /home/was/twisted/.   Read the README.txt file there for complete instructions to get up to speed.  
These are the tasks that need to be accomplished, in order of importance. 

1. (in progress) **A User Model** Make it so each user of the notebook has an account on the notebook, and can only see worksheets that are explicitly shared by other users.   (I.e., we need either an account and ownership model or a wiki model for the notebook.  Email/registration.  An account model makes the most sense). <a href="/days4/projects/account">This page has more about the account model.</a> 
         * Bobby, William, Tom, ....  
1. (done) **Secure Separate User Process** Create an option so that processes that run the actual worksheets can be started as a different user.  This will be slower, but could be vastly more secure.  <a href="/days4/projects/sepuser">More about this</a> 
         * William Stein, Bobby, Tom, Dorian, Timothy -- 3 hours of design; 3 hours implementation. 
1. (done) **Twisted Web2** Convert the web server so that it uses twisted's web2 server  
            * William -- what remains: 
                           * (done) Interactive help browser really being interactive. 
                           * (done) Upload and download of worksheets 
1. (done) **SSL Encrypted** Make it so that the server use GNUTLS to *secure* all communications and logins  (current: openssl) 
         * (done) Yi -- 1 hour: subclass something and replace listen ssl with gnutls.  
         * (done) Need to make it so dsage uses gnutls to generate certificates.  
         * (done) Url--goes to http instead of https. 
1. **Rating system of published worksheets** Users should be able to rate published worksheets, similar to how iTunes allows you to rate your song. 
         * I propose a rating of 1-5 stars (iTunes, Google Video both use this scale).   
         * Worksheets can store their ratings as an attribute 
         * Have methods set_rating() and get_rating() 
         * Keep number of ratings (i.e. one 5 star rating is a lot more dubious than 25 ratings that average to 4 stars) 
         * Each user should be allowed to register only one vote for a worksheet, but they should be allowed to re-rate a worksheet at will 


---

 


## If time permits

* **Save/Load Worksheets/Plain Mode** Rewrite saving/loading of worksheets, so it doesn't use pickle.  Instead use the `'`'s text encoding and the images in directories. XML, plain text format, etc.  Finish implementing the html/edit mode: (1) images shouldn't get deleted on saving, (2) inserting new cells shouldn't be broken. 
            * Alex Clemesha, Dorian, Tom, Yi 
* **Make it look good**  
            * Timothy, and everybody -- time. 
* **Don't lose work** If anything in a page changes, make it so trying to navigate away from the page requires confirmation (like in gmail) 
            * Dorian, Tom -- 1 hour 
* User should be able to create their own css, which is partof their profile. 
* **Internet Explorer 7** support 
      * <a href="http://www.webdeveloper.com/forum/archive/index.php/t-102141.html">http://www.webdeveloper.com/forum/archive/index.php/t-102141.html</a> 
* **Worksheet Revision Log** Revision log for worksheets. like moin-moin; SAVE when -- hit a big "save" button or exit a worksheet. 
* Interface issues: 
      * Highlighting a block of text and pressing tab indents it four spaces; similarly, pressing shift-tab dedents it four spaces. 
      * In the notebook some input cell should *always* have focus, if this is possible.  I hate typing into a worksheet and having random movement happen. 
* Create a **worksheet settings panel**; use this to: 
      * Set the math software system used to evaluate cells 
      * Determine whether pressing shift-enter jumps to the next cell or stays in current one. 
   * Create a **notebook settings panel**: 
      * Whether or not left panel is displayed by default 
      * Whether shift enter or enter evaluates a cell (Mathematica or Maple mode) 
      * Default math software system for new worksheets. 
* New feature -- pdf printing; **Printing** needs to also allow for the following: Given a single worksheet, print it by (1) saving it to a latex file with embedded images, and (2) running pdflatex on the result, then return the resulting pdf file and/or a tarball with the images and latex. This would be very high quality, and will also be something that would be easily included in latex documents.  Printing a notebook (=all worksheets owned by a given user) would create a document with a section for each notebook. 
* Published notebook should be rate-able.  
* Focus-on-cell mode should flip through slides, which should be well-defined sections of the worksheet. 
* Implement correct tab completion in the worksheet when in system-other-than-sage mode (i.e., don't put magma.foo[tab]) 
* Add support for user javascript in the worksheet cells along with basic graphics (Robert Miller). See <a href="http://www.sagemath.org:9002/sage_trac/ticket/359">http://www.sagemath.org:9002/sage_trac/ticket/359</a> 
* Come up with clever new ideas to address the "jupiness" of the notebook, e.g., Justin Walker reports that in Safari under OS X, "I reach the bottom of the visible page, and scroll down to make the next cell visible, enter an expression, and hit SHFT- Return, the page jumps back to the top." 
* Implement some of the features of Google Notebook (<a href="http://www.google.com/notebook">http://www.google.com/notebook</a>)  -- note we were before them. 
         * Full search of all worksheets 
         * Cleaner display of worksheet list on the left 
         * Drag and drop 
* (I'm *not* convinced that this is the right thing to do, or should be a high priority).  New directory structure / never an sobj -- *BUT* maintain backwards compatibility with existing notebooks (!). 
      * /notebook 
         * config.txt #config file for notebook in standard config file format 
         * /history 
         * /data (contains objects & stuff) 
         * /codes (contains attachable scripts & stuff) 
         * /worksheets 
            * /_scratch_ (for example) 
               * _scratch_.txt (contains worksheet wiki text + config-file format header) 
               * /cells 
               * /images? 
         * /userinfo (contains SQLite database to control access / session / user stuff & stuff) 
      * Note -- when one saves a worksheet (or set of worksheets), all objects that they link to must be included in the saved worksheet! 
* Javascript feature: click & drag on a plot to zoom.  Tom really wants this. Bobby seconds this. It's a killer feature. Perhaps google maps style? 
* Create a quiz-mode for worksheets, which satisfies the requirements of a quiz system. 