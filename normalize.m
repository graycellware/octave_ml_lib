function Y = normalize(X)

#	normalize(X) takes as input a matrix X
#	returns the normalized version
#	Y = (X-mu)/std; where mu is mean(X) and std is the standard deviation of X
#	when std = 0; then Y = X-mu

[m,n] = size(X);
mn = mean(X,1); # Column-wise mean
stdev = std(X,1); # Column-wise std deviation
zidx = find(stdev==0);
stdev(zidx) =1;
Y = (X - repmat(mn,m,1))./repmat(stdev,m,1);
endfunction
