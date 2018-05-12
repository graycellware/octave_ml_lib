function [theta, degree] = lrtrainv2(X,y, maxDegree, metaData)

# 	[theta, degree] = lrtrain(X, y, maxDegree) performs logistic regression on a 
#	data matrix X, given an outcome column vector y
#	maxDegree is the highest degree of the polynomial in the
#	model generated using X.
# 	Returns the model size in degree, and the corresponding weight matrix theta


# The algorithm to check if a matrix is binary is very easy
# We make use of the function f(x) = abs(2x -1). If x =0, f(x) = abs(-1) = 1
# if x =1, then f(x) = 1. 
# Thus abs(2*X -1 ) makes it an all 1 matrix. Subtracting 1 elementwise, 
# makes all the elements 0. We can find this using any(any(.)) in Octave
# this returns 0 if it is a binary. Subtracting this from 1 gives 1 when matrix is
# binary.


# First, normalize X
fprintf('Normalizing ...');
X = normalizeXM(X, metaData);
fprintf('Done\n\n');
numData = length(y);

dCost = ones(maxDegree,1); # Min cost for each degree

# dlambda = zeros(maxDegree,1); # Best lambda for each degree
dTheta = cell(maxDegree,1); # Cell array to store theta values

Lambda = [ 0, 0.01, 0.03, 0.1, 0.3, 1, 3, 10 ];


fprintf('Training upto polynomial order: %d ...\n\n', maxDegree);

for degree = 1:maxDegree
	Lcost = zeros(length(Lambda),1);
	L_Theta = cell(size(Lambda));

	lambda_idx =1;
	
	for lambda = Lambda
		# Create model M
		M = getpolymodel(X,degree);

		#---------------------------------------------------------------------------------------------------
		# Using unconditional optimization
		# set options for fmincg -- part of octave.
		# It in turn calls quite a few functions

		# Java implementation: recommend QNMinimizer
		# See: http://nlp.stanford.edu/nlp/javadoc/javanlp/edu/stanford/nlp/optimization/QNMinimizer.html
		# Run fmincg to obtain the optimal theta
		# This function will return theta and the cost
		# Note: fmincg returns the vector [ theta, cost] while getCostLgR
		# returns [ cost, grad ], where grad = grad(theta);
		#---------------------------------------------------------------
	
		#---------------------------------------------------------------
		# Initialize theta
		#---------------------------------------------------------------
		theta_0 = zeros(size(M,2),1); # same as the length of number of columns in M
		options = optimset('GradObj', 'on', 'MaxIter', 500);
	
		[ theta, cost ] = fmincg(@(t)(getCostRLgR(t, M, y, lambda)), theta_0 , options);
		cost = getCostRLgR(theta, M, y, lambda);
		
		Lcost(lambda_idx) = cost;
		L_Theta{lambda_idx} = theta;
		
		lambda_idx++;
	endfor
	
	[ cost, lambda_idx ] = min(Lcost);
	dCost(degree) = cost;
	THETA{degree} = L_Theta{lambda_idx};
endfor

[ ~, idx ] = min(dCost);
theta = THETA{idx};
end
