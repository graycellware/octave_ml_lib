function theta = sGradDescent(X, y, theta, alpha, iterations)
#
#
# 	Performs Stochastic gradient Descent to learn theta
#   theta = sGradDescent(x, y, theta, alpha, iterations) updates theta by
#   computing delta-theta over a given number of iterations


# number of training examples
m = length(y);
err = zeros(size(theta));

for idx = 1:iterations,
	# randomize the learning set
	randIdx = randperm(size(X,1));
	X = X(randIdx,:);
	Y = y(randIdx);
	for row = 1:m,
		err = alpha*(X(row,:)*theta - Y(row))*X(row,:);
		theta = theta - err';
	endfor
endfor

end
