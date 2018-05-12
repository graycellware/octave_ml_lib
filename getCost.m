function [Cost, grad]  = getCost(X, y, theta)

#   [Cost, grad] = getCost(X, y, theta) computes the 
#   cost of using theta as the parameter for linear regression WITHOUT regularization
#   Returns the cost in Cost and the gradient in grad



m = length(y); # Size of training set
Cost = 0;
err = X*theta - y;
Cost = 0.5*(err'*err)./m;
grad = X'*err./m;
grad = grad(:);
end




