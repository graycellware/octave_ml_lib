function L = getTemplate(n, deg)

# function L = getTemplate(n, deg)
# takes as input the number of variables 'n'
# and the degree 'deg', and returns all possible 
# sorted combinations of length 'deg'

x = (1:n)';
M = []; # Empty matrix

for cols = 1:deg
	offset = 1; 
	numRows = n^(deg-cols);
	P = [];
	
	for rows = 1:n
		Q = repmat(x(rows),numRows,1);
		if isempty(P)
			P = Q;
		else
			P = [ P; Q ];
		end
		offset+=numRows;
	endfor
	
	numRows = n^(cols-1); # Reusing variable
	Q = repmat(P,numRows,1);
	if isempty(M)
		M = Q;
	else
		M = [ M Q ];
	endif
end
	
M = sort(M,2); 
L = unique(M,'rows');


