

# Sage Days 87: p-adics in Sage and the LMFDB (July 17-22, 2017)

[[_TOC_]] 

Location: University of Vermont, in Burlington, VT. 


## Schedule

Activities will begin the morning of Monday, July 17 and end around in the early afternoon on Saturday, July 22.  The workshop will be primarily project-focused, though there will be a few talks. 

On the first day Mckenzie West will lead some activities to help novices get oriented with Sage. If you are a novice and would like more information as well as ways to prepare, please scroll down to <a href="/days87#To_prepare_for_the_workshop">To prepare for the workshop</a> below. 

All events below take place in **University Heights South room 133**, except as noted. 

**Monday, July 17** 

* 9:45: Welcome, announcements 
* 10:00: David Roe, Introduction to p-adics in Sage 
* 11:00: John Jones, Introduction to the LMFDB 
* 2:00: Daily general meeting 
* following: Mckenzie West, Get oriented with Sage, University Heights North 119 
**Tuesday, July 18** 

* 10:00: William Stein, <a class="https" href="https://k8s.sagemath.org/app#projects/da1818ed-996d-4de6-acc6-361415b7725d/files/Talks/william/state-of-sage.ipynb">State of Sage</a> 
* 10:20: William Stein, The modular forms code in Sage 
* 11:00: Daily general meeting 
**Wednesday, July 19** 

* 10:00: Tristan Vaccon: Characteristic polynomials of p-adic matrices 
* 11:00: Daily general meeting 
**Thursday, July 20** 

* 10:00: Ben Hutz: Dynamical systems in Sage 
* 11:00: Daily general meeting 
**Friday, July 21** 

* 10:00: Marc Masdeu: Distributing Sage/Python code the right way 
* 11:00: Daily general meeting 
**Saturday, July 22** 

* 11:00: Daily general meeting, wrap up 

### Location map

Here is a <a class="https" href="https://www.uvm.edu/~cvincen1/images/locationmap.pdf">campus map</a> with University Heights circled in green. The check in location for the dorms is also indicated by an arrow. Check in is in University Heights North, but all of our dorm rooms as well as the main room in which we will be meeting (University Heights South 133) are in University Heights South. 

Our rooms are 

* University Heights South 133 
* University Heights North 119 
* University Heights North 016 
* Living and Learning Building B B132 
* Living and Learning Commons 302 
We have power strips, blank paper, paper easels and markers available in the common room. 


## Projects

Feel free to add suggestions to our <a href="/days87/projects">list of projects</a> 

Please add "sd87" as a keyword to any tickets you are working in during this week so they show up in this list: <a class="https" href="https://trac.sagemath.org/query?keywords=~sd87&amp;col=id&amp;col=summary&amp;col=status&amp;col=type&amp;col=priority&amp;col=milestone&amp;col=component&amp;order=status">sd87 Tickets</a> 


## Participants

See our <a href="/days87/participants">list of participants</a>. 


## Lodging and Travel

If you still need the info on lodging and travel arrangements, <a href="/days87/travel">look here</a>.  Check out is Sunday July 23 at 11am, and the front desk's number is 802-656-5550. 

You can use <a class="https" href="https://docs.google.com/spreadsheets/d/1vwwQd-Ig3nZRY-e2jihL72g6hnH0KUfXAoaOeXkccks/edit?usp=sharing">this google doc</a> to share taxi rides. 


## Reimbursements

Instructions for reimbursements will be given on the first day of the conference. If you are **not** a US citizen or green card holder, please bring your passport and any visa paperwork you have (I-94, visa stamps, etc.) so that we can make scans while you are here. 


## Internet on campus

The University of Vermont offers <a class="https" href="https://www.eduroam.us/">eduroam</a> on campus. To access the network at UVM, please take a few minutes to set up your laptop before traveling, while you are on your home university campus. If you do not have eduroam, please contact Christelle Vincent to receive a guest log in for UVM's network. 


## The k8s server

William has kindly provided a server for us to use during the workshop, with 48 CPUs and 256 GB of RAM.  It is running CoCalc, so you can access it from your browser. 


### Creating an Account

