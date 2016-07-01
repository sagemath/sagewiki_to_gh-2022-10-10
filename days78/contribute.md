All of the things you need to know to get Sage set up for development are documented...somewhere. Unfortunately, the information is in a few different places, and it's not clear which order you need to go through them in. This will hopefully organize the information in a more linear fashion. Relevant links most of this information are culled from are

http://doc.sagemath.org/html/en/installation/source.html

http://doc.sagemath.org/html/en/developer/git_trac.html

http://doc.sagemath.org/html/en/developer/trac.html

https://wiki.sagemath.org/TentativeConventions

To use an adage from boxing, everybody has a plan until they get hit. This guide will describe how things should ideally go, but it's likely that some step won't work out as expected, and you'll have to Google/ask to figure out what's not working.


1) Install Linux

Sage development can be done on Mac, but I don't know how. Ideally, one would have a native Linux installation. It is also possible to run a Linux virtual machine within Windows. Advantage: You don't have to partition your hard drive and boot into a second OS. Disadvantage: Virtual machines restrict you to using one CPU core and a fixed subset of memory, which makes compiling take much longer. A virtual hard drive is much less robust against errors than working natively, and it's more likely some corruption will cause you to have to scrap everything and start over.

If you are running a virtual machine, I would suggest using a lightweight distribution of Ubuntu, like Lubuntu or Xubuntu. The variants of Ubuntu all have the same guts, but use a different Window Manager and have different aesthetics. The standard version of Ubuntu tries to include fancier UI options, and this is not conducive to a virtual machine limited to one core and limited memory.


2) Update Linux

If you're installing Linux from a binary, then it's likely that many programs have been updated since that binary was created. First, run

sudo apt-get update

"sudo" means "super user do". Some commands require administrator privileges, and updating/upgrading packages is one of them. "apt-get" is the command line package manager. "update" tells the package manager to check your repository and see which programs have newer versions.

Next, run

sudo apt-get upgrade

OR

sudo apt-get dist-upgrade

"upgrade" will tell you which programs have newer versions, and ask you if you want to install them. "dist-upgrade" also does this, but will also upgrade the kernel if possible (the heart of the operating system).


3) Install dependencies necessary for building from source


Hopefully, all you need to do is run the line

sudo apt-get install binutils gcc g++ gfortran make m4 perl tar git

For more information, see ( http://doc.sagemath.org/html/en/installation/source.html#prerequisites )

4) Configure git

See ( https://wiki.sagemath.org/TentativeConventions#Step_4:_make_sure_your_git_configuration_is_correct )

git is a widely used revision control system that Sage uses to manage the source code. The main thing is to make sure your name and e-mail are in there.


5) Obtain the source code

In the command line, navigate to your home directory, and run

git clone git://github.com/sagemath/sage.git sage

You can change the "sage" to whatever you want your Sage directory to be called. If you have enough hard drive space, it's not a bad idea to have a "sage-devel" directory you use for development, and a "sage-stable" directory that you keep on the latest stable release. From here on, we will assume that you're working in '~/sage/' (the '~' is a shortcut for the Linux command line that refers to the home directory for the current user.

6) Get the latest development source code/starting to use Git


By default, you get the source code for the latest stable release. However, there are a few developmental releases between stable releases that slowly integrate new changes as tickets get closed. Change to your '~/sage' directory, and type

git branch

You should just see

*master

The * means you are on the branch called "master", which corresponds to the stable source code. Next, type

git branch develop
git checkout develop

The first line will create a new branch of the source code that you're calling develop. The second line will make that new branch the active branch you're working on. Creating a new branch and switching to it is a common operation, so one can combine them in the single line

git checkout -b develop

Next, we want to download the latest development source code. But instead of downloading a whole new copy of the source code, we're really only downloading a list of changes between the development source code and the stable version. So we type

git pull origin develop

The command "pull" means we want to download something and merge it into our current branch. "origin" is the name of the remote server we want to download the code from (type git remote -v to see a list of remote servers and their names. Right now you should just have two called 'origin'. Later, you will have two more called 'trac').

Now, by switching between the branch "master" and the branch "develop", one can switch between the source code for the latest stable release and the latest development release. But since we're only keeping track of changes, we really only have one copy of the source code.

6.5) Tab completion for git

If you've used the command line or Sage before, you know the magic of tab completion. By default, git doesn't let you use tab completion to complete commands or names of branches, but it's not difficult to add. 

