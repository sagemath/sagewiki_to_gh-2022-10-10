
.. code:: python

    import sage.combinat.finite_state_machine
    sage.combinat.finite_state_machine.FSMOldProcessOutput = False
    sage.combinat.finite_state_machine.FSMOldCodeTransducerCartesianProduct = False
Automata and Transducers in SageMath
====================================

Digit Expansions
----------------

-  **decimal system**: base 10, digits 0, 1, ..., 9
-  **binary system**: base 2, digits 0, 1
-  base 2, digits -1, 0, 1 --> *redundancy*

Non-adjacent Form (NAF)
~~~~~~~~~~~~~~~~~~~~~~~

-  no consequtive non-zero digits in expansion
-  examples
-  3 = 1 + 2 = (1 1)2 (standard binary) ... not a NAF
-  3 = -1 + 4 = (-1 0 1)2 ... a NAF

Creating a Transducer from Scatch
---------------------------------

.. code:: python

    NAF1 = Transducer([('I', 0, 0, None), ('I', 1, 1, None),
                       (0, 0, 0, 0), (0, 1, 1, 0),
                       (1, 0, 0, 1), (1, 2, 1, -1),
                       (2, 1, 0, 0), (2, 2, 1, 0)], 
                      initial_states=['I'], final_states=[0], 
                      input_alphabet=[0, 1])
    NAF = NAF1
    NAF
.. code:: python

    view(NAF)
.. code:: python

    14.digits(base=2)
.. code:: python

    NAF(14.digits(base=2))
.. code:: python

    NAF.process(14.digits(base=2))
.. code:: python

    NAF(14.digits(base=2) + [0, 0, 0])
.. code:: python

    NAF = NAF.with_final_word_out(0)
.. code:: python

    NAF(14.digits(base=2))
Calculating the Non-adjacent Form with Less Thinking
----------------------------------------------------

.. code:: python

    def NAF_transition(state_from, read):
        if state_from == 'I':
            write = None
            state_to = read
            return (state_to, write)
        current = 2*read + state_from
        if current % 2 == 0:
            write = 0
        elif current % 4 == 1:
            write = 1
        else:
            write = -1
        state_to = (current - write) / 2
        return (state_to, write)
    
    NAF2 = Transducer(NAF_transition,
                      initial_states=['I'],
                      final_states=[0],
                      input_alphabet=[0, 1]).with_final_word_out(0)
    
    NAF == NAF2
.. code:: python

    NAF2(14.digits(base=2))
A 3rd Construction of the Same Transducer
-----------------------------------------

-  (NAF of 2n) = (binary of 3n) – (binary of n)

.. code:: python

    def f(state_from, read):
        current = 3*read + state_from
        write = current % 2
        state_to = (current - write) / 2
        return (state_to, write)
    
    Triple = Transducer(f, input_alphabet=[0, 1],
                        initial_states=[0],
                        final_states=[0]).with_final_word_out(0)
    Triple
.. code:: python

    Triple(4.digits(base=2))
.. code:: python

    Id = Transducer([(0, 0, 0, 0), (0, 0, 1, 1)],
                    initial_states=[0], final_states=[0],
                    input_alphabet=[0, 1])
.. code:: python

    prebuiltId = transducers.Identity([0, 1])
.. code:: python

    Combined_3n_n = Triple.cartesian_product(Id).relabeled()
    Combined_3n_n
.. code:: python

    Combined_3n_n(4.digits(base=2))
.. code:: python

    def g(read0, read1):
        return ZZ(read0) - ZZ(read1)
    
    Minus = transducers.operator(g, input_alphabet=[None, -1, 0, 1])
.. code:: python

    prebuiltMinus = transducers.sub([-1, 0, 1])
.. code:: python

    NAF3 = Minus(Combined_3n_n).relabeled()  # compositions of transducers
.. code:: python

    NAF3(14.digits(base=2))
An Automaton detecting NAFs
---------------------------

