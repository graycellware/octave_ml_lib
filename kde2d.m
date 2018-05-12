function v = kde2d(data, numbins)
#	v = kde2d(data, numbins)
# 	Implements kernel density estimation
# 	Generating the density (using an Gaussian multivariate kernel.) 
# 	Setting the parameters.

# 	here data is a mx2 matrix, and numbins is a resolution factor
#	numbins can be set to 100 
	
	numData = length(data(:,1));
	[ lowX, highX ] = getlim(data(:,1));
	[ lowY, highY ] = getlim(data(:,2));
	stdX = std(data(:,1));
	stdY = std(data(:,2));
	sigma = [ (stdX*stdX) sqrt(stdX*stdY); sqrt(stdX*stdY) (stdY*stdY)];
	
	xspace = linspace(lowX,highX,numbins);
	yspace = linspace(lowY,highY,numbins);
	[X, Y] = meshgrid (xspace,yspace);
 	XY = [X(:), Y(:)];
 	Z = zeros(size(XY,1),1);
	
	for ii = 1:numData
		idx = find(xspace > data(ii,1),1,'first');
		idy = find(yspace > data(ii,2),1,'first');
		mu = [ (idx -1),(idy-1) ];
		Z += mvnpdf(XY,mu,sigma);
	endfor
		Z./=sum(Z);
		v = reshape(Z,length(xspace),length(yspace));
endfunction
