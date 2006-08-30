 * Everywhere continuous, nowhere differentiable function (in the infinite limit, anyway):
{{{p = Graphics()
for n in range(1,20):
  f = lambda x: sum([sin(x*3^i)/(2^i) for i in range(1,n)])
  p += plot(f,0,float(pi/3),plot_points=2000,rgbcolor=hue(n/20))

p.show(xmin=0, ymin=0,dpi=250)
}}}

[http://sage.math.washington.edu/home/wdj/art/cool-sage-pic-small1.png cool pic 1]
