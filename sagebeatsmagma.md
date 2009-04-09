= List of Computations where Sage is Noticeably Faster than Magma =

* Large degree polynomial multiplication modulo n
{{{
sage: R.<t> = Zmod(next_prime(8000^3))[]
sage: ff = R.random_element(degree=3200)
sage: time v = [ff*ff for i in [1..100]]
CPU times: user 0.19 s, sys: 0.00 s, total: 0.19 s
Wall time: 0.19 s
}}}

In my initial tests this seems to be nearly 10 times faster in Sage than in Magma!
{{{
sage: S = magma(R)
sage: f = magma('%s![Random(0,10000000) : i in [1..3200]]'%S.name())
sage: magma.eval('time z:=[%s*%s : i in [1..100]]'%(f.name(), f.name()))
'Time: 1.690'
sage: 1.69/0.19
8.89473684210526
}}}
