== Cauchy residue theorem ==
Pablo Angulo. Shows a function f of a complex variable, a plane curve gamma given as a map 
R -> C
t -> gamma(t)
and plots the contribution of the residues of f to the contour integral of f along gamma

{{{#!sagecell
import scipy.integrate as integ
from sage.misc.html import HtmlFragment
var('z t')

def winding_number(gamma, z0):
    t, = gamma.variables()
    assume(t, 'real')
    x,y = gamma.real_part(), gamma.imag_part()
    z0 += I*0
    x0,y0 = z0.real_part(), z0.imag_part()
    xmx0 = x - x0
    ymy0 = y - y0
    r2 = xmx0^2 + ymy0^2
    xp = xmx0.derivative(t)
    yp = ymy0.derivative(t)
    integrando(t) = (xmx0*yp -ymy0*xp)/r2
    i,e = numerical_integral(integrando, 0, 2*pi)
    return round(i/(2*pi))

def cauchy_residue(f, gamma):
    z, = f.variables()
    t, = gamma.variables()
    ftheta = f.subs({z:gamma})*gamma.diff(t)
    quad_integral = (
          integ.quad(lambda t0:ftheta(t=t0).real_part(), 0, 2*pi)[0],
          integ.quad(lambda t0:ftheta(t=t0).imag_part(), 0, 2*pi)[0],
    )
    poles = [
        d[z] for d in solve(1/f==0,z, solution_dict=True)
    ]
    residues = [
        #pole, residue and its winding number wrt gamma
        (z0, f.residue(z==z0), winding_number(gamma, z0))
        for z0 in poles
    ]
    residue_integral = 2*pi*i*sum(
        res*win for z0,res,win in residues
    ).simplify_full()
    return residues, residue_integral, quad_integral


def cauchy_residue_plot(f, gamma):
    residues, residue_integral, quad_integral = cauchy_residue(f, gamma)
    max_win = max(win for z0,res,win in residues)
    min_win = min(win for z0,res,win in residues)
    return (
        complex_plot(f,(-3,3),(-3,3))
        + point2d([(z0.real_part(), z0.imag_part()) for z0,res,win in residues], 
                       size=50, zorder=5, color='white')
        + sum([point2d((z0.real_part(), z0.imag_part()), 
                       size=30, zorder=6,
                       color=(max(0,win/(max_win-min_win)),max(0,-win/(max_win-min_win)),0)) 
               for z0,res,win in residues])
        + parametric_plot( (gamma.real_part(), gamma.imag_part()), (t, 0, 2*pi))
        + sum([text('$%s$'%latex(res),(z0.real_part()+0.1, z0.imag_part()+0.3), 
                    fontsize=10, color='white', 
                    background_color=(max(0,win/(max_win-min_win)),max(0,-win/(max_win-min_win)),0), 
                    alpha=1, zorder=4) 
               for z0,res,win in residues])
    )

@interact
def _(f = cos(z)/(z^4-1),
      #Lemniscate
      gamma = 2*(cos(t)/(1+sin(t)^2) + i*sin(t)*cos(t)/(1+sin(t)^2))):
    residues, residue_integral, quad_integral = cauchy_residue(f, gamma)
    show('Residues:', residues)
    pretty_print(HtmlFragment(r'$\int_\gamma f(z)\: d z = %s$'%
         (' + '.join(r'%s\cdot %s'%(latex(win), latex(res)) 
                     for z0,res,win in residues))))
    pretty_print(HtmlFragment(r'$\int_\gamma f(z)\: d z = %s$'%
                              residue_integral.simplify_full()))
    pretty_print(HtmlFragment(r'$\int_\gamma f(z)\: d z \approx %.8f + %.8f*I$'%
                              quad_integral))
    cauchy_residue_plot(f, gamma).show(figsize=(8,8))
}}}
{{attachment:residues_lemniscate.png}}
