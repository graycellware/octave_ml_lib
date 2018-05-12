function [ Z, mu, sigma ] = normalizeX(X)

#	normalizeX(X) takes as input a matrix X
#	returns the normalized version
#	For each entry in a column, computes the Z score
#	Z = (x-mu)/sigma

[ m,n] = size(X);
mu = mean(X);
sigma = std(X);

zidx = find(sigma == 0);
sigma(zidx) =1;
Z = (X - repmat(mu,m,1))./repmat(sigma,m,1);
sigma(zidx) =0;
end
