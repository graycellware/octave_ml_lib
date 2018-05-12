function [X, mu, V, D] = whitenTrain(X,fudgefactor)
if ~exist('fudgefactor','var') || isempty(fudgefactor)
	fudgefactor = 1e-17;
endif
mu = mean(X);
X = bsxfun(@minus, X,mu);
A = X'*X;
[V,D] = eig(A);
X = X*V*diag(1./(diag(D)+fudgefactor).^(1/2))*V';
end
