function [KL RKL] = poisskl(lambda,L)

# KL = poisskl(lambda,L) returns the KL divergence for
# a given Poisson distribution with parameter lambda,
# when it is approximated using a set of alternative lambda 
# values contained in L (a column vector)

if any(L <= 0)
	error('vector of Lambdas contains negtaive or 0 values');
endif
KL = zeros(length(L),1);
KL = L - lambda + L.*(log(lambda) - log(L));
RKL = KL./lambda;
end
