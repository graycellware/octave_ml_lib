function [X, e, v] = CMDS(P)
  
  if isvector (P)
    P = squareform (P);
  endif
  # Torgerson’s Procedure for Metric MDS
  # Create a “double-centered” version of D, designated Dstar
  # Double-centering transforms D, so that the row sums, the
  # column sums, and the overall sum of the cell entries in the
  # matrix are all zero.
  # Based on https://homepages.uni-tuebingen.de/florian.wickelmaier/pubs/Wickelmaier2003SQRU.pdf pages 9-11.
  
  # Ensure Octave does not crib :)
  warning ("off", "Octave:broadcast","local");
  
  [m,n] = size(P); # Obviously m = n
  P2 = P.*P; # We get P^2
  matJ = eye(m) - (ones(m,n)./n);
  Dstar = -0.5.*matJ*P2*matJ;
  

	# Dstar can be factored to obtain the matrix of point coordinates:
	# Dstar = XX'
	# The factoring process is carried out by performing an
	# eigendecomposition on Dstar
	# Dstar = VE^2V' = (VE)(VE)'
	# where V is the eigenvector matrix and E is the diagonal matrix of eigenvalues
	#
	# X is then = VE.
	# We return only those eigenvalues which are > 0.
  
  	[v e] = eig(Dstar);
  	
  	#disp(size(v)); 
    e = diag(e); # Create diagonal matrix of eigenvalues
    [e, sortidx] = sort(e,'descend'); #disp(size(e));
    v = v(:,sortidx);
    
    
  	idx = find(e > 0); # get only the positive eigenvalues
  	v = v(:,idx); # get corresponding eigenvectors
  	X = v* diag(sqrt(e(idx))); # X = VE (returning only positive eigenvalues)
  
endfunction
