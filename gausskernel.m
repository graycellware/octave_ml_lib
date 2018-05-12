function rbf = gausskernel(x1, x2)

#	rbf = gausskernel(x1, x2, sigma)
#	x1 and x2 are two column vectors
#	x1 and x2 have the same size
#	rbf is a measure of the distance between them
#	
#	gausskernel implements the gaussian radial basis function
#	it is a measure of the distance between the vectors x1 and x2, and the 
#	gamma factor, gamma = (1/2sigma^2), where sigma = std(x1-x2);
#	As exp(-t^2) moves very quickly to zero, small distnces 
#	can make a huge difference -- gamma moderates that.

# Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

# x1 and x2 should have the same size
if(length(x1) != length(x2))
	error('parameters x1 and x2 of differenet lengths');
endif


# Theoretical implementation
# rbf = exp(-sum((x1 - x2).^2)/(2*sigma*sigma));

# This is faster.
delta = x1-x2; 	# difference (vector)
sigma = std(delta);
delta .*= delta;	# perform the squaring (vector)
distsq = sum(delta); # delta is a column vector, so column sum gives distsq, a scalar
rbf = exp(-distsq/(2*sigma*sigma));
    
end
