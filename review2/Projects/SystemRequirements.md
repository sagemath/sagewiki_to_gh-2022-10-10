
We're considering various options (like using a combination of trac and github, or trac with a git plugin).  The following are some features we would like in whatever system we choose. 

* Everything is possible through an e-mail interface 
* Inline code comments 
* Easy hosting and low administrative effort 
* User-editable e-mail subscriptions based on component, file, keywords.... 
* Ability to delete your own patches and edit your own comments 
* Ability to request a reviewer 
* Currently in trac (0.11) if you're working on a comment and someone else makes a comment before you post, you need to manually resubmit after an initial failure 
* The flexibility to add our own fields, like dependencies 
* Easy for current developers to transition, easy for new developers to get involved. 
* Useful reports 
* We should have options if our hosting service goes down 
* There should be ways to migrate to another system if we choose to move again 
* Integration between trac server and source control 
* Integration with patchbot 
* Programmable API -- easy for us to interface with our own scripts 
* Inline comments are preserved locally 
Various options we've considered: 

* Trac + Github 
* Trac + Inline comments plugin + Git plugin 