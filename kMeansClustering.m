function [centroids, idx, stopParams ] = kMeansClustering(X, k, stopCriterion)

# 	[centroids, idx] = kMeansClustering(X, k, max_iters) runs the k means clustering
#	algorithm on the given data set X. It uses one of 2 methods to stop.
#	1. Based on maximum iterations OR 
#	2. Maximum Change in position of centroids
#	Inputs:
#	1. m x n matrix of data points X
#	2. k, the number of clusters
#	3. stopCriterion: a scalar. 
#		a. If an integer > 1, is the maximum number of iterations
#		b. The desired accuracy (typically a number << 1)
#	Outputs:
#	1. Centroids of the k clusters
#	2. idx: A m x 1 vector which maps each datapoint in X to one of the k clusters
#		idx(i) = j means that X(i,:) belongs to the cluster j, with centroid Centroids(j,:)
#	3. stopParams = [ iterations, max_change_in_centroid_position ]'
#		iterations: Number of iterations performed -- variable 'iters' below
#		max_change_in_centroid_position: largest change in centroid position 
#		during last iteration -- variable 'change' below


stopCriterion = abs(stopCriterion);

#-------------------------------------------
# Used for demo and debug
#------------------------------------------
PLOTFLAG = 0;
#-----------------------------------------------------------------------------------------------------
#	Find out which method to use
# 	using inline functions to check for stopping criteria
#	This is being done to avoid code replication in the main while loop
#-----------------------------------------------------------------------------------------------------
if (stopCriterion > 1)
	stopCriterion = round(stopCriterion);
	check = inline('I <= stopCriterion','I','C'); # Define criterion to stop
elseif isscalar(stopCriterion) && isreal(stopCriterion) # ... and obviously < 1
	check = inline('C > stopCriterion','I','C'); # Define criterion to stop
else
	error('Invalid stop criterion: stopCriterion > 0; integer => max iterations; real => max change');
endif




#-----------------------------------------------
# Get initial centroids
#-----------------------------------------------
#centroids = initCentroidsv2(X,k);
[m,n] = size(X);
iters = 0;
change = realmax('double');



centroids = old_centroids = zeros(k,n);
centroids = initCentroids(X,k);


# idx = mapCentroids(X, centroids);

while check(iters,change) 	# <-- simple check. Otherwise would have required 2 if-statements 
							# and replicated code within the corresponding while loops.
							# Alternative was to implement body of while as a function.
							# function calls would have been expensive because X and idx would
							# have had to be passed each time. Also too many parameters. Would
							# have been messy.
	# Get a new set of centroids
	old_centroids = centroids;
	idx = mapCentroids(X, centroids);
	centroids = getCentroids(X,idx,k); 
	
	
	# Compute the resultant Euclidean distance change in location
	change = max(norm((centroids - old_centroids),2,'rows'));
	iters++;
	#{
	# PLOTFLAG is required, provide
	if PLOTFLAG
		plotProgress(X,centroids,old_centroids,idx, iters);
	endif
	#}
end

stopParams = [ iters, change ]';


if PLOTFLAG
	# Plot the data ...
	graphics_toolkit('gnuplot');
	clf;
    hold on;
	plotClusters(X, idx, centroids);
	palette = gmap40(k + 1);
	centroid_colors = palette(1:k,:);
	scatter(centroids(:,1), centroids(:,2), 15, centroid_colors, 'fill');
	hold off;
end



endfunction

