function centroids = getCentroids(X, Label, k)
#	centroids = getCentroids(X, Label, k) computes the new centroids of the cluster
#	of data points assigned to each centroid.
#   centroids = getCentroids(X, Label, k) returns the new centroids by 
#   computing the means of the data points assigned to each centroid.
#	Input:
#	1. m x n matrix of datapoints X
#	2. m x 1 column vector Label containing the labels of the candidate centroid points nearest
#		to each datapoint in X. If  X(i,:) and X(j,:) have the same label, 
#		they are in the same cluster
#	3. k, the number of clusters

n = size(X,2); # dimension of X
centroids = zeros(k, n);

for ii = 1:k
	idx = Label == ii;
	q = sum(idx > 0);
	if q > 0
	# Get the data points in cluster labeled and find the mean
		centroids(ii,:) = mean(X(idx,:));
	endif
endfor

endfunction

