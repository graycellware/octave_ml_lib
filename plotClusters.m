function plotClusters(X, idx, centroids)
graphics_toolkit('gnuplot');
# Create palette

K = size(centroids,1);
#scatter(X(:,1), X(:,2),[],'k', '+');
palette = hsv(K + 1);
colors = palette(idx, :);

# Plot the data
scatter(X(:,1), X(:,2), 10, colors);
#scatter(centroids(:,1), centroids(:,2),16, 'k');

end