.. code:: python

    view(NAF)
.. code:: python

    A = NAF.output_projection()
    A
.. code:: python

    A([0])
.. code:: python

    A([0, -1, 1])
.. code:: python

    A([1, 0, 1])
.. code:: python

    view(A)
.. code:: python

    A = A.split_transitions()
    A
.. code:: python

    A.is_deterministic()
.. code:: python

    A.determine_alphabets()
    A = A.minimization().relabeled()
    A
.. code:: python

    A.is_deterministic()
Combining Small Transducers to a Larger One: The 3/2-1/2-NAF
------------------------------------------------------------

.. code:: python

    NAF = NAF3
    NAF3n = NAF(Triple)  # composition
    Combined_NAF_3n_n = NAF3n.cartesian_product(NAF).relabeled()
    T = Minus(Combined_NAF_3n_n).relabeled()  # composition
    T
.. code:: python

    T(14.digits(base=2))
.. code:: python

    def value(digits):
        return sum(d * 2^(e-2) for e, d in enumerate(digits))
    value(T(14.digits(base=2)))
Again an Alternative Construction
---------------------------------

.. code:: python

    def minus(trans1, trans2):
        if trans1.word_in == trans2.word_in:
            return (trans1.word_in, 
                    trans1.word_out[0] - trans2.word_out[0])
        else:
            raise LookupError
    
    from itertools import izip_longest
    def final_minus(state1, state2):
        return [x - y for x, y in 
            izip_longest(state1.final_word_out, state2.final_word_out, fillvalue=0)]
    
    Talternative = NAF3n.product_FiniteStateMachine(
                               NAF, minus,
                               final_function=final_minus).relabeled()
    Talternative == T
Getting a Picture
-----------------

.. code:: python

    sage.combinat.finite_state_machine.setup_latex_preamble()
    latex.mathjax_avoid_list('tikzpicture')
    T.set_coordinates({
        0: (-2, 0.75),
        1: (0, -1),
        2: (-6, -1),
        3: (6, -1),
        4: (-4, 2.5),
        5: (-6, 5),
        6: (6, 5),
        7: (4, 2.5),
        8: (2, 0.75)})
    T.latex_options(format_letter=T.format_letter_negative,
                    accepting_where={
                      0: 'right',
                      1: 'below',
                      2: 'below',
                      3: 'below',
                      4: 60,
                      5: 'above',
                      6: 'above',
                      7: 120,
                      8: 'left'},
                    accepting_show_empty=True)
    
    view(latex(T))
    latex(T)
Weights
-------

.. code:: python

    def weight(state_from, read):
        write = ZZ(read != 0)
        return (0, write)
    
    Weight = Transducer(weight, input_alphabet=srange(-2, 2+1),
                        initial_states=[0], final_states=[0])
    Weight.add_transition((0, 0, None, None))
    Weight
.. code:: python

    prebuiltWeight = transducers.weight(srange(-2, 2+1))
.. code:: python

    NAF = NAF2  # reset since modified above
    W_binary = Weight(Id)
    W_NAF = Weight(NAF)
    W_T = Weight(T)
.. code:: python

    expansion = 14.digits(base=2)
    print "binary" , Id(expansion), W_binary(expansion), sum(W_binary(expansion))
    print "NAF", NAF(expansion), W_NAF(expansion), sum(W_NAF(expansion))
    print "T", T(expansion), W_T(expansion), sum(W_T(expansion))
Also Possible: Adjacency Matrices
---------------------------------

.. code:: python

    var('y')
    def am_entry(trans):
        return y^add(trans.word_out) / 2
    W_T.adjacency_matrix(entry=am_entry)
Asymptotic Analysis
-------------------

.. code:: python

    var('k')
    W_binary.asymptotic_moments(k)
.. code:: python

    W_NAF.asymptotic_moments(k)
.. code:: python

    W_T.asymptotic_moments(k)