function idx = mapCentroids(X, centroids)
#	mapCentroids computes the centroid memberships for every example
#   idx = mapCentroids(X, centroids) returns the closest centroids
#   in idx for the dataset X where each row is a single example.
#	idx is an index assignment. idx(i) corresponds to the data point in the
#	ith row of X. If this value is j, then the corresponding centroid is in
#	centroids(j,:).

# Find the number of centroids
k = size(centroids, 1);
m = size(X,1);

dist = zeros(m,k);

for indx = 1:k,
	delX = bsxfun(@minus,X,centroids(indx,:));
	dist(:,indx) = norm(delX,2,'rows'); # Euclidean distance
endfor;

[ ~, idx ] = min(dist,[],2);


endfunction

