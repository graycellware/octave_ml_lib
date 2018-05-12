function [ p, skew ] = probcause(x, y, value)


[ m, n ] = size(x);

if ( n != 1)
	error('x is not a column vector');
endif

[ m, n ] = size(y);

if ( n != 1)
	error('y is not a column vector');
endif


if (length(x) != length(y))
	error('inputs column vectors x and y should have the same length');
endif

numData = length(x);

# Prob(x = value| y = 1)
E = x == value;
Ev = sum(y.*E); # Both event and value in x : Prob(x = value | event)
p = Ev * sum(y) / (sum(E) * numData);

skew = Ev/sum((1 - y).*E);
endfunction
