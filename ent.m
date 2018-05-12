function E = ent(x)

# E = ent(x) takes as input
#	x is a column vector whose entries are integers. x(i) is the count of the number of
#	occurrences of the attribute i in the input.
if any(find(x < 0)) 
	error('Count has to be positive');
endif
P = x./sum(x);
zidx = find(P == 0);
P(zidx) = 1; # As log2(0) is undefined we force P.*log2(P) to be 0 by setting P to 1.
E = -sum(P.*log2(P));
endfunction

