function delg = gradsigmoid(z)

# 	delg = gradsigmoid(z) returns the gradient of the sigmoid function
#	evaluated at z.
#   It computes the gradient of the sigmoid function evaluated at z. 
#	where z is a matrix/vector/scalar. If z is a vector or matrix, gradsigmoid returns
#   the gradient for each element.

t = sigmoid(z);
g = zeros(size(z));
g = t.*(1-t);
endfunction
