function [ theta, finalLambda] = getbestmodelGD(data)


# function [ theta, finalLambda] = getbestmodelGD(data) is used in linear regression
# data: is a column vector containing the data points 
#	to be fitted with a polynomial
# theta is the vector of coefficients of the BEST polynomial
# t_0 +t_1x+t_2x^2+ ... +t_nx^n
# theta = [ t_0, t_1, ..., t_n]
# Degree of best polynomial is: length(theta) -1
# finalLambda is the best estimate of the target lambda

numData = length(data);
X = (1:numData)';
D = X;

maxModel = 6; # To avoid polynomial wiggle
costArray = zeros(maxModel,1);
THETA = cell(maxModel,1);


II = ones(numData, 1);
M = II;
alpha = 0.1;
lambda = 0.0;
iters = 1000;

for ii = 1:maxModel
	M = [ M X ];
	theta = getTheta(M, data, lambda); # uses fmincg
	THETA{ii,1} = theta;
	
	Y = M*theta;
	err = data - Y;
	costArray(ii) = (err'*err)/numData;
	X = X.*D;
endfor

[ ~, bestModel] = min(costArray);
theta = THETA{bestModel,1};
# Rebuild Model

initLambda = ones(1,length(theta))*theta;
finalLambda = getpolymodel(numData, bestModel);
finalLambda*=theta;
end
