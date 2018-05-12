function plotProgress(X, centroids, previous, idx, iter)


k = size(centroids,1);



palette = copper(k + 1);
centroid_colors = palette(1:k,:);

# Plot the centroids using different colors to distinguish between centroids
# scatter(centroids(:,1), centroids(:,2), 15, centroid_colors, 'fill');

# Plot the progress of the centroids

for jj=1:k
    plot([centroids(jj,1), previous(jj,1)], ...
    	 [centroids(jj,2), previous(jj,2)], ...
    	'-ok');
end

endfunction

