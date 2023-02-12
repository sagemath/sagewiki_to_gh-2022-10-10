

# Stein -- what I did at Dev Days 1

1. Made a start on sage lite.  It didn't go anywhere, but I have some ideas... 

2. Implemented and tested the pickle jar.  <a href="http://trac.sagemath.org/sage_trac/ticket/3482">http://trac.sagemath.org/sage_trac/ticket/3482</a> 
```txt
It turns out that *all* 465 pickles in sage-3.0.3 made on opteron 64-bit linux *unpickle* fine on 32-bit osx intel.
```
3. Basic decorator and primitive for parallel computing in sage:  <a href="http://trac.sagemath.org/sage_trac/ticket/3467">http://trac.sagemath.org/sage_trac/ticket/3467</a> Actually used this to compute 1.6GB of modular symbols spaces in parallel. Works well.  There are a few details that it would be nice to add, but already this is a very nice useful thing to have.  I deleted more code than I wrote. 

4. <a class="http" href="http://pyprocessing.berlios.de/">Pyprocessing</a> -- learned about it, used it, integrated with @parallel with Mike Hansen.  Very interesting technology.  Is **very** likely to finally make it so we can start using parallel computing in the core of the Sage library.  This is, imho, major.   

5. Refereed a lot of patches. 

6. Discussed notebook database schema with Tom Boothby. 

7. Helped a little bit with the coercion rewrite 

8. Rode a Segway. 

--- 


## Modular Forms

At the modular forms workshop, I: 

1. Gave an intro talk with challenge problems. 

2. with Citro and Butt: Estimated time to solve them. 

3. with Citro and Butt: Wrote code and computed 1.6GB of data (weight 2 and levels up to about 2200).   Very surprising timing results.   Here's the data, actively being computed: 

      * <a href="http://sage.math.washington.edu/home/was/db/modsym/">http://sage.math.washington.edu/home/was/db/modsym/</a> 

```txt
Tasks: 479 total,   9 running, 469 sleeping,   0 stopped,   1 zombie
Cpu(s): 10.3%us,  3.3%sy, 36.7%ni, 49.7%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:  65993220k total, 63870396k used,  2122824k free,  5090292k buffers
Swap:  2931820k total,   364768k used,  2567052k free, 17267892k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND                    
10080 was       39  19 1139m 785m 7880 R  100  1.2  23:08.39 sage-ipython                
10069 was       39  19  894m 540m 5820 R  100  0.8  23:08.89 sage-ipython                
10071 was       39  19 2523m 2.1g 8144 R  100  3.4  23:05.69 sage-ipython                
10076 was       39  19 2290m 1.9g 8056 R  100  3.0  23:00.41 sage-ipython                
10077 was       39  19 2003m 1.6g 7992 R  100  2.6  22:59.63 sage-ipython                
...
```