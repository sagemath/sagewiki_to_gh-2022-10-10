= List of Computations where Sage is Noticeably Faster than Magma =

* Large degree polynomial multiplication modulo n:
{{{
sage: R.<t> = Zmod(next_prime(8000^3))[]
sage: ff = R.random_element(degree=3200)
sage: time v = [ff*ff for i in [1..100]]
}}}

{{{
sage: S = magma(R)
sage: f = magma('%s![Random(0,10000000) : i in [1..3200]]'%S.name())
sage: magma.eval('time z:=[%s*%s : i in [1..100]]'%(f.name(), f.name()))
}}}
