function [ erms, emre, emean ] = getesterror(xest, xact)

#	[ erms, emre, emean ] = getesterror(xest, xact) computes various error parameters
#	(returns errors due to estimation). 
#	erms = root mean square error = sqrt(mean(((xest-xact)./xact).^2))
#	emre = maximum relative absolute error = max(abs(xest-xact)./xact)
#	emean = mean relative absolute error = mean(abs(xest-xact)./xact)
# 	Inputs:
#	1. xact -- column vector of actual data
#	2. xest -- column vector of estimate of xact

xest = xest(:);
xact = xact(:);

if length(xest) != length(xact)
	error('input column vectors need to be of the same length');
endif


relativeError = (xest - xact)./xact; # Relative error
erms = sqrt(mean((relativeError).^2)); # Root mean square error
emre = max(abs(relativeError)); # maximum absolute error
emean = mean(abs(relativeError)); # Mean absolute error
end

endfunction
