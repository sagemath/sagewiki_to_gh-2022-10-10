

# Sage Days 88: Opening Workshop for a Year of Coding Sprints at the IMA


## General Information

Sage Days will kick off a year-long series of open-source software coding sprints at the IMA. This workshop will bring together mathematicians, engineers, educators, members of industry, and researchers from the national labs to discuss, design, and implement new algorithms and computational tools that will be of use to scientists and industry professionals.  All software developed during the workshop will be made freely available as part of the open-source mathematics software system Sage (<a href="http://www.sagemath.org">http://www.sagemath.org</a>). 

Themes of the workshop include applied representation theory, optimization, data science, machine learning, algebraic combinatorics, and computational number theory. The workshop will include talks on target features and the logistics of Sage development, including time for design discussions and coding sprints to implement the developed algorithms. 

In the ensuing year, workshop participants will be invited to return to the IMA in small groups to push the software development even further in coding sprints. 

**More Information at the IMA Webpage**: <a href="https://www.ima.umn.edu/2017-2018.2/W8.21-25.17">https://www.ima.umn.edu/2017-2018.2/W8.21-25.17</a> 

**Organizers**: 

* Jennifer Balakrishnan (Boston University) 
* Benjamin Brubaker (University of Minnesota) 
* Matthias Köppe (University of California, Davis) 
* Gregg Musiker (University of Minnesota) 

## Wishlist pad

<a href="https://hebdo.framapad.org/p/IMA-wishlist">https://hebdo.framapad.org/p/IMA-wishlist</a> 


## Wednesday Brainstorming for 2017-18 Coding Sprints (with contact or interested people listed)

Please add your name in the list below to the projects you are interested in or add your own project idea 

* Improving review process (possibly two meetings: 1) discussion and prototypes; 2) finishing the build) (David R.) 

* Speed Regression Testing Framework (David R.) 

