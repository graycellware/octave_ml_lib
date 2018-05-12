function [theta] = getTheta(X, y, lambda)

#   [theta] = getTheta (X, y, lambda) trains linear regression using
#   the dataset (X, y) and regularization parameter lambda. Returns the
#   trained parameters theta.


# Initialize Theta
theta0 = zeros(size(X, 2), 1); 

costFunction = @(t) getCostR(X, y, t, lambda);

# Minimize using fmincg
theta = fmincg(costFunction, theta0, 'MaxIter', 500, 'GradObj', 'on');

end