You should create an account <a class="https" href="https://k8s.sagemath.org/settings">here</a>.  You will need a secret token, which has been e-mailed to participants (ask someone if you can't find it).  Once you have an account, someone will have to add you to the Sage Days 87 project; anyone who is already part of the project can do so from the project settings page.  At that point, you will be able to access the server at <a class="https" href="https://k8s.sagemath.org">k8s.sagemath.org</a>. 


### Git

If you will be doing Sage development, you need to set up a terminal that knows who you are (since we're all using the same user when we log in from the browser).  This way we will be able to share Sage installations on the server.  To set this up, open up a terminal (`~/Terms/Admin.term` exists for this purpose) and run the script `setup_user`.  This will ask you some questions (name, e-mail, trac account info) and create a terminal for you (`~/Terms/$TRAC_USERNAME.term`).  It will also create an ssh key specific to you that you should upload to <a class="https" href="https://trac.sagemath.org/prefs/sshkeys">trac</a>.  If you're ever interacting with git, you should use this terminal (or the ssh method described below).  In particular, please don't set the git configuration on any of the Sage installations. 

Note that by default, it will store your trac password in plain text in a file on the server.  If you don't want it to, just answer "No" to the "store trac password" question, and you'll be asked for it at the beginning of each ssh session. 


### SSH

Once you add the public key _from your laptop_ (generated by `ssh-keygen` and then copied from `~/.ssh/id_rsa.pub` for example) to `~/.ssh/authorized_keys` _in the browser_, you will be able to SSH into the project using the following command. 

`ssh da1818ed996d4de6acc6361415b7725d@k8s-ssh.sagemath.org -p 2222` 

At the beginning of your key in `~/.ssh/authorized_keys` you should add `command=".init_user roed" ` for example.  You can look at the other keys there for examples. 


### Sage installations

You can create a new Sage installation within a couple minutes as follows (replace BLAH with the name of your installation, e.g. your trac username): 


```txt
cd ~/Src/
./new_sage BLAH
```
Now `sage-BLAH` is available for you to work on a ticket.  If you think you'll be doing a lot of development, feel free to create your own installation (labeled with your trac username); if you're less experienced you might share one as part of a group. 


### Building and Large output

Avoid sending huge amounts of output in a terminal, as this slows the whole project down for everybody (proper output truncation isn’t sufficiently implemented). 

Instead, please do 
```txt
./sage -b > output 2>&1
```
rather than just sending a large amount of output to your terminal.  You can check on output by typing 
```txt
tail output
```
Alternatively, if you know tmux, do control+b, then c to make a new session, and leave the large-output session in a different session.  You can switch back and forth with control+b then n. 

If you've set up your terminal as described above, then 
```txt
make build
```
in your sage folder will do the redirection for you, as well as automatically use many threads (so that the build goes much faster). 


### Jupyter notebooks

[edited by William Stein] 

Our custom Sages ARE available from Jupyter notebooks.  Just make a copy of /projects/da1818ed-996d-4de6-acc6-361415b7725d/.local/share/jupyter/kernels/sageroed (next to it) and edit kernel.json to point to your install.   See <a href="https://github.com/sagemathinc/cocalc/issues/2201">https://github.com/sagemathinc/cocalc/issues/2201</a> 


### Tmux

The current CoCalc terminal implementation has some bugs with resizing inserting strange control characters.  The fix is to type tmux after you've opened and logged into your personal terminal, or to just use SSH. 


## Local dining options

Check out the <a class="https" href="https://drive.google.com/open?id=1A2B4-EmWB1cUQat364SzVJV9aD4&amp;usp=sharing">map</a> Christelle made!  Some people will be getting takeout for dinner. 


## To prepare for the workshop

On the first day of the workshop, <a class="http" href="http://people.reed.edu/~westm/">Mckenzie West</a> will lead some activities to help novices get oriented with Sage. Stay tuned for more details. Before the workshop, we recommend <a class="http" href="http://www.sagemath.org/">downloading and installing</a> the latest version of the source code of Sage, opening a <a class="https" href="https://trac.sagemath.org/">Sage trac</a> account and completing the <a class="https" href="https://www.codecademy.com/">Code Academy</a> modules on Python and Git. 

If you have never done any LMFDB development work and might want to start -- a workshop is by far the best place to get started. A starting point is have a recent installation of Sage on your own laptop, on top of which you can run the LMFDB website software with a little setting up. Here is how to do it: <a href="https://github.com/LMFDB/lmfdb/blob/master/GettingStarted.md">https://github.com/LMFDB/lmfdb/blob/master/GettingStarted.md</a> 

For this workshop, we have dedicated server for readonly purposes that simplifies some of the steps. If you add to your LMFDB directory a file called `mongoclient.config` with the following content: 
```txt
[db]
port = 27017
host = readonly.lmfdb.xyz 
```
* then you can run the LMFDB as usual by doing: 

```txt
 sage -python start-lmfdb.py --debug
```