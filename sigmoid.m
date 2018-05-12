function prob = sigmoid(z)

#   Probability = sigmoid(z) computes a value in the interval (0,1)
#	for a given z. z is a Real number -infinity < z < +infinity
#	Used in logistic regression
#	Treated as a probability value

prob = 1.0 ./ (1.0 + exp(-z));
end
