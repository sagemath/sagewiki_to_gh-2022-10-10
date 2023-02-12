

# Fixing Singular's build system


## People

<a href="/MartinAlbrecht">Martin Albrecht</a>, Justin Walker 


## Tasks

* re-enable the dynamic kernel for OSX 
* 'make install' should copy the binary not symlink it 
* approach the Singular people to change omalloc's licence 
* make libboost configurable 
* remove Hannes-Sprueche (probably won't be accepted upstream) 
* merge libsingfac with libfac and libsingcf with libcf 

## Results

* We gave up.  There seems to be no good way to make progress on this until we get some input from the Singular folk and help from an 'autoconf' maven. We will continue to look at individual issues (like the dynamic kernel on Mac OS X), but the list above is a bit too ambitious given our knowledge of 'autoconf', and the need to coordinate and get feedback from the Singular team. 