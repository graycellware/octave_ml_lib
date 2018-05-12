function centroids = initCentroidsv2(X, k)

# centroids = initCentroids(X, k) initializes the centroids using the modified ElAgha algorithm
# for the initialization of the centroids
# The modified ElAgha algorithm finds the max eigenvector traversing the volume occupied by the data
# and generates k random points randomly perturbed from k equally spaced points along
# this vector

[ Q, E ] = eig(X'*X);
[~, idx ] = max(sum(E,2));

eigvec = Q(:,idx); # Column Vector
size(eigvec);

[ ~ , n ] = size(X);
MinX = (min(X))'; # Column vector
allMin = (dot(MinX, eigvec)/norm(eigvec)^2)*eigvec;
allMin = allMin';


MaxX = (max(X))'; # Column vector
allMax = (dot(MaxX, eigvec)/norm(eigvec)^2)*eigvec;
allMax = allMax';

delDim = (1/k)*(allMax - allMin);
centroids = zeros(k,n);
refSegment = allMin + (delDim*0.5);

for ii =1:k
	centroids(ii,:) = refSegment + rand(1,n).*delDim*0.5;
	refSegment += delDim;
endfor
endfunction
