function centroids = initCentroids(X, k)

# centroids = initCentroids(X, k) initializes the centroids using the ElAgha algorithm
# for the initialization of the centroids
# The ElAgha algorithm finds the diagonal traversing the volume occupied by the data
# and generates k random points randomly perturbed from k equally spaced points along
# this diagonal



[ ~ , n ] = size(X);
allMin = min(X);
allMax = max(X);
delDim = (1/k)*(allMax - allMin);
centroids = zeros(k,n);
refSegment = allMin + (delDim*0.5);

for ii =1:k
	centroids(ii,:) = refSegment + rand(1,n).*delDim*0.5;
	refSegment += delDim;
endfor
endfunction
