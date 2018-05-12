function s = specificity(x,y,value)

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

R = x != value;
TN = sum(R.*(1-y));
FP = sum((1-R).*(1-y));
s = TN/(TN+FP);
endfunction
