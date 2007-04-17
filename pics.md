 * Everywhere continuous, nowhere differentiable function (in the infinite limit, anyway):
{{{p = Graphics()
for n in range(1,20):
  f = lambda x: sum([sin(x*3^i)/(2^i) for i in range(1,n)])
  p += plot(f,0,float(pi/3),plot_points=2000,rgbcolor=hue(n/20))

p.show(xmin=0, ymin=0,dpi=250)
}}}

[http://sage.math.washington.edu/home/wdj/art/cool-sage-pic-small1.png cool pic 1]

 * Math art by Tom Boothby:
{{{
# Author: Tom Boothby
# This is a remake of an old art piece I made in POVRay


t = Tachyon(xres=1000,yres=600, camera_center=(1,0,5), antialiasing=3)
t.light((4,3,2), 0.2, (1,1,1))
t.texture('t0', ambient=0.1, diffuse=0.9, specular=0.5, opacity=1.0, color=(1.0,1,1))
t.texture('t1', ambient=0.5, diffuse=0.5, specular=0.0, opacity=1.0, color=(0,0,0))
t.texture('t2', ambient=0.2, diffuse=0.7, specular=0, opacity=0.7, color=(.5,.5,.5))
t.texture('t3', ambient=.9, diffuse=5, specular=0,opacity=.1, color=(1,0,0))
t.sphere((1,0,0), 30, 't2')



k=0
for i in srange(-pi*10,0,.01):
  k += 1
  t.sphere((cos(i/10)-.1, sin(i/10)*cos(i), sin(i/10)*sin(i)), 0.1, 't0')
  t.sphere((cos(i/10) + 2.1, sin(i/10)*cos(i), sin(i/10)*sin(i)), 0.1, 't1')

t.show(verbose=1)
}}}

[http://sage.math.washington.edu/home/wdj/art/boothby-tachyon1.png cool pic 2]

 * Twisted cubic in tachyon:
{{{
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
}}}

[http://sage.math.washington.edu/home/wdj/art/boothby-tachyon2.png cool pic 3]

 * Reflections from four spheres in tachyon
{{{
t6 = Tachyon(camera_center=(0,-4,1), xres = 800, yres = 600, raydepth = 12, aspectratio=.75, antialiasing = True)
t6.light((0.02,0.012,0.001), 0.01, (1,0,0))
t6.light((0,0,10), 0.01, (0,0,1))
t6.texture('s', color = (.8,1,1), opacity = .9, specular = .95, diffuse = .3, ambient = 0.05)
t6.texture('p', color = (0,0,1), opacity = 1, specular = .2)
t6.sphere((-1,-.57735,-0.7071),1,'s')
t6.sphere((1,-.57735,-0.7071),1,'s')
t6.sphere((0,1.15465,-0.7071),1,'s')
t6.sphere((0,0,0.9259),1,'s')
t6.plane((0,0,-1.9259),(0,0,1),'p')
t6.show()
}}}

attachment:fourspheres.png
