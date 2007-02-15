Investigate memory leaks associated to [http://sage.math.washington.edu/sage/hg/sage-main/file/3643a7cae944/sage/modular/ssmod/ssmod.py SupersingularModule ] code

{{{
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

}}}
