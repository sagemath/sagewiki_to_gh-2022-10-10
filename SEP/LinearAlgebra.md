This may be more of a work-in-progress than a formal SEP, but I\'m not sure where else to put it.

Basically, we now have inconsistency of what functions are defined for what matrix types. This makes things confusing to students, for example; when they are doing a problem, often a matrix will be coerced into a new type, which then has a different set of functions.

We should also carefully look at the eig* functions in each datatype and make sure that the interface is consistent and that the eigenvalues/vectors/spaces/matrices are computed in the appropriate way.


These methods are fine the way they are now:

|| method || Integer Ring || Rational Field || Real Field with 53 bits of precision || Complex Field with 53 bits of precision || Real Double Field || Complex Double Field || Symbolic Ring ||
|| BKZ || TRUE ||  ||  ||  ||  ||  ||  ||
|| LLL || TRUE ||  ||  ||  ||  ||  ||  ||
|| LLL_gram || TRUE ||  ||  ||  ||  ||  ||  ||
|| add_multiple_of_column || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| add_multiple_of_row || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| apply_map || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| apply_morphism || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| arguments ||  ||  ||  ||  ||  ||  || TRUE ||
|| change_ring || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| column || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| column_module || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| columns || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| commutator || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| copy || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| db || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||  Is this used?? ||
|| dense_columns || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| dense_matrix || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| dense_rows || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| det || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| determinant || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| dict || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| dump || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| dumps || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||


These methods still need to be combed through to see if something needs to be done.

|| method || Integer Ring || Rational Field || Real Field with 53 bits of precision || Complex Field with 53 bits of precision || Real Double Field || Complex Double Field || Symbolic Ring ||
|| expand ||  ||  ||  ||  ||  ||  || TRUE ||
|| factor ||  ||  ||  ||  ||  ||  || TRUE ||
|| fcp || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| find || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| frobenius || TRUE ||  ||  ||  ||  ||  ||  ||
|| gcd || TRUE ||  ||  ||  ||  ||  ||  ||
|| get_subdivisions || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| gram_schmidt || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| hadamard_bound || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| height || TRUE || TRUE ||  ||  ||  ||  ||  ||
|| hermite_form || TRUE ||  ||  ||  ||  ||  ||  ||
|| hessenberg_form || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| hessenbergize || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| image || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| index_in_saturation || TRUE ||  ||  ||  ||  ||  ||  ||
|| insert_row || TRUE ||  ||  ||  ||  ||  ||  ||
|| integer_kernel || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| inverse || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| invert ||  || TRUE ||  ||  ||  ||  ||  ||
|| is_LLL_reduced || TRUE ||  ||  ||  ||  ||  ||  ||
|| is_dense || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_immutable || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_invertible || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_mutable || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_nilpotent || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_one || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_scalar || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_simplified ||  ||  ||  ||  ||  ||  || TRUE ||
|| is_sparse || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_square || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_symmetric || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_unit || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| is_zero || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| iterates || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| jordan_form || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| kernel || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| kernel_matrix || TRUE ||  ||  ||  ||  ||  ||  ||
|| kernel_on || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| left_eigenmatrix || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| left_eigenvectors || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| left_kernel || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| left_nullity || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| lift || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| linear_combination_of_columns || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| linear_combination_of_rows || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| list || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| log_determinant ||  ||  ||  ||  || TRUE || TRUE ||  ||
|| matrix_from_columns || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| matrix_from_rows || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| matrix_from_rows_and_columns || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| matrix_over_field || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| matrix_space || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| matrix_window || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| maxspin || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| minimal_polynomial || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| minors || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| minpoly || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| mod || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| multiplicative_order || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| n || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| ncols || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| new_matrix || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| nonpivots || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| nonzero_positions || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| nonzero_positions_in_column || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| nonzero_positions_in_row || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| norm || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| nrows || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| nullity || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| number_of_arguments ||  ||  ||  ||  ||  ||  || TRUE ||
|| numerical_approx || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| numpy || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| order || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| parent || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| permanent || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| permanental_minor || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| pivot_rows || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| pivots || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| plot || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| prod_of_row_sums || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| randomize || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| rank || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| rational_reconstruction || TRUE ||  ||  ||  ||  ||  ||  ||
|| rename || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| rescale_col || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| rescale_row || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| reset_name || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| restrict || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| restrict_codomain || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| restrict_domain || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| right_eigenmatrix || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| right_eigenspaces || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| right_eigenvectors || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| right_kernel || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| right_nullity || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| rook_vector || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| row || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| row_module || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| row_space || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| rows || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| saturation || TRUE ||  ||  ||  ||  ||  ||  ||
|| save || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| set_block || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| set_col_to_multiple_of_col || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| set_column || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| set_immutable || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| set_row || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| set_row_to_multiple_of_row || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| simplify ||  ||  ||  ||  ||  ||  || TRUE ||
|| simplify_rational ||  ||  ||  ||  ||  ||  || TRUE ||
|| simplify_trig ||  ||  ||  ||  ||  ||  || TRUE ||
|| smith_form || TRUE ||  ||  ||  ||  ||  ||  ||
|| solve_left || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| solve_left_LU ||  ||  ||  ||  || TRUE || TRUE ||  ||
|| solve_right || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| sparse_columns || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| sparse_matrix || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| sparse_rows || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| stack || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| str || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| subdivide || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| subdivision || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| subdivision_entry || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| subdivisions || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| submatrix || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| subs || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| substitute || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| swap_columns || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| swap_rows || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| symplectic_form || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| tensor_product || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| trace || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| transpose || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| variables ||  ||  ||  ||  ||  ||  || TRUE ||
|| version || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| visualize_structure || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| wiedemann || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| with_added_multiple_of_column || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| with_added_multiple_of_row || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| with_col_set_to_multiple_of_col || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| with_rescaled_col || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| with_rescaled_row || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| with_row_set_to_multiple_of_row || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||