* Sage Infrastructure (10-15 people (Vincent):  

   * Improving Sage build process 
   * Improving the patchbot 
   * Make docbuilds more robust 
   * Allow trac, github, google and Zulip accounts talk to each other - same sign-ins 
   * Improve ability to cite which sage packages are used in a given computation 
* Interacts and interactive mathematics (Franco, Fowler, Beezer) 

* Random testing and random generation (Vincent) 

* Compare benchmarks and functionalities of Magma vs. Sage (David R., Kiran, Aly, Edgar) 

* Function Fields (David R., Edgar) 

* Orders in quaternion algebras (David R., Aly, Edgar) 

* Modular Forms (Kiran) 

* p-adics (David R.) 

* Dedekind domains (Aly, Edgar) 

* Linear algebra (Edgar, Kiran) 

* Macaulay2 interface (Kiran) 

* Polyhedral geometry and optimization and link to Sage Days 84 (Jean Philippe) 

* Dealing with general schemes (Kiran) 

* Python 3 Compatibility (Franco) 

* Representation theory (Travis) 

* KLR algebras (Travis) 

* Schubert polynomials (Travis) 

* Real algebraic geometry (Vincent) 

* Geometry of surfaces - link with June 2018 conference in Toronto (Vincent) 

* Coxeter group/root systems and braid groups (Travis, Vincent,Jean-Philippe) 

* Common implementations of different trees of expressions, e.g. for algebraic numbers or symbolic ring.   Also for use in pedagogical assessment (Vincent, Duane, Fowler) 

* Cup product for cohomology (Fowler) 


## When and where?

August 21-25, 2017, at the IMA, University of Minnesota, in Minneapolis, MN, USA. 


## How to check out an old ticket

If you use the standard method `git trac checkout TICKET_NUM`, you will spend a long time rebuilding all of Sage. 

Instead, you can do the following: 


```txt
git checkout develop
git checkout -b t/TICKET_NUM/name
git trac fetch TICKET_NUM
git merge FETCH_HEAD
git trac push
```
You may need to fix merge problems during the merge, and then finish the merge by `git commit`. 


## The k8s server

William has kindly provided a server for us to use during the workshop, with 48 CPUs and 256 GB of RAM.  It is running CoCalc, so you can access it from your browser. 


### Creating an Account

You should create an account <a class="https" href="https://k8s.sagemath.org/settings">here</a>.  You will need a secret token, which will be e-mailed to participants (ask an organizer if you can't find it).  Once you have an account, someone will have to add you to the Sage Days 87 project; anyone who is already part of the project can do so from the project settings page.  At that point, you will be able to access the server at <a class="https" href="https://k8s.sagemath.org">k8s.sagemath.org</a>. 


### Git

If you will be doing Sage development, you need to set up a terminal that knows who you are (since we're all using the same user when we log in from the browser).  This way we will be able to share Sage installations on the server.  To set this up, open up a terminal (`~/Terms/Admin.term` exists for this purpose) and run the script `setup_user` (from anywhere).  This will ask you some questions (name, e-mail, trac account info) and create a terminal for you (`~/Terms/$TRAC_USERNAME.term`).  It will also create an ssh key specific to you that you should upload to <a class="https" href="https://trac.sagemath.org/prefs/sshkeys">trac</a>.  If you're ever interacting with git, you should use this terminal (or the ssh method described below) so that git knows who you are. 

Note that by default, it will store your trac password in plain text in a file on the server.  If you don't want it to, just answer "No" to the "store trac password" question, and you'll be asked for it at the beginning of each terminal session. 


### SSH

Once you add the public key _from your laptop_ (generated by `ssh-keygen` and then copied from `~/.ssh/id_rsa.pub` for example) to `~/.ssh/authorized_keys` _in the browser_, you will be able to SSH into the project using the following command. 

`ssh a39cf01fc6e44081aa52d632be263a45@k8s-ssh.sagemath.org -p 2222` 

At the beginning of your key in `~/.ssh/authorized_keys` on the server you should add `command=".init_user roed" ` for example.  You can look at the other keys there for examples. 


### Sage installations

You can create a new Sage installation for yourself by running  
```txt
new_sage
```
at your command prompt, or `new_sage $YOUR_TRAC_USERNAME` at any prompt (replacing `$YOUR_TRAC_USERNAME` with your trac username.  Note that this will take about 15 minutes. 

The setup described above also means that the `sage` command in your terminal will be aliased to your copy of Sage, and anyone will be able to use your sage install from a Jupyter notebook by selecting the appropriate kernel. 


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


## Year-long Program at the IMA

<a href="https://www.ima.umn.edu/2017-2018.2">https://www.ima.umn.edu/2017-2018.2</a> 

The program aims to further develop software that will be of use to academia and industrial scientists, as well as introduce <a href="/SageMath">SageMath</a> to graduate students and researchers and train them to become part of the developer community. Activities include an opening workshop and ongoing coding sprints that will allow teams of 2-8 participants to spend 3-5 days at the IMA. Projects must include a coding component using <a href="/SageMath">SageMath</a>; for example, coding sprints might propose to write new code for research in mathematics, science, or for industrial applications integrate a piece of open source software into the <a href="/SageMath">SageMath</a> platform develop interactive Sage worksheets for disseminating mathematics or use in mathematics education Visitors will receive office space in Lind Hall, access to the computing network, and additional technical support as needed.  

**More information and how to apply (<a href="https://www.ima.umn.edu/2017-2018.2#full-description">https://www.ima.umn.edu/2017-2018.2#full-description</a>):** 

Coding sprints are designed for teams 2-8 participants to spend 3-5 days at the IMA. Interested applicants should first initiate a <a class="https" href="https://trac.sagemath.org">trac ticket</a> (or describe an existing one) on the <a href="/SageMath">SageMath</a> trac server, explaining the proposed code. (Proof-of-concept code is not necessary at this stage, but welcome.) This will allow developers and users to comment on proposed changes and is the first, important step in the git workflow. 

Applicants should then complete a <a class="https" href="https://docs.google.com/a/umn.edu/forms/d/e/1FAIpQLSdpp6jpUJn-tt7I3aZYd5OQJj3T0Qt5yqq684XA4fhOmGzraw/viewform">short online application</a> and email a 1-2 page proposal to <a href="mailto:coding-sprints@ima.umn.edu">coding-sprints@ima.umn.edu</a>. The proposal should include a description of the design proposals for any code to be written and how the potential functions of the code or materials to be developed will impact researchers in academia and industry and/or educators. Proposals should discuss prior history of related code in <a href="/SageMath">SageMath</a>, or other open-source software, and a brief description of the relevant mathematical and coding background of the proposers. 

Please note only one participant of the coding sprint team needs to fill out the online application and submit the proposal to <a href="mailto:coding-sprints@ima.umn.edu">coding-sprints@ima.umn.edu</a>. The submitted proposal should include name, affiliation, and email address of all collaborators.  

**Selection Process** 

Each proposal will be evaluated by the <a href="/IMA-Sage-Board">scientific board</a> according to the following three criteria: 

Effectiveness – does the proposed functionality successfully address an important development opportunity in Sage? 

Feasibility – can sufficient progress be made on the proposed functionality during the coding sprint? 

Interest from the community – is there a pressing need for the code? 

**Applications will be accepted on a rolling basis according to the following schedule:** 

June 1, 2017—Deadline for initial round of decisions (Notification by July 1) 

Sept. 1, 2017—Deadline for second round of decisions, sprints must occur after Nov. 1 (Notification by Oct. 1) 

Nov. 1, 2017—Deadline for third round of decisions, sprints must occur after Jan. 1 (Notification by Dec. 1) 

Feb. 1, 2018—Final deadline for coding sprint applications, sprints to occur after April 1 (Notification by March 1) 

Please contact the organizers with additional inquiries. 

The goal of this year-long program to continue expanding the developer base of <a href="/SageMath">SageMath</a> while fostering connections between mathematics and industry. 
