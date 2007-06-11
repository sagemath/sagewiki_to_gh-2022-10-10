= The SAGE Notebook =

[:days4/projects/: Other SAGE Days 4 Project]


Participants: W Stein, Tom Boothby, Robert Miller, Dorian Raymer, Alex Clemesha, Yi Qiang, and Timothy Clemans: Improve '''The SAGE Notebook'''

  1. (mostly done) Convert the web server so that it uses twisted's web2 server 
  1. Make it so that the server use https to secure all communications and logins
  1. Figure out precisely why the notebook feels sluggish when running locally on _certain_ platforms.  Consider removing features in the interest of speed.  Also seriously consider making it so maybe 3 SAGE instances are pre-started by the notebook server when it is fairly idle so that new worksheets appear to starting working immediately.
  1. Make it so each user of the notebook has an account on the notebook, and can only see worksheets that are explicitly shared by other users.  Worksheet names would internally be prefaced with the user name.
  1. Interface issues:
   1. Highlighting a block of text and pressing tab indents it four spaces; similarly, pressing shift-tab dedents it four spaces.
   1. Uploading a worksheet should not display an empty page.
  1. Create a worksheet settings panel; use this to:
   1. Set the math software system used to evaluate cells
   1. Determine whether pressing shift-enter jumps to the next cell or stays in current one.
   1. Determine whether or not the side bar is displayed (the left button wall could still be used to toggle it).
  1. In the notebook some input cell should *always* have focus, if this is possible.  I hate typing into a worksheet and having random movement happen.
  1. Create a notebook settings panel:
   1. Whether or not panel is displayed by default
   1. Whether shift enter or enter evaluates a cell (Mathematica or Maple mode)
   1. Default CAS for new worksheets.
   1. Whether or not SAGE logo at top left is displayed (or another log is displayed in its place, which is copied to .sage when selected).
  1. Change "slide-show mode" to "single cell mode".  Make it so the editor in this mode is a full-fledged code editor.
  1. Slide-show mode should flip through slides, which should be well-defined sections of the worksheet.
  1. Printing needs to be rewritten as follows: Given a single worksheet, print it by (1) saving it to a latex file with embedded (vector, if possible) images, and (2) running pdflatex on the result, then return the resulting pdf file and/or a tarball with the images and latex. This would be very high quality, and will also be something that would be easily included in latex documents.  Printing a notebook (=all worksheets owned by a given user) would create a document with a section for each notebook.
  1. Rewrite saving/loading of worksheets, so it doesn't use pickle.  Instead use the {{{'}}}'s text encoding and the images in directories.
  1. Finish implementing the html/edit mode: (1) images shouldn't get deleted on saving, (2) inserting new cells shouldn't be broken, and (3) it would be really nice, and probably easy, to have a WYSIWYG html editor mode like the one in moinmoin in which I'm writing this right now.
  1. Fix the bug where variables aren't listed in the sidebar.
  1. Implement correct tab completion in the worksheet when in system-other-than-sage mode (i.e., don't put magma.foo[tab])
  1. Add support for user javascript in the worksheet cells along with basic graphics (Robert Miller). See http://www.sagemath.org:9002/sage_trac/ticket/359
  1. Create an option so that processes that run the actual worksheets can be started as a different user.  This will be slower, but could be vastly more robust.  With sufficient thought there might be a trick to implement this in a few lines of code.
  1. Add a lock button in upper left that looks like a lock.  When clicked one can't accidentally navigate away from a worksheet with out confirming.
  1. Fix bugs:
   1. The interactive help at sagenb.org and sagenb.com often doesn't appear unless one hits refresh a few times.
   1. Come up with clever new ideas to address the "jupiness" of the notebook, e.g., Justin Walker reports that in Safari under OS X, "I reach the bottom of the visible page, and scroll down to make the next cell visible, enter an expression, and hit SHFT- Return, the page jumps back to the top."
  1. Implement some of the features of Google Notebook (http://www.google.com/notebook)  -- note we were before them.
   1. Full search of all worksheets
   1. Cleaner display of worksheet list on the left
   1. Drag and drop
  1. New directory structure / never an sobj -- *BUT* maintain backwards compatibility with existing notebooks (!).
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
  1. Javascript feature: click & drag on a plot to zoom.  Tom really wants this. Bobby seconds this. It's a killer feature. Perhaps google maps style?
  1. Create a quiz-mode for worksheets, which satisfies the requirements of a quiz system.
