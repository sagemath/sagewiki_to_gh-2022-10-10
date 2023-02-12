
Investigate memory leaks associated to <a class="http" href="http://sage.math.washington.edu/sage/hg/sage-main/file/3643a7cae944/sage/modular/ssmod/ssmod.py">SupersingularModule</a> code 


```txt
---------- Forwarded message ----------
Date: Wed, 14 Feb 2007 20:51:12 -0800
From: William Stein <wstein@gmail.com>
Reply-To: sage-devel@googlegroups.com
To: sage-devel@googlegroups.com
Subject: [sage-devel] Re: Memory leaks


You should try to create a coding sprint project out of this for SAGE Days 3:

   http://sage.math.washington.edu:9001/days3/sprints

The memory leak might just be the result of caching in the ssmod.py module...
You would do well to think through precisely what
          X = SupersingularModule(p)
          X.hecke_matrix(2)
does.  The get_memory_usage() command can be very useful also for seeing
when memory is going up but not down.

On Wed, 14 Feb 2007 19:42:22 -0800, Iftikhar Burhanuddin <burhanud@usc.edu> wrote:

>
> Hi folks,
>
> The following piece of code seems to leak a lot of memory (with/without
> the statement 'del X') during long runs of computation:
>
>     while true:
>         X = SupersingularModule(p)
>         X.hecke_matrix(2)
>         del X
>         p = ZZ(p).next_prime()
>
> To pin down the souce of leakage, I incorporated the below code
>
> http://aspn.activestate.com/ASPN/Cookbook/Python/Recipe/65333
>
> into mine
>
> http://sage.math.washington.edu/home/burhanud/leak/leak.py
>
>
> [1] When I run
>
> load leak.py
>
> at the sage prompt, I get the following output ad infinitum:
>
> http://sage.math.washington.edu/home/burhanud/leak/dump.txt
>
> Are _PolynomialRing_general, _FiniteField_ext_pariElement leaking memory?
>
> [2] When I run
>
> nohup sage <leak.py> tmp.txt &
> 
> from the shell prompt, sage exits in a few milliseconds due to an
> Indentation Error exception.
>         
> http://sage.math.washington.edu/home/burhanud/leak/tmp.txt
>         
> Why does the leak.py run perfectly from the sage prompt but not from the
> shell? Preparsing issue?
> 
> Regards,
> Ifti

---------- Forwarded message ----------
Date: Fri, 16 Feb 2007 06:02:11 +0000
From: Joshua Kantor <kantor.jm@gmail.com>
Reply-To: sage-devel@googlegroups.com
To: sage-devel <sage-devel@googlegroups.com>
Subject: [sage-devel] Re: Memory leaks


Perhaps related (and maybe already fixed). But I noticed the
following
do
M=MatrixSpace(ZZ,1000)

then repeatedly do
m=M.random_element();get_memory_usage()

You should see the memory usage go up by around 16 mb per execution
and it doesn't appear to ever go down,

If you do the same thing with RDF matrices for example, the memory
usage goes up a bit but remains basically constant.


```