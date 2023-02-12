
Trying out html2moin.py processor; this is one step in processing doc pages for a notebook help browser, as well as a step to making a wiki-version of the documentation. This is just a test using a random doc page. 

14.3 Abelian group elements 
<a class="http" href="http://modular.math.washington.edu/sage/doc/html/ref/module-sage.groups.abelian-gps.abelian-group.html">prev</a> | <a class="http" href="http://modular.math.washington.edu/sage/doc/html/ref/node144.html">parent</a> | <a class="http" href="http://modular.math.washington.edu/sage/doc/html/ref/module-sage.groups.abelian-gps.abelian-group-morphism.html">next</a> | <a class="http" href="http://modular.math.washington.edu/sage/doc/html/ref/contents.html">''SAGE'' Reference Manual</a> | <a class="http" href="http://modular.math.washington.edu/sage/doc/html/ref/modindex.html">module index</a> | <a class="http" href="http://modular.math.washington.edu/sage/doc/html/ref/genindex.html">general index</a>

* **Previous:** <a class="http" href="http://modular.math.washington.edu/sage/doc/html/ref/module-sage.groups.abelian-gps.abelian-group.html">14.2 Multiplicative Abelian Groups</a> **Up:** <a class="http" href="http://modular.math.washington.edu/sage/doc/html/ref/node144.html">14. Groups</a> **Next:** <a class="http" href="http://modular.math.washington.edu/sage/doc/html/ref/module-sage.groups.abelian-gps.abelian-group-morphism.html">14.4 Homomorphisms of abelian</a> 


---

 



# 14.3 Abelian group elements

<a name="SECTION0016300000000000000000"></a> 

* **Module:** `sage.groups.abelian_gps.abelian_group_element` 
<a name="module-sage.groups.abelian-gps.abelian-group-element"></a> 

* **Author Log:**   
 
* David Joyner (2006-02); based on free_abelian_monoid_element.py, written by David Kohel.  
 
* David Joyner (2006-05); bug fix in order  
 
* " (2006-08); bug fix+new method in pow for negatives+fixed corresponding examples.  
 
Recall an example from abelian groups. 
```python
#!python 
sage: F = AbelianGroup(5,[4,5,5,7,8],names = list("abcde"))
sage: (a,b,c,d,e) = F.gens()
sage: x = a*b^2*e*d^20*e^12
sage: x
a*b^2*d^6*e^5
sage: x = a^10*b^12*c^13*d^20*e^12
sage: x
a^2*b^2*c^3*d^6*e^4
sage: y = a^13*b^19*c^23*d^27*e^72
sage: y
a*b^4*c^3*d^6
sage: x*y
a^3*b*c*d^5*e^4
sage: x.list()
[2, 2, 3, 6, 4]
```
It is important to note that lists are mutable and the returned list is not a copy. As a result, reassignment of an element of the list changes the object. 
```txt
sage: x.list()[0] = 3
sage: x.list()
[3, 2, 3, 6, 4]
sage: x
a^3*b^2*c^3*d^6*e^4
```
* **Module-level Functions** ** `is_AbelianGroupElement` ** (x ) **Class: `AbelianGroupElement`** **class  `AbelianGroupElement` ** ** `AbelianGroupElement` ** (self, F, x ) 
Create the element x of the <a href="/AbelianGroup">AbelianGroup</a> F. 


```txt
sage: F = AbelianGroup(5, [3,4,5,8,7], 'abcde')
sage: a, b, c, d, e = F.gens()
sage: a^2 * b^3 * a^2 * b^-4
a*b^3
sage: b^-11
b
sage: a^-11
a
sage: a*b in F
True
```
* **Functions:**  `as_permutation` , `list` , `order` , `random` , `word_problem` ** `as_permutation` ** (self ) 
Return the element of the permutation group G (isomorphic to the abelian group A) associated to a in A. 
