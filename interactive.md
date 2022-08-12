== Interactive Widgets ==

Currently, visualization in SageMath is mostly not interactive. However, there are approaches to build interactive widgets for the Jupyter notebook:

 * [[interact|@interact]] creates configurable widgets.
 * [[https://github.com/flatsurf/ipymuvue/tree/master/examples|ipyμvue]] can be used to write Jupyter widgets in Python that work with SageMath.
 * matplotlib plots can be made interactive.

=== Example: Interactive matplotlib Plots ===

{{{#!python
# Enable interactive matplotlib output in Jupyter.
%matplotlib notebook

class DynamicPlot(sage.plot.primitive.GraphicPrimitive):
    r"""
    A dynamic 2D plot that redraws when it is dragged around.
    
    INPUT:
    
    - ``create_plot`` -- a callable that creates a plot for given ``xmin``, ``ymin``, ``xmax``, ``ymax`` bounds.
    
    - ``xmin``, ``ymin``, ``xmax``, ``ymax`` -- initial bounds of the 2D plot.

    """
    def __init__(self, create_plot, xmin=-1, xmax=1, ymin=-1, ymax=1, options={}):
        self._create_plot = create_plot
        
        self._xmin = xmin
        self._xmax = xmax
        self._ymin = ymin
        self._ymax = ymax
        
        super().__init__(options)
        
    def _render_on_subplot(self, subplot):
        def redraw(_=None):
            try:
                # Clear the subplot before redrawing. Otherwise, we would pile up lots
                # of identical plots that take more and more time to draw.
                # Note that this will also clear other primitives from this subplot.
                subplot._children = []

                xlim = subplot.axes.get_xlim()
                ylim = subplot.axes.get_ylim()

                import sage.misc.verbose
                verbose = sage.misc.verbose.get_verbose()
                # Silence warnings about undefined values in the plotted function.
                sage.misc.verbose.set_verbose(-1)
                try:
                    # Plot all the objects produced by create_plot().
                    for object in self._create_plot(xmin=xlim[0], xmax=xlim[1], ymin=ylim[0], ymax=ylim[1])._objects:
                        object._render_on_subplot(subplot)
                finally:
                    sage.misc.verbose.set_verbose(verbose)
            except Exception:
                # Unfortunately, there is no easy way to display an error message in a matplotlib callback.
                # Errors are shown in the terminal where Jupyter was started.
                subplot.clear()
                raise

        # Redraw when the plot is dragged around.
        subplot.axes.callbaacks.connect("ylim_changed", redraw)
        subplot.axes.callbacks.connect("xlim_changed", redraw)
        
        # Draw the plot in the initial bounds.
        redraw()
     
    def get_minmax_data(self):
        r"""
        Return the initial bounds of this plot to focus the camera here.
        """
        return dict(xmin=self._xmin, ymin=self._ymin, xmax=self._xmax, ymax=self._ymax)

    def show(self):
        r"""
        Create a matplotlib figure and show this plot.
        """
        g = Graphics()
        g.add_primitive(self)

        import matplotlib.pyplot as plt
        figure = plt.figure()
        g.matplotlib(figure=figure)
}}}

{{{#!python
# We plot an infinite ray from the origin.
def create_plot(*, xmin, ymin, xmax, ymax):
    def ray(x):
        if x > 0:
            return x + sin(x)

    return plot(ray, alpha=.5, xmin=xmin, ymin=ymin, xmax=xmax, ymax=ymax)

DynamicPlot(create_plot).show()
}}}

{{{#!python
# We plot a parabola
def create_plot(*, xmin, ymin, xmax, ymax):
    return plot(x^2, alpha=.5, xmin=xmin, ymin=ymin, xmax=xmax, ymax=ymax,
               # Adaptive recursion slows down the plotting when we zoom out a lot, so we disable
               # it for this simple function.
               adaptive_recursion=0)

DynamicPlot(create_plot).show()
}}}
