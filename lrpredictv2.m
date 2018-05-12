function p = predict(X, theta)
#	
#   p = predict(X, theta, degree) returns the class (0 or 1) 
#	given the value of X, theta and the model
#	in logistic regression

[ m  c ] = size(X); # Number of training examples

# Number of classifications to be done
p = zeros(m, 1);

# Get the size of the model used
# Degree = sqrt(1+8*length(theta)) -3)*0.5
# Follows from the fact that a nth degree model has (n+1)*(n+2)/2 terms.
# If L is the length, solve the quadratic n^2+3n-2(L-1) = 0

if (c == 2)
	degree = round((sqrt(1+8*length(theta)) -3)*0.5); # Simplified. Round to force to integer
	M = getpolymodel(X(:,1), X(:,2), degree);
	M = M(:,2:end); # drop the colum of 1's
	p = round(sigmoid(M*theta));
else
	p = round(sigmoid(X*theta));
endif

end
