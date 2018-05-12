function [ E, M, varM ] = ent2(x,y)

# E = ent2(x) takes as input
#	x,y are column vectors whose entries are integers. 
#	x(i) is the count of the number of
#	occurrences of the attribute i in the input.
#	y is an outcome matrix (0/1)

U = unique(y);

if length(U) ~= 2
	error('y needs to be binary (0/1)');
endif

if ~(any(find(U==0)) && any(find(U==1)))
	error('y needs to be binary (0/1)');
endif

U = unique(x); # Find out the number of unique entries in x.
E =0;

M = -1;
for jj = 1:length(U)
	u = U(jj);
	Q = x == u;
	pu = sum(Q)./length(x);
	T = sum(Q.*y); # Number of elements of x where value == u and y == 1
	F = sum(Q) - T;
	A = [ T, F];
	alpha = ent(A);
	E += pu*alpha;
	if alpha > M
		M = alpha;
		varM = u;
	endif 
endfor
endfunction

