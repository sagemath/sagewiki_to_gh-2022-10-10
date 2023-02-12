

# Database Code

Robert Bradshaw planned a simple abstract base class.  I implemented a simple demo of it, which is here: 

      * <a href="http://sage.math.washington.edu/home/wstein/days/17/db/">http://sage.math.washington.edu/home/wstein/days/17/db/</a> 
Demo of using it: 
```txt
sage: attach "lmfdb.py"
sage: db = CuspidalSubgroupJ0N()
sage: db
Structure of cuspidal subgroup of J0(N)
sage: db[11]
[5]
sage: db[100]
[6, 30, 30, 30, 30]
sage: for N, I in db: 
...       print N, I
1 []
2 []
3 []
4 []
5 []
6 []
7 []
8 []
9 []
10 []
11 [5]
12 []
13 []
14 [6]
sage: timeit('db[1000]')
625 loops, best of 3: 6.45 µs per loop
sage: for N, X in db[512:514]:
...       print N, X
512 [2, 4, 4, 4, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 64]
513 [3, 3, 6, 30, 360, 360, 1080, 1080]
514 [64, 2752]
sage: for N, X in db( lambda z: len(z) == 2 ): 
...       print N, X
15 [2, 4]
21 [2, 4]
22 [5, 5]
```