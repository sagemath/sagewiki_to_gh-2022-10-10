= Create a Matrix_numpy_dense class in Sage =

Add a new file {{{matrix_numpy_dense.pyx}}} to the devel/sage/sage/matrix/ directory that implements ``Sage matrices'' that wrap the raw data of a numpy array. 

Issues: Sage matrices are 2-dimensional -- but really could be n-dimensional if the base ring is a tuple-ring say.  Interesting.
