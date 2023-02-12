

# Days 66 page related to doctests

For some doctests (hopefully few of them) tests are very long to run. For example, there is a dramatic 
```txt
TestSuite(R).run(elements = [R.random_element() for i in range(3^6)])
```
In `sage/rings/padics/padic_base_leaves.py` 

Plan of attack: 

* run `sage -t` and `sage -t --long` on all Sage files 
* sort the running time in decreasing order 
* start the list from the begining, read the file and try to do faster tests 