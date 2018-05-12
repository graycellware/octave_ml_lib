function M = getpolymodel(X,degree)

# X =  getpolymodel(X,degree) takes as input X, m x n matrix
# where each of the n columns is treated as a variable
# and returns M containing all the terms of (X(1) + ... + X(n))^d
# wihout their respective coefficients

[m,n] = size(X); # Number of variables

M = [ ones(m,1) X ]; # Order 1 model

 if degree == 1
 	return;
 endif
 
 L = getTemplate(n,1); # Get the first ordertemplate
 prevL = L;
 colOffset =1; # The last order starts from col 1
 nextColOffset = size(M,2);
 
 for deg = 2:degree
 	L = getTemplate(n,deg);
 	lenL = size(L,1); # Number of rows of L
 	lenPL = size(prevL,1); # Number of rows of prevL
 	# Loop through each row of L
 	# each row adds a column to M
 	for ii = 1:lenL
 		#prefix = L(ii,1:(end-1));
 		prefix = repmat(L(ii,1:(end-1)),lenPL,1);
 		Q = prevL- prefix;
 		R = sum(Q,2);
 		idx = find(R == 0);
 		suffix = L(ii,end);
 		# So we have to multiply elementwise
 		# column number (colOffset+prefix) of 
 		# M with column number suffix of X
 		b = M(:,(colOffset+idx)).*X(:,suffix);
 		M = [ M, b ];
 	endfor
 	
 	colOffset = nextColOffset;
 	nextColOffset = size(M,2);
 	prevL = L;
 	
 endfor
end		
 		
 	
 		
 	
 	
 