These functions are on the todo list.

|| method || Integer Ring || Rational Field || Real Field with 53 bits of precision || Complex Field with 53 bits of precision || Real Double Field || Complex Double Field || Symbolic Ring || TODO ||
|| LU ||  ||  ||  ||  || TRUE || TRUE ||  ||
|| LU_valid ||  ||  ||  ||  || TRUE || TRUE ||  ||
|| QR ||  ||  ||  ||  || TRUE || TRUE ||  ||
|| SVD ||  ||  ||  ||  || TRUE || TRUE ||  ||
|| abs || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Make it clear that this returns the determinant ||
|| act_on_polynomial || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Does not deal with symbolic polynomials ||
|| additive_order || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||  Is this implemented for any matrix ||
|| adjoint || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Rename to adjugate, deprecate this function.  Later, define this function to be the conjugate transpose ||
|| antitranspose || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||  Define antitranspose in the docs ||
|| augment || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Make it clear that other will be coerced to a matrix over self.base_ring().  Maybe this should be changed so that the returned matrix is of a type that both matrices can be coerced to? ||
|| base_extend || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || No documentation ||
|| base_ring || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || No documentation ||
|| block_sum || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Same comment as augment above.  In fact, fixing augment may fix this. ||
|| category || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || No documentation ||
|| characteristic_polynomial || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Docs point to charpoly, but in reality, the long name should have all the docs and charpoly should just be an alias ||
|| charpoly || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || No documentation explaining the characteristic polynomial. ||
|| cholesky ||  ||  ||  ||  || TRUE || TRUE ||  ||
|| column_space || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Make this just an alias for column_module.  In fact, we might deprecate this, since currently it says it returns a vector space for an integer matrix, for example, but does not (returns a free module). ||
|| conjugate || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Does not work for integer matrices (see #4494).  Maybe we need to coerce to complex numbers first? ||
|| decomposition || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Doesn't work for SR matrices ||
|| decomposition_of_subspace || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Doesn't work for SR matrices? ||
|| denominator || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Doesn't work for SR matrices ||
|| density || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || typo in docstring "ration" -> "ratio" ||
|| derivative || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Doesn't work for integer matrices (need to define a derivative function for numeric constants?) ||
|| echelon_form || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Implement #3211 ||
|| echelonize || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Implement #3211 ||
|| eigenmatrix_left || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || For all the eigenfunctions below, make sure that the return values are consistent across rings. ||
|| eigenmatrix_right || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| eigenspaces || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| eigenspaces_left || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| eigenspaces_right || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| eigenvalues || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||
|| eigenvectors_left || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || Implement #4834 ||
|| eigenvectors_right || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE || TRUE ||  Implement #4834 ||
|| elementary_divisors || TRUE ||  ||  ||  ||  ||  ||  || Doesn't work over SR matrices; apparently this function was expanded in 3.2.2 to work over more matrices. ||
|| exp || #4733 || #4733 || #4733 || #4733 || #4733 || #4733 || TRUE ||


I got this from this code:

{{{
import inspect
rings = [ZZ,QQ,RR,CC,RDF,CDF,SR]

ring_methods = {}

for r in rings:
    ring_methods[r] = set([method for method,_ in inspect.getmembers(matrix(r)) if not method.startswith('_')])

# Get a comprehensive list of names.
full_list = set([])

for r in rings:
    full_list.update(ring_methods[r])

full_list = sorted(list(full_list))

s = '|| method || '
s += ' || '.join([repr(r) for r in rings])+' ||'
print s

for method in full_list:
    s = "|| "+ method+" || "
    s += ' || '.join(['TRUE' if method in ring_methods[r] else '' for r in rings])
    s += ' ||'
    print s
}}}
