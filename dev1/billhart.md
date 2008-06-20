= eMPIRe =

The new SAGE fork of GMP, now called MPIR needs lots of build fixes to support various systems. I've been working through fixing these.

1) I fixed support for gcc 4.3.0 and 4.3.1

2)I closed a trac ticket related to the global symbol prefix which is used on Core 2 systems. 

3)I updated the yasm we distribute with mpir so that it will support the new intel syntax x86_64 code on Core 2.
