MPIR - Parallel Algorithms and CUDA

Present : Carl Witty, Bill Hart, Michael Abshoff, Glenn Tarbox
Virtually Present : Jeff Gilchrist, Gonzalo Tornaria

You can chat in a Linux text console by installing "irssi" and running: "irssi -c irc.freenode.net" and then type "/join #sage-devel"

Parallel algorithms:

 * Multimodular algorithms
 * Scalar algorithms
 * Peter Montgomery's remainder algorithm a mod b, precompute b1 = B mod b, b2 = B^2 mod b, b3 = B^3 mod b, then write a = a0 + a1*B + a2*B^2 +..., then compute a0 + a1*b1 + a2*b2 +.... and do final reduction mod b. Multiplications can be done in parallel.
 * Addition and subtraction can be parallelised using nails - non-unique representation of numbers
