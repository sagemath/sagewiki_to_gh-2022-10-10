This is a informal page for coordinating suggestions on improving the interact command.  At some point it should be either deleted, turned into a trac ticket, or more formal enhancement proposal.  Any commentary on the nuts and bolts of what code should be changed would be appreciated as well.


 Improvement/Suggestion list
    1. Input boxes should have a changable length - sometimes longer inputs are necessary, and these are not handled gracefully.
    2. Controls placed horizontally - it would save a lot of screen real estate if controls could be placed next to each other.
    3. Controls changing state of other controls - currently this is not possible.
    4. Image input - for example, being able to click and drag a point in a displayed image.  Probably hard to implement.
    5. Show current value next to slider control, perhaps also min/max: e.g. {{{[min] |----------------[V]----| value [max]}}}
    6. Add a 'point' control. One way to do it is to display two text boxes with the x and y coordinates for the point (measured in [0,1] coordinates) and a big colored dot. Whenever the dot is dragged onto an image, the x and y coordinates are updated to the ratio of the click coordinates to the image size. Less general than 4, but maybe simpler to implement.
    7. Integrate [[pyjamas|http://pyjs.org/]] into Sage so that we can build interactive widgets using standard object-oriented code. Include a new Callback_Canvas widget, such that a click or drag event on the Callback_Canvas triggers a call to the server that updates the image within the Callback_Canvas, or performs any other change in the interact.

== Links ==
 * [[http://code.google.com/p/playwith/wiki/Screenshots|R package playwith]] - similar idea, inside a gtk2 window
