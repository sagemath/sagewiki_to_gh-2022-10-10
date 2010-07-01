def minPolyGen(conductor,degree):
	"""
	Give an integer m for which the multiplicative group of
	of ZZ/mZZ is cyclic then for each divisor d of euler_phi(m), there
	will be a unique subfield of Q(zeta_m) of degree d. This returns
	this polynomial which generates such an extension. 
	
	EXAMPLE:
	  m=7, d=3
	  K.<a> = NumberField(minPolyGen(7,3))
	"""
	n = conductor
	d = degree

	# check that the Z/nZ has cyclic multiplicative group
	if not n % 2 == 0 and not n.is_prime_power():
		raise ValueError, 'Invalid input because (ZZ/%sZZ)* is not cyclic' % n
	if n % 2 == 0:
		nprime = Integer(n/2)
		if not nprime.is_prime_power() or nprime % 4 == 0:
			raise ValueError, 'Invalid input because (ZZ/%sZZ)* is not cyclic' % n
 
	# check that there will be such a field of degree d in side QQ(zeta_n)
	if euler_phi(n) % d != 0:
		raise ValueError, 'No field exists because %s does not divide %s=phi(%s)' % (d,euler_phi(n),n)

	f = euler_phi(n)/d
        R = IntegerModRing(n)
        g = R.unit_gens()[0]
        zetap = CC.zeta(n)
	
	# create a list alpha of all the Galois conjugates
        alpha = []
        for i in range(d):
                alpha.append(0)
                for j in range(f):
                        alpha[i] += zetap^(Integer(g^(d*j+i)))

        S.<x> = ZZ[]
        the_poly = prod(x - a for a in alpha)
	coeff = [CC(x).real_part().round() for x in the_poly.coefficients()]
	new_poly = S(0)
        for i in range(len(coeff)):
                new_poly += coeff[i]*S.gen()^i
	return new_poly

def shaOrderFast(E,K,mod_symb,m,precision=10^(-10)):
	"""
	E = EllipticCurve/Q we want #Sha(E/K) for
	K = Field to check over
	mod_symb = modular symbols of E
	m = conductor of K (should be 1 mod d)
	precision = a precision to which we will consider something an integer

	Want to return:
		0: integral order of sha
		1: real order of sha
		2: product without the L(E,1) term (j=0 below)
	"""
	print '\t checking conductor %s on curve %s' % (m,E.cremona_label())
	if E.conductor() % m == 0:
		raise ValueError, 'field conductor m=%s was not coprime to E.conductor()=%s' % (m,E.conductor()) 
	d = K.degree()
	EK = E.change_ring(K)
	tor_order = EK.torsion_subgroup().order()^2
	tamagawa_factor = EK.tamagawa_product_bsd()
	product_result = 1
	R = IntegerModRing(m)
	g = R.unit_gens()[0]
	bits = 53
	accurate = False
	while accurate == False:
		C = ComplexField(bits)
		z = C.zeta(m-1)
		max_ellchi = 0
		symbols = [mod_symb(Integer(g^k)/m) for k in range(m-1)]
		for j in range(1,d):
			ellchi = sum(z^((m-1)*j*k/d)*symbols[k] for k in range(m-1))
			max_ellchi = max(max_ellchi,ellchi.norm())
			product_result *= ellchi
		nontrivial_part = CC(product_result.real_part())
		product_result *= mod_symb(0)
		real_result = CC(product_result*tor_order/(tamagawa_factor*E.real_components()^d)).real_part()
		int_result = real_result.round()
		if nontrivial_part != 0:
			epsilon = max_ellchi/(2*tor_order^(d-1)*euler_phi(m)*nontrivial_part*max([r for r in symbols]))
			epsilon = CC(epsilon.norm())
			b = RR(-log(epsilon)/log(2))
			print b
			if b < bits:
				accurate = True
			else:
				bits *= 2
				product_result = 1 # resset the result
		else:
			accurate = True
	
	return [int_result, real_result, nontrivial_part]

