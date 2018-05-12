function [ theta, finalLambda] = getbestmodelNE(data)

# function [ theta, finalLambda] = getbestmodelNE(data) is used in linear regression
# data: is a column vector containing the data points 
#	to be fitted with a polynomial
# theta is the vector of coefficients of the BEST polynomial
# t_0 +t_1x+t_2x^2+ ... +t_nx^n
# theta = [ t_0, t_1, ..., t_n]
# Degree of best polynomial is: length(theta) -1
# finalLambda is the best estimate of the target lambda


numData = length(data);
X=(1:numData)';
D = X;

maxModel = 10; # To avoid polynomial wiggle

costArray = zeros(maxModel,1);
THETA = cell(maxModel,1);
II = ones(numData, 1);
M = II;

for ii = 1:maxModel
	M = [ M X ];
	theta = pinv(M'*M)*M'*data; # Apply normal equation
	THETA{ii,1} = theta;
	#----------------------------------
	err = data - (M*theta);
	costArray(ii) = (err'*err)/numData;
	#----------------------------------
	X = X.*D;
endfor

[ ~, bestModel] = min(costArray);

theta = THETA{bestModel,1};

initLambda = ones(1,length(theta))*theta;
finalLambda = getpolymodel(numData, bestModel);
finalLambda*=theta;
end
