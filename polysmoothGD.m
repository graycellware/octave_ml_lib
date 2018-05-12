function [ y, degree ] = polysmoothGD(x)

# function y = polysmooth(x) takes as input a column vector
# x, and finds the best polynomial to approximate x, and returns
# the degree of the polynomial and the smoothened x in y.

x = x(:); # ensure that x is a column vector

theta = getbestmodelGD(x);
degree = length(theta) -1;
X = (1:length(x))';
D = X;
M = ones(length(x),1);

for ii =1:degree
	M = [ M D ];
	D .*= X;
endfor
	
y = M*theta;
end

endfunction

