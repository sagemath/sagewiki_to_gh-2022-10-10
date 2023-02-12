

# ZAK code analysis

To quote the Introduction of the ZAK software survey by Rainer Schulze-Pillot (linked below as PDF): 
```txt
In the 1990s Rudolf Scharlau and I had a joint project concerned 
with computations for and with integral quadratic (and later also 
hermitian) forms over Z and also over the rings of integers of 
(mainly quadratic) number fields. The project originated in 
Rudolf Scharlau’s group of Diplom and doctoral students, where it 
also got its name ZAK, I don’t really now why (from the German word 
Zahlkoerper (number field) perhaps?). It turned later into a project 
funded by Deutsche Forschungsgemeinschaft; in this time Alexander 
Schiemann worked for the project, coordinated the programming work 
and wrote several C++ programs. The programs developed in the project 
were the basis of the articles [19, 20, 18, 22, 5] and were used for
Schiemann’s computation of tables of integral hermitian forms [23]. 
After Schiemann left academia we continued to use the programs for 
a while on our HP-UX workstations. When these went out of service 
it turned out to be difficult to adapt the programs to other 
environments; I will describe some of the problems later. All 
experiments I did now are under Linux (Suse 11.0) using gcc 4.3. 
The present new interest in such computations, in particular in 
the SAGE project, raises the question whether it is worthwhile 
(and possible) to revive these programs.
```

## Interesting code


### tn

* C code 
* compiles fine and is well tested 
* GPL V2+ 
* depends on GMP only 
* minor issues in code, i.e. "malloc.h" used, static linking broken on OSX 
* mabshoff will build an experimental spkg 

### hn

* C++ code 
* friend and template issues - forward declaration should fix that (patch exists) 
* depends on LiDiA **and** LEDA (depends on sorting for sortseq) 
* presumed to work correctly 
* ancient binary on Linux exists, uses old LEDA and LiDiA 

### isolist

* C++ code 
* depends on LiDiA **or** LEDA controllable via include_param.h - see end of schulzepillot_qfcomputing_zak.pdf 

### decomp

* valgrind it to check for 

```txt
*** glibc detected *** decomp: double free or 
corruption (fasttop): 0x08055458 *** 
```

### herm_mass

* check compilation  