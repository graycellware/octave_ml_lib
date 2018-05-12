function [Cost, grad] = getCostRLgR(theta, X, y, lambda)

#	getCostRLgR computes the cost and gradient for logistic regression WITH regularization
#   Cost = getCostRLgR(theta, X, y, lambda) computes the cost of using
#   theta as the parameter for regularized logistic regression, and the
#   gradient of the cost.




Cost = 0;
grad = zeros(size(theta));
m = length(y); # number of training examples

h_theta = sigmoid(X * theta);


# During regularization, theta(1) is not used. Therefore, to facilitate vectorization,
# we set theta(1) = 0.
theta(1)=0;


Cost = (1/m)*sum(-y.*log(h_theta)-(1-y).*log(1 - h_theta)) + (lambda/(2*m))*theta'*theta;

# Note: grad is nothing but d(Cost)/dtheta_i

grad = (1/m).*(X'*(h_theta - y) + lambda.*theta);

endfunction