Download the file ( https://github.com/git/git/blob/master/contrib/completion/git-completion.bash ), and put it in your home directory. Then in your favorite text editor, open the file

~/.bashrc

(the period means that it's a hidden file, so if you're navigating using a file manager, you may need to enable hidden files) and then add the line

source ~/git-completion.bash

to the bottom. 



7) Install ccache

We haven't compiled the source code yet. But eventually, you will have the source code compile, you'll be making your own edits, and then recompiling frequently. Ccache saves files used during the build process that will make these future recompiles go much faster. So run

./sage -i ccache

This is the general method for installing optional sage packages

8) Compile the source code

This step takes a long time to run, at least the first time.

In theory, one could just type

make

and Sage would build from source and create the documentation. There are other options, like

make build

That will build Sage from source, but not compile the documentation. See ( http://doc.sagemath.org/html/en/installation/source.html#make-targets ) for a complete list of options.

One can also set environment variables for the build process. See ( http://doc.sagemath.org/html/en/installation/source.html#environment-variables ) for a complete list.

An example of the most common environment variable you may want to set is

export "MAKE=make -jn"

where n is some integer. By default, Sage will build everything linearly. With this variable set, Sage will find parts of the code that don't depend on each other, and split them into n separate jobs. If you have a multi-core processor, then these jobs can be run in parallel.

Some rules of thumb for which value of n to choose: If you're using a virtual machine or a single core machine, then this won't really help you. If you're planning on doing other things while the source code is compiling and you have N>1 cores, then I would set n=N-1. If you want things to get done as fast as possible, then set N<n<1.5N (a job may be more won't necessarily be using up 100% of a CPU core, so it can help to have more jobs than cores). Also keep in mind that for the documentation build, each job will use up to 1GB of memory, so this may be a limiting factor.

Running "export" in the command line will only set that environment variable for that terminal session. If you want to permanently set an environment variable, you would need to add the export line to your '~/.bashrc' file.

9) Setting up trac

The Trac server is a front-end for Sage development, which provides a permanent record of discussions about issues and the proposed code changes. You will need an account if you want to be able to push your changes up to the trac server (though as we've seen, it is possible to pull code from the trac server without having an account set up).

To set up an account, e-mail ( http://doc.sagemath.org/html/en/installation/source.html#environment-variables ) with your full name, your preferred username, contact e-mail, and reason for wanting an account. ( http://www.sagemath.org/git-developer-guide/trac.html#obtaining-an-account ). Having a trac account lets you change the wiki. The main page ( https://trac.sagemath.org/ ) has a list mapping usernames to real names/institutions, which you are suggested to add yourself to.

10) Using the Trac website.

http://doc.sagemath.org/html/en/developer/trac.html

On the trac website ( https://trac.sagemath.org/ ), each individual bug/proposal/etc. is assigned a ticket with a number. 

When you create a ticket, you give the ticket:

A title.

A brief description of what the bug/desired enhancement is, a "type" (indicating if this is a bug, enhancement, or new feature).

A "component" (indicating which part of Sage this is dealing with), a "priority" (this is not taken seriously, I have been told to just mark everything as 'major'). You can add keywords to the ticket (for example, when working at a Sage Days, it is common to have a designated keywords like 'days78' to make it easier to catalog what was achieved at each Sage Days). You can add people to the cc (using their trac name), and they will be notified any time the ticket is updated. Author/reviewer is using real names for the people who write and review the code. It is not uncommon for one person to write a large chunk of code, and for a reviewer to also add a large chunk of code, and they end up jointly being both author and reviewer. There is a 'branch', which is a branch on the Github server containing the proposed code for the ticket. Each ticket has a status, which starts off as 'new', and will becomes 'needs work', 'needs review', 'positive review', and once a ticket has a positive review an administrator will set it to be closed and the proposed code will be integrated into the next release. There's also an ongoing comment thread that notes when code is committed, and contains comments about the ticket.

11) Combining git and trac.

For the purposes of this tutorial, we will be using a specially made 'git-trac' program which streamlines the process of pushing/pulling code between your local copy of Sage and what's on the trac server. Eventually, it would be worth figuring out how to do things the 'right way' ( http://doc.sagemath.org/html/en/developer/manual_git.html#chapter-manual-git https://wiki.sagemath.org/TentativeConventions#Quick_reference_guide:_I_want_to... ) to get a better idea about what's actually going on, and to give you more control over workflow for more complicated tickets. But even then, I personally prefer using git-trac command for simple bug fixes/enhancements.

The directions for setting up the git-trac command at ( http://doc.sagemath.org/html/en/developer/git_trac.html ) are fairly complete and self-contained.

