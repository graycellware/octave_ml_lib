function plotdecboundary(theta, X, y, degree)

#	plotdecboundary plots the data points X and y, and the decision boundary defined by theta

#   plotdecboundary(theta, X,y) plots the data points with + for the 
#   positive examples and o for the negative examples. 

#	X is assumed to be an m x 2 feature set matrix
#	y is the corresponding m x 1 outcome set (contains only 0's and 1's)
#	theta defines the boundary

#---------------------------------------
# Plot data
#---------------------------------------
graphics_toolkit('gnuplot');

# 2-D plot
hold on; grid;
res = 100; # Mesh resolution
fprintf('Please wait. This could take a while. Resolution = %d x %d\n',res,res);

pos = find(y == 1);neg = find(y == 0);

plot(X(pos,1), X(pos,2), '+', "markerfacecolor", 'g');
plot(X(neg,1), X(neg,2), 'o', "markerfacecolor", 'r');

minX = min(X(:,1)); #
maxX = max(X(:,1));
minY = min(X(:,2));
maxY = max(X(:,2)); 

# Now plot the decision boundary
u = linspace(minX, maxX, res);
v = linspace(minY, maxY, res);
[ xx, yy ] = meshgrid(u,v);
XY = [xx(:), yy(:)];

[ m, n ] = size(X);
mData = zeros(2,n);
mData(1,:) = min(X);
mData(2,:) = max(X);

z = lrpredict(XY,theta,degree,mData);
# z is a column vector of probability values 0 <= z <= 1
z = 2*(z -0.5); # push the values down Now, -1 <= z <= 1
z = reshape(z,length(u), length(v));
# z = z'; # important to transpose z before calling contour
# Plot z = 0
# Notice you need to specify the range [0, 0]
contour(u, v, z, [0, 0], '-k', 'linewidth', 2);
legend('positive values', 'negative values', 'decision boundary');
print('DB.png');
hold off;

# Give a 3D plot to show the decision surface
figure;
hold on; colormap gmap40;
mesh(u,v,z); # Form the mesh

# 
offset = 0.25;
z = zeros(size(X(neg,1))) - offset;
scatter3(X(neg,1), X(neg,2), z, 10, 'r', 'filled');
z = zeros(size(X(pos,1))) + offset;
scatter3(X(pos,1), X(pos,2), z, 10, 'g', 'filled');
print('DB3d.png');
hold off;
fprintf('Paused: press ENTER to continue');
pause;

end
