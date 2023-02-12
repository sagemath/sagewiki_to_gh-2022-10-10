
MPIR - Parallel Algorithms and CUDA 

Present : Carl Witty, Bill Hart, Michael Abshoff, Glenn Tarbox Virtually Present : Jeff Gilchrist, Gonzalo Tornaria 

You can chat in a Linux text console by installing "irssi" and running: "irssi -c irc.freenode.net" and then type "/join #sage-devel" 

Parallel algorithms: 

* Multimodular algorithms 
* Scalar algorithms 
* Peter Montgomery's remainder algorithm a mod b, precompute b1 = B mod b, b2 = B<sup>2 mod b, b3 = B</sup>3 mod b, then write a = a0 + a1*B + a2*B^2 +..., then compute a0 + a1*b1 + a2*b2 +.... and do final reduction mod b. Multiplications can be done in parallel. 
* Addition and subtraction can be parallelised using nails - non-unique representation of numbers 
* Classical algorithm is embarrassingly parallel - bad if you have an n log n algorithm in that range 
Glenn Tarbox (Owner of cuda1, AMD K10 with NVIDA CUDA card - expert on large scale parallelisation) 

* What are the top level integration issues, e.g. by libraries using MPIR 
Michael Abshoff (Sage release manager) 

* Link into Sage via cython and link in CUDA 
CUDA documentation: 

* <a class="http" href="http://www.nvidia.co.uk/object/cuda_develop_emeai.html">NVIDA website</a> 
CUDA issues: 

* Memory bandwidth limits algorithms - matrices n**2 entries to get in and out, matrix multiplication O(n**2.7), but for integers n limbs to get in and out O(n log n log log n) operations to multiply 
Other Options: 

* AMD Math library AML provides BLAS interface uses GPU - but that's for linear algebra 
* PTX NVIDIA GPU assembler code for inner loops 
Gonzalo Tornaria (theta functions expert) 

* Is there a way to encode integer multiplication in linear algebra? (A. Perhaps vectors - multimodular, but not matrices) 
* Kernel 
* Launch threads - issues based on hierarchy of memory - CPU registers-> memory per processor block-> main graphics memory-> system memory 
* Can launch all the threads on all cpus in a couple of cycles 
* How GPU would compare to carefuly programmed FPGA? 
* E.g a Stratix IV can have around 1000 18x18 multipliers, but maybe that's not too much, and this is probably very expensive hardware 
* <a href="http://www.altera.com/products/devices/stratix-fpgas/stratix-iv/stxiv-index.jsp">http://www.altera.com/products/devices/stratix-fpgas/stratix-iv/stxiv-index.jsp</a> 
* Carl Witty does FPGA programming - says it is probably very expensive 
* Accoding to the spec the stratix can have parallel high-bandwith communication 
* Up to 48 8.5Gb/s tranceivers or 24 11.3 gbps tranceivers 
* Deal with 533MHz DDR3 memory directly 
Jeff Gilchrist 

* What about ATI hardware - why not support OpenCL? 
* Carl Witty says - Nobody ships OpenCL yet but in a year or two it should be common 
* Intel has Larrabee and will ship some intel library, NVIDIA has CUDA and PTX, ATI has AML (basically BLAS) + low level interface - OpenCL is slated to be common 
* OSX will ship with OpenCL 
Bill Hart 

* Cell port will happen as it is funded by EPSRC Grant - will be proof of principle code to apply for a port to <a href="/Cell2Xi">Cell2Xi</a> 
Glenn Tarbox  

* What is the focus for mathematicians? E.g. mathematica is reputedly going to have parallel CUDA or something similar 