function [Cost, grad] = getCostLgR(theta, X, y)


#	getCostLgR computes the cost and gradient for logistic regression WITHOUT regularization (lambda =0)
#   [Cost, grad] = getCostLgR(theta, X, y) computes the cost of using theta as the
#   parameter for logistic regression, and the gradient of the cost.


Cost = 0;
grad = zeros(size(theta));
m = length(y); # number of training examples

h_theta = sigmoid(X * theta); 

Cost = (1/m)*sum(-y.*log(h_theta)-(1-y).*log(1-h_theta));

grad = (1/m)*X'*(h_theta - y);

end
