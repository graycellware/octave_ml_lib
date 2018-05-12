function centroids = initCentroidsForgy(X, k)

# centroids = initCentroidsForgy(X, k) initializes the centroids using the Forgy algorithm
# for the initialization of the centroids
# The Forgy algorithm randomly selects k samples from the given data as centroids.

m = size(X,1);

if (k > m)
	error('Amount of data less than samples required');
endif

rndIDX = randperm(m); 
centroids = X(rndIDX(1:k), :); 
endfunction
