function dbi = getDBI(data, centroids, idx)
# Computes the Davies-Bouldin Index (DBI), a measure of the tightness of a cluster
# Given the data; the centroids of the clusters and idx such that idx(i) = j means
# data(i,:) is in cluster with centroid centroids(j)

# See http://en.wikipedia.org/wiki/Davies%E2%80%93Bouldin_index

k = size(centroids,1);

if (k == 1)
	dbi = realmax('double');
	return;
endif

cmap = centroids(idx,:); # Cluster centroids


#Compute the Euclidean distance of each vector from corresponding centroid
Dist = sqrt(sum((data - cmap).^2,2)); 

# Compute the inter-cluster distances
M = squareform(pdist(centroids,'euclidean')); # M is a k x k matrix

M = M + eye(k).*realmax('double');

# Compute the measure of the scatter within the cluster
# This is nothing but the mean distance between the points
# in the cluster and the centroid of the cluster
S = zeros(k,1);
for ii = 1:k
	kidx = find(idx == ii); 
	S(ii) = sum(Dist(kidx))/length(kidx);
endfor

# Compute the Davies-Bouldin Index
R = ones(k,k).*realmax('double');

for ii = 1:k
	for jj = 1:k
		if(ii ~= jj)
			R(ii,jj) = S(ii)+S(jj);
		endif
	endfor
endfor
#{
system('clear');
R
fprintf('Press ENTER to continue');
#}
R ./= M;

# R is symmetric
dbi = sum(max(R,[], 2))/k;
endfunction
