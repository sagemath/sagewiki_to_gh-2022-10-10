= Sage Interactions - Fractal =
goto [:interact:interact main page]

[[TableOfContents]]

== Mandelbrot's Fractal Binomial Distribution ==

{{{
def muk_plot(m0,k):  
    """
    Return a plot of the binomial fractal measure mu_k
    associated to m0, 1-m0, and k.   
    """
    k = int(k)
    m0 = float(m0)
    m1 = float(1 - m0)
    assert m0 > 0 and m1 > 0, "both must be positive"
    v = [(0,0)]
    t = 0
    two = int(2)
    delta = float(1/2^k)
    multiplier = float(2^k)
    for i in [0..2^k-1]:
        t = i * delta
        phi1 = i.str(two).count("1")
        phi0 = k - phi1
        y = m0^(phi0)*m1^(phi1)*multiplier
        v.append((t,y))
        v.append((t+delta,y))
    return v

html("<h1>Mandelbrot's Fractal Binomial Measure</h1>")

@interact
def _(mu0=(0.3,(0.0001,0.999)), k=(3,(1..14)), thickness=(1.0,(0.1,0.2,..,1.0))):
    v = muk_plot(mu0,k)
    line(v,thickness=thickness).show(xmin=0.5, xmax=0.5, ymin=0, figsize=[8,3])
}}}

attachment:binomial.png
