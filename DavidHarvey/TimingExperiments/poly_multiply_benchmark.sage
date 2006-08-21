""" This is a program for comparing times of NTL, MAGMA, PARI multiplication
of polynomials over Z, over various degrees and coefficient sizes.

AUTHOR: David Harvey (2006-08-21)
"""

## todo: docstring

from sys import stdout

# which systems to test:
systems = ["magma", "pari", "ntl"]

# initialise various subsystems
if "magma" in systems:
    M = Magma()
    M.set("R<x>", "PolynomialRing(IntegerRing())")

if "pari" in systems:
    pari.allocatemem()
    pari.allocatemem()
    pari.allocatemem()
    pari.allocatemem()
    pari.allocatemem()
    pari.allocatemem()


# polynomials over Z


def poly_to_string(coeffs):
    # returns string for polynomial with given coefficients
    return "+".join(["%s*x^%s" % (str(coeffs[i]), i) for i in range(len(coeffs))])


def time_ntl(coeffs1, coeffs2, poly1_string, poly2_string, num_trials):
    poly1 = ntl.ZZX(coeffs1)
    poly2 = ntl.ZZX(coeffs2)

    t = cputime()
    for trial in range(num_trials):
        poly = poly1 * poly2
    return cputime(t)


def time_magma(coeffs1, coeffs2, poly1_string, poly2_string, num_trials):
    M.set("poly1", poly1_string)
    M.set("poly2", poly2_string)

    t = M.cputime()
    for trial in range(num_trials):
        M.set("result", "poly1 * poly2")
    return M.cputime(t)


def time_pari(coeffs1, coeffs2, poly1_string, poly2_string, num_trials):
    poly1 = pari(poly1_string)
    poly2 = pari(poly2_string)
    t = cputime()
    for trial in range(num_trials):
        poly3 = poly1 * poly2
    return cputime(t)



# make a list of degrees to test
degree_list = [10]
while degree_list[-1] < 10000:
    degree_list.append(ceil(degree_list[-1] * 1.3))

# make a list of coefficient sizes to test
coeff_bits_list = [4]
while coeff_bits_list[-1] < 10000:
    coeff_bits_list.append(ceil(coeff_bits_list[-1] * 1.3))

for degree in degree_list:
    for coeff_bits in coeff_bits_list:

        # generate random polynomials to multiply
        max_coeff = 2**coeff_bits
        coeffs1 = [ZZ.random(max_coeff) for i in range(degree)]
        coeffs2 = [ZZ.random(max_coeff) for i in range(degree)]

        poly1_string = poly_to_string(coeffs1)
        poly2_string = poly_to_string(coeffs2)

        for system in systems:
            timing_function = eval("time_" + system)

            # determine an appropriate number of trials for each timing attempt

            num_trials = 0
            t = 0.0
            while t < 0.3:
                if num_trials == 0:
                    num_trials = 1
                else:
                    num_trials *= 2

                t = timing_function(coeffs1, coeffs2, poly1_string, poly2_string, num_trials)

            # now take 5 samples with that number of trials each

            samples = [t / num_trials]
            for i in range(4):
                t = timing_function(coeffs1, coeffs2, poly1_string, poly2_string, num_trials)
                samples.append(t / num_trials)

            # get some stats on the sample timing

            average = sum(samples) / len(samples)
            value_range = max(samples) - min(samples)

            print "%d %d %s %.5f %.5f %d" % (degree, coeff_bits, system, average, value_range, num_trials)
            stdout.flush()

