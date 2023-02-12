
Copy cells from wiki-form window in sage worksheet and paste directly into wiki edit. 


# Wiki form worksheet (with prompt): _scratch_ 

```python
#!python 
sage: a = 5
```

```python
#!python 
sage: a
5
```

```python
#!python 
sage: for i in range(10):
...    print i*i - 2
-2
-1
2
7
14
23
34
47
62
79
```

```python
#!python 
sage: c=0
sage: for i in range(200):
...    a = 2^i -1
...    if a.is_prime():
...        c += 1
...        print str(c)+': '+str(a)
1: 3
2: 7
3: 31
4: 127
5: 8191
6: 131071
7: 524287
8: 2147483647
9: 2305843009213693951
10: 618970019642690137449562111
11: 162259276829213363391578010288127
12: 170141183460469231731687303715884105727
```

```python
#!python 
sage: a.is_prime()
True
```

```python
#!python 

```

# Wiki form worksheet: _scratch_ 

```python
#!python 

```

```python
#!python 
b=10
```

```python
#!python 
a.is_prime()
out: True
```

```python
#!python 
a
out: 5
```

```python
#!python 

```

```python
#!python 
a = 5
```

```python
#!python 

```

```python
#!python 
a
out: 5
```

```python
#!python 
for i in range(10):
    print i*i - 2
out: -2
 -1
 2
 7
 14
 23
 34
 47
 62
 79
```

```python
#!python 
c=0
for i in range(200):
    a = 2^i -1
    if a.is_prime():
        c += 1
        print str(c)+': '+str(a)
out: 1: 3
 2: 7
 3: 31
 4: 127
 5: 8191
 6: 131071
 7: 524287
 8: 2147483647
 9: 2305843009213693951
 10: 618970019642690137449562111
 11: 162259276829213363391578010288127
 12: 170141183460469231731687303715884105727
```

```python
#!python 
t = Tachyon(xres=512,yres=512, camera_center=(5,0,0))
t.light((4,3,2), 0.2, (1,1,1))
t.texture('t0', ambient=0.1, diffuse=0.9, specular=0.5, opacity=1.0, color=(1.0,0,0))
t.texture('t1', ambient=0.1, diffuse=0.9, specular=0.3, opacity=1.0, color=(0,1.0,0))
t.texture('t2', ambient=0.2, diffuse=0.7, specular=0.5, opacity=0.7, color=(0,0,1.0))
k=0
for i in srange(-5,1.5,0.1):
    k += 1
    t.sphere((i,i^2-0.5,i^3), 0.1, 't%s'%(k%3))

t.show()
```

```python
#!python 

```