function [X] = whitenCandidate(X,mu, V, D, fudgefactor)

if ~exist('fudgefactor','var') || isempty(fudgefactor)
	fudgefactor = 1e-17;
endif
X = bsxfun(@minus, X,mu);
X = X*V*diag(1./(diag(D)+fudgefactor).^(1/2))*V';
end
