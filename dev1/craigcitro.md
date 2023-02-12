

# What I did at dev1

I was involved in both `dev1` and the modular forms school; I'll divide what I did into two groups, though I don't know if the division is that meaningful. 


## dev1

* I was really loud when necessary. :) 
* As with most sage conferences, I spent most of my time working on a large project I hadn't intended to at all, and hadn't looked at before the conference started. In this case, it was **coercion**. I've just been trying to help update various parts of the codebase now that the core coercion model works. I helped with various pieces here and there, but probably my largest contribution was getting the doctests in `sage/modular/` working -- I'm mostly done, and hope I can finish by 4PM today. I'm going to finish off anything that's left over the weekend, and will try to help with the fallout of the doctest timings and pickle jar. 
      * I also provided excellent moral support for Rob and Mike when they did the crazy `3.0.3` merge, and snored from the sidelines the whole way. 
* I fixed or worked on fixing various bugs that have been on my todo list for a while. My code for #2535 is now mostly done, and I should finish that up this weekend. Nick Alexander and I talked about #2329, and we've agreed on **what** the right strategy is, and that should also be finished up this weekend. Rob Bradshaw and I tracked down a nasty coercion bug. There were a handful of others I don't remember right now. 
* I was involved in several discussions about the editorial process for `trac`, and did a bunch of editing work. 

## Modular Forms

* I was more interested in working on modular forms than just `dev1` stuff this week, but I was somehow ... **coerced** ... into doing more sage work.  
* With William and Salman, I helped compute data for William's three challenge problems. I was in charge of computing $S_2(\Gamma_0(N), \chi)$ for all $N < 100$ and all $\chi$. I've computed up to 20, and stopped -- not because the code is too slow to finish this challenge, but because I hit a bug in sage. :( I'm going to fix it this weekend, and I **strongly** believe that we'll be able to take care of William's challenge problem over the weekend. William's new `@parallel` makes doing this in parallel trivial, which is ridiculously cool to use. 
      * Data so far: <a class="http" href="http://sage.math.washington.edu/home/citro/modsym-char-data/data/">data</a> 
* I chatted with David Kohel several times about implementing computation of Brandt matrices in sage. I did a basic implementation of this at the AWS in 2007, but there's a decent bit of framework that still needs to be built. I wanted to work with David on this during the week, but was busy with other things, sadly. :( We have plans to get this working in the not-too-distant future (read: over the summer).  
* William and I did a fun computation for Barry Mazur. This only took a few minutes, due to our new cyclotomic charpoly code. 