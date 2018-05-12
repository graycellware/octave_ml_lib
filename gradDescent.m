function theta = gradDescent(X, Y, lambda)

#	theta = gradDescent(X, Y, lambda)
# 	Performs gradient descent to learn theta
#   theta = gradDescent(x, y, lambda) updates theta by
#   computing cost over a given number of iterations
#	uses getCostR() and fmincg() lambda is the regularization parameter

# Initialize Theta (theta0 is the initial value of theta)
theta0 = zeros(size(X, 2), 1); 
.
#	Associate function pointer for getCostR
costFunction = @(t) getCostR(X, y, t, lambda);

# Create a simple string for options for fmincg
options = optimset('MaxIter', 200, 'GradObj', 'on');

# Minimize using fmincg
theta = fmincg(costFunction, theta0, options);

end
