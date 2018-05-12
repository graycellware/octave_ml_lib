function [prob, category ] = lrpredict(X, theta, degree, metaData)

# 	lrpredict(X,theta) predicts the probability (in vector p)
#	and class (in vector category), given a test matrix X
#	and the theta resulting from training
#	degree is the degree of the polynomial used in training
#	
#	If X is a m x n matrix, then metaData is a 2 x n matrix
#	in which the first row contains the minimum value for each column 
#	(metaData(1,i) = minimum possible value for column i in X,
#	and the second row contains the maximum value for each column 
#	(metaData(2,i) = maximum possible value for column i in X


# Normalize X
X = normalizeXM(X,metaData);

# Ensure that theta is a column vector;
theta = theta(:);

# Next, get the polynomial
M = getpolymodel(X,degree);
prob = sigmoid(M*theta);
category = prob >= 0.5;
end
