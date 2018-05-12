function [lower1, upper1, upper2] = pquantile(lambda,percent)

# 	pquantile(lambda,percent)
#	Probability of k in (lower1, upper1) = percent;
# 	Probability of k in (0,upper2) = percent;

# takes as input lambda and desired percent grouping, and returns the upper  and lower limits
# such that, for the given lambda, the given percent of population lie between these two limits


if (percent > 100) || (percent < 0) || iscomplex(percent)
	error('Parameter percent has to have value between 0 and 100');
endif

if (lambda < 0) || iscomplex(lambda)
	error('Parameter lambda has to be a positive real number');
endif

percent/=100.0;
upper2 = poissinv(percent,lambda);
pcent = (1-percent)*0.5;
upper1 = poissinv(1-pcent,lambda);
lower1 = poissinv(pcent,lambda);
end;