def sha_fast(p,field_conductor_bound=100,curve_conductor_bound=20,curve_conductor_lower_bound=11,spacing=20,filename='sha_fast_data.txt'):
	"""
	p = degree of fields K to consider sha(E/K)
	field_conductor_bound = bound on the conductor of the number field
	curve_conductor_bound = UPPER bound on conductor of elliptic_curves to consider
	curve_conductor_lower_bound = LOWER bound on conductor of elliptic_curves to consider
	spacing = formatting
	filename = filename if you want to specify one
	"""
	if filename == 'sha_fast_data.txt':
		filename = 'sha_data_%s_%s_%s_%s.txt' % (p, field_conductor_bound, curve_conductor_lower_bound, curve_conductor_bound)
	bad_filename = filename+'.exceptions'
	candidates = [q for q in prime_range(field_conductor_bound) if q % p == 1]
        print 'Candidates field conductors initialized...'
	fields=[NumberField(minPolyGen(q,p),'a') for q in candidates]
	print 'Fields initialized...'
	file = open(filename, 'a')
	bad_file = open(bad_filename, 'a')
	print 'Writing to file %s' % filename
	file.write('Data for fields of degree %s of conductor < %s with curves having conductor between %s and %s\n' % (p, field_conductor_bound, curve_conductor_lower_bound, curve_conductor_bound))
	bad_file.write('Exceptions thrown for fields of degree %s of conductor < %s with curves having conductor between %s and %s\n' % (p, field_conductor_bound, curve_conductor_lower_bound, curve_conductor_bound))
	file.write('%s %s %s %s %s %s\n' % ('Curve label'.ljust(spacing), 'ZZ(#Sha(E/K))'.ljust(spacing), '#Sha(E/K)'.ljust(spacing), 'ell_chi'.ljust(spacing), 'Field conductor'.ljust(spacing), 'Field degree'.ljust(spacing)))
	for E in CremonaDatabase().iter_optimal([curve_conductor_lower_bound..curve_conductor_bound]):
		print 'Beginning curve %s' % E.cremona_label()
		try:
			M = E.modular_symbol()
		except:
			bad_file.write('Curve %s did not compute its modular symbols correctly\n' % E.cremona_label())
		else:
			for q in candidates:
				try:
					shaData = shaOrderFast(E,fields[candidates.index(q)],M,q)
                                except ValueError as detail:
					bad_file.write('Curve %s threw exception: %s\n' % (E.cremona_label(), detail))
				except:
					bad_file.write('Curve %s threw unrecorded exception\n' % E.cremona_label())
				else:	
					shaOrder = shaData[0]
					shaOrder_R = shaData[1]
					chi_factors = shaData[2]
					to_write = '%s %s %s %s %s %s\n' % (str(E.cremona_label()).ljust(spacing), is_square(shaOrder) and str(shaOrder).ljust(spacing) or (str(shaOrder)+'***').ljust(spacing), str('%.4f' % shaOrder_R).ljust(spacing), str('%.4f' % chi_factors).ljust(spacing), str(q).ljust(spacing), str(fields[candidates.index(q)].degree()))
                                	file.write(to_write)
	file.close()
	bad_file.close()
	print 'Finished'


def sha_list_for_curve(d,E,field_conductor_bound=100,spacing=20,filename=None):
	"""
	d = degree of fields K to consider sha(E/K)
	field_conductor_bound = bound on the conductor of the number field
	spacing = formatting
	filename = filename if you want to specify one
	"""
	if filename == None:
		filename = 'sha_data_%s_%s_%s.txt' % (d, E.cremona_label(), field_conductor_bound)
	bad_filename = filename+'.exceptions'
	candidates = [q for q in prime_range(field_conductor_bound) if q % d == 1]
        print 'Candidates field conductors initialized...'
	fields=[NumberField(minPolyGen(q,d),'a') for q in candidates]
	print 'Fields initialized...'
	file = open(filename, 'a')
	bad_file = open(bad_filename, 'a')
	print 'Writing to file %s' % filename
	file.write('Data for fields of degree %s, prime conductor < %s with curve %s\n' % (d, field_conductor_bound, E.cremona_label()))
	bad_file.write('Exceptions for fields of degree %s, prime conductor < %s with curve %s\n' % (d,field_conductor_bound,E.cremona_label()))
	file.write('%s %s %s %s %s %s\n' % ('Curve label'.ljust(spacing), 'ZZ(#Sha(E/K))'.ljust(spacing), '#Sha(E/K)'.ljust(spacing), 'ell_chi'.ljust(spacing), 'Field conductor'.ljust(spacing), 'Field degree'.ljust(spacing)))
	print 'Beginning curve %s' % E.cremona_label()
	try:
		M = E.modular_symbol()
	except:
		bad_file.write('Curve %s did not compute its modular symbols correctly\n' % E.cremona_label())
	else:
		for q in candidates:
			try:
				shaData = shaOrderFast(E,fields[candidates.index(q)],M,q)
                        except ValueError as detail:
				bad_file.write('Curve %s threw exception: %s\n' % (E.cremona_label(), detail))
			except:
				bad_file.write('Curve %s threw unrecorded exception\n' % E.cremona_label())
			else:	
				shaOrder = shaData[0]
				shaOrder_R = shaData[1]
				chi_factors = shaData[2]
				to_write = '%s %s %s %s %s %s\n' % (str(E.cremona_label()).ljust(spacing), is_square(shaOrder) and str(shaOrder).ljust(spacing) or (str(shaOrder)+'***').ljust(spacing), str('%.4f' % shaOrder_R).ljust(spacing), str('%.4f' % chi_factors).ljust(spacing), str(q).ljust(spacing), str(fields[candidates.index(q)].degree()))
                                file.write(to_write)
	file.close()
	bad_file.close()
	print 'Finished'

