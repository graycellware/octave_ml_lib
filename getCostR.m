function [Cost, grad] = getCostR(X, y, theta, lambda)


#   [Cost, grad] = getCostR(X, y, theta, lambda) computes the 
#   cost of using theta as the parameter for linear regression with regularization to fit the 
#   data points in X and y. f(X) = y; lambda is the regularization parameter
# 	Returns the cost in Cost and the gradient in grad


m = length(y); # number of training examples

Cost = 0;
grad = zeros(size(theta));

# X is a m x (n+1) matrix 
# theta is a n+1 x 1 col vector

err = X*theta - y;


theta(1) = 0; # I don't care about theta(1) any more

Cost = (0.5/m)*(err'*err + lambda*theta'*theta); # Regularization

grad = (1/m)*(X'*err +lambda*theta);

grad = grad(:);
end
