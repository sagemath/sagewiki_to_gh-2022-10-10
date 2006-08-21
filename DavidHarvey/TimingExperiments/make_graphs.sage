""" This program collects the data produced by poly_multiply_benchmark.sage
and makes it into pretty pictures.

AUTHOR: David Harvey (2006-08-21)
"""


def getInputData():
    """ opens and read data file, returns list of tuples
    (degree, coeff_bits, system, time)
    where degree is the polynomial degree,
    coeff_bits is number of bits per coefficient,
    system is one of the strings "ntl", "magma", "pari",
    time is a float showing time for the polynomial multiplication.
    """
    inputFile = file("output.txt")   # how to get command line arguments?

    output = []
    for line in inputFile:
        if "Doubling the PARI stack." in line:
            continue
        (degree, coeff_bits, system, time) = tuple(line.split()[0:4])
        degree = int(degree)
        coeff_bits = int(coeff_bits)
        system = str(system)
        time = float(time)
        output.append((degree, coeff_bits, system, time))

    return output


def makeGraph1(input, max_diameter, max_value, positive_colour, negative_colour):
    """ input should be a list of tuples (x, y, z),
    where z is the value to plot at coordinates x, y.

    positive_colour and negative_colour are the colours to use for when
    the value is positive or negative

    max_value is the maximum allowable absolute z (anything above this
    is cropped to max_value)

    return graphics object
    """
    # scale data so that z is between -1 and 1:
    max_value = max([z for (x, y, z) in input])

    output = Graphics()

    for (x, y, z) in input:
        # scale and crop z:
        z = z / max_value
        if z > 1:
            z = 1
        elif z < -1:
            z = -1
        
        radius = sqrt(abs(z)) * max_diameter / 2
        if z > 0:
            colour = positive_colour
        else:
            colour = negative_colour
        output += disk((x, y), radius, 0, 360, rgbcolor=colour)

    return output


def compareSystems(lookup, system1, system2, output_filename):
    colours = {"magma": (1, 0, 0), "ntl": (0, 0, 1), "pari": (0, 1, 0)}
    points = []
    for ((log_degree, log_coeff_bits), systems) in lookup.iteritems():
        try:
            if systems[system1] != 0 and systems[system2] != 0:
                points.append((log_degree, log_coeff_bits, log(systems[system1]/systems[system2])))
        except KeyError:
            pass

    # the log(10) here means any circles representing ratios above 10 will be cropped at 10
    graph = makeGraph1(points, 0.12, log(10), colours[system2], colours[system1])
    x_values = [x for (x, y, z) in points]
    y_values = [y for (x, y, z) in points]
    print "rendering", output_filename, "..."
    graph.save(output_filename, xmin=min(x_values), xmax=max(x_values), ymin=min(y_values), ymax=max(y_values))
    

# main script:

inputData = getInputData()

# re-organise the data in a more useful way:
lookup = {}
for (degree, coeff_bits, system, time) in inputData:
    lookup.setdefault((log(degree)/log(10), log(coeff_bits)/log(10)), {})[system] = time

compareSystems(lookup, "magma", "ntl", "magma_vs_ntl.png")
compareSystems(lookup, "magma", "pari", "magma_vs_pari.png")
compareSystems(lookup, "pari", "ntl", "pari_vs_ntl.png")
