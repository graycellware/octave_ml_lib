function [ eVec, eVal ] = sortEig(A)

# 	[ V, S ] = sortEig(A)
# 	The eig function in Octave does not sort the eigenvalues
#	sortEig takes as input a square matrix A, and returns the
#	sorted (descending) eigenvalues in the diagonal matrix S.
#	The eigen value in s_ii > s_jj if i < j
#	the eigenvector corresponding to the eigenvalue in entry s_ii
#	is in the ith column of V. V is an orthonormal square symmetric matrix
#	hence V' = V^(-1) = V
# 	if A is not a square matrix, report error

if(issquare(A))
	[ eVec, eVal ] = eig(A);
	[ ~, idx ] = sort(diag(eVal),'descend');
	eVal = eVal(idx,idx);
	eVec = eVec(idx,idx);
else
	error('sortEig needs a square matrix as input');
endif
