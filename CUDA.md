MPIR - Parallel Algorithms and CUDA

Present : Carl Witty, Bill Hart, Michael Abshoff, Glenn Tarbox
Virtually Present : Jeff Gilchrist, Gonzalo Tornaria

You can chat in a Linux text console by installing "irssi" and running: "irssi -c irc.freenode.net" and then type "/join #sage-devel"

Parallel algorithms:

 * Multimodular algorithms
 * Scalar algorithms
 * Peter Montgomery's remainder algorithm a mod b, precompute b1 = B mod b, b2 = B^2 mod b, b3 = B^3 mod b, then write a = a0 + a1*B + a2*B^2 +..., then compute a0 + a1*b1 + a2*b2 +.... and do final reduction mod b. Multiplications can be done in parallel.
 * Addition and subtraction can be parallelised using nails - non-unique representation of numbers
 * Classical algorithm is embarrassingly parallel - bad if you have an n log n algorithm in that range

Glenn Tarbox (Owner of cuda1, AMD K10 with NVIDA CUDA card - expert on large scale parallelisation)

 * What are the top level integration issues, e.g. by libraries using MPIR

Michael Abshoff (Sage release manager)
 
 * Link into Sage via cython and link in CUDA

CUDA documentation:

 * [[http://www.nvidia.co.uk/object/cuda_develop_emeai.html|NVIDA website]]

CUDA issues:

 * Memory bandwidth limits algorithms - matrices n**2 entries to get in and out, matrix multiplication O(n**2.7), but for integers n limbs to get in and out O(n log n log log n) operations to multiply

Other Options:

 * AMD Math library AML provides BLAS interface uses GPU - but that's for linear algebra
 * PTX NVIDIA GPU assembler code for inner loops

Gonzalo Tornaria (theta functions expert)

 * Is there a way to encode integer multiplication in linear algebra? (A. Perhaps vectors - multimodular, but not matrices)
