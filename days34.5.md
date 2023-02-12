

# Summary of the days

(un texte en francais sur les divers points discutes entre participants suit) 

(a text in french about points that were discussend during the meeting follows). 


## Context

There have been a sage days from October 31 to November 4, 2011, at the university of Bobo Dioulasso, Burkina Faso. We were about 20 people from Bobo Dioulasso, Koudougou, Marseille, Montpellier, Ouagadougou, learning about sage for about 2-3h per day (the rest of the workshop was devoted to mathematical talks). 

It was the occasion to prepare the CIMPA research school that will happen in November 2012 at the same place <a href="http://www.cimpa-icpam.org">http://www.cimpa-icpam.org</a> 


## Classes that should be in sage

Many participants were interested in the use of sage from various fields of mathematics, and in particular  

* having non-associative algebras coded in sage 
* having the albert software included (or interfaced) in sage: <a href="http://www.cs.clemson.edu/~dpj/albertstuff/albert.html">http://www.cs.clemson.edu/~dpj/albertstuff/albert.html</a> (or maybe an idea could be to have its algorithms directly written in sage). 

## Report on installing sage

Concerening installations, we exprienced quite a lot of problems related to the lack of internet connection at the university itself, and to the age of some machines (pentium 3 and 4). The ubuntu build we get from the repository needs some additional packages (libgfortran3 for example), and the compilation seems to have been made with some new CPU instructons (removing sage-flags file was not sufficient to solve the problem). [Remark by William Stein: removing sage-flags.txt should never ever be sufficient to "solve the problem"; the file local/lib/sage-flags.txt allows a Sage binary to detect hardware on which it can't possibly run, and the only possible fix is to rebuild packages, e.g., Atlas and MPIR, that depend on these flags.  If just deleting sage-flags.txt actually fixes a problem, then this is itself a bug.] In such situations where internet is too slow to download a distro or a whole build for each particular machine (with its own version of ubuntu), we definitely need to have a minimal build that runs on every machine (e.g. complied on a minimal debian with as few package as possible installed, and using only instruction of an old machine). 

The use of virtualbox is definitely too slow and relies on a clean windows install; it seems that the best options were: 

* to serve sage on the LAN for all the participants (but this needs a machine with quite a lot of RAM). 
* to use the live-cd.  
Note that after various tests on some machines, the .exe file that installs the live-cd on the hard disk of a windows machine does not work (but the uninstall script works well). 

The main concern with the live-cd installed on a usb-key is the difficulty to spread it among colleagues and students (we need a machine with syslinux or quite a recent version of unetbootin). 

Hence, we hacked it a bit to have a key with sage that is able to clone itself on another usb key, indefinitely, in one click. Some additional informations about this hack will be posted soon, and we should discuss with the guy that built this "sage on Puppy" about this. 


# Resources

* <a href="/Comment%20installer%20Albert%20sur%20la%20derniere%20Debian%20ou%20Ubuntu">Comment installer Albert sur la derniere Debian ou Ubuntu</a> 